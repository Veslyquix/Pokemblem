
#define POKEMBLEM_VERSION
// #define APPROXIMATE_BEST_TARGET
#define USE_CLOSEST_TARGET

#include "Ai.h"
#include "CpDecide.c"
extern int AI_UseWexpAsWeps;
extern void TurnOnBGMFlag(void);
// AiSimulateBestBattleAgainstTarget takes ~100k cycles before getting to:
// AiSimulateBattleAgainstTargetAtPosition->
// BattleGenerateSimulationInternal calls InitBattleUnit twice  which is a little expensive at 100k

// https://github.com/FireEmblemUniverse/fireemblem8u/blob/b9ad9bcafd9d4ecb7fc13cc77a464e2a82ac8338/src/bmbattle.c#L181C6-L181C20
// BattleGenerate takes ~600k cycles:
// ComputeBattleUnitStats ~200k twice largely due to ~100k from MakeAuraSkillBuffer - now down to 20k by only making it
// for players BattleUnwind ~150k

// after acting: 8037745 HandlePostActionTraps ~550k
// 801D301 MaybeRunPostActionEvents ~880k
// 803A63D Procs CpPerform CallASM ~700k

extern u8 BossChapterTable[];
// ai fill danger map

extern int AI_UseWexpAsWeps;
int GetEnemyWepBySlot(struct Unit * unit, int slot)
{
    // UNIT_ITEM_COUNT
    if (AI_UseWexpAsWeps)
    {
        return unit->ranks[slot] | 0xA00; // 10 durability
    }
    return unit->items[slot];
}

extern u8 * SelectedSpell_Link;

//! FE8U = 0x0803D450
// NOTE: Shade+ and Steal+ hook this function
// WARNING: Barricade normally sets r11 to 0 despite not pushing / popping r11
// Please comment out asm("mov r11, r0"); from EngineHacks\Necessary\CalcLoops\CanUnitDoubleCalcLoop and make
// can break at start and end of 8039858
s8 AiAttemptOffensiveAction(s8 (*isEnemy)(struct Unit * unit))
{
    // asm("mov r11, r11");
    struct AiCombatSimulationSt tmpResult;
    struct AiCombatSimulationSt finalResult;

    int i;
    struct Unit * actor = gActiveUnit;

    finalResult.targetId = 0;
    finalResult.score = 0;
    finalResult.itemSlot = 0; // so compiler is happy
    finalResult.xMove = 0;    // so compiler is happy
    finalResult.yMove = 0;    // so compiler is happy

#ifndef POKEMBLEM_VERSION
    if (actor->state & US_IN_BALLISTA)
    {
        BmMapFill(gBmMapMovement, -1);
        gBmMapMovement[actor->yPos][actor->xPos] = 0;

        if (GetRiddenBallistaAt(actor->xPos, actor->yPos) != 0)
        {
            goto _0803D628;
        }

        TryRemoveUnitFromBallista(actor);
    }
    if (UNIT_CATTRIBUTES(actor) & CA_STEAL)
    {

        if (GetUnitItemCount(actor) < UNIT_ITEM_COUNT)
        {
            GenerateUnitMovementMap(actor);
            MarkMovementMapEdges();

            if (AiAttemptStealActionWithinMovement() == 1)
            {
                return 0;
            }
        }
    }
#endif

    if (gAiState.flags & AI_FLAG_1)
    {
        BmMapFill(gBmMapMovement, -1);
        gBmMapMovement[actor->yPos][actor->xPos] = 0;
    }
    else
    {
        GenerateUnitMovementMap(actor);
    }

#ifndef POKEMBLEM_VERSION
    if (UnitHasMagicRank(actor))
    {
        GenerateMagicSealMap(-1);
    }
#endif

    SetWorkingBmMap(gBmMapRange);

#ifdef USE_CLOSEST_TARGET
    int xPos = actor->xPos;
    int yPos = actor->yPos;
    int bestDist = 0xFF;
    int currDist;
    int numberOfTargetsTried = 0;
    int triedUnit = false;
    int actorUID = actor->pCharacterData->number;
#endif

    int startID = 1;
    int endID = 0x7F; // actor is an enemy so they target players/npcs
    if (AreUnitsAllied(actor->index, 1))
    {
        startID = 0x80;
        endID = 0xC0; // actor is a player/npc so they target enemies
    }
    // else {
    // startID = 1; endID = 0x7F; // actor is an enemy so they target players/npcs
    //}
    for (int uid = startID; uid < endID; uid++)
    {
        if (triedUnit)
        {
            if (numberOfTargetsTried >= 7)
            {
                break;
            } // against bosses we'll check everyone
            if ((BossChapterTable[gPlaySt.chapterIndex] == 0) && (numberOfTargetsTried >= 3))
            {
                break;
            } // only bother looking at the first 3 valid targets as to not cause lag
            // else
            numberOfTargetsTried++;
            triedUnit = false;
        }

        struct Unit * unit = GetUnit(uid);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16))
        {
            continue;
        }

