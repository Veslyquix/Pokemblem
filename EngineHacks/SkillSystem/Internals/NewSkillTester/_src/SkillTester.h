#include "gbafe.h"

typedef struct SkillBuffer SkillBuffer;
typedef struct AuraSkillBuffer AuraSkillBuffer;


extern s8 AreAllegiancesEqual(int factionA, int factionB);
extern int AreUnitsAllied(int, int) __attribute__((long_call));
extern int IsSameAllegience(int, int) __attribute__((long_call)); // forgive the typo

struct SkillBuffer {
/*00*/  u8 lastUnitChecked;
/*01*/  u8 skills[11];
};

struct BWLData {
/*00*/  u8 unk1;
/*01*/  u8 skills[4];
/*05*/  u8 pad[11]; //Stuff not relevant for skills
};

struct AuraSkillBuffer {
/*00*/  u8 skillID;
/*01*/  u8 distance; //Relative to main unit
/*02*/  u8 faction;
/*03*/  u8 pad;
};

extern struct BWLData gBWLDataArray[];

extern SkillBuffer gAttackerSkillBuffer[];
extern SkillBuffer gDefenderSkillBuffer[];
extern AuraSkillBuffer gAuraSkillBuffer[];
extern u8 gUnitRangeBuffer[];

extern int gAuraSkillBufferLimit;

extern u8 AuraSkillTable[];
extern u8 NegatedSkills[];

extern u8 NihilIDLink;
extern u32 PassiveSkillBit;
extern u32 PassiveSkillStack;
