#include "C_Code.h"
extern int IsTargetTypeImmune(int statusType, struct Unit * unit, struct Unit * unit2);
void GenerateGasTrapTargets(int x, int y, int damage, int facing)
{
    int i;

    int xInc = 0;
    int yInc = 0;

    switch (facing)
    {

        case FACING_UP:
            xInc = 0;
            yInc = -1;

            break;

        case FACING_DOWN:
            xInc = 0;
            yInc = +1;

            break;

        case FACING_LEFT:
            xInc = -1;
            yInc = 0;

            break;

        case FACING_RIGHT:
            xInc = +1;
            yInc = 0;

            break;

    } // switch (facing)

    for (i = 1; i >= 0; --i)
    {
        x += xInc;
        y += yInc;
        int uid = gBmMapUnit[y][x];
        if (uid)
        {
            struct Unit * unit = GetUnit(uid);
            if (!IsTargetTypeImmune(1, unit, unit)) // they are not immune to poison
            {
                AddTarget(x, y, gBmMapUnit[y][x], damage);
            }
        }
    }
}

s8 ShouldSkipGasTrapDisplay(int x, int y, int facing)
{
    int i;

    int xInc = 0;
    int yInc = 0;

    s8 boolHasNoEffect = TRUE;

    switch (facing)
    {

        case FACING_UP:
            xInc = 0;
            yInc = -1;

            break;

        case FACING_DOWN:
            xInc = 0;
            yInc = +1;

            break;

        case FACING_LEFT:
            xInc = -1;
            yInc = 0;

            break;

        case FACING_RIGHT:
            xInc = +1;
            yInc = 0;

            break;

    } // switch (facing)

    for (i = 0; i < 2; ++i)
    {
        x += xInc;
        y += yInc;

        int uid = gBmMapUnit[y][x];
        if (uid)
        {
            struct Unit * unit = GetUnit(uid);
            if (!IsTargetTypeImmune(1, unit, unit)) // they are not immune to poison
            {
                boolHasNoEffect = FALSE;
            }
        }
    }

    return boolHasNoEffect;
}
