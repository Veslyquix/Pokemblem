#include "gbafe.h" // headers
extern int SkillTester(struct Unit * unit, int SkillID);
extern int SwarmID_Link;
extern int FlankID_Link;
extern int SwarmBonusDamagePercent;
extern int FlankBonusDamagePercent;
extern int FlankRequiresSkill_Link;
extern int MultiscaleID_Link;
extern int AreWeOutdoors();

extern int ChlorophyllID_Link;
// Bulbasaur line
int ChlorophyllEffect(int stat, struct Unit * unit) // 50% more speed when outside
{
    if (AreWeOutdoors())
    {
        if (SkillTester(unit, ChlorophyllID_Link))
        {
            stat += ((stat + 1) >> 1);
        }
    }
    return stat;
}

extern int SolarPowerID_Link;
// Charmander line
int SolarPowerEffect(int stat, struct Unit * unit) // 25% more str/mag when outside
{
    if (AreWeOutdoors())
    {
        if (SkillTester(unit, SolarPowerID_Link))
        {
            stat += ((stat + 2) >> 2);
        }
    }
    return stat;
}

// Squirtle line
int Explorer_CanUnitHeal(struct Unit * unit) // restore 1/8th hp at the end of your turn while outdoors
{
    if (AreWeOutdoors())
    {
        // if (SkillTester(unit, ExplorerID_Link))
        // {
        return true;
        // }
    }
    return false;
}

void Explorer_HealAmount(struct Unit * unit) // restore 1/8th hp at the end of your turn while outdoors
{
    unit->curHP += (unit->maxHP + 3) >> 3;
    if (unit->curHP > unit->maxHP)
    {
        unit->curHP = unit->maxHP;
    }
}

void AdjustDamageByPercent(struct BattleUnit * bunitA, struct BattleUnit * bunitB, int percent)
{
    if (percent < 0)
        percent = 0; // min 0

    int baseDamage = bunitA->battleAttack - bunitB->battleDefense;
    if (baseDamage < 0)
        baseDamage = 0;

    // Apply percent with rounding: (x * percent + 50) / 100
    int adjustedDamage = (baseDamage * percent + 50) / 100;

    // Recalculate battleAttack to ensure damage = adjustedDamage
    bunitA->battleAttack = adjustedDamage + bunitB->battleDefense;
}

// Caterpie / Venonat line
// Tinted Lens: Ineffective moves deal regular damage

// Metapod / Kakuna (Ekans / Arbok have intimidate)
int ShedSkinUsability(struct Unit * unit)
{
    return true;
}

void ShedSkinEffect(struct Unit * unit) // Shed Skin: at the start of the turn, cure status
{
    if (unit->statusDuration)
    {
        unit->statusDuration = 1;
    }
}

extern int KeenEyeID_Link;
// Pidgey line, maybe Farfetch'd
void KeenEyeEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB) // 50% more accuracy from moves
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (SkillTester(&bunitA->unit, KeenEyeID_Link))
        {
            int hit = GetItemHit(bunitA->weaponBefore);
            bunitA->battleHitRate += (hit >> 1);
        }
    }
}

// Rattata has canto

extern int SniperID_Link;
// Spearow, Horsea lines
void SniperEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB) // doubled crit rate
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (SkillTester(&bunitA->unit, SniperID_Link))
        {
            bunitA->battleCritRate += bunitA->battleCritRate;
        }
    }
}

// Pikachu, Goldeen, Jolteon (volt absorb)
// Cubone, Rhyhorn
extern int LightningRodID_Link; // electric aura
extern int FieryAuraID_Link;
extern int DampAuraID_Link;
void LightningRodEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
}
// Electric moves within 2 tiles deal 25% more damage. Immune to electric moves.
// or Electric moves within 2 tiles deal no damage.

// Fiery Aura: Fire moves within 2 tiles deal 25% more damage, while water moves deal 50% less.
// Vulpix line
// Poliwag line
// Damp Aura: Water moves within 2 tiles deal 25% more damage, while fire moves deal 50% less.

// Sandshrew (Geodude?) line - some outdoor thing?
// or just rough skin / rocky helmet

extern int UnawareID_Link;
// Unaware: Ignores the target's buffs/debuffs.
// Clefairy
void UnawareEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (SkillTester(&bunitB->unit, UnawareID_Link))
        {
            struct Unit * unit = GetUnit(bunitA->unit.index);
            bunitA->unit.maxHP = unit->maxHP;
            bunitA->unit.pow = unit->pow;
            bunitA->unit.skl = unit->skl;
            bunitA->unit.spd = unit->spd;
            bunitA->unit.def = unit->def;
            bunitA->unit.lck = unit->lck;
            bunitA->unit.res = unit->res;
            bunitA->unit._u3A = unit->_u3A;
        }
    }
}

