
struct ItemData
{
    /* 00 */ u16 nameTextId;
    /* 02 */ u16 descTextId;
    /* 04 */ u16 useDescTextId;

    /* 06 */ u8  number;
    /* 07 */ u8  weaponType;

    /* 08 */ u32 attributes;

    /* 0C */ const struct ItemStatBonuses* pStatBonuses;
    /* 10 */ const u8* pEffectiveness;

    /* 14 */ u8  maxUses;

    /* 15 */ u8  might;
    /* 16 */ u8  hit;
    /* 17 */ u8  weight;
    /* 18 */ u8  crit;

    /* 19 */ u8 encodedRange;

    /* 1A */ u16 costPerUse;
    /* 1C */ u8  weaponRank;
    /* 1D */ u8  iconId;
    /* 1E */ u8  useEffectId;
    /* 1F */ u8  weaponEffectId;
	#ifndef FE6 
    /* 20 */ u8  weaponExp;
	#endif 
};

enum {
    // Item attributes

    IA_NONE           = 0,

    IA_WEAPON         = (1 << 0),
    IA_MAGIC          = (1 << 1),
    IA_STAFF          = (1 << 2),
    IA_UNBREAKABLE    = (1 << 3),
    IA_UNSELLABLE     = (1 << 4),
    IA_BRAVE          = (1 << 5),
    IA_MAGICDAMAGE    = (1 << 6),
    IA_UNCOUNTERABLE  = (1 << 7),
    IA_REVERTTRIANGLE = (1 << 8),
    IA_HAMMERNE       = (1 << 9), // Defined as Hammerne effect in FE6 Nightmare module, but as ??? in FE7 & FE8.
    IA_LOCK_3         = (1 << 10), // Dragons or Monster depending of game
    IA_LOCK_1         = (1 << 11),
    IA_LOCK_2         = (1 << 12),
	#ifndef FE6 
    IA_LOCK_0         = (1 << 13), // King in FE6, "show prf if no wexp required" in fe7/fe8 
	#endif 
	#ifdef FE6 
	IA_LOCK_4 		  = (1 << 13), 
	#endif 
    IA_NEGATE_FLYING  = (1 << 14),
    IA_NEGATE_CRIT    = (1 << 15),
	// fe6 ends here 
	#ifndef FE6 
    IA_UNUSABLE       = (1 << 16),
    IA_NEGATE_DEFENSE = (1 << 17),
    IA_LOCK_4         = (1 << 18),
    IA_LOCK_5         = (1 << 19),
    IA_LOCK_6         = (1 << 20),
    IA_LOCK_7         = (1 << 21),
	#endif 

    // Helpers
    IA_REQUIRES_WEXP = (IA_WEAPON | IA_STAFF),
    //IA_LOCK_ANY = (IA_LOCK_0 | IA_LOCK_1 | IA_LOCK_2 | IA_LOCK_3 | IA_LOCK_4 | IA_LOCK_5 | IA_LOCK_6 | IA_LOCK_7 | IA_UNUSABLE)
};

extern struct ItemData* GetItemData(int item);
s8 UnitAddItem(struct Unit* unit, int item);
void UnitClearInventory(struct Unit* unit);
int MakeNewItem(int item);
s8 CanUnitUseWeapon(struct Unit* unit, int item);

int GetItemAttributes(int item);
extern int GetUnitItemCount(struct Unit* unit); // 80176DC
extern int GetItemIndex(int item); // 80171B4
extern int GetUnitItemSlot(struct Unit* unit, int itemIndex); // 8016D0C
extern int GetItemAttributes(int item); // 801727C 
extern s8 CanUnitUseChestKeyItem(struct Unit * unit); // 8027354
extern s8 CanUnitUseDoorKeyItem(struct Unit * unit); // 8027390
extern s8 CanUnitOpenBridge(struct Unit * unit); // 80273A4
extern s8 CanUnitUseStaff(struct Unit* unit, int item); // 80163D4
extern s8 CanUnitUseWeapon (struct Unit* unit, int item); // 80161A4
extern int GetItemUseEffect(int item); // 801743C

