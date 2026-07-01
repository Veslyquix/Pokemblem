#include "C_Code.h"
#include "global.h"
#include "muctrl.h"

extern int CheckIfCaught(int classID);
extern void AutoLevelSummonedUnit(struct Unit * unit, int levels);
extern void RegisterPokemon(int classID);
extern int FindFreeSlot(void); // returns unitID to make
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

    int i = GetConvoyItemCount();
    u16 * data = GetConvoyItemArray();
    while (*itemList)
    {
        item = *itemList++;

        if (!ITEM_USES(item))
            item = MakeNewItem(item);

        data[i] = item;
        i++;

        if (i >= 200) // Convoy is full
        {
            return;
        }
    }
}

static void DebugSetFlags(const u16 * flagList)
{
    if (!flagList)
        return;

    while (*flagList)
        SetFlag(*flagList++);
}

extern void FindFreeTile(struct Unit * unit, int * xOut, int * yOut);

static void DebugPlaceUnitNearActiveUnit(struct Unit * unit)
{
    if (!UNIT_IS_VALID(gActiveUnit))
        return;

    int x = (-1);
    int y = (-1);

    FindFreeTile(gActiveUnit, &x, &y);
    if (x >= 0)
    {
        unit->xPos = x;
        unit->yPos = y;
        gBmMapUnit[y][x] = unit->index;
    }
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
    int i = 0;

    while (*classList)
    {
        classID = *classList++;
        if (i > 15)
        {
            return;
        }

        if (!CheckIfCaught(classID))
        {
            unit = LoadUnit(DefaultUnit);
            int uid = FindFreeSlot();
            if (unit && uid != 0xFF)
            {
                i++;

                unit->pClassData = &classTablePoin[classID];
                unit->pCharacterData = GetCharacterData(uid);
                RegisterPokemon(classID);
                AutoLevelSummonedUnit(unit, debugStuff->level);
                unit->items[0] = 0;
                unit->items[1] = 0;
                unit->items[2] = 0;
                unit->items[3] = 0;
                DebugPlaceUnitNearActiveUnit(unit);
                UnitChangeFaction(unit, FACTION_BLUE);
            }
        }
    }

    RefreshAllies();
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