// Competitive: When debuffed, raise Mag by +15.
// Jigglypuff line
// Defiant: When debuffed, raise Str by +15.
// Farfetch'd

extern int RivalryID_Link;
int GetUnitsHighestStat(struct Unit * unit);

// Rivalry: Deal 25% more damage if the opponent's highest stat is higher than yours.
// Nidoqueen line
void RivalryEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (SkillTester(&bunitB->unit, RivalryID_Link))
        {
            int highestB = GetUnitsHighestStat(GetUnit(bunitA->unit.index));
            int highestA = GetUnitsHighestStat(GetUnit(bunitB->unit.index));
            if (highestB > highestA)
            {
                AdjustDamageByPercent(bunitB, bunitA, 120);
            }
        }
    }
}

// Hustle: Deal 25% more damage, but moves are 25% less accurate.
// Nidoking line
extern int HustleID_Link;
void HustleEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (SkillTester(&bunitB->unit, HustleID_Link))
        {
            AdjustDamageByPercent(bunitB, bunitA, 120);
            int hit = GetItemHit(bunitB->weaponBefore);
            bunitB->battleHitRate -= (hit >> 1);
        }
    }
}

// Flank (Zubat line) - done

// Oddish line - ?? some weather effect maybe
// Chlorophyll, Flower Gift (Aura +mag), Harvest, Leaf Guard (Tangela)

// Paras line - ??

// Arena Trap - Diglett
// Inflicts Bind status after combat against grounded foes

// Meowth line has pay day already

// Psyduck - oblivious or own tempo type thing?

// Mankey has reckless fighter already

// Growlithe line has intimidate

// Abra, (Clefairy)
// Magic Guard: Only takes damage from attacks.

// Machop line has Steady Brawler already

// Bellsprout line has gluttony

// Clear Body: cannot be debuffed
// hardcoded to tentacool / tentacruel in StatGetters/_asm/DebuffStat.s
// Tentacool line

// Sturdy / Miracle
// Geodude / (Magnemite) / Onix

// Ponyta line has Canto+ already

// Slowpoke has oblivious / cannot be doubled
// Maybe replace with
// Regenerator: Restore 1/3rd of max hp when "wait" is selected.
// (also Tangela)

// Analytic: deal 30% more damage when counter attacking.
// or.. deal 30% more damage against faster foes
// Magnemite, (Staryu), (Porygon)
extern int AnalyticID_Link;
void AnalyticEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (SkillTester(&bunitB->unit, AnalyticID_Link))
        {
            int speedB = GetUnit(bunitA->unit.index)->spd;
            int speedA = GetUnit(bunitB->unit.index)->spd;
            if (speedB > speedA)
            {
                AdjustDamageByPercent(bunitB, bunitA, 130);
            }
        }
    }
}

// Hydration: Fully restore each turn when on water.
// Seel, (Lapras), (Vaporeon)
extern int IsCoordWater(s8 x, s8 y);
int HydrationUsability(struct Unit * unit)
{
    return IsCoordWater(unit->xPos, unit->yPos);
}

void HydrationEffect(struct Unit * unit)
{
    if (unit->statusDuration)
    {
        unit->statusDuration = 0;
        unit->statusIndex = 0;
    }
    unit->curHP = unit->maxHP;
}

// Doduo has canto+

// Poison touch: Inflict poison after combat.
// Grimer line

// Shell Armor: Opponent's moves cannot critical hit.
// Shellder, (Krabby), (Lapras), (Omanyte),

// Grudge / Hex / Black Magic / Cursed Body: Opponent's def/res is debuffed by 10 after the user faints.
// Gastly line
// Aftermath: Opponent loses 25% hp after the user faints.
// Voltorb line

// Sheer Force: secondary effects cannot happen, but deal 30% more damage?

// Forewarn: Adjacent units take 20% less damage.
// Drowzee, (Jynx)

// Hyper Cutter: Str cannot be debuffed.
// Krabby line

// Harvest: While outdoors, restore 1/8th hp each turn.
// Exeggcute

// Unburden: Speed is doubled without a held item.
// Hitmonlee
// Steady Brawler: Machop / Hitmonchan line

