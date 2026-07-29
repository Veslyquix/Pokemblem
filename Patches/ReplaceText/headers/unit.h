enum { UNIT_LEVEL_MAX = 20 };
enum { UNIT_ITEM_COUNT = 5 };
enum { UNIT_DEFINITION_ITEM_COUNT = 4 };
#ifndef FE6 
enum { UNIT_SUPPORT_MAX_COUNT = 7 };
#else 
enum { UNIT_SUPPORT_MAX_COUNT = 10 };
#endif 
enum { UNIT_EXP_DISABLED = 0xFF };
struct CharacterData
{
    /* 00 */ u16 nameTextId;
    /* 02 */ u16 descTextId;
    /* 04 */ u8 number;
    /* 05 */ u8 defaultClass;
    /* 06 */ u16 portraitId;
    /* 08 */ u8 miniPortrait;
    /* 09 */ u8 affinity;
    /* 0A */ u8 sort_order;

    /* 0B */ s8 baseLevel;
    /* 0C */ s8 baseHP;
    /* 0D */ s8 basePow;
    /* 0E */ s8 baseSkl;
    /* 0F */ s8 baseSpd;
    /* 10 */ s8 baseDef;
    /* 11 */ s8 baseRes;
    /* 12 */ s8 baseLck;
    /* 13 */ s8 baseCon;

    /* 14 */ u8 baseRanks[8];

    /* 1C */ u8 growthHP;
    /* 1D */ u8 growthPow;
    /* 1E */ u8 growthSkl;
    /* 1F */ u8 growthSpd;
    /* 20 */ u8 growthDef;
    /* 21 */ u8 growthRes;
    /* 22 */ u8 growthLck;

    /* 23 */ u8 _u23;
    /* 24 */ u8 _u24;
    /* 25 */ u8 _u25[2]; // Unique animation IDs in FE7
    /* 27 */ u8 _u27;

    /* 28 */ u32 attributes;

    /* 2C */ u32 pSupportData;
    /* 30 */ u8 visit_group;

    /* 31 */ u8 _pad_[0x34 - 0x31];
};


struct ClassData
{
    /* 00 */ u16 nameTextId;
    /* 02 */ u16 descTextId;
    /* 04 */ u8 number;
    /* 05 */ u8 promotion;
    /* 06 */ u8 SMSId;
    /* 07 */ u8 slowWalking;
    /* 08 */ u16 defaultPortraitId;
    /* 0A */ u8 sort_order;

    /* 0B */ s8 baseHP;
    /* 0C */ s8 basePow;
    /* 0D */ s8 baseSkl;
    /* 0E */ s8 baseSpd;
    /* 0F */ s8 baseDef;
    /* 10 */ s8 baseRes;
    /* 11 */ s8 baseCon;
    /* 12 */ s8 baseMov;

    /* 13 */ s8 maxHP;
    /* 14 */ s8 maxPow;
    /* 15 */ s8 maxSkl;
    /* 16 */ s8 maxSpd;
    /* 17 */ s8 maxDef;
    /* 18 */ s8 maxRes;
    /* 19 */ s8 maxCon;

    /* 1A */ s8 classRelativePower;

    /* 1B */ s8 growthHP;
    /* 1C */ s8 growthPow;
    /* 1D */ s8 growthSkl;
    /* 1E */ s8 growthSpd;
    /* 1F */ s8 growthDef;
    /* 20 */ s8 growthRes;
    /* 21 */ s8 growthLck;

    /* 22 */ u8 promotionHp;
    /* 23 */ u8 promotionPow;
	#ifndef FE6
    /* 24 */ u8 promotionSkl;
    /* 25 */ u8 promotionSpd;
    /* 26 */ u8 promotionDef;
    /* 27 */ u8 promotionRes;
	#endif 
    /* 28 */ u32 attributes;

    /* 2C */ u8 baseRanks[8];

    /* 34 */ u32 pBattleAnimDef;
	#ifdef FE6 
    /* 38 */ s8* pMovCostTable[1]; // standard, rain, snow
    #endif 
	#ifndef FE6 
	/* 38 */ s8* pMovCostTable[3]; // standard, rain, snow
	#endif 
    /* 44 */ const s8 * pTerrainAvoidLookup;
    /* 48 */ const s8 * pTerrainDefenseLookup;
    /* 4C */ const s8 * pTerrainResistanceLookup;

    /* 50 */ const void * _pU50;
};


struct Unit
{
    /* 00 */ const struct CharacterData* pCharacterData;
    /* 04 */ const struct ClassData* pClassData;

    /* 08 */ s8 level;
    /* 09 */ u8 exp;

    /* 0A */ u8 aiFlags;

