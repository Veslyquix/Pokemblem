#include "gbafe.h" // headers
#define brk asm("mov r11, r11");
extern int SkillTester(struct Unit * unit, int SkillID);
extern int SwarmID_Link;
extern int FlankID_Link;
extern int SwarmBonusDamagePercent;
extern int FlankBonusDamagePercent;
extern int FlankRequiresSkill_Link;
extern int MultiscaleID_Link;
extern int AreWeOutdoors();

int AreWeOutdoorsOrFieryAura(struct Unit * unit);
int AreWeOutdoorsOrDampAura(struct Unit * unit);

extern int ChlorophyllID_Link;
// Bulbasaur line
int ChlorophyllEffect(int stat, struct Unit * unit) // 50% more speed when outside
{
    if (SkillTester(unit, ChlorophyllID_Link))
    {
        if (AreWeOutdoorsOrFieryAura(unit))
        {

            stat += stat;
        }
    }
    return stat;
}

extern int SolarPowerID_Link;
// Charmander line
int SolarPowerEffect(int stat, struct Unit * unit) // 25% more str/mag when outside
{
    if (SkillTester(unit, SolarPowerID_Link))
    {
        if (AreWeOutdoorsOrFieryAura(unit))
        {
            stat += ((stat + 2) >> 2);
        }
    }
    return stat;
}

// Squirtle line
int ExplorerUsability(struct Unit * unit) // restore 1/8th hp at the end of your turn while outdoors
{
    if (AreWeOutdoorsOrDampAura(unit))
    {
        // if (SkillTester(unit, ExplorerID_Link))
        // {
        return true;
        // }
    }
    return false;
}

int ExplorerEffect(struct Unit * unit) // restore 1/4th hp at the end of your turn while outdoors
{
    int result = (unit->maxHP + 2) >> 2;
    return result;
}

// Harvest: While outdoors, restore 1/2 hp each turn.
// Exeggcute
int HarvestUsability(struct Unit * unit) // restore 1/2 hp at the end of your turn while outdoors
{
    if (AreWeOutdoorsOrFieryAura(unit))
    {
        // if (SkillTester(unit, ExplorerID_Link))
        // {
        return true;
        // }
    }
    return false;
}

int HarvestEffect(struct Unit * unit) // restore 1/2th hp at the end of your turn while outdoors
{
    int result = (unit->maxHP) >> 1;
    return result;
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
void AdjustDamageByPercentWithPiercing(struct BattleUnit * bunitA, struct BattleUnit * bunitB, int percent, int pierce)
{
    if (percent < 0)
        percent = 0; // min 0

    if (pierce < 0)
        pierce = 0;
    if (pierce > 100)
        pierce = 100;

    int baseDef = bunitB->battleDefense;
    baseDef = baseDef * (100 - pierce) / 100;
    int baseDamage = bunitA->battleAttack - baseDef;
    if (baseDamage < 0)
        baseDamage = 0;

    // Apply percent with rounding: (x * percent + 50) / 100
    int adjustedDamage = (baseDamage * percent + 50) / 100;

    // Recalculate battleAttack to ensure damage = adjustedDamage
    bunitA->battleAttack = adjustedDamage + baseDef;
}

// Caterpie / Venonat line
// Tinted Lens: Ineffective moves deal regular damage

// Metapod / Kakuna (Ekans / Arbok have intimidate)
int ShedSkinUsability(struct Unit * unit)
{
    return true;
}

int ShedSkinEffect(struct Unit * unit) // Shed Skin: at the start of the turn, cure status
{
    if (unit->statusDuration)
    {
        unit->statusDuration = 1;
    }
    return 0;
}
int NaturalCureUsability(struct Unit * unit)
{
    return true;
}

int NaturalCureEffect(struct Unit * unit) // NaturalCure: at the start of the turn, cure status
{
    if (unit->statusDuration)
    {
        unit->statusDuration = 1;
    }
    return 0;
}

extern int KeenEyeID_Link;
// Pidgey line, maybe Farfetch'd
void KeenEyeEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB) // 50% more accuracy from moves
{
    // Uncomment these lines for prebattle skills that should only show up when targetting / fighting an enemy
    // eg. Flank depends on the position of the enemy, so it should not display the conditional bonus in stat screen
    // if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    // {
    if (SkillTester(&bunitA->unit, KeenEyeID_Link))
    {
        int hit = GetItemHit(bunitA->weaponBefore);
        bunitA->battleHitRate += (hit >> 1);
    }
    // }
}

