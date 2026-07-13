#include "C_Code.h"
#include "global.h"
#include "muctrl.h"
#include "prepscreen.h"

extern int CheckIfCaught(int classID);
extern void AutoLevelSummonedUnit(struct Unit * unit, int levels);
extern void RegisterPokemon(int classID);
extern int FindFreeSlot(void); // returns unitID to make
extern void ChangeS1UnitIntoLowestUnitID(void);
extern const struct UnitDefinition DefaultUnit[];
extern int DefaultUnitID_Link;

enum
{
    DEBUG_STUFF_CHAPTER_COUNT = 128,
    DEBUG_PREP_LIST_COUNT = 150,
    DEBUG_MAX_LOADED_UNITS = 40
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
extern const u16 DebugRemoveFlagsList[];

static int DebugIsSameItem(int convoyItem, int listedItem)
{
    if (!convoyItem)
        return 0;

    if (ITEM_USES(listedItem))
        return convoyItem == listedItem;

    return ITEM_INDEX(convoyItem) == ITEM_INDEX(listedItem);
}

static int DebugConvoyHasItem(int item)
{
    int i;
    int count = GetConvoyItemCount();
    u16 * data = GetConvoyItemArray();

    for (i = 0; i < count; i++)
    {
        if (DebugIsSameItem(data[i], item))
            return 1;
    }

    return 0;
}

static void ClearConvoyItem(int item)
{
    int i;
    int write = 0;
    int kept;
    int count = GetConvoyItemCount();
    u16 * data = GetConvoyItemArray();

    for (i = 0; i < count; i++)
    {
        if (!DebugIsSameItem(data[i], item))
            data[write++] = data[i];
    }

    kept = write;

    while (write < count)
        data[write++] = 0;

    gConvoyItemCount = kept;
}
extern u16 ItemListToDelete[];
static void DebugClearExtraConvoyItems(void)
{
    u16 * data = ItemListToDelete;
    int tmp;
    while ((tmp = *data) != 0)
    {
        ClearConvoyItem(tmp);
        data++;
    }
}

static void DebugAddItemsToConvoy(const u16 * itemList)
{
    int item;

    if (!itemList)
        return;

    while (*itemList)
    {
        item = *itemList++;

        if (DebugConvoyHasItem(item))
            continue;

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

static void DebugClearFlags(const u16 * flagList)
{
    if (!flagList)
        return;

    while (*flagList)
        ClearFlag(*flagList++);
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

extern int BerserkGeneLink;
static void DebugLoadClasses(const struct DebugStuffStruct * debugStuff)
{
    int classID;
    struct Unit * unit;
    const u8 * classList = debugStuff->classList;

    if (!classList)
        return;

    gEventSlots[1] = DefaultUnitID_Link; // unit ID
    gEventSlots[3] = 1;                  // visible levels
    int level = debugStuff->level;
    int loadedCount = 0;
    int i;

    for (i = 0; i < 0x40; ++i)
    {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit))
        {
            if (unit->state & (US_NOT_DEPLOYED | US_BIT16))
            {
                ClearUnit(unit);
            }
            else
            {
                loadedCount++;
            }
        }
    }

    while (*classList && (loadedCount < DEBUG_MAX_LOADED_UNITS))
    {
        int isCaught;
        int uid;

        classID = *classList++;
        isCaught = CheckIfCaught(classID);

        // if (!isCaught || !DebugPrepListHasClass(classID))
        // {
        unit = LoadUnit(DefaultUnit);
        uid = FindFreeSlot();

        if (unit && uid != 0xFF)
        {
            loadedCount++;

            unit->pClassData = &classTablePoin[classID];
            unit->pCharacterData = GetCharacterData(uid);
            if (!isCaught)
                RegisterPokemon(classID);
            AutoLevelSummonedUnit(unit, level);
            unit->items[0] = BerserkGeneLink;
            unit->items[1] = 0;
            unit->items[2] = 0;
            unit->items[3] = 0;

            if (loadedCount < 16)
            {
                DebugPlaceUnitNearActiveUnit(unit);
            }
            else
            {
                unit->state |= US_NOT_DEPLOYED | US_HIDDEN;
            }

            UnitChangeFaction(unit, FACTION_BLUE);
        }
        else if (unit)
        {
            ClearUnit(unit);
            break;
        }
        // }
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
    DebugClearExtraConvoyItems();
    DebugAddItemsToConvoy(debugStuff->itemList);
    DebugClearFlags(DebugRemoveFlagsList);
    DebugSetFlags(debugStuff->flagList);
    DebugLoadClasses(debugStuff);
}