#ifdef USE_CLOSEST_TARGET

        currDist = abs(unit->xPos - xPos) + abs(unit->yPos - yPos);
        if (actorUID < 0xA0)
        {
            if (currDist >= bestDist)
            { // wild pokemon skip units that are farther away from them (up to 3 units are checked)
                continue;
            }
        }
#endif

        if (!isEnemy(unit))
        { // This checks specific unit IDs to not target as well as AreUnitsAllied
            continue;
        }

        for (i = 0; i < 5; i++)
        {
            // u16 item = actor->items[i];
            u16 item = GetEnemyWepBySlot(actor, i);

            if (item == 0)
            {
                break;
            }

#ifndef POKEMBLEM_VERSION
            if (item == ITEM_NIGHTMARE)
            {
                continue;
            }
#endif

            if (!CanUnitUseWeapon(actor, item))
            {
                continue;
            }

            tmpResult.itemSlot = i;
            if (!AiReachesByBirdsEyeDistance(actor, unit, item))
            {
                continue;
            }

            AiFillReversedAttackRangeMap(unit, item);

            tmpResult.targetId = unit->index;
            *SelectedSpell_Link = item;

            if (!AiSimulateBestBattleAgainstTarget(&tmpResult))
            { // 800k cycles per unit
                continue;
            }
#ifdef USE_CLOSEST_TARGET
            triedUnit = true;
#endif

            if (tmpResult.score >= finalResult.score)
            {
                finalResult = tmpResult;
                finalResult.itemSlot = i;

#ifdef USE_CLOSEST_TARGET
                bestDist = currDist;
// if (bestDist <= 1) {
// break;
//}
#endif
            }
        }
    }

#ifndef POKEMBLEM_VERSION
_0803D628:
    if (UNIT_CATTRIBUTES(actor) & CA_BALLISTAE)
    {
        if (AiAttemptBallistaCombat(isEnemy, &tmpResult) == 1)
        {
            if (tmpResult.score >= finalResult.score)
            {
                finalResult = tmpResult;
            }
        }
    }
#endif

    if ((finalResult.score != 0) || (finalResult.targetId != 0))
    {
#ifdef POKEMBLEM_VERSION
        TurnOnBGMFlag();
        // Now swap moves around and set
        int move1 = actor->ranks[0];
        int move2 = actor->ranks[finalResult.itemSlot];
        actor->ranks[0] = move2;
        actor->ranks[finalResult.itemSlot] = move1;
        *SelectedSpell_Link = move2;
        finalResult.itemSlot = 0;
#endif

        AiSetDecision(finalResult.xMove, finalResult.yMove, 1, finalResult.targetId, finalResult.itemSlot, 0, 0);

#ifndef POKEMBLEM_VERSION
        if ((s8)finalResult.itemSlot != -1)
        {
            TryRemoveUnitFromBallista(actor);
        }
#endif
    }
    // asm("mov r11, r11");
    return 0; // added so the compiler doesn't get mad at me
}