// Rattata has canto

extern int SniperID_Link;
// Spearow, Horsea lines
void SniperEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB) // doubled crit rate
{
    // if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    // {
    if (SkillTester(&bunitA->unit, SniperID_Link))
    {
        // bunitA->battleCritRate += bunitA->battleCritRate;
        bunitA->battleCritRate += 30;
    }
    // }
}

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
            if (bunitA->unit.pow > unit->pow)
            {
                bunitA->unit.pow = unit->pow;
            }
            if (bunitA->unit.skl > unit->skl)
            {
                bunitA->unit.skl = unit->skl;
            }

            if (bunitA->unit.spd > unit->spd)
            {
                bunitA->unit.spd = unit->spd;
            }

            if (bunitA->unit.def > unit->def)
            {
                bunitA->unit.def = unit->def;
            }

            if (bunitA->unit.lck > unit->lck)
            {
                bunitA->unit.lck = unit->lck;
            }
            if (bunitA->unit.res > unit->res)
            {
                bunitA->unit.res = unit->res;
            }

            if (bunitA->unit._u3A > unit->_u3A)
            {
                bunitA->unit._u3A = unit->_u3A;
            }
        }
    }
}

// Competitive: When debuffed, raise Mag by +15.
// Jigglypuff line
// Defiant: When debuffed, raise Str by +15.
// Farfetch'd
// or Proud / Brave bird
// (Prideful Warrior) - always double, but attack after the enemy

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
                AdjustDamageByPercent(bunitB, bunitA, 125);
            }
        }
    }
}

// Sheer Force: secondary effects cannot happen, but deal 20-30% more damage?
extern int SheerForceID_Link;
int DoesUnitHaveSheerForce(struct Unit * unit)
{
    return SkillTester(unit, SheerForceID_Link);
}

struct StatusEffectTableStruct
{
    u8 statusID;
    u8 percent;
};

extern struct StatusEffectTableStruct StatusEffectTable[];
// Krabby line, maybe Nido?
void SheerForceEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        int item = bunitA->weaponBefore & 0xFF;
        int percent = StatusEffectTable[item].percent;
        // if (percent && percent < 100)
        if (percent)
        {
            if (DoesUnitHaveSheerForce(&bunitA->unit))
            {
                AdjustDamageByPercent(bunitB, bunitA, 130);
            }
        }
    }
}

// Hustle: Deal 25% more damage, but moves are 25% less accurate.
// Nidoking line
extern int HustleID_Link;
void HustleHitrateEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    // if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    // {
    if (SkillTester(&bunitA->unit, HustleID_Link))
    {
        int hit = GetItemHit(bunitA->weaponBefore);
        hit = bunitA->battleHitRate - (hit >> 2);
        if (hit < 10)
        {
            hit = 10;
        }
        bunitA->battleHitRate = hit;
    }
    // }
}

void HustleEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    {
        if (SkillTester(&bunitA->unit, HustleID_Link))
        {
            AdjustDamageByPercent(bunitA, bunitB, 125);
            if (bunitA->battleEffectiveHitRate > 80)
            {
                bunitA->battleEffectiveHitRate = 80;
            }
        }
    }
}

// Onix, Lickitung, Staryu, Oddish, Abra, Psyduck

// Flank (Zubat line) - done

// Oddish line - ?? some weather effect maybe
// Chlorophyll, Flower Gift (Aura +mag), Harvest, Leaf Guard (Tangela)

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

// Slowpoke had oblivious / cannot be doubled
// Maybe replace with
// Regenerator: Restore 1/3rd of max hp when "wait" is selected.
// (also Tangela)
extern int RegeneratorID_Link;
void RegeneratorEffect(struct Unit * unitA, struct Unit * unitB)
{
    if (gActionData.unitActionType == UNIT_ACTION_WAIT)
    {
        // if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
        // {
        if (SkillTester(unitA, RegeneratorID_Link))
        {
            unitA->curHP += unitA->maxHP / 3;
        }
        // }
    }
}

