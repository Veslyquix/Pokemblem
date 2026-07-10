#include "C_Code.h"
extern int AnyTargetWithinRange(struct Unit * unit);
extern int ShouldTrainerSummonTeam(); // uses gActiveUnit

int GetBestDirection(struct Unit * unit, int direction)
{
    int i;
    int bestDirection = direction;
    int bestScore = 0x7fffffff;

    if (!UNIT_IS_VALID(unit))
    {
        return direction;
    }

    for (i = 1; i < 0xC0; i++)
    {
        struct Unit * target = GetUnit(i);
        u16 move = 0;
        u8 might = 0;
        int xDiff;
        int yDiff;
        int xDist;
        int yDist;
        int distance;
        int offAxis;
        int score;
        int targetDirection;
        int j;

        if (!UNIT_IS_VALID(target))
        {
            continue;
        }

        if (target->state & (US_HIDDEN | US_DEAD | US_NOT_DEPLOYED | US_BIT16))
        {
            continue;
        }

        if (AreUnitsAllied(unit->index, target->index))
        {
            continue;
        }

        for (j = 0; j < UNIT_ITEM_COUNT; j++)
        {
            u8 moveTmp = target->ranks[j];
            u8 moveMt;

            if (moveTmp == 0)
            {
                break;
            }

            if (!CanUnitUseWeapon(target, moveTmp))
            {
                continue;
            }

            moveMt = GetItemMight(moveTmp);

            if (moveMt > might)
            {
                move = moveTmp;
                might = moveMt;
            }
        }

        if (move == 0)
        {
            continue;
        }

        xDiff = target->xPos - unit->xPos;
        yDiff = target->yPos - unit->yPos;

        if ((xDiff == 0) && (yDiff == 0))
        {
            continue;
        }

        xDist = xDiff;
        yDist = yDiff;

        if (xDist < 0)
        {
            xDist = -xDist;
        }

        if (yDist < 0)
        {
            yDist = -yDist;
        }

        if (xDist >= yDist)
        {
            targetDirection = xDiff < 0 ? 2 : 1; // left/right
            offAxis = yDist;
        }
        else
        {
            targetDirection = yDiff < 0 ? 3 : 0; // up/down
            offAxis = xDist;
        }

        distance = xDist + yDist;

        if (!AiCouldReachByBirdsEyeDistance(unit, target, move))
        {
            continue;
        }

        FillMovementAndRangeMapForItem(target, move);

        if (gBmMapRange[unit->yPos][unit->xPos] == 0)
        {
            continue;
        }

        score = distance + offAxis;

        if (score < bestScore)
        {
            bestScore = score;
            bestDirection = targetDirection;
        }
    }

    return bestDirection;
}

int IsTrainerWithinRangeForSummon(void)
{
    // if AiSetDecision has not happened, don't do anything
    if (!gAiDecision.unitId) //&& gActiveUnit->xPos == gAiDecision.xMove && gActiveUnit->yPos == gAiDecision.yMove)
    {
        return false;
    }
    struct Unit unit;
    CopyUnit(gActiveUnit, &unit);
    unit.index = gActiveUnit->index;
    unit.xPos = gAiDecision.xMove;
    unit.yPos = gAiDecision.yMove;
    unit.movBonus += 3; // so they go 1 outside range, then summon everything

    int result = AnyTargetWithinRange(&unit);
    if (result)
    {
        result = ShouldTrainerSummonTeam();
    }
    return result;
}

//! FE8U = 0x0803E320
void AiFillDangerMap(void)
{
    int ix;
    int iy;
    int i;
    int j;
    int xSize = gBmMapSize.x;
    int ySize = gBmMapSize.y;

    for (i = 1; i < 0xC0; i++)
    {
        int danger;
        u16 move = 0;
        u8 might = 0;

        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_NOT_DEPLOYED | US_BIT16))
        {
            continue;
        }

        if (AreUnitsAllied(gActiveUnitId, unit->index))
        {
            continue;
        }

        for (j = 0; j < UNIT_ITEM_COUNT; j++)
        {
            u8 moveTmp = unit->ranks[j];
            u8 moveMt;

            if (moveTmp == 0)
            {
                break;
            }

            if (!CanUnitUseWeapon(unit, moveTmp))
            {
                continue;
            }

            moveMt = GetItemMight(moveTmp);

            if (moveMt > might)
            {
                move = moveTmp;
                might = moveMt;
            }
        }

        if (move == 0)
        {
            continue;
        }

        if (!AiCouldReachByBirdsEyeDistance(gActiveUnit, unit, move))
        {
            continue;
        }

        FillMovementAndRangeMapForItem(unit, move);

        danger = (GetUnitPower(unit) + might) >> 1;

        if (danger == 0)
        {
            continue;
        }

        for (iy = ySize - 1; iy >= 0; iy--)
        {
            s8 * rangeRow = gMapRangeSigned[iy];
            u8 * otherRow = gBmMapOther[iy];

            for (ix = xSize - 1; ix >= 0; ix--)
            {
                if (rangeRow[ix] == 0)
                {
                    continue;
                }

                otherRow[ix] += danger;
            }
        }
    }

    return;
}