// Lickitung ??

// Levitate: Immune to ground moves.
// Koffing / Weezing

// Reckless Rock: Deal and take 20% more damage.
// Rhyhorn
extern int RecklessRockID_Link;

void RecklessRockEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (SkillTester(&bunitB->unit, RecklessRockID_Link))
        {
            if (gBattleTarget.battleDefense)
            { // if def isn't calculated yet, do nothing
                AdjustDamageByPercent(bunitB, bunitA, 120);
                AdjustDamageByPercent(bunitA, bunitB, 120);
            }
        }
    }
}

// Annoying (renamed Amaterasu): Allies within 2 tiles recover 20% HP each turn.
// Chansey
// or Healer: Allies within 2 tiles recover from status, debuffs, and restore 10% hp each turn.

// Kangaskhan
void ScrappyEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
}

// Starmie - analytic? natural cure? shed skin?

extern int TintedLensID_Link;
extern int FilterID_Link;
// Filter: Super Effective moves deal 25% less damage.
// Mr. Mime & Venomoth
int CheckTintedLensFilter(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    int result = 0;
    if (!(gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE)))
    {
        return 0;
    }

    if (SkillTester(&bunitA->unit, TintedLensID_Link))
    {
        result = 1;
    }
    if (SkillTester(&bunitB->unit, FilterID_Link))
    {
        result |= 2;
    }
    return result;
}

// Scyther (Meowth / Persian already have a skill)
extern int TechnicianID_Link;
void TechnicianEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (SkillTester(&bunitA->unit, TechnicianID_Link))
        {
            int mt = GetItemMight(bunitA->weaponBefore);
            if (mt <= 6)
            {
                bunitA->battleAttack += mt;
            }
        }
    }
}

// Dry Skin: Absorb water moves, but fire moves deal 2x damage.
// Jynx

// Motor Drive: Boost speed by +15 when hit by an electric move.
// Electabuzz

// Flash Fire / Flame Body: Boost mag by +15 when hit by a fire move.
// Magmar?

// Pinsir has guard breaker already

// Tauros has intimidate - maybe replace with anger point: Boost str by +15 when hit by a supereffective or critical
// hit.

// Magikarp / Gyarados have scaled back / scaled up

// Lapras - ??
// hydration, battle armor, water absorb

// ditto has transform

// Eevee
extern int AdaptabilityID_Link;
extern int ShouldWeaponHaveStabBonus(int, int);
void AdaptabilityEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (ShouldWeaponHaveStabBonus(bunitA->weaponBefore, bunitA->unit.pClassData->number))
        {
            if (SkillTester(&bunitA->unit, AdaptabilityID_Link))
            {
                int mt = GetItemMight(bunitA->weaponBefore);
                bunitA->battleAttack += mt;
            }
        }
    }
}

// Acid Armor / Marvel Scale: Boost Def/Res by 25% when inflicted by status.
// Vaporeon
extern int AcidArmorID_Link;
int AcidArmorEffect(int stat, struct Unit * unit)
{
    if (unit->statusDuration)
    {
        if (SkillTester(unit, AcidArmorID_Link))
        {
            stat += ((stat + 2) >> 2);
        }
    }
    return stat;
}

// Quick Feet: +25% speed when inflicted by status.
// Jolteon
extern int QuickFeetID_Link;
int QuickFeetEffect(int stat, struct Unit * unit)
{
    if (unit->statusDuration)
    {
        if (SkillTester(unit, QuickFeetID_Link))
        {
            stat += ((stat + 2) >> 2);
        }
    }
    return stat;
}

// Guts: +25% str when inflicted by status.
// Flareon
extern int GutsID_Link;
int GutsEffect(int stat, struct Unit * unit)
{
    if (unit->statusDuration)
    {
        if (SkillTester(unit, GutsID_Link))
        {
            stat += ((stat + 2) >> 2);
        }
    }
    return stat;
}

// Porygon has downgrade

// Weak Armor: -5 def and +10 spd while damaged.
// Omanyte / Kabuto

// Strong Claws: Boosts str by 12.5%.
// Aerodactyl

// Snorlax has gluttony

// Pressure: Opponents counter with a random move.
// Birds / Mewtwo

// Synchronize: The attacker will receive the same status condition if it inflicts one to this Pokémon.
// Mew

// Contrary: Debuffs instead buff the user.
// Simple, Moody