// Patches/StatusEffects
extern int IsTargetTypeImmune(int statusIndex, struct Unit * unitA, struct Unit * unitB);
// this really uses battle units, but it doesn't matter

// Paras line
extern int SporeTouchID_Link;
void SporeTouchEffect(struct Unit * unitA, struct Unit * unitB)
{
    if (gActionData.unitActionType != UNIT_ACTION_COMBAT || !unitB)
    {
        return;
    }
    if (IsTargetTypeImmune(UNIT_STATUS_SLEEP, unitA, unitB))
    {
        return;
    }
    if (gBattleStats.config & BATTLE_CONFIG_REAL && gBattleStats.range == 1)
    {
        if (SkillTester(unitA, SporeTouchID_Link))
        {
            unitB->statusDuration = 2;
            unitB->statusIndex = UNIT_STATUS_SLEEP;
        }
    }
}

extern int ArenaTrapID_Link;
// Diglett
// Inflicts Bind status after combat against grounded foes
void ArenaTrapEffect(struct Unit * unitA, struct Unit * unitB)
{
    if (gActionData.unitActionType != UNIT_ACTION_COMBAT || !unitB)
    {
        return;
    }

    if (IsTargetTypeImmune(8, unitA, unitB))
    {
        return;
    }
    // flying types (but not levitate I guess) immune to trapped status

    if (gBattleStats.config & BATTLE_CONFIG_REAL && gBattleStats.range == 1)
    {
        if (SkillTester(unitA, ArenaTrapID_Link))
        {
            unitB->statusDuration = 2;
            unitB->statusIndex = 8; // Entangle
        }
    }
} // UNIT_STATUS_ATTACK = BURN

// Poison touch: Inflict poison after combat.
// Grimer line
extern int PoisonTouchID_Link;
void PoisonTouchEffect(struct Unit * unitA, struct Unit * unitB)
{
    if (gActionData.unitActionType != UNIT_ACTION_COMBAT || !unitB)
    {
        return;
    }
    if (IsTargetTypeImmune(UNIT_STATUS_POISON, unitA, unitB))
    {
        return;
    }
    if (gBattleStats.config & BATTLE_CONFIG_REAL && gBattleStats.range == 1)
    {
        if (SkillTester(unitA, PoisonTouchID_Link))
        {

            unitB->statusDuration = 2;
            unitB->statusIndex = UNIT_STATUS_POISON;
        }
    }
}

// grisly wound for now
// Aftermath: enemy loses 50% hp after the user faints
// Voltorb line
// extern int AftermathID_Link;
// void AftermathEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
// {
// if (gActionData.unitActionType != UNIT_ACTION_COMBAT)
// {
// return;
// }
// if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
// {
// if (SkillTester(&bunitA->unit, AftermathID_Link))
// {
// bunitB->statusOut = UNIT_STATUS_POISON;
// }
// }
// }

extern int GrudgeDebuffID_Link;
extern u32 * GetUnitDebuffEntry(struct Unit * unit);
extern void ProcessCombatDebuffs(int id, struct BattleUnit * actor, u32 * buffSelfRam, u32 * buffEnemyRam);
extern void ApplyDebuffUnit(int debuffID, u32 * buffSelfRam, u32 * buffEnemyRam);
extern int GrudgeID_Link;
void GrudgeEffect(struct Unit * unitA, struct Unit * unitB)
{
    if (gActionData.unitActionType != UNIT_ACTION_COMBAT)
    {
        return;
    }
    // if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    // {

    if (gBattleActor.unit.curHP <= 0)
    {
        if (SkillTester(&gBattleActor.unit, GrudgeID_Link))
        {

            ApplyDebuffUnit(
                GrudgeDebuffID_Link, GetUnitDebuffEntry(&gBattleActor.unit), GetUnitDebuffEntry(&gBattleTarget.unit));
        }
    }
    else if (gBattleTarget.unit.curHP <= 0)
    {
        if (SkillTester(&gBattleTarget.unit, GrudgeID_Link))
        {

            ApplyDebuffUnit(
                GrudgeDebuffID_Link, GetUnitDebuffEntry(&gBattleTarget.unit), GetUnitDebuffEntry(&gBattleActor.unit));
        }
    }

    // }
}