//! FE8U = 0x0803BA08
extern int prMovGetter(struct Unit * unit);
int IsTargetCoordTooExpensiveToUseBlueArrowPathing(int x, int y)
{
    // return gBmMapMovement[y - 1][x] > 63 && gBmMapMovement[y + 1][x] > 63 && gBmMapMovement[y][x - 1] > 63 &&
    // gBmMapMovement[y][x + 1] > 63;
    return gBmMapRange[y][x] > 63;
}
struct Vec2 *
New_AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 ignoreUnitsOnMap, int mov, struct Vec2 * coord);
void AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 ignoreUnitsOnMap)
{
    struct Vec2 coord = { 0, 0 };
    coord.x = -1;

    if ((gActiveUnit->xPos == x) && (gActiveUnit->yPos == y))
    {
        AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, action, 0, 0, 0, 0);
        return;
    }

    int mov = prMovGetter(gActiveUnit);

    // u8 savedUnit = gBmMapUnit[y][x];
    // gBmMapUnit[y][x] = 0;
    if (ignoreUnitsOnMap)
    {
        GenerateExtendedMovementMapOnRange(x, y, GetUnitMovementCost(gActiveUnit));
    }
    else
    {
        sub_80410C4(x, y, gActiveUnit);
    }

    // gBmMapUnit[y][x] = savedUnit;
    // I believe GenerateUnitExtendedMovementMap and GenerateExtendedMovementMapOnRange are broken
    // due to acrobat's taking over of SetWorkingBmMap, so we're using GenerateUnitMovementMapExt
    // GenerateUnitMovementMapExt(gActiveUnit, MAP_MOVEMENT_EXTENDED);
    // it could also be because some of them put 0 as the unit for GenerateMovementMap
    // if (!IsTargetCoordTooExpensiveToUseBlueArrowPathing(x, y))
    // {
    // u8 activeUnitId = gActiveUnitId;
    // GenerateUnitMovementMapExt(gActiveUnit, MAP_MOVEMENT_EXTENDED);

    // GenerateBestMovementScript(x, y, gWorkingMovementScript);
    // u8 * it = gWorkingMovementScript;

    New_AiTryMoveTowards(x, y, action, maxDanger, ignoreUnitsOnMap, mov, &coord);

    if (coord.x >= 0)
    {
        AiSetDecision(coord.x, coord.y, action, AI_ACTION_NONE, 0, 0, 0);
    }

    return;
}

struct Vec2 *
New_AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 ignoreUnitsOnMap, int mov, struct Vec2 * coord)
{

    GenerateUnitMovementMap(gActiveUnit);
    int bestRange = gBmMapRange[gActiveUnit->yPos][gActiveUnit->xPos];
    int bestCoordCount = 0;
    u8 activeUnitId = gActiveUnitId;

    for (int iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        u8 * movementRow = gBmMapMovement[iy];
        u8 * unitRow = gBmMapUnit[iy];
        u8 * otherRow = gBmMapOther[iy];
        u8 * rangeRow = gBmMapRange[iy];

        for (int ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            u8 range = rangeRow[ix];

            if (movementRow[ix] > MAP_MOVEMENT_MAX)
            {
                continue;
            }

            if (unitRow[ix] != 0 && unitRow[ix] != activeUnitId)
            {
                continue;
            }

            if (maxDanger == 0)
            {
                if (mov < gAiState.bestBlueMov && otherRow[ix] != 0)
                {
                    continue;
                }
            }

            if (!AiCheckDangerAt(ix, iy, maxDanger))
            {
                continue;
            }

            if (range > bestRange)
            {
                continue;
            }

            if (range < bestRange)
            {
                bestRange = range;
                bestCoordCount = 1;
                coord->x = ix;
                coord->y = iy;
                continue;
            }

            bestCoordCount++;

            if (NextRN_N(bestCoordCount) == 0)
            {
                coord->x = ix;
                coord->y = iy;
            }
        }
    }
    return coord;
}
extern int ProtagID_Link;
//! FE8U = 0x0803A924

// if multiple targets within the same distance but outside attack range, pick one randomly
// for TryMoveTowardsEnemy
s8 AiFindTargetInReachByFunc(s8 (*func)(struct Unit * unit), struct Vec2 * out)
{
    s16 ix;
    s16 iy;

    u8 bestDistance = 0xff;
    int bestCoordCount = 0;

    s16 xOut = 0;
    s16 yOut = 0;

    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    xOut = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        u8 * rangeRow = gBmMapRange[iy];
        u8 * unitRow = gBmMapUnit[iy];

        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            u8 distance = rangeRow[ix];
            u8 unitId = unitRow[ix];
            struct Unit * unit;

            if (distance > MAP_MOVEMENT_MAX)
            {
                continue;
            }

            if (unitId == 0)
            {
                continue;
            }

            if (unitId == gActiveUnitId)
            {
                continue;
            }

            unit = GetUnit(unitId);

            if (unit->pCharacterData->number == ProtagID_Link)
            {
                continue;
            }
            if (!func(unit))
            {
                continue;
            }

            if (distance > bestDistance)
            {
                continue;
            }

            if (distance < bestDistance)
            {
                bestDistance = distance;
                bestCoordCount = 1;
                xOut = ix;
                yOut = iy;
                continue;
            }

            bestCoordCount++;

            if (NextRN_N(bestCoordCount) == 0)
            {
                xOut = ix;
                yOut = iy;
            }
        }
    }

    if (xOut >= 0)
    {
        out->x = xOut;
        out->y = yOut;

        return 1;
    }

    return 0;
}
