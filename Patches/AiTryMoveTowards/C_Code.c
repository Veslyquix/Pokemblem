#include "C_Code.h"
//! FE8U = 0x0803BA08
extern int prMovGetter(struct Unit * unit);
int AreAdjacentTilesToTargetTooExpensiveToUseBlueArrowPathing(int x, int y)
{
    // return gBmMapMovement[y - 1][x] > 63 && gBmMapMovement[y + 1][x] > 63 && gBmMapMovement[y][x - 1] > 63 &&
    // gBmMapMovement[y][x + 1] > 63;
    return gBmMapRange[y][x] > 63;
}
struct Vec2 *
Vanilla_AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 ignoreUnitsOnMap, int mov, struct Vec2 * coord);
void AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 ignoreUnitsOnMap)
{
    struct Vec2 coord = { 0, 0 };
    coord.x = -1;

    if ((gActiveUnit->xPos == x) && (gActiveUnit->yPos == y))
    {
        AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, action, 0, 0, 0, 0);
        return;
    }

    int ix = gActiveUnit->xPos;
    int iy = gActiveUnit->yPos;
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

    if (maxDanger != 0xFF) // not random pathing when following safety rules
    {
        Vanilla_AiTryMoveTowards(x, y, action, maxDanger, ignoreUnitsOnMap, mov, &coord); // for danger / safety
        x = coord.x;
        y = coord.y;
        if (coord.x >= 0)
        {
            AiSetDecision(coord.x, coord.y, action, AI_ACTION_NONE, 0, 0, 0);
            return;
        }
    }

    // gBmMapUnit[y][x] = savedUnit;
    // I believe GenerateUnitExtendedMovementMap and GenerateExtendedMovementMapOnRange are broken
    // due to acrobat's taking over of SetWorkingBmMap, so we're using GenerateUnitMovementMapExt
    // GenerateUnitMovementMapExt(gActiveUnit, MAP_MOVEMENT_EXTENDED);
    // it could also be because some of them put 0 as the unit for GenerateMovementMap
    if (!AreAdjacentTilesToTargetTooExpensiveToUseBlueArrowPathing(x, y))
    {
        GenerateUnitMovementMapExt(gActiveUnit, MAP_MOVEMENT_EXTENDED);

        GenerateBestMovementScript(x, y, gWorkingMovementScript);
        u8 * it = gWorkingMovementScript;

        for (;;)
        {
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
            it++;
            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId)
            {
                continue;
            }
            coord.x = ix;
            coord.y = iy;
        }
        if (coord.x < 0)
        {
            Vanilla_AiTryMoveTowards(x, y, action, maxDanger, ignoreUnitsOnMap, mov, &coord);
        }
    }
    else
    { // vanilla version when really far away
        Vanilla_AiTryMoveTowards(x, y, action, maxDanger, ignoreUnitsOnMap, mov, &coord);
    }

    if (coord.x >= 0)
    {
        AiSetDecision(coord.x, coord.y, action, AI_ACTION_NONE, 0, 0, 0);
    }

    return;
}

struct Vec2 *
Vanilla_AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 ignoreUnitsOnMap, int mov, struct Vec2 * coord)
{

    GenerateUnitMovementMap(gActiveUnit);
    int bestRange = gBmMapRange[gActiveUnit->yPos][gActiveUnit->xPos];
    for (int iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (int ix = gBmMapSize.x - 1; ix >= 0; ix--)
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
            coord->x = ix;
            coord->y = iy;
        }
    }
    return coord;
}
extern int ProtagID_Link;
//! FE8U = 0x0803A924

// if multiple targets within the same distance but outside attack range, 50% chance of overwriting the previous target
// for TryMoveTowardsEnemy
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

            // if (GetUnit(gBmMapUnit[iy][ix])->pCharacterData->number == ProtagID_Link)
            // {
            // continue;
            // }

            if (!func(GetUnit(gBmMapUnit[iy][ix])))
            {
                continue;
            }

            if (gBmMapRange[iy][ix] > bestDistance)
            {
                continue;
            }
            if (gBmMapRange[iy][ix] == bestDistance && NextRN_N(2))
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