//! FE8U = 0x0803D6B8
s8 AiAttemptCombatWithinMovement(s8 (*isEnemy)(struct Unit * unit))
{
    struct AiCombatSimulationSt tmpResult;
    struct AiCombatSimulationSt finalResult;

    int i;

    finalResult.targetId = 0;
    finalResult.itemSlot = 0;
    finalResult.xMove = 0;
    finalResult.yMove = 0;
    finalResult.score = 0;

    if (gActiveUnit->state & US_IN_BALLISTA)
    {
        BmMapFill(gBmMapMovement, -1);
        gBmMapMovement[gActiveUnit->yPos][gActiveUnit->xPos] = 0;

        if (GetRiddenBallistaAt(gActiveUnit->xPos, gActiveUnit->yPos) == 0)
        {
            TryRemoveUnitFromBallista(gActiveUnit);
            goto else_stmt;
        }
    }
    else
    {
    else_stmt:
        SetWorkingBmMap(gBmMapRange);

        for (i = 0; i < UNIT_ITEM_COUNT; i++)
        {
            // u16 item = gActiveUnit->items[i];
            u16 item = GetEnemyWepBySlot(gActiveUnit, i);

            if (item == 0)
            {
                break;
            }

            if (item == ITEM_NIGHTMARE)
            {
                continue;
            }

            if (!CanUnitUseWeapon(gActiveUnit, item))
            {
                continue;
            }

            tmpResult.itemSlot = i;

            {
                int uid;
                for (uid = 1; uid < 0xC0; uid++)
                {
                    struct Unit * unit = GetUnit(uid);

                    if (!UNIT_IS_VALID(unit))
                    {
                        continue;
                    }

                    if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16))
                    {
                        continue;
                    }

                    if (!isEnemy(unit))
                    {
                        continue;
                    }

                    if (!AiReachesByBirdsEyeDistance(gActiveUnit, unit, item))
                    {
                        continue;
                    }

                    AiFillReversedAttackRangeMap(unit, item);

                    tmpResult.targetId = unit->index;

                    if (!AiSimulateBestBattleAgainstTarget(&tmpResult))
                    {
                        continue;
                    }

                    if (tmpResult.score >= finalResult.score)
                    {
                        finalResult = tmpResult;
                        finalResult.itemSlot = i;
                    }
                }
            }
        }
    }

    if (UNIT_CATTRIBUTES(gActiveUnit) & CA_BALLISTAE)
    {
        if (AiAttemptBallistaCombat(isEnemy, &tmpResult) == 1)
        {
            if (tmpResult.score >= finalResult.score)
            {
                finalResult = tmpResult;
            }
        }
    }

    if ((finalResult.score != 0) || (finalResult.targetId != 0))
    {

        AiSetDecision(
            finalResult.xMove, finalResult.yMove, AI_ACTION_COMBAT, finalResult.targetId, finalResult.itemSlot, 0, 0);

        if ((s8)finalResult.itemSlot != -1)
        {
            TryRemoveUnitFromBallista(gActiveUnit);
        }
    }
    return true;
}