// Grudge / Hex / Black Magic / Cursed Body: Opponent's def/res is debuffed by 10 after the user faints.
// Gastly line
// Aftermath: Opponent loses 25% hp after the user faints.
// Voltorb line

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

// Doduo has canto+

// Shell Armor: Opponent's moves cannot critical hit.
// Shellder, (Krabby), (Lapras), (Omanyte),

// Forewarn: Adjacent units take 20% less damage.
// Drowzee, (Jynx)

// Hyper Cutter: Str cannot be debuffed.
// Krabby line

// Steady Brawler: Machop / Hitmonchan line

// Lickitung ??

// Levitate: Immune to ground moves.
// Koffing / Weezing

// Reckless Rock: Deal and take 20% more damage.
// Rhyhorn
extern int RecklessRockID_Link;

void RecklessRockEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    // if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    // {
    if (SkillTester(&bunitB->unit, RecklessRockID_Link))
    {
        if (gBattleTarget.battleDefense)
        { // if def isn't calculated yet, do nothing
            AdjustDamageByPercent(bunitB, bunitA, 120);
            AdjustDamageByPercent(bunitA, bunitB, 120);
        }
    }
    // }
}

// Annoying (renamed Amaterasu): Allies within 2 tiles recover 20% HP each turn.
// Chansey
// or Healer: Allies within 2 tiles recover from status, debuffs, and restore 10% hp each turn.

// Starmie - analytic? natural cure? shed skin?

// Pikachu, Goldeen, Jolteon (volt absorb)
// Cubone, Rhyhorn
extern int LightningRodID_Link; // stormy aura
extern int FieryAuraID_Link;    // or BlazingAura
extern int DampAuraID_Link;
extern int DrySkinID_Link;
extern int MotorDriveID_Link;
extern int FlashFireID_Link;

// Electric moves within 2 tiles deal 25% more damage. Immune to electric moves.
// or Electric moves within 2 tiles deal no damage.

// Fiery Aura: Fire moves within 2 tiles deal 25% more damage, while water moves deal 50% less.
// Vulpix line
// Poliwag line
// Damp Aura: Water moves within 2 tiles deal 25% more damage, while fire moves deal 50% less.

extern const int PikachuID_Link;
extern const int RaichuID_Link;
extern const int GoldeenID_Link;
extern const int SeakingID_Link;
extern const int CuboneID_Link;
extern const int MarowakID_Link;
// Jolteon
// Rhyhorn
extern const int VulpixID_Link;
extern const int NinetalesID_Link;
extern const int PoliwagID_Link;
extern const int PoliwhirlID_Link;
extern const int PoliwrathID_Link;

// These are hard-coded to pkmn to avoid lag
const int * const LightningRodPkmn[] = {
    &PikachuID_Link, &RaichuID_Link, &GoldeenID_Link, &SeakingID_Link, &CuboneID_Link, &MarowakID_Link, NULL
};
const int * const StormyAuraPkmn[] = { NULL };
// const int * const StormyAuraPkmn[] = { &PikachuID_Link, &RaichuID_Link, NULL };
const int * const FieryAuraPkmn[] = { &VulpixID_Link, &NinetalesID_Link, NULL };
const int * const DampAuraPkmn[] = { &PoliwagID_Link, &PoliwhirlID_Link, &PoliwrathID_Link, NULL };

// RhyhornID_link, RhydonID_Link, NULL };
typedef int (*AuraPredicate)(struct Unit * unit, struct Unit * unitException);

int DoesUnitHaveFieryAura(struct Unit * unit, struct Unit * unitException)
{
    int classID = unit->pClassData->number;
    const int * const * data = FieryAuraPkmn;

    while (*data != NULL)
    {
        if (**data == classID)
            return true;
        data++;
    }
    return false;
}
int DoesUnitHaveDampAura(struct Unit * unit, struct Unit * unitException)
{
    int classID = unit->pClassData->number;
    const int * const * data = DampAuraPkmn;

    while (*data != NULL)
    {
        if (**data == classID)
            return true;
        data++;
    }
    return false;
}
int DoesUnitHaveStormyAura(struct Unit * unit, struct Unit * unitException)
{
    int classID = unit->pClassData->number;
    const int * const * data = StormyAuraPkmn;

    while (*data != NULL)
    {
        if (**data == classID)
            return true;
        data++;
    }
    return false;
}

