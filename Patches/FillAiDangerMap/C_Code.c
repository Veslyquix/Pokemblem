#include "C_Code.h"
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