extern void sub_803EC18(int);
//! FE8U = 0x0803E93C
s8 AiEquipGetFlags(u16 * out) // if doing nothing else, equip some item
{
    int i;
    u32 perc;
    int ret = false;

    if (GetUnitItemCount(gActiveUnit) == 0)
        return 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item;
        out[i] = 0;

        // item = gActiveUnit->items[i];
        item = GetEnemyWepBySlot(gActiveUnit, i);

        if (item == 0)
            break;

        if (!(GetItemAttributes(item) & (IA_WEAPON | IA_STAFF)))
            continue;

        if (GetItemAttributes(item) & IA_LOCK_3)
            continue;

        if (!CanUnitUseWeapon(gActiveUnit, item) && !CanUnitUseStaff(gActiveUnit, item))
            continue;

        if (GetItemAttributes(item) & IA_WEAPON)
        {
            if (GetItemMinRange(item) > 1)
                out[i] |= 2;

            if (GetItemMaxRange(item) == 1)
                out[i] |= 1;

            perc = Div(perc = GetItemUses(item) * 100, GetItemMaxUses(item));

            if (perc <= 10)
                out[i] |= 4;
        }
        else
        {
            sub_803EC18(item); // staff
            out[i] |= 8;
        }
        ret = true;

        out[i] |= (GetItemMight(item) << 8);
    }
    return ret;
}
// NOTE: MSG/3rdParty/InjectMovGetters hooks this function
#define gMapRangeSigned ((s8 **)gBmMapRange)
#define gMapMovementSigned ((s8 **)gBmMapMovement)
extern int sub_803CF60(int x, int y);
//! FE8U = 0x0803CFB4
s8 sub_803CFB4(int x, int y, struct Vec2 * out, u8 * itemSlotOut) // only used in AiScriptCmd_18_TryAttackSnagWall
{
    int slot;

    int xOut = -1;
    int yOut = -1;

    u32 best = 0;

    GenerateUnitMovementMap(gActiveUnit);

    for (slot = 0; slot < 5; slot++)
    {
        int ix;
        int iy;

        // u16 item = gActiveUnit->items[slot];
        u16 item = GetEnemyWepBySlot(gActiveUnit, slot);

        if (item == 0)
        {
            break;
        }

        if (!CanUnitUseWeapon(gActiveUnit, item))
        {
            continue;
        }

        BmMapFill(gBmMapRange, 0);
        MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
        {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
            {
                u32 current;

                if (gBmMapMovement[iy][ix] > 0x78)
                {
                    continue;
                }

                if (gMapRangeSigned[iy][ix] == 0)
                {
                    continue;
                }

                if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId)
                {
                    continue;
                }

                current = GetItemMight(item) + sub_803CF60(ix, iy);

                if (current > best)
                {
                    xOut = ix;
                    yOut = iy;
                    best = current;

                    *itemSlotOut = slot;
                }
            }
        }
    }

    if (best == 0)
    {
        return 0;
    }

    out->x = xOut;
    out->y = yOut;

    return 1;
}

/*
inline s8 AreUnitsAlliedInline(int left, int right);
inline struct Unit* GetUnitInline(int id);
struct Unit* CONST_DATA gUnitLookup[0x100];
inline struct Unit* GetUnitInline(int id) {
    return gUnitLookup[id & 0xFF];
}
inline s8 AreUnitsAlliedInline(int left, int right) {
    int a = left & 0x80;
    int b = right & 0x80;
    return (a == b);
}
*/

/*
// This was commented out from being included
//! FE8U = 0x0803BA08
// NOTE: MSG/3rdParty/InjectMovGetters hooks this function
void NewAiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 unk)
{
    s16 ix;
    s16 iy;

    u8 bestRange;

    s16 xOut = 0;
    s16 yOut = 0;

    if ((gActiveUnit->xPos == x) && (gActiveUnit->yPos == y))
    {
        AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, action, 0, 0, 0, 0);
        return;
    }

    if (unk)
    {
        GenerateExtendedMovementMapOnRange(x, y, GetUnitMovementCost(gActiveUnit));
    }
    else
    {
        sub_80410C4(x, y, gActiveUnit);
    }

    GenerateUnitMovementMap(gActiveUnit);

    bestRange = gBmMapRange[gActiveUnit->yPos][gActiveUnit->xPos];
    xOut = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
            {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId)
            {
                continue;
            }

            if (maxDanger == 0)
            {
                if (UNIT_MOV(gActiveUnit) < gAiState.bestBlueMov && gBmMapOther[iy][ix] != 0)
                {
                    continue;
                }
            }

            if (!AiCheckDangerAt(ix, iy, maxDanger))
            {
                continue;
            }

            if (gBmMapRange[iy][ix] > bestRange)
            {
                continue;
            }

            bestRange = gBmMapRange[iy][ix];
            xOut = ix;
            yOut = iy;
        }
    }

    if (xOut >= 0)
    {
        AiSetDecision(xOut, yOut, action, 0, 0, 0, 0);
    }

    return;
}
*/