extern int LightningrodBuffID_Link;
int DoesUnitHaveLightningRod(struct Unit * unit, struct Unit * unitException)
{
    int classID = unit->pClassData->number;
    const int * const * data = LightningRodPkmn;

    while (*data != NULL)
    {
        if (**data == classID)
        {
            if (unit != unitException)
            {
                if (gBattleStats.config & BATTLE_CONFIG_REAL)
                {
                    ApplyDebuffUnit(LightningrodBuffID_Link, GetUnitDebuffEntry(unit), GetUnitDebuffEntry(unit));
                }
            }
            return true;
        }
        data++;
    }
    return false;
}

int IsEffectivenessAuraNearby(struct Unit * unitException, struct Unit * unit, AuraPredicate predicate)
{
    int x = unit->xPos;
    int y = unit->yPos;
    int sizeX = gBmMapSize.x;
    int sizeY = gBmMapSize.y;

    for (int dy = -2; dy <= 2; dy++)
    {
        for (int dx = -2; dx <= 2; dx++)
        {
            if ((abs(dx) + abs(dy)) > 2)
                continue;

            int nx = x + dx;
            int ny = y + dy;

            if (nx < 0 || ny < 0 || nx >= sizeX || ny >= sizeY)
                continue;

            int id = gBmMapUnit[ny][nx];
            if (!id)
                continue;

            struct Unit * unit2 = GetUnit(id);
            if (predicate(unit2, unitException))
                return true;
        }
    }

    return false;
}

extern int TintedLensID_Link;
extern int FilterID_Link;
extern int ScrappyID_Link;
extern int LevitateID_Link;
// Tinted Lens: Ineffective moves are super effective.
// Filter: Super Effective moves deal 25% less damage.
// Scrappy: Kangaskhan - Your attacks ignore immunities.
// Mr. Mime, Venomoth, Kangaskhan
struct EffectivenessExceptions
{
    u32 tintedLens : 1;
    u32 filter : 1;
    u32 scrappy : 1;
    u32 drySkin : 1;
    u32 flashFire : 1;
    u32 motorDrive : 1;
    u32 lightningRod : 1;
    u32 dampAura : 1;
    u32 fieryAura : 1;
    u32 stormyAura : 1;
    u32 levitate : 1;
};
struct EffectivenessExceptions CheckEffectivenessExceptions(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    struct EffectivenessExceptions result = { 0 };
    if (!(gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE)))
    {
        return result;
    }

    if (SkillTester(&bunitA->unit, TintedLensID_Link))
    {
        result.tintedLens = true;
    }
    if (SkillTester(&bunitB->unit, FilterID_Link))
    {
        result.filter = true;
    }
    if (SkillTester(&bunitA->unit, ScrappyID_Link))
    {
        result.scrappy = true;
    }
    if (SkillTester(&bunitB->unit, DrySkinID_Link))
    {
        result.drySkin = true;
    }
    if (SkillTester(&bunitB->unit, FlashFireID_Link))
    {
        result.flashFire = true;
    }
    if (SkillTester(&bunitB->unit, MotorDriveID_Link))
    {
        result.motorDrive = true;
    }
    if (SkillTester(&bunitB->unit, LevitateID_Link))
    {
        result.levitate = true;
    }
    if (IsEffectivenessAuraNearby(&bunitB->unit, &bunitA->unit, DoesUnitHaveLightningRod))
    {
        result.lightningRod = true;
    }
    if (IsEffectivenessAuraNearby(&bunitB->unit, &bunitA->unit, DoesUnitHaveDampAura))
    {
        result.dampAura = true;
    }
    if (IsEffectivenessAuraNearby(&bunitB->unit, &bunitA->unit, DoesUnitHaveFieryAura))
    {
        result.fieryAura = true;
    }
    if (IsEffectivenessAuraNearby(&bunitB->unit, &bunitA->unit, DoesUnitHaveStormyAura))
    {
        result.stormyAura = true;
    }

    return result;
}

#define Immune 1
#define TintedLensCase 3
#define SuperEffective 4
#define DoubleEffective 5 // Dry skin only currently
#define Absorbtion 6
#define Ineffective 7

