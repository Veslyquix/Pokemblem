#include "gbafe.h"
extern int SkillTester(struct Unit * unit, int SkillID);
extern int ExpShareID_Link;
extern void * ShareExpEvent;
extern int IsTrainersTeamDefeated(void);
extern u8 * ExpShareQueueUnitIDs_Link;
extern u8 * ExpShareQueueAmounts_Link;
extern u8 * ExpShareQueueCount_Link;
extern u8 * ExpShareQueueCursor_Link;

extern int MoveToLearnAtLevel(struct Unit * unit, int level);

#define EXP_SHARE_QUEUE_CAPACITY 6
extern void giveExp(struct Unit * unit, int exp, struct Proc * proc);
// int WillUnitLearnMove(struct Unit * unit, int expGain)
// {
// if ((expGain + unit->exp) < 100)
// return false;

// return MoveToLearnAtLevel(unit, unit->level + 1);
// }
extern void prLearnNewSpell(struct Unit * unit, int move, struct Proc * proc);

static void ClearExpShareQueue(void)
{
    *ExpShareQueueCount_Link = 0;
    *ExpShareQueueCursor_Link = 0;
    gEventSlot[0xC] = 0;
}

void GrantExp(struct Unit * unit)
{
    if (gActiveUnit->level >= unit->level)
    {
        if (SkillTester(unit, ExpShareID_Link))
        {
            int expGain = gBattleActor.expGain;
            // int move = WillUnitLearnMove(unit, expGain);
            int count = *ExpShareQueueCount_Link;

            if (count >= EXP_SHARE_QUEUE_CAPACITY)
                return;

            ExpShareQueueUnitIDs_Link[count] = unit->index;
            ExpShareQueueAmounts_Link[count] = expGain;
            *ExpShareQueueCount_Link = count + 1;
        }
    }
}

void ExpShareSetupNextQueuedExp(void)
{
    int cursor = *ExpShareQueueCursor_Link;

    while (cursor < *ExpShareQueueCount_Link)
    {
        struct Unit * unit = GetUnit(ExpShareQueueUnitIDs_Link[cursor]);
        *ExpShareQueueCursor_Link = cursor + 1;

        if (unit)
        {
            gEventSlot[1] = unit->pCharacterData->number;
            gEventSlot[2] = unit->pCharacterData->number;
            gEventSlot[0xC] = 1;
            return;
        }

        cursor = *ExpShareQueueCursor_Link;
    }

    ClearExpShareQueue();
}

void ExpShareGiveCurrentQueuedExp(struct Proc * proc)
{
    int cursor = *ExpShareQueueCursor_Link;

    if (cursor == 0)
    {
        gEventSlot[0xC] = 0;
        return;
    }

    struct Unit * unit = GetUnit(ExpShareQueueUnitIDs_Link[cursor - 1]);
    int expGain = ExpShareQueueAmounts_Link[cursor - 1];

    if (!unit)
    {
        gEventSlot[0xC] = cursor < *ExpShareQueueCount_Link;
        return;
    }

    giveExp(unit, expGain, proc);
    gEventSlot[0xC] = cursor < *ExpShareQueueCount_Link;
}

void QueueExpShare(void)
{
    struct Unit * actor = GetUnit(gBattleActor.unit.index);
    // struct Unit * target = GetUnit(gBattleActor.unit->index);

    ClearExpShareQueue();
    if (!(actor->index >> 7) && (gActionData.unitActionType == UNIT_ACTION_COMBAT) && (gBattleActor.expGain))
    { // player attacking only
        InitTargets(actor->xPos, actor->yPos);

        BmMapFill(gMapRange, 0);
        SetSubjectMap(gMapRange);
        int range = 2;
        MapAddInRange(actor->xPos, actor->yPos, range, 1); //! FE8U = 0x801AABD
        // MapAddInRange(actor->xPos, actor->yPos, 0, (-1));
        MapAddInRange(actor->xPos, actor->yPos, 0, 0);
        // MapSetInRange(actor->xPos, actor->yPos, range, 1);
        ForEachUnitInRange(GrantExp);
        // ForEachUnitInRange(void(*)(struct Unit*));
    }

    if (*ExpShareQueueCount_Link)
        CallMapEventEngine(&ShareExpEvent, 1);
}