#ifdef FE6
#define MONEYBAG_DESC 0x61e
#define CLASS_THIEF_A 0x34 
#define CLASS_THIEF_B 0x35 
#define IRON_SWORD 1 
#define IRON_LANCE 0x10  
#define IRON_AXE 0x1B  
#define IRON_BOW 0x27  
#define FIRE 0x33  
#define LIGHT 0x3B 
#define FLUX 0x3F
#define HEAL 0x43
#define CHEST_KEY_A 0x64 
#define CHEST_KEY_B 0x64 
#define DOOR_KEY 0x65 
#define LOCKPICK 0x67
#define VULNERARY 0x68 
#define ELIXIR 0x69 
#endif 
#ifdef FE7 
#define MONEYBAG_DESC 0x2FF
#define CLASS_THIEF_A 0x3C 
#define CLASS_THIEF_B 0x3D 
#define IRON_SWORD 1 
#define IRON_LANCE 0x14  
#define IRON_AXE 0x1F  
#define IRON_BOW 0x2C  
#define FIRE 0x37  
#define LIGHT 0x3E
#define FLUX 0x44
#define HEAL 0x4A
#define CHEST_KEY_A 0x68 
#define CHEST_KEY_B 0x78 
#define DOOR_KEY 0x69
#define LOCKPICK 0x6A
#define VULNERARY 0x6B
#define ELIXIR 0x6C
#endif 
#ifdef FE8 
#define MONEYBAG_DESC 0x4A1 
#define CLASS_THIEF_A 0xD 
#define CLASS_THIEF_B 0x33 // rogue 
#define IRON_SWORD 1 
#define IRON_LANCE 0x14  
#define IRON_AXE 0x1F  
#define IRON_BOW 0x2D  
#define FIRE 0x38  
#define LIGHT 0x3F
#define FLUX 0x45
#define HEAL 0x4B
#define CHEST_KEY_A 0x69 
#define CHEST_KEY_B 0x79 
#define DOOR_KEY 0x6A
#define LOCKPICK 0x6B
#define VULNERARY 0x6C
#define ELIXIR 0x6D
#endif
struct Text {
    u16 chr_position;
    u8 x;
    u8 colorId;
    u8 tile_width;
    s8 db_enabled;
    u8 db_id;
    u8 is_printing;
};
struct Font {
    /*0x00*/ u8 *vramDest;
             // pointer to table of glyph structs
             // In ASCII fonts, there is just one byte per character, so the glyph
             // for a given character is obtained by indexing this array.
             // In Shift-JIS fonts, each character is 2 bytes. Each element in
             // this array is a linked list. byte2 - 0x40 is the index of the head
             // of the list, and the list is traversed until a matching byte1 is found.
    /*0x04*/ struct Glyph **glyphs;
    /*0x08*/ void (*drawGlyph)(void *, struct Glyph *);
    /*0x0C*/ void *(*get_draw_dest)(struct Text *);
    /*0x10*/ u16 tileref;
    /*0x12*/ u16 chr_counter;
    /*0x14*/ u16 palid;
    /*0x16*/ u8 lang;
};

struct SpecialCharSt {
    s8 color;
    s8 id;
    s16 chr_position;
};
struct SpecialCharSt sSpecialCharStList[64]; 



// MENU 
void LockGame(void); //8015308
void UnlockGame(void); //8015318
void BMapDispSuspend(void); //802D3B4
void BMapDispResume(void); //802D3E8
void StartFastFadeFromBlack(void); //8013FD4
void StartFastFadeToBlack(void); //8013FB0
void WaitForFade(ProcPtr); //8014298
#define BG_SYNC_BIT(aBg) (1 << (aBg))
#define TILEMAP_INDEX(aX, aY) (0x20 * (aY) + (aX))
#define TILEMAP_INDEX2(aX, aY) (((aY) << 5) + (aX))
#define TILEMAP_LOCATED(aMap, aX, aY) (TILEMAP_INDEX((aX), (aY)) + (aMap))
#define TILEREF(aChar, aPal) ((aChar) + ((aPal) << 12))
void BG_Fill(void *dest, int b); //8001810
extern u16 gBG0TilemapBuffer[32 * 32]; //2022C60
extern u16 gBG1TilemapBuffer[32 * 32]; //2023460
extern u16 gBG2TilemapBuffer[32 * 32]; //2023C60
extern u16 gBG3TilemapBuffer[32 * 32]; //2024460
#define BG_SYNC_BIT(aBg) (1 << (aBg))
enum {
    BG_0 = 0,
    BG_1,
    BG_2,
    BG_3,
};