    /* 0B */ s8 index;

	#ifndef FE6
    /* 0C */ u32 state;
	#endif 
	#ifdef FE6 
	u16 state; 
	#endif 

    /* 10 */ s8 xPos;
    /* 11 */ s8 yPos;

    /* 12 */ s8 maxHP;
    /* 13 */ s8 curHP;
    /* 14 */ s8 pow;
    /* 15 */ s8 skl;
    /* 16 */ s8 spd;
    /* 17 */ s8 def;
    /* 18 */ s8 res;
    /* 19 */ s8 lck;

    /* 1A */ s8 conBonus;
    /* 1B */ u8 rescue;
#ifdef FE6
s8 movBonusA; // used 
s8 movBonusB; // displayed on stat screen
#endif 
#ifndef FE6
    /* 1C */ u8 ballistaIndex;
    /* 1D */ s8 movBonus;
#endif
    /* 1E */ u16 items[UNIT_ITEM_COUNT];
    /* 28 */ u8 ranks[8];

    /* 30 */ u8 statusIndex : 4;
    /* 30 */ u8 statusDuration : 4;

    /* 31 */ u8 torchDuration : 4;
    /* 31 */ u8 barrierDuration : 4;

    /* 32 */ u8 supports[UNIT_SUPPORT_MAX_COUNT];
	#ifndef FE6
    /* 39 */ s8 supportBits;
	#endif
    /* 3A */ u8 _u3A;
    /* 3B */ u8 _u3B;
	
	

    /* 3C */ struct SMSHandle* pMapSpriteHandle;

    /* 40 */ u16 ai3And4;
    /* 42 */ u8 ai1;
    /* 43 */ u8 ai1data;
    /* 44 */ u8 ai2;
    /* 45 */ u8 ai2data;
    /* 46 */ u8 _u46; 
    /* 47 */ u8 _u47; 
};

#ifndef FE8 
struct UnitDefinition // same as fe6 
{
    /* 00 */ u8  charIndex;
    /* 01 */ u8  classIndex;
    /* 02 */ u8  leaderCharIndex;

    /* 03 */ u8  autolevel  : 1;
    /* 03 */ u8  allegiance : 2;
    /* 03 */ u8  level      : 5;

    /* 04 */ u8 xPosition; 
    /* 05 */ u8 yPosition; 
    /* 06 */ u8 xMove; 
    /* 07 */ u8 yMove; 


    /* 08 */ u8 items[UNIT_DEFINITION_ITEM_COUNT];

    /* 0C */ u8 ai[4];
};
#endif 
#ifdef FE8 
struct UnitDefinition
{
    /* 00 */ u8  charIndex;
    /* 01 */ u8  classIndex;
    /* 02 */ u8  leaderCharIndex;

    /* 03 */ u8  autolevel  : 1;
    /* 03 */ u8  allegiance : 2;
    /* 03 */ u8  level      : 5;

    /* 04 */ u16 xPosition  : 6; /* 04:0 to 04:5 */
    /* 04 */ u16 yPosition  : 6; /* 04:6 to 05:3 */
    /* 05 */ u16 genMonster : 1; /* 05:4 */
    /* 05 */ u16 itemDrop   : 1; /* 05:5 */
    /* 05 */ u16 sumFlag    : 1; /* 05:6 */
    /* 05 */ u16 unk_05_7   : 1; /* 05:7 */
    /* 05 */ u16 extraData  : 8;
    /* 07 */ u16 redaCount  : 8;

    /* 08 */ const void * redas;

    /* 0C */ u8 items[UNIT_DEFINITION_ITEM_COUNT];

    /* 10 */ u8 ai[4];
} BITPACKED;
#endif 

enum
{
    // Unit state constant masks

    US_NONE         = 0,

    US_HIDDEN       = (1 << 0),
    US_UNSELECTABLE = (1 << 1),
    US_DEAD         = (1 << 2),
    US_NOT_DEPLOYED = (1 << 3),
    US_RESCUING     = (1 << 4),
    US_RESCUED      = (1 << 5),
    US_HAS_MOVED    = (1 << 6), // Bad name?
    US_CANTOING     = US_HAS_MOVED, // Alias
    US_UNDER_A_ROOF = (1 << 7),
    US_BIT8 = (1 << 8), // has been seen?
    US_BIT9 = (1 << 9), // hidden by fog?
    US_HAS_MOVED_AI = (1 << 10),
    US_IN_BALLISTA  = (1 << 11),
    US_DROP_ITEM    = (1 << 12),
    US_GROWTH_BOOST = (1 << 13),
    US_SOLOANIM_1   = (1 << 14),
    US_SOLOANIM_2   = (1 << 15),
    US_BIT16        = (1 << 16),
    US_BIT17        = (1 << 17),
    US_BIT18        = (1 << 18),
    US_BIT19        = (1 << 19),
    US_BIT20        = (1 << 20),
    US_BIT21        = (1 << 21),
    US_BIT22        = (1 << 22),
    US_BIT23        = (1 << 23),
    // = (1 << 24),
    US_BIT25 = (1 << 25),
    US_BIT26 = (1 << 26),
    US_BIT27 = (1 << 27),
    // = (1 << 28),
    // = (1 << 29),
    // = (1 << 30),
    // = (1 << 31),

