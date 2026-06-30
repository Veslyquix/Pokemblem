#include "C_Code.h"
#include "global.h"

extern int CheckIfCaught(int classID);
extern void AutoLevelSummonedUnit(struct Unit * unit, int levels);
// extern void RegisterPokemon(int classID);
// extern struct Unit * FindFreeSlot(void); // returns unit to make
extern void ChangeS1UnitIntoLowestUnitID(void);
extern const struct UnitDefinition DefaultUnit[];
extern int DefaultUnitID_Link;

enum
{
    DEBUG_STUFF_CHAPTER_COUNT = 128
};

struct DebugStuffStruct
{
    u8 level;
    u8 _pad[3];
    u32 gold;
    const u16 * itemList;
    const u8 * classList;
    const u16 * flagList;
};
extern const struct DebugStuffStruct * DebugStuff[];

static void DebugAddItemsToConvoy(const u16 * itemList)
{
    int item;

    if (!itemList)
        return;

    while (*itemList)
    {
        item = *itemList++;

        if (!ITEM_USES(item))
            item = MakeNewItem(item);

        AddItemToConvoy(item);
    }
}

static void DebugSetFlags(const u16 * flagList)
{
    if (!flagList)
        return;

    while (*flagList)
        SetFlag(*flagList++);
}

static void DebugLoadClasses(const struct DebugStuffStruct * debugStuff)
{
    int classID;
    struct Unit * unit;
    const u8 * classList = debugStuff->classList;

    if (!classList)
        return;

    gEventSlots[1] = DefaultUnitID_Link; // unit ID
    gEventSlots[3] = 1;                  // visible levels

    while (*classList)
    {
        classID = *classList++;

        if (!CheckIfCaught(classID))
        {
            unit = LoadUnit(DefaultUnit);

            if (unit)
            {
                unit->pClassData = classTablePoin[classID];
                AutoLevelSummonedUnit(unit, debugStuff->level);
                ChangeS1UnitIntoLowestUnitID();
            }
        }
    }
}

void DebugLoadUnits(void)
{
    int chapterIndex = gPlaySt.chapterIndex;
    const struct DebugStuffStruct * debugStuff;

    if (chapterIndex < 0 || chapterIndex >= DEBUG_STUFF_CHAPTER_COUNT)
        return;

    debugStuff = DebugStuff[chapterIndex];

    if (!debugStuff)
        return;

    SetPartyGoldAmount(debugStuff->gold);
    DebugAddItemsToConvoy(debugStuff->itemList);
    DebugSetFlags(debugStuff->flagList);
    DebugLoadClasses(debugStuff);
}
