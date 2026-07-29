#include "C_Code.h"

extern int NoExpFlag_Link;
extern u8 maxLevelTableHard[];
extern u8 BadgeFlagLink[];

#define BADGE_COUNT 8
#define ACTION_USE_ITEM 0x1A

static int CountNumberOfBadges(void)
{
    int count = 0;

    for (int i = 0; i < BADGE_COUNT; i++)
    {
        count += CheckFlag(BadgeFlagLink[i]);
    }

    return count;
}

int CanGainExpVesly(struct Unit * unit)
{
    int level = unit->level;

    if (CheckFlag(NoExpFlag_Link))
    {
        return FALSE;
    }

    if (!(gBmSt.gameStateBits & BM_FLAG_LINKARENA))
    {
        if (unit->exp == 0xFF)
        {
            return FALSE;
        }

        if (unit->index & 0xC0)
        {
            return FALSE;
        }
    }

    if (gActionData.unitActionType == ACTION_USE_ITEM)
    {
        return TRUE;
    }

    return level < maxLevelTableHard[CountNumberOfBadges()];
}

int ExpModifyBasedOnBadges(int exp, struct Unit * unit)
{
    int maxLevel = maxLevelTableHard[CountNumberOfBadges()];
    int levelsUntilCap = maxLevel - unit->level;

    if (levelsUntilCap <= 0)
    {
        return 0;
    }

    if (levelsUntilCap <= 5)
    {
        exp = (exp * levelsUntilCap * 20) / 100;
    }

    return exp;
}