inline const s8 * VanillaGetUnitMovementCost(struct Unit * unit)
{
    if (unit->state & US_IN_BALLISTA)
        return Unk_TerrainTable_0880BC18;

    switch (gPlaySt.chapterWeatherId)
    {

        case WEATHER_RAIN:
            return unit->pClassData->pMovCostTable[1];

        case WEATHER_SNOW:
        case WEATHER_SNOWSTORM:
            return unit->pClassData->pMovCostTable[2];

        default:
            return unit->pClassData->pMovCostTable[0];

    } // switch (gPlaySt.chapterWeatherId)
}

// use vanilla version so we don't lag by using hooked versions that accounts
// for pass etc
inline s8 Vanilla_CanUnitCrossTerrain(struct Unit * unit, int terrain)
{
    const s8 * lookup = (s8 *)VanillaGetUnitMovementCost(unit);
    return (lookup[terrain] > 0) ? TRUE : FALSE;
}

bool Generic_CanUnitBeOnPos(struct Unit * unit, s8 x, s8 y, int x2, int y2)
{
    if (x < 0 || y < 0)
        return 0; // position out of bounds
    if (x >= gBmMapSize.x || y >= gBmMapSize.y)
        return 0; // position out of bounds
    if (gBmMapUnit[y][x])
        return 0;
    if (gBmMapHidden[y][x] & 1)
        return 0; // a hidden unit is occupying this position
    if ((x2 == x) && (y2 == y))
        return 0; // exception / a battle unit is on this tile
    return Vanilla_CanUnitCrossTerrain(unit,
                                       gBmMapTerrain[y][x]); // CanUnitCrossTerrain(unit, gMapTerrain[y][x]);
}

// If an adjacent target is surrounded, +50% damage.
void SwarmEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (gBattleStats.range == 1)
        {
            if (SkillTester(&bunitB->unit, SwarmID_Link))
            {
                struct Unit * unit = &bunitA->unit;
                int x = unit->xPos;
                int x2 = bunitB->unit.xPos;
                int y = unit->yPos;
                int y2 = bunitB->unit.yPos;
                // if the target can be on any adjacent position, do nothing
                if (Generic_CanUnitBeOnPos(unit, x + 1, y, x2, y2))
                {
                    return;
                }
                if (Generic_CanUnitBeOnPos(unit, x - 1, y, x2, y2))
                {
                    return;
                }
                if (Generic_CanUnitBeOnPos(unit, x, y + 1, x2, y2))
                {
                    return;
                }
                if (Generic_CanUnitBeOnPos(unit, x, y - 1, x2, y2))
                {
                    return;
                }
                int dmg = bunitB->battleAttack - bunitA->battleDefense;
                if (dmg < 0)
                    dmg = 0;
                int addDmg =
                    ((dmg) * (SwarmBonusDamagePercent)) / 100; // dmg+(dmg*SwarmBonusDamagePercent/200) for rounding
                // int addDmg =
                // ((dmg+(dmg*SwarmBonusDamagePercent/200))*(SwarmBonusDamagePercent+100))/100;
                // // dmg+(dmg*SwarmBonusDamagePercent/200) for rounding
                bunitB->battleAttack += addDmg;
            }
        }
    }
}

// If an ally is on the opposite side of an adjacent target, +25% damage.
void FlankEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (gBattleStats.range == 1)
        {
            if (SkillTester(&bunitB->unit, FlankID_Link) || (!FlankRequiresSkill_Link))
            {

                int activeX = bunitB->unit.xPos;
                int targetX = bunitA->unit.xPos;
                int activeY = bunitB->unit.yPos;
                int targetY = bunitA->unit.yPos;
                int dirX = activeX - targetX;
                int dirY = activeY - targetY;
                int deploymentID = bunitB->unit.index;
                int allyID = 0;
                if ((dirX > 0) && (activeX > 1))
                    allyID = gBmMapUnit[activeY][activeX - 2];
                if (dirX < 0)
                    allyID = gBmMapUnit[activeY][activeX + 2];
                if ((dirY > 0) && (activeY > 1))
                    allyID = gBmMapUnit[activeY - 2][activeX];
                if (dirY < 0)
                    allyID = gBmMapUnit[activeY + 2][activeX];

                // int allyID = gBmMapUnit[activeY+dirY+dirY][activeX+dirX+dirX];

                if ((allyID) && (AreUnitsAllied(deploymentID, allyID)))
                {
                    int dmg = bunitB->battleAttack - bunitA->battleDefense;
                    if (dmg < 0)
                        dmg = 0;
                    // int addDmg =
                    // ((dmg+(dmg*FlankBonusDamagePercent/200))*(FlankBonusDamagePercent+100))/100;
                    // // dmg+(dmg*FlankBonusDamagePercent/200) for rounding
                    int addDmg =
                        ((dmg) * (FlankBonusDamagePercent)) / 100; // dmg+(dmg*FlankBonusDamagePercent/200) for rounding
                    bunitB->battleAttack += addDmg;
                }
            }
        }
    }
}

void MultiscaleEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (SkillTester(&bunitB->unit, MultiscaleID_Link))
        {
            if (bunitB->hpInitial == bunitB->unit.maxHP)
            {
                if (bunitB->unit.curHP == bunitB->unit.maxHP)
                {
                    int dmg = bunitA->battleAttack - bunitB->battleDefense;
                    if (dmg < 0)
                        dmg = 0;
                    int subDmg = dmg / 2; // for rounding
                    bunitA->battleAttack -= subDmg;
                }
            }
        }
    }
}

extern int MissingnoID_Link;
extern int ShouldWeaponHaveStabBonus(int wep, int classID);
extern int SilphScopeID_Link;

void SilphScopeEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {

        if (ShouldWeaponHaveStabBonus(bunitA->weaponBefore, bunitA->unit.pClassData->number))
        {
            if (SkillTester(&bunitA->unit, SilphScopeID_Link))
            {
                int effectiveness = IsItemEffectiveAgainst(bunitA->weaponBefore, &bunitB->unit);
                if (effectiveness)
                {
                    if ((effectiveness != 1) && (effectiveness != 2) && (effectiveness != 7) && (effectiveness != 9))
                    {
                        bunitA->battleEffectiveCritRate = 100;
                        bunitA->battleCritRate = 200;
                    }
                }
            }
        }
    }
}

extern const void * ObjTypePalettePLIST[];
void UnpackChapterMapPalette(void)
{
    if ((gActiveUnit) && (gActiveUnit->pCharacterData) && (gActiveUnit->pClassData->number == MissingnoID_Link))
    {
        ApplyPalettes(
            // gChapterDataAssetTable[GetROMChapterStruct(NextRN_N(gPlaySt.chapterIndex))->map.paletteId],
            ObjTypePalettePLIST[GetROMChapterStruct(NextRN_N(99))->map.paletteId], 6,
            10); // TODO: palette id constant?
        return;
    }

    ApplyPalettes(
        ObjTypePalettePLIST[GetROMChapterStruct(gPlaySt.chapterIndex)->map.paletteId], 6,
        10); // TODO: palette id constant?
}

void MissingnoEffect(struct Unit * actor, struct Unit * target)
{
    if (gActionData.unitActionType == UNIT_ACTION_COMBAT)
    { // attacking only
        if ((actor->pClassData->number == MissingnoID_Link) || (target->pClassData->number == MissingnoID_Link))
        {
            for (int i = 4; i > 0; i--)
            { // dupe items
                if (!actor->items[i])
                {
                    actor->items[i] = actor->items[(4 - i)];
                }
                if (!target->items[i])
                {
                    target->items[i] = target->items[(4 - i)];
                }
            }
            for (int i = 1; i < 5; i++)
            {
                if (!actor->items[i])
                {
                    actor->items[i] = actor->items[i - 1];
                }
                if (!target->items[i])
                {
                    target->items[i] = target->items[i - 1];
                }
            }
            // UnitRemoveInvalidItems(actor);
            // UnitRemoveInvalidItems(target);
            // target->pMapSpriteHandle = actor->pMapSpriteHandle;
        }
        // UnpackChapterMapPalette();
    }
}

int GetUnitsHighestStat(struct Unit * unit)
{
    int highest = 0;
    int tmp;
    tmp = unit->pow;
    if (tmp > highest)
    {
        highest = tmp;
    }
    tmp = unit->skl;
    if (tmp > highest)
    {
        highest = tmp;
    }
    tmp = unit->spd;
    if (tmp > highest)
    {
        highest = tmp;
    }
    tmp = unit->def;
    if (tmp > highest)
    {
        highest = tmp;
    }
    tmp = unit->lck;
    if (tmp > highest)
    {
        highest = tmp;
    }
    tmp = unit->res;
    if (tmp > highest)
    {
        highest = tmp;
    }
    tmp = unit->_u3A;
    if (tmp > highest)
    {
        highest = tmp;
    }
    return highest;
}
