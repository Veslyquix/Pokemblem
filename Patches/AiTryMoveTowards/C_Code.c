#include "C_Code.h"
//! FE8U = 0x0803BA08
extern int prMovGetter(struct Unit * unit);
void AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 ignoreUnitsOnMap)
{

    u8 bestRange;

    s16 xOut = 0;
    s16 yOut = 0;

    if ((gActiveUnit->xPos == x) && (gActiveUnit->yPos == y))
    {
        AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, action, 0, 0, 0, 0);
        return;
    }

    GenerateUnitMovementMapExt(gActiveUnit, MAP_MOVEMENT_EXTENDED);

    int ix = gActiveUnit->xPos;
    int iy = gActiveUnit->yPos;

    int mov = prMovGetter(gActiveUnit);
    xOut = -1;

    // I believe GenerateUnitExtendedMovementMap and GenerateExtendedMovementMapOnRange are broken
    // due to acrobat's taking over of SetWorkingBmMap, so we're using GenerateUnitMovementMapExt
    // GenerateUnitMovementMapExt(gActiveUnit, MAP_MOVEMENT_EXTENDED);
    // it could also be because some of them put 0 as the unit for GenerateMovementMap
    GenerateBestMovementScript(x, y, gWorkingMovementScript);
    u8 * it = gWorkingMovementScript;

    for (;;)
    {
        // if (mov < gAiState.bestBlueMov && gBmMapOther[iy][ix] != 0)
        // {
        // continue;
        // }
        // brk;
        switch (*it)
        {

            case MOVE_CMD_MOVE_UP: // up
                iy--;
                break;

            case MOVE_CMD_MOVE_DOWN: // down
                iy++;
                break;

            case MOVE_CMD_MOVE_LEFT: // left
                ix--;
                break;

            case MOVE_CMD_MOVE_RIGHT: // right
                ix++;
                break;

        } // switch (*it)
        if (*it == MOVE_CMD_HALT)
        {
            break;
        }
        if (gBmMapMovement[iy][ix] > mov)
        {
            break;
        }
        xOut = ix;
        yOut = iy;

        it++;
    }

    /*
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
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
                    if (mov < gAiState.bestBlueMov && gBmMapOther[iy][ix] != 0)
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
    }
    */

    if (xOut >= 0)
    {
        AiSetDecision(xOut, yOut, action, AI_ACTION_NONE, 0, 0, 0);
    }

    return;
}

extern int ProtagID_Link;
//! FE8U = 0x0803A924

/*
s8 AiFindTargetInReachByFunc(s8 (*func)(struct Unit * unit), struct Vec2 * out)
{
    s16 ix;
    s16 iy;

    u8 bestDistance = 0xff;

    s16 xOut = 0;
    s16 yOut = 0;

    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    xOut = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX)
            {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0)
            {
                continue;
            }

            if (gBmMapUnit[iy][ix] == gActiveUnitId)
            {
                continue;
            }

            if (GetUnit(gBmMapUnit[iy][ix])->pCharacterData->number == ProtagID_Link)
            {
                continue;
            }

            if (!func(GetUnit(gBmMapUnit[iy][ix])))
            {
                continue;
            }

            if (gBmMapRange[iy][ix] > bestDistance)
            {
                continue;
            }

            bestDistance = gBmMapRange[iy][ix];
            xOut = ix;
            yOut = iy;
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
*/