enum {
    BG0_SYNC_BIT = BG_SYNC_BIT(0),
    BG1_SYNC_BIT = BG_SYNC_BIT(1),
    BG2_SYNC_BIT = BG_SYNC_BIT(2),
    BG3_SYNC_BIT = BG_SYNC_BIT(3),
};

#define white 0
#define gray 1
#define grey 1
#define blue 2
#define gold 3
#define green 4
#define black 5

// current unit 3004690
struct KeyStatusBuffer {
    /* 00 */ u8 repeatDelay;     // initial delay before generating auto-repeat presses
    /* 01 */ u8 repeatInterval;  // time between auto-repeat presses
    /* 02 */ u8 repeatTimer;     // (decreased by one each frame, reset to repeatDelay when Presses change and repeatInterval when reaches 0)
    /* 04 */ u16 heldKeys;       // keys that are currently held down
    /* 06 */ u16 repeatedKeys;   // auto-repeated keys
    /* 08 */ u16 newKeys;        // keys that went down this frame
    /* 0A */ u16 prevKeys;       // keys that were held down last frame
    /* 0C */ u16 LastPressState;
    /* 0E */ u16 ABLRPressed; // 1 for Release (A B L R Only), 0 Otherwise
    /* 10 */ u16 newKeys2;
    /* 12 */ u16 TimeSinceStartSelect; // Time since last Non-Start Non-Select Button was pressed
};

extern struct KeyStatusBuffer sKeyStatusBuffer; // 2024C78
extern void BG_EnableSyncByMask(int bg); // 0x8000FFC 
extern void BG_SetPosition(u16 bg, u16 x, u16 y); // 0x8001D8C
extern void LoadUiFrameGraphics(void); // 804A210
extern void LoadObjUIGfx(void); // 8015590

#ifdef FE6 
extern void PutDrawText(struct Text* text, u16* dest, int colorId, int x, int tileWidth, char* string); // 8005AD4
#else 
extern void PutDrawText(struct Text* text, u16* dest, int colorId, int x, int tileWidth, const char* string); // 8005AD4
#endif 
extern void ClearText(struct Text* text); // 80054E0
extern void InitText(struct Text* text, int width); // 8005474
extern void ResetText(void); //80053B0
extern void SetTextFontGlyphs(struct Font *); //8005410
extern void SetTextFont(struct Font *); // 8005450
extern void ResetTextFont(void); //8005438
extern char *GetStringFromIndex(int index);
extern struct Font gDefaultFont;
extern void *GetTextDrawDest(struct Text *th); 

extern int sPrevHandClockFrame; 
extern struct Vec2 sPrevHandScreenPosition; 


extern void DisplayUiHand(int x, int y); //8049F58


struct StatScreenSt
{
    /* 00 */ u8 page;
    /* 01 */ u8 pageAmt;
    /* 02 */ u16 pageSlideKey; // 0, DPAD_RIGHT or DPAD_LEFT
    /* 04 */ short xDispOff; // Note: Always 0, not properly taked into account by most things
    /* 06 */ short yDispOff;
    /* 08 */ s8 inTransition;
    /* 0C */ struct Unit* unit;
    /* 10 */ struct MUProc* mu;
    /* 14 */ const struct HelpBoxInfo* help;
    /* 18 */ struct Text text[0x34];
};
extern struct StatScreenSt gStatScreen; //0x200310C


typedef struct {
    /* 00 */ PROC_HEADER;
	/* 2c */ int seed; 
	s8 id; // menu id 
	u8 offset; 
	u8 redraw; 
	s8 digit; 
	u8 freezeSeed; 
	u8 calledFromChapter; 
	s8 Option[20];
} ConfigMenuProc;

