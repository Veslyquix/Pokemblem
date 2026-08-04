#include "C_Code.h"

extern int FireType_Link;
extern int ElectricType_Link;
extern int PoisonType_Link;
extern int GroundType_Link;
extern int FlyingType_Link;
extern int GrassType_Link;
extern int IceType_Link;

extern int BurnStatusID_Link;
extern int ParalyzeStatusID_Link;
extern int SleepStatusID_Link;
extern int PoisonStatusID_Link;
extern int FreezeStatusID_Link;
extern int TrappedStatusID_Link;
extern int AcidArmorID_Link;
extern int QuickFeetID_Link;
extern int GutsID_Link;

extern int SkillTester(struct Unit * unit, int skillID);

int IsStatusApplicable(struct Unit * unit, int status)
{
    if (unit->statusDuration == 0)
        return 0;

    if (unit->statusIndex != status)
        return 0;

    return 1;
}

static int HasAnyStatus(struct Unit * unit)
{
    return unit->statusIndex && unit->statusDuration;
}

static int ApplyLightStatusDebuff(int stat)
{
    return stat - ((stat + 4) >> 3);
}

int IsTargetTypeImmune(int status, struct Unit * attacker, struct Unit * defender)
{
    int immuneTypes = 0;

    (void)attacker; // parameter is unused

    if (status == BurnStatusID_Link)
        immuneTypes = FireType_Link;
    else if (status == TrappedStatusID_Link)
        immuneTypes = FlyingType_Link;
    else if (status == SleepStatusID_Link)
        immuneTypes = GrassType_Link;
    else if (status == ParalyzeStatusID_Link)
        immuneTypes = ElectricType_Link | GroundType_Link;
    else if (status == PoisonStatusID_Link)
        immuneTypes = PoisonType_Link;
    else if (status == FreezeStatusID_Link)
        immuneTypes = IceType_Link | FireType_Link;

    if (immuneTypes == 0)
        return 0;

    return (((u32)defender->pClassData->_pU50 & immuneTypes) != 0);
}

int StrDebuff_Status(int stat, struct Unit * unit)
{
    if (stat >= 0 && HasAnyStatus(unit))
    {
        if (SkillTester(unit, GutsID_Link))
            stat += ((stat + 2) >> 2); // 125% Str
        else if (SkillTester(unit, QuickFeetID_Link))
        {
            return stat;
        }
        else if (SkillTester(unit, AcidArmorID_Link))
        {
            return stat;
        }

        else if (IsStatusApplicable(unit, BurnStatusID_Link))
            stat = ((stat + 1) >> 1); // 50% Str
        else
            stat = ApplyLightStatusDebuff(stat); // 87.5% Str
    }

    return stat;
}

int MagDebuff_Status(int stat, struct Unit * unit)
{
    if (stat >= 0 && HasAnyStatus(unit))
    {
        if (SkillTester(unit, GutsID_Link))
            stat += ((stat + 2) >> 2); // 125% Mag
        else if (SkillTester(unit, QuickFeetID_Link))
        {
            return stat;
        }
        else if (SkillTester(unit, AcidArmorID_Link))
        {
            return stat;
        }
        else if (IsStatusApplicable(unit, BurnStatusID_Link))
            stat = ((stat + 1) >> 1); // 50% Mag
        else
            stat = ApplyLightStatusDebuff(stat); // 87.5% Str
    }

    return stat;
}

int SpdDebuff_Status(int stat, struct Unit * unit)
{
    if (stat >= 0 && HasAnyStatus(unit))
    {
        if (SkillTester(unit, QuickFeetID_Link))
            stat += ((stat + 2) >> 2); // 125% Spd
        else if (SkillTester(unit, GutsID_Link))
        {
            return stat;
        }
        else if (SkillTester(unit, AcidArmorID_Link))
        {
            return stat;
        }
        else if (IsStatusApplicable(unit, TrappedStatusID_Link) || IsStatusApplicable(unit, ParalyzeStatusID_Link))
            stat = ((stat + 2) >> 2); // 25% Spd
        else
            stat = ApplyLightStatusDebuff(stat); // 87.5% Spd
    }

    return stat;
}

int SklDebuff_Status(int stat, struct Unit * unit)
{
    if (stat >= 0 && HasAnyStatus(unit))
    {
        if (SkillTester(unit, QuickFeetID_Link))
            return stat;
        else if (SkillTester(unit, GutsID_Link))
        {
            return stat;
        }
        else if (SkillTester(unit, AcidArmorID_Link))
        {
            return stat;
        }
        else
            stat = ApplyLightStatusDebuff(stat); // 87.5% Skl/Lck
    }

    return stat;
}

int LckDebuff_Status(int stat, struct Unit * unit)
{
    if (stat >= 0 && HasAnyStatus(unit))
    {
        if (SkillTester(unit, QuickFeetID_Link))
            return stat;
        else if (SkillTester(unit, GutsID_Link))
        {
            return stat;
        }
        else if (SkillTester(unit, AcidArmorID_Link))
        {
            return stat;
        }
        else
            stat = ApplyLightStatusDebuff(stat); // 87.5% Skl/Lck
    }

    return stat;
}

int DefDebuff_Status(int stat, struct Unit * unit)
{
    if (stat >= 0 && HasAnyStatus(unit))
    {
        if (SkillTester(unit, AcidArmorID_Link))
            stat += ((stat + 2) >> 2); // 125% Def
        else if (SkillTester(unit, QuickFeetID_Link))
        {
            return stat;
        }
        else if (SkillTester(unit, GutsID_Link))
        {
            return stat;
        }
        else if (IsStatusApplicable(unit, SleepStatusID_Link) || IsStatusApplicable(unit, FreezeStatusID_Link))
            stat = ((stat + 1) >> 1); // 50% Def
        else if (IsStatusApplicable(unit, PoisonStatusID_Link))
            stat -= ((stat + 3) >> 2); // 75% Def
        else
            stat = ApplyLightStatusDebuff(stat); // 87.5% Def
    }

    return stat;
}

int ResDebuff_Status(int stat, struct Unit * unit)
{
    if (stat >= 0 && HasAnyStatus(unit))
    {
        if (SkillTester(unit, AcidArmorID_Link))
            stat += ((stat + 2) >> 2); // 125% Res
        else if (SkillTester(unit, QuickFeetID_Link))
        {
            return stat;
        }
        else if (SkillTester(unit, GutsID_Link))
        {
            return stat;
        }
        else if (IsStatusApplicable(unit, FreezeStatusID_Link))
            stat = ((stat + 1) >> 1); // 50% Res
        else if (IsStatusApplicable(unit, SleepStatusID_Link))
            stat = ((stat + 1) >> 1); // 50% Res
        else if (IsStatusApplicable(unit, PoisonStatusID_Link))
            stat -= ((stat + 3) >> 2); // 75% Res
        else
            stat = ApplyLightStatusDebuff(stat); // 87.5% Res
    }

    return stat;
}

int MovDebuff_Status(int stat, struct Unit * unit)
{
    if (stat >= 0 && IsStatusApplicable(unit, TrappedStatusID_Link))
        stat = (stat + 2) >> 2;

    return stat;
}
