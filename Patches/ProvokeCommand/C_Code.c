#include "C_Code.h"

struct ProvokeUsabilityStruct
{
    u8 charID;
    u8 classID;
    u16 reqFlag;
    u16 reqEquip;
    u8 reqLvl;
    u8 reqMove;
};
extern struct ProvokeUsabilityStruct ProvokeUsabilityList[];
static int DoesUnitKnowMove(struct Unit * unit, int move)
{
    for (int i = 0; i < 5; ++i)
    {
        if (unit->ranks[i] == move)
        {
            return true;
        }
    }
    return false;
}
int IsProvokeEquipAvailable(struct Unit * unit, int item, int weaponID)
{
    u32 attr;
    int isWep = GetItemAttributes(weaponID) & IA_WEAPON;
    if (isWep)
    {
        if (weaponID && CanUnitUseWeapon(unit, weaponID))
        {

            // don't move this part above CanUnitUseWeapon in case it needs durability
            if (!ITEM_USES(item)) // if durability is not specified, then accept any durability
            {
                weaponID = ITEM_INDEX(weaponID);
            }
            if (weaponID == item)
            {
                return true;
            }
        }
    }
    else
    {

        for (int i = 0; i < 5; ++i)
        {
            weaponID = unit->items[i];
            attr = GetItemAttributes(weaponID);
            if (attr & IA_WEAPON)
            {
                continue;
            } // skip weapons, as they aren't equipped
              // in the for loop so it gets rid of durability each time
            if (attr & IA_STAFF &&
                !CanUnitUseStaff(unit, weaponID)) // no effect of the staff is necessarily needed, I think
            {
                continue;
            } // can't use as staff but it is one, so don't allow Provoke
            if (!ITEM_USES(item)) // if durability is not specified, then accept any durability
            {
                weaponID = ITEM_INDEX(weaponID);
            }
            if (weaponID == item)
            {
                return true;
            }
        }
    }
    return false;
}

int GetUnitAdjustedLevel(struct Unit * unit)
{
    int level = unit->level;
    if (UNIT_CATTRIBUTES(unit) & CA_PROMOTED)
    {
        level += 20;
    }
    return level;
}
int CanUnitUseProvoke(struct Unit * unit)
{
    int unitID = unit->pCharacterData->number;
    int classID = unit->pClassData->number;
    int weaponID = GetUnitEquippedWeapon(unit);

    struct ProvokeUsabilityStruct * data = &ProvokeUsabilityList[0];
    while (data->charID != 0xFF || data->classID != 0xFF || data->reqFlag != 0xFFFF || data->reqEquip != 0xFFFF ||
           data->reqLvl != 0xFF || data->reqMove != 0xFF)
    {

        if (!data->charID || (data->charID == unitID))
        {
            if (!data->classID || (data->classID == classID))
            {
                if (!data->reqLvl || (data->reqLvl <= GetUnitAdjustedLevel(unit)))
                {
                    if ((data->reqMove == 0xFF) || DoesUnitKnowMove(unit, data->reqMove))
                    {
                        if (!data->reqFlag || (CheckFlag(data->reqFlag)))
                        {
                            if (!data->reqEquip || IsProvokeEquipAvailable(unit, data->reqEquip, weaponID))
                            {
                                return true;
                            }
                        }
                    }
                }
            }
        }

        data++;
    }
    return false;
}

extern u32 ProvokeBitflag;
int ProvokeTest(int score) // If provoke bitflag, always target
{
    if (gBattleTarget.unit.state & ProvokeBitflag)
    {
        return 255;
    }
    if (score > 40)
    {
        score = 40;
    }
    return score;
}
int ProvokeSwitchPhaseHook(void) // Clear the provoke bitflag
{
    ClearActiveFactionGrayedStates();
    RefreshUnitSprites();
    SwitchPhases();
    for (int i = gPlaySt.faction + 1; i < gPlaySt.faction + 0x40; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (UNIT_IS_VALID(unit))
            unit->state = unit->state & ~(ProvokeBitflag);
    }
    return RunPhaseSwitchEvents();
}

u8 ProvokeUsability(const struct MenuItemDef * def, int number)
{
    if (gActiveUnit->state & US_HAS_MOVED)
    {
        return MENU_NOTSHOWN;
    }
    if (CanUnitUseProvoke(gActiveUnit))
    {
        return MENU_ENABLED;
    }
    return MENU_NOTSHOWN;
}

extern EventScr EventScr_ShowProvokeEmoticon[];
u8 ProvokeEffect(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gActiveUnit->state |= ProvokeBitflag | US_HAS_MOVED;
    gActionData.unitActionType = UNIT_ACTION_WAIT;
    CallEvent((u16 *)EventScr_ShowProvokeEmoticon, EV_EXEC_GAMEPLAY);
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}