struct DispCnt {
    /* bit  0 */ u16 mode : 3;
    /* bit  3 */ u16 cgbMode : 1; // reserved, do not use
    /* bit  4 */ u16 bmpFrameNum : 1;
    /* bit  5 */ u16 hblankIntervalFree : 1;
    /* bit  6 */ u16 obj1dMap : 1;
    /* bit  7 */ u16 forcedBlank : 1;
    /* bit  8 */ u16 bg0_on : 1;
    /* bit  9 */ u16 bg1_on : 1;
    /* bit 10 */ u16 bg2_on : 1;
    /* bit 11 */ u16 bg3_on : 1;
    /* bit 12 */ u16 obj_on : 1;
    /* bit 13 */ u16 win0_on : 1;
    /* bit 14 */ u16 win1_on : 1;
    /* bit 15 */ u16 objWin_on : 1;
    //STRUCT_PAD(0x02, 0x04);
};
struct DispStat {
    /* bit  0 */ u16 vblankFlag : 1;
    /* bit  1 */ u16 hblankFlag : 1;
    /* bit  2 */ u16 vcountFlag : 1;
    /* bit  3 */ u16 vblankIrqEnable : 1;
    /* bit  4 */ u16 hblankIrqEnable : 1;
    /* bit  5 */ u16 vcountIrqEnable : 1;
    /* bit  6 */ u16 dummy : 2;
    /* bit  8 */ u16 vcountCompare : 8;
    STRUCT_PAD(0x02, 0x04);
};

struct BgCnt {
    /* bit  0 */ u16 priority : 2;
    /* bit  2 */ u16 charBaseBlock : 2;
    /* bit  4 */ u16 dummy : 2;
    /* bit  6 */ u16 mosaic : 1;
    /* bit  7 */ u16 colorMode : 1;
    /* bit  8 */ u16 screenBaseBlock : 5;
    /* bit 13 */ u16 areaOverflowMode : 1;
    /* bit 14 */ u16 screenSize : 2;
    STRUCT_PAD(0x02, 0x04);
};

struct LCDControlBuffer {
    /* 00 */ struct DispCnt dispcnt;
    /* 04 */ struct DispStat dispstat;
    /* 08 */ u32 pad;
    /* 0C */ struct BgCnt bg0cnt;
    /* 10 */ struct BgCnt bg1cnt;
    /* 14 */ struct BgCnt bg2cnt;
    /* 18 */ struct BgCnt bg3cnt;
    ///* 1C */ struct BgCoords bgoffset[4];
    ///* 2C */ u8 win0_right, win0_left;
    ///* 2C */ u8 win1_right, win1_left;
    ///* 30 */ u8 win0_bottom, win0_top;
    ///* 30 */ u8 win1_bottom, win1_top;
    ///* 34 */ struct WinCnt wincnt;
    ///* 38 */ u16 mosaic;
    //         STRUCT_PAD(0x3A, 0x3C);
    ///* 3C */ struct BlendCnt bldcnt;
    ///* 44 */ u8 blendCoeffA;
    ///* 45 */ u8 blendCoeffB;
    ///* 46 */ u8 blendY;
    ///* 48 */ u16 bg2pa;
    ///* 4A */ u16 bg2pb;
    ///* 4C */ u16 bg2pc;
    ///* 4E */ u16 bg2pd;
    ///* 50 */ u32 bg2x;
    ///* 54 */ u32 bg2y;
    ///* 58 */ u16 bg3pa;
    ///* 5A */ u16 bg3pb;
    ///* 5C */ u16 bg3pc;
    ///* 5E */ u16 bg3pd;
    ///* 60 */ u32 bg3x;
    ///* 64 */ u32 bg3y;
    ///* 68 */ s8 colorAddition;
};
extern struct LCDControlBuffer gLCDControlBuffer;


#ifdef FE8 
struct ChapterMap {
    u8  obj1Id;
    u8  obj2Id;
    u8  paletteId;
    u8  tileConfigId;
    u8  mainLayerId;
    u8  objAnimId;
    u8  paletteAnimId;
    u8  changeLayerId;
};
struct ROMChapterData {
    /* 00 */ const char* internalName;

    /* 04 */ struct ChapterMap map;

    /* 0C */ u8  initialFogLevel;
    /* 0D */ u8  hasPrepScreen; // left over from FE7

    /* 0E */ u8 chapTitleId;
    /* 0F */ u8 chapTitleIdInHectorStory; // left over from FE7

