#include "C_Code.h"
//! FE8U = 0x0803E320
void AiFillDangerMap(void)
{
    int ix;
    int iy;
    int i;
    int j;

    u16 item = 0;
    u8 might = 0;

    for (i = 1; i < 0xC0; i++)
    {
        u16 itemTmp;

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

        // BUG: Item is never re-initialized in the loop

        for (j = 0; (j < UNIT_ITEM_COUNT) && (itemTmp = unit->items[j]); j++)
        {
            if (!CanUnitUseWeapon(unit, itemTmp))
            {
                continue;
            }

            if (GetItemMight(itemTmp) > might)
            {
                item = itemTmp;
                might = GetItemMight(itemTmp);
            }
        }

        if (item == 0)
        {
            continue;
        }

        if (!AiCouldReachByBirdsEyeDistance(gActiveUnit, unit, item))
        {
            continue;
        }

        FillMovementAndRangeMapForItem(unit, item);

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
        {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
            {
                if (gMapRangeSigned[iy][ix] == 0)
                {
                    continue;
                }

                gBmMapOther[iy][ix] += (GetUnitPower(unit) + might) >> 1;
            }
        }
    }

    return;
}
