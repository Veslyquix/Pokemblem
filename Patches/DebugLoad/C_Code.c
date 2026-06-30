#include "C_Code.h"
#include "global.h"

extern int CheckIfCaught(int classID);
extern void AutoLevelSummonedUnit(struct Unit * unit, int levels);
// extern void RegisterPokemon(int classID);
// extern struct Unit * FindFreeSlot(void); // returns unit to make
extern void ChangeS1UnitIntoLowestUnitID(void);
extern const struct UnitDefinition DefaultUnit[];
extern int DefaultUnitID_Link;

struct DebugStuffStruct
{
};
extern struct DebugStuffStruct DebugStuff[];

void DebugLoadUnits(void)
{
    int classID;
    int level;
    struct Unit * unit;
    gEventSlots[1] = DefaultUnitID_Link; // unit ID
    gEventSlots[3] = 1;                  // visible levels
    if (!CheckIfCaught(classID) {
        unit = LoadUnit(DefaultUnit);
        unit->pClassData = classTablePoin[classID];
        AutoLevelSummonedUnit(unit, level);
        ChangeS1UnitIntoLowestUnitID(); 
    }
}
