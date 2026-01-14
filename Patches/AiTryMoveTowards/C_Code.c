#include "C_Code.h"
//! FE8U = 0x0803BA08
extern int prMovGetter(struct Unit * unit);
void AiTryMoveTowards(s16 x, s16 y, u8 action, u8 maxDanger, u8 unk)
{
    s16 ix;
    s16 iy;

    u8 bestRange;

    s16 xOut = 0;
    s16 yOut = 0;

    if ((gActiveUnit->xPos == x) && (gActiveUnit->yPos == y))
    {
        AiSetDecision(gActiveUnit->xPos, gActiveUnit->yPos, action, 0, 0, 0, 0);
        return;
    }

    if (unk)
    {
        GenerateExtendedMovementMapOnRange(x, y, GetUnitMovementCost(gActiveUnit));
    }
    else
    {
        sub_80410C4(x, y, gActiveUnit);
    }

    GenerateUnitMovementMap(gActiveUnit);

    bestRange = gBmMapRange[gActiveUnit->yPos][gActiveUnit->xPos];
    int mov = prMovGetter(gActiveUnit);
    xOut = -1;
    if (NextRN_N(2)) // half the time we search by x axis first, the other half of the time we search by y axis first
    {
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
    else
    {
        for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
        {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
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

    for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
    {
        for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
        {
            // for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
            // {
            // for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
            // {
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
                // brk;
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

s8 AiFindTargetInReachByFunc(s8 (*func)(struct Unit * unit), struct Vec2 * out)
{
    s16 ix;
    s16 iy;

    u8 bestDistance = 0xff;

    s16 xOut = 0;
    s16 yOut = 0;

    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, GetUnitMovementCost(gActiveUnit));

    xOut = -1;
    int unitID;
    struct Unit * target;
    int range;

    for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
    {
        for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
        {
            unitID = gBmMapUnit[iy][ix];
            if (!unitID)
            {
                continue;
            }

            if (unitID == gActiveUnitId)
            {
                continue;
            }
            target = GetUnit(unitID);

            if (target->pCharacterData->number == ProtagID_Link)
            {
                continue;
            }
            if (!func(target))
            {
                continue;
            }

            for (s16 ty = 0; ty < gBmMapSize.y; ty++)
            {
                for (s16 tx = 0; tx < gBmMapSize.x; tx++)
                {
                    range = gBmMapRange[ty][tx];

                    if (range > MAP_MOVEMENT_MAX)
                    {
                        continue;
                    }

                    if (range > bestDistance)
                    {
                        continue;
                    }

                    bestDistance = range;
                    xOut = ix;
                    yOut = iy;
                }
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

/*
// s8 AiFindTargetInReachByFunc_PathAware(s8 (*func)(struct Unit * unit), struct Vec2 * out)
s8 AiFindTargetInReachByFunc(s8 (*func)(struct Unit * unit), struct Vec2 * out)
{
    s16 ix;
    s16 iy;

    u8 bestDistance = 0xFF;
    s16 xOut = 0;
    s16 yOut = 0;

    struct Unit * target;

    // 1. Generate movement map from active unit (where we can go this turn)
    const s8 * mct = GetUnitMovementCost(gActiveUnit);
    GenerateExtendedMovementMapOnRange(gActiveUnit->xPos, gActiveUnit->yPos, mct);

    xOut = -1;

    // Copy movement map
    // for (iy = 0; iy < gBmMapSize.y; iy++)
    // for (ix = 0; ix < gBmMapSize.x; ix++)
    // gBmMapOther[iy][ix] = gBmMapRange[iy][ix];

    // 2. Loop over all possible targets
    for (iy = gBmMapSize.y - 1; iy >= 0; iy--)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--)
        {
            u8 unitId = gBmMapUnit[iy][ix];

            if (unitId == 0)
                continue;

            // if (unitId == gActiveUnitId)
            // continue;

            target = GetUnit(unitId);

            if (target->pCharacterData->number == ProtagID_Link)
                continue;

            if (!func(target))
                continue;

            // 3. Generate distance map from this target
            // GenerateExtendedMovementMapOnRange(target->xPos, target->yPos, mct);

            // 4. Evaluate reachable tiles
            for (s16 ty = 0; ty < gBmMapSize.y; ty++)
            {
                for (s16 tx = 0; tx < gBmMapSize.x; tx++)
                {
                    // if (gBmMapOther[ty][tx] > MAP_MOVEMENT_MAX)
                    // continue; // can't reach this turn

                    if (gBmMapRange[ty][tx] > MAP_MOVEMENT_MAX)
                        continue; // no path to target

                    if (gBmMapRange[ty][tx] > bestDistance)
                        continue;

                    bestDistance = gBmMapRange[ty][tx];

                    xOut = tx;
                    yOut = ty;
                }
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
*/