    // Helpers
    US_UNAVAILABLE = (US_DEAD | US_NOT_DEPLOYED | US_BIT16),
};

enum
{
    // Unit status identifiers

    UNIT_STATUS_NONE = 0,

    UNIT_STATUS_POISON = 1,
    UNIT_STATUS_SLEEP = 2,
    UNIT_STATUS_SILENCED = 3,
    UNIT_STATUS_BERSERK = 4,

    UNIT_STATUS_ATTACK = 5,
    UNIT_STATUS_DEFENSE = 6,
    UNIT_STATUS_CRIT = 7,
    UNIT_STATUS_AVOID = 8,

    UNIT_STATUS_SICK = 9,
    UNIT_STATUS_RECOVER = 10,

    UNIT_STATUS_PETRIFY = 11,
    UNIT_STATUS_12 = 12,
    UNIT_STATUS_13 = 13,
};

enum {
    FACTION_BLUE   = 0x00, // player units
    FACTION_GREEN  = 0x40, // ally npc units
    FACTION_RED    = 0x80, // enemy units
    FACTION_PURPLE = 0xC0, // link arena 4th team
};

enum
{
    FACTION_ID_BLUE   = 0,
    FACTION_ID_GREEN  = 1,
    FACTION_ID_RED    = 2,
    FACTION_ID_PURPLE = 3,
};

#define UNIT_IS_VALID(aUnit) ((aUnit) && (aUnit)->pCharacterData)
#define UNIT_CHAR_ID(aUnit) ((aUnit)->pCharacterData->number)
#define UNIT_CLASS_ID(aUnit) ((aUnit)->pClassData->number)
#define UNIT_FACTION(aUnit) ((aUnit)->index & 0xC0)

#define UNIT_CATTRIBUTES(aUnit) ((aUnit)->pCharacterData->attributes | (aUnit)->pClassData->attributes)

#define UNIT_NAME_ID(aUnit) ((aUnit)->pCharacterData->nameTextId)

#define UNIT_MHP_MAX(aUnit) (UNIT_FACTION(unit) == FACTION_RED ? 120 : 60)
#define UNIT_POW_MAX(aUnit) ((aUnit)->pClassData->maxPow)
#define UNIT_SKL_MAX(aUnit) ((aUnit)->pClassData->maxSkl)
#define UNIT_SPD_MAX(aUnit) ((aUnit)->pClassData->maxSpd)
#define UNIT_DEF_MAX(aUnit) ((aUnit)->pClassData->maxDef)
#define UNIT_RES_MAX(aUnit) ((aUnit)->pClassData->maxRes)
#define UNIT_LCK_MAX(aUnit) (30)
#define UNIT_CON_MAX(aUnit) ((aUnit)->pClassData->maxCon)
#define UNIT_MOV_MAX(aUnit) (15)

#define UNIT_CON_BASE(aUnit) ((aUnit)->pClassData->baseCon + (aUnit)->pCharacterData->baseCon)
#define UNIT_MOV_BASE(aUnit) ((aUnit)->pClassData->baseMov)

#define UNIT_CON(aUnit) (UNIT_CON_BASE(aUnit) + (aUnit)->conBonus)
#ifdef FE6 
#define UNIT_MOV(aUnit) ((aUnit)->movBonusA + UNIT_MOV_BASE(aUnit))
#endif 
#ifndef FE6 
#define UNIT_MOV(aUnit) ((aUnit)->movBonus + UNIT_MOV_BASE(aUnit))
#endif 
const struct ClassData* GetClassData(int classId);
const struct CharacterData* GetCharacterData(int charId);



struct BattleUnit {
    /* 00 */ struct Unit unit;

    /* 48 */ u16 weapon;
    /* 4A */ u16 weaponBefore;
	#ifndef FE6 
    /* 4C */ u32 weaponAttributes;
	#endif 
	#ifdef FE6 
    /* 4C */ u16 weaponAttributes;
	#endif 
    /* 50 */ u8 weaponType;
    /* 51 */ u8 weaponSlotIndex;

    /* 52 */ s8 canCounter;