extern int NormalTypeWep_Link;
extern int ElectricTypeWep_Link;
extern int WaterTypeWep_Link;
extern int FireTypeWep_Link;
extern int GrassTypeWep_Link;
extern int GroundTypeWep_Link;
extern int PsychicTypeWep_Link;
extern int FightingTypeWep_Link;
extern int IceTypeWep_Link;
extern int PoisonTypeWep_Link;
extern int FlyingTypeWep_Link;
extern int RockTypeWep_Link;
extern int GhostTypeWep_Link;
extern int DragonTypeWep_Link;
extern int BugTypeWep_Link;
extern int SteelTypeWep_Link;
// Dry Skin: Absorb water moves, but fire moves deal 2x damage.
// Jynx

// Motor Drive: Boost speed by +15 when hit by an electric move.
// Electabuzz

// Flash Fire / Flame Body: Boost mag by +15 when hit by a fire move.
// Magmar?
extern int ShouldWeaponHaveStabBonus(int, int);
void AdjustHitrateForEffectiveness(struct BattleUnit * bunitA, struct BattleUnit * bunitB);
void PressureEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB);

void ComputeBattleUnitAttack(struct BattleUnit * attacker, struct BattleUnit * defender)
{
    short attack;
    PressureEffect(attacker, defender);

    attacker->battleAttack = GetItemMight(attacker->weaponBefore);
    if (ShouldWeaponHaveStabBonus(attacker->weaponBefore, attacker->unit.pClassData->number))
    { // stab bonus hook
        attacker->battleAttack += attacker->battleAttack;
    }
    attack = attacker->battleAttack;

    attacker->battleAttack = attack;
    AdjustHitrateForEffectiveness(attacker, defender);
    // used to have a hook here for effectiveness that modified hitrate

    int isMag = attacker->weaponAttributes & IA_MAGICDAMAGE;
    if (!isMag) // strmag hook
    {
        attacker->battleAttack += attacker->unit.pow;
    }
    else
    {
        attacker->battleAttack += attacker->unit._u3A;
    }
}

void AdjustHitrateForEffectiveness(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (!(gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE)))
    {
        return;
    }
    int effectiveness = IsItemEffectiveAgainst(bunitA->weaponBefore, &bunitB->unit);
    if (!effectiveness)
    {
        return;
    }
    int canCounter = bunitA->canCounter;
    if (bunitA->unit.index >= 0)
    {
        canCounter = true; // players always get bonus def from using super effective moves
    }
    struct EffectivenessExceptions exceptions = CheckEffectivenessExceptions(bunitA, bunitB);
    int wepType = bunitA->weaponType;
    if (wepType == GroundTypeWep_Link && exceptions.levitate)
    {
        effectiveness = Immune;
    }
    switch (effectiveness)
    {
        case Immune:
        {
            if (exceptions.scrappy)
            {
                return;
            }
            bunitA->wTriangleHitBonus = (-40);
            break;
        }
        case SuperEffective:
        {
            if (canCounter)
            {
                bunitA->wTriangleHitBonus = 40;
                bunitA->battleAvoidRate += 40;
                if (UNIT_FACTION(&bunitA->unit) == FACTION_BLUE)
                {
                    bunitA->battleCritRate += 10 + (bunitA->unit.skl >> 1);
                }
                bunitA->battleDodgeRate += 10 + (bunitA->unit.lck >> 1);
            }
            break;
        }
        case Ineffective:
        {
            if (exceptions.tintedLens)
            {
                return;
            }
            bunitA->wTriangleHitBonus = (-40);
            break;
        }

        default:
    }
}