    /* 10 */ u8 initialPosX;
    /* 11 */ u8 initialPosY;
    /* 12 */ u8 initialWeather;
    /* 13 */ u8 battleTileSet;

    // This may need a type change.
    /* 14 */ u16 easyModeLevelMalus      : 4;
    /* 14 */ u16 difficultModeLevelBonus : 4;
    /* 14 */ u16 normalModeLevelMalus    : 4;

    /* 16 */ u16 mapBgmIds[11];

    /* 2C */ u8 mapCrackedWallHeath;

    /* 2D */ u8 turnsForTacticsRankAInEliwoodStory[2]; // left over from FE7
    /* 2F */ u8 turnsForTacticsRankAInHectorStory[2]; // left over from FE7
    /* 31 */ u8 turnsForTacticsRankBInEliwoodStory[2]; // left over from FE7
    /* 33 */ u8 turnsForTacticsRankBInHectorStory[2]; // left over from FE7
    /* 35 */ u8 turnsForTacticsRankCInEliwoodStory[2]; // left over from FE7
    /* 37 */ u8 turnsForTacticsRankCInHectorStory[2]; // left over from FE7
    /* 39 */ u8 turnsForTacticsRankDInEliwoodStory[2]; // left over from FE7
    /* 3B */ u8 turnsForTacticsRankDInHectorStory[2]; // left over from FE7

    /* 3D */ u8 unk3D; // padding?

    /* 3E */ u16 gainedExpForExpRankAInEliwoodStory[2]; // left over from FE7
    /* 42 */ u16 gainedExpForExpRankAInHectorStory[2]; // left over from FE7
    /* 46 */ u16 gainedExpForExpRankBInEliwoodStory[2]; // left over from FE7
    /* 4A */ u16 gainedExpForExpRankBInHectorStory[2]; // left over from FE7
    /* 4E */ u16 gainedExpForExpRankCInEliwoodStory[2]; // left over from FE7
    /* 52 */ u16 gainedExpForExpRankCInHectorStory[2]; // left over from FE7
    /* 56 */ u16 gainedExpForExpRankDInEliwoodStory[2]; // left over from FE7
    /* 5A */ u16 gainedExpForExpRankDInHectorStory[2]; // left over from FE7

    /* 5E */ u16 unk5E; // padding?

    /* 60 */ u32 goldForFundsRankInEliwoodStory[2]; // left over from FE7
    /* 68 */ u32 goldForFundsRankInHectorStory[2]; // left over from FE7

    /* 70 */ u16 chapTitleTextId;
    /* 72 */ u16 chapTitleTextIdInHectorStory; // left over from FE7

    /* 74 */ u8 mapEventDataId;
    /* 75 */ u8 gmapEventId;

    /* 76 */ u16 divinationTextIdBeginning; // left over from FE7
    /* 78 */ u16 divinationTextIdInEliwoodStory; // left over from FE7
    /* 7A */ u16 divinationTextIdInHectorStory; // left over from FE7
    /* 7C */ u16 divinationTextIdEnding; // left over from FE7
    /* 7E */ u8 divinationPortrait; // left over from FE7
    /* 7F */ u8 divinationFee; // left over from FE7

    /* 80 */ u8 prepScreenNumber;
    /* 81 */ u8 prepScreenNumberInHectorStory; // left over from FE7
    /* 82 */ u8 merchantPosX;
    /* 83 */ u8 merchantPosXInHectorStory; // left over from FE7
    /* 84 */ u8 merchantPosY;
    /* 85 */ u8 merchantPosYInHectorStory; // left over from FE7

    /* 86 */ s8 victorySongEnemyThreshold;
    /* 87 */ u8 fadeToBlack;

    /* 88 */ u16 statusObjectiveTextId;
    /* 8A */ u16 goalWindowTextId;
    /* 8C */ u8 goalWindowDataType;
    /* 8D */ u8 goalWindowEndTurnNumber;
    /* 8E */ u8 protectCharacterIndex;

    /* 8F */ u8 destPosX;
    /* 90 */ u8 destPosY;

    /* 91 */ u8 unk91; // ?
    /* 92 */ u8 unk92; // ?
    /* 93 */ u8 unk93; // ?
};
const struct ROMChapterData* GetROMChapterStruct(unsigned chIndex); 
#endif 