    /* 53 */ s8 wTriangleHitBonus;
    /* 54 */ s8 wTriangleDmgBonus;

    /* 55 */ u8 terrainId;
    /* 56 */ s8 terrainDefense;
    /* 57 */ s8 terrainAvoid;
    /* 58 */ s8 terrainResistance;
    /* 59 */ /* pad */

    /* 5A */ short battleAttack;
    /* 5C */ short battleDefense;
    /* 5E */ short battleSpeed;
    /* 60 */ short battleHitRate;
    /* 62 */ short battleAvoidRate;
    /* 64 */ short battleEffectiveHitRate;
    /* 66 */ short battleCritRate;
    /* 68 */ short battleDodgeRate;
    /* 6A */ short battleEffectiveCritRate;
	#ifndef FE6 
    /* 6C */ short battleSilencerRate;
	#endif 
    /* 6E */ s8 expGain;
    /* 6F */ s8 statusOut;
    /* 70 */ s8 levelPrevious;
    /* 71 */ s8 expPrevious;

    /* 72 */ s8 hpInitial;

    /* 73 */ s8 changeHP;
    /* 74 */ s8 changePow;
    /* 75 */ s8 changeSkl;
    /* 76 */ s8 changeSpd;
    /* 77 */ s8 changeDef;
    /* 78 */ s8 changeRes;
    /* 79 */ s8 changeLck;
    /* 7A */ s8 changeCon;

    /* 7B */ s8 wexpMultiplier;
    /* 7C */ s8 nonZeroDamage;
    /* 7D */ s8 weaponBroke;

    /* 7E */ s8 hasItemEffectTarget;
    /* 7F */ /* pad */
	u8 padding;
};
struct BattleUnit gBattleActor; 
struct BattleUnit gBattleTarget; 

// USED FOR LOCKS ONLY 
// this is the fe8u one, so different than fe7 in some places (but similar) 
enum
{
    // Character/Class attributes

    CA_NONE = 0,

    CA_MOUNTEDAID = (1 << 0),
    CA_CANTO = (1 << 1),
    CA_STEAL = (1 << 2),
    CA_THIEF = (1 << 3),
    CA_DANCE = (1 << 4),
    CA_PLAY = (1 << 5),
    CA_CRITBONUS = (1 << 6),
    CA_BALLISTAE = (1 << 7),
    CA_PROMOTED = (1 << 8),
    CA_SUPPLY = (1 << 9),
    CA_MOUNTED = (1 << 10),
    CA_WYVERN = (1 << 11),
    CA_PEGASUS = (1 << 12),
    CA_LORD = (1 << 13),
    CA_FEMALE = (1 << 14),
    CA_BOSS = (1 << 15),
    CA_LOCK_1 = (1 << 16),
    CA_LOCK_2 = (1 << 17),
    CA_LOCK_3 = (1 << 18), // Dragons or Monster depending of game
    
	#ifndef FE6 
	CA_MAXLEVEL10 = (1 << 19),
	#endif 
	#ifdef FE6 
	CA_LOCK_4 = (1<<19), 
	#endif 
    CA_UNSELECTABLE = (1 << 20),
    CA_TRIANGLEATTACK_PEGASI = (1 << 21),
    CA_TRIANGLEATTACK_ARMORS = (1 << 22),
    CA_BIT_23 = (1 << 23),
    CA_NEGATE_LETHALITY = (1 << 24),
    CA_ASSASSIN = (1 << 25),
    CA_MAGICSEAL = (1 << 26),
    CA_SUMMON = (1 << 27),
	#ifndef FE6 
    CA_LOCK_4 = (1 << 28),
	#endif 
    CA_LOCK_5 = (1 << 29),
    CA_LOCK_6 = (1 << 30),
    CA_LOCK_7 = (1 << 31),

    // Helpers
    CA_REFRESHER = CA_DANCE | CA_PLAY,
    CA_FLYER = CA_WYVERN | CA_PEGASUS,
    CA_TRIANGLEATTACK_ANY = CA_TRIANGLEATTACK_ARMORS | CA_TRIANGLEATTACK_PEGASI,
};

int GetUnitMaxHp(struct Unit* unit); // 8018AB0
int GetUnitPower(struct Unit* unit); // 8018AD0
int GetUnitSkill(struct Unit* unit); // 8018AF0
int GetUnitSpeed(struct Unit* unit); // 8018B30
int GetUnitDefense(struct Unit* unit); // 8018B70
int GetUnitResistance(struct Unit* unit); // 8018B90
int GetUnitLuck(struct Unit* unit); // 8018BB8

extern struct Unit * gActiveUnit; // 3004690
extern struct Unit * GetUnit(int); // 3004690