void TypeEffectiveness(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (!(gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE)))
    {
        return;
    }
    int canCounter = bunitB->canCounter;
    if ((bunitB->unit.index & 0x80) == 0)
    {
        canCounter = true; // players always get bonus def from using super effective moves
    }

    int effectiveness = IsItemEffectiveAgainst(bunitA->weaponBefore, &bunitB->unit);
    // 2AAEC used to adjust hitrate in Add_weapon_might.s

    // EffectivenessToTypeBitfield
    struct EffectivenessExceptions exceptions = CheckEffectivenessExceptions(bunitA, bunitB);
    if (exceptions.tintedLens && (effectiveness == Ineffective))
    {
        effectiveness = TintedLensCase;
    }
    int wepType = bunitA->weaponType;
    if (wepType == FireTypeWep_Link && exceptions.flashFire)
    {
        effectiveness = Absorbtion;
    }
    if (wepType == ElectricTypeWep_Link && exceptions.motorDrive)
    {
        effectiveness = Absorbtion;
    }
    if (wepType == GroundTypeWep_Link && exceptions.levitate)
    {
        effectiveness = Immune;
    }
    if (wepType == FireTypeWep_Link && exceptions.drySkin)
    {
        effectiveness = DoubleEffective;
    }
    if (wepType == WaterTypeWep_Link && exceptions.drySkin)
    {
        effectiveness = Absorbtion;
    }
    if (wepType == FireTypeWep_Link && exceptions.drySkin)
    {
        effectiveness = DoubleEffective;
    }
    if (wepType == FireTypeWep_Link && exceptions.fieryAura)
    {
        AdjustDamageByPercent(bunitA, bunitB, 150);
    }
    if (wepType == FireTypeWep_Link && exceptions.dampAura)
    {
        AdjustDamageByPercent(bunitA, bunitB, 75);
    }
    if (wepType == WaterTypeWep_Link && exceptions.dampAura)
    {
        AdjustDamageByPercent(bunitA, bunitB, 150);
    }
    if (wepType == WaterTypeWep_Link && exceptions.fieryAura)
    {
        AdjustDamageByPercent(bunitA, bunitB, 75);
    }
    if (wepType == ElectricTypeWep_Link && exceptions.stormyAura)
    {
        AdjustDamageByPercent(bunitA, bunitB, 150);
    }
    if (wepType == ElectricTypeWep_Link && exceptions.lightningRod)
    {
        // if the target has lightning rod or the actor does not have lightning rod, then the target is immune
        if (DoesUnitHaveLightningRod(&bunitB->unit, &bunitA->unit) ||
            !DoesUnitHaveLightningRod(&bunitA->unit, &bunitB->unit))
        {
            effectiveness = Immune;
        }
    }
    if (!effectiveness)
    {
        return;
    }

    switch (effectiveness)
    {
        case Immune:
        {
            if (exceptions.scrappy)
            {
                return;
            }
            AdjustDamageByPercent(bunitA, bunitB, 0);
            break;
        }
        case DoubleEffective:
        {
            AdjustDamageByPercentWithPiercing(bunitA, bunitB, 200, 25);
            if (canCounter)
            {
                AdjustDamageByPercent(bunitB, bunitA, 75);
            }
            break;
        }
        case TintedLensCase: // no damage reduction from opponent
        {
            int percent = 150;
            if (exceptions.filter)
            {
                percent = 125;
            }
            AdjustDamageByPercentWithPiercing(bunitA, bunitB, percent, percent - 100);
            break;
        }
        case SuperEffective:
        {
            int percent = 150;
            if (exceptions.filter)
            {
                percent = 125;
            }
            AdjustDamageByPercentWithPiercing(bunitA, bunitB, percent, percent - 100);
            if (canCounter)
            {
                AdjustDamageByPercent(bunitB, bunitA, 75);
            }
            // @ 2x crit avoid + 10 while SE
            break;
        }
        case Absorbtion:
        {
            AdjustDamageByPercent(bunitA, bunitB, 0);
            bunitB->unit.curHP = bunitB->unit.maxHP;
            // hpInitial
            break;
        }
        case Ineffective:
        {
            AdjustDamageByPercent(bunitA, bunitB, 50);
            break;
        }

        default:
    }
}

// Scyther (Meowth / Persian already have a skill)
extern int TechnicianID_Link;
void TechnicianEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    // if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    // {
    if (SkillTester(&bunitA->unit, TechnicianID_Link))
    {
        int mt = GetItemMight(bunitA->weaponBefore);
        if (mt <= 6)
        {
            bunitA->battleAttack += mt;
        }
    }
    // }
}

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
    // if (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))
    // {
    if (ShouldWeaponHaveStabBonus(bunitA->weaponBefore, bunitA->unit.pClassData->number))
    {
        if (SkillTester(&bunitA->unit, AdaptabilityID_Link))
        {
            int mt = GetItemMight(bunitA->weaponBefore);
            bunitA->battleAttack += mt;
        }
    }
    // }
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
extern int WeakArmorID_Link;
int WeakArmorDefEffect(int stat, struct Unit * unit)
{
    if (unit->curHP < unit->maxHP)
    {
        if (SkillTester(unit, WeakArmorID_Link))
        {
            stat -= 5;
            if (stat < 0)
            {
                stat = 0;
            }
        }
    }
    return stat;
}
int WeakArmorSpdEffect(int stat, struct Unit * unit)
{
    if (unit->curHP < unit->maxHP)
    {
        if (SkillTester(unit, WeakArmorID_Link))
        {
            stat += 10;
        }
    }
    return stat;
}

// Unburden: Speed is doubled without a held item.
// Hitmonlee
extern int EquippedAccessoryGetter(struct Unit * unit);
extern int UnburdenID_Link;
int UnburdenEffect(int stat, struct Unit * unit)
{

    if (SkillTester(unit, UnburdenID_Link))
    {
        int heldItem = EquippedAccessoryGetter(unit);

        if (!heldItem)
        {
            stat += stat;
        }
    }
    return stat;
}

extern int IsCoordWater(s8 x, s8 y);
extern int SwiftSwimID_Link;
int SwiftSwimEffect(int stat, struct Unit * unit)
{
    if (SkillTester(unit, SwiftSwimID_Link))
    {
        if (IsCoordWater(unit->xPos, unit->yPos) || IsEffectivenessAuraNearby(unit, unit, DoesUnitHaveDampAura))
        {
            stat += stat;
        }
    }
    return stat;
}
// Hydration: Fully restore each turn when on water.
// Seel, (Lapras), (Vaporeon)

int HydrationUsability(struct Unit * unit)
{
    return IsCoordWater(unit->xPos, unit->yPos) || IsEffectivenessAuraNearby(unit, unit, DoesUnitHaveDampAura);
}

int HydrationEffect(struct Unit * unit)
{
    if (unit->statusDuration)
    {
        unit->statusDuration = 0;
        unit->statusIndex = 0;
    }
    return unit->maxHP - unit->curHP;
}

int AreWeOutdoorsOrFieryAura(struct Unit * unit)
{
    if (AreWeOutdoors())
    {
        return true;
    }
    if (IsEffectivenessAuraNearby(unit, unit, DoesUnitHaveFieryAura))
    {
        return true;
    }
    return false;
}

int AreWeOutdoorsOrDampAura(struct Unit * unit)
{
    if (AreWeOutdoors())
    {
        return true;
    }
    if (IsEffectivenessAuraNearby(unit, unit, DoesUnitHaveDampAura))
    {
        return true;
    }
    return false;
}

// Strong Claws: Boosts str by 12.5%.
extern int StrongClawsID_Link;
// Aerodactyl
int StrongClawsEffect(int stat, struct Unit * unit)
{
    if (SkillTester(unit, StrongClawsID_Link))
    {
        stat += (stat + 3) >> 3;
    }
    return stat;
}

// Snorlax has gluttony

// Pressure: Opponents counter with a random move.
// Birds / Mewtwo
extern int PressureID_Link;
void PressureEffect(struct BattleUnit * bunitA, struct BattleUnit * bunitB)
{
    if (!(gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE)))
    // if (!(gBattleStats.config & (BATTLE_CONFIG_REAL)))
    {
        return;
    }
    if (SkillTester(&bunitA->unit, PressureID_Link))
    {
        int count = 0;
        u32 attr;
        u8 validSlots[5] = { 0 };
        for (int i = 0; i < 5; ++i)
        {
            attr = GetItemAttributes(bunitB->unit.ranks[i]);
            if (attr & IA_WEAPON)
            {
                validSlots[count] = i;
                count++;
            }
        }
        int rand = NextRN_N(count);
        bunitB->weaponBefore = bunitB->unit.ranks[validSlots[rand]];
        bunitB->weapon = bunitB->unit.ranks[validSlots[rand]];
    }
    return;
}

// Synchronize: The attacker will receive the same status condition if it inflicts one to this Pokémon.
// Mew

// Contrary: Debuffs instead buff the user.
// Simple, Moody
extern int LickitungID_Link;
// double debuff or buff
int AdjustForSimple(int debuffVal, struct Unit * unit)
{
    if (unit->pClassData->number != LickitungID_Link)
    {
        return debuffVal;
    }

    debuffVal *= 2;
    return debuffVal;
}

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
