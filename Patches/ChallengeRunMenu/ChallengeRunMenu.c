#include "gbafe.h" // headers

#define PUREFUNC __attribute__((pure))
#define ARMFUNC __attribute__((target("arm")))
int Div(int a, int b) PUREFUNC;
int Mod(int a, int b) PUREFUNC;
int DivArm(int b, int a) PUREFUNC;

extern int CR_MaxDisplayed;
extern int CR_TotalOptions;
extern const u8 CR_NumberOfOptionsPerEntryTable[];
extern char * TacticianName; // 8 bytes long
extern int CannotCaptureFlag_Link;
extern int CannotEvolveFlag_Link;

#define CR_BADGE_RING_COLOR_COUNT 6
#define RGB5(r, g, b) ((r) | ((g) << 5) | ((b) << 10))

#define COLOR_WHITE RGB5(31, 31, 31)
#define COLOR_BLACK RGB5(0, 0, 0)
#define COLOR_GRAY RGB5(16, 16, 16)

#define COLOR_RED RGB5(31, 0, 0)
#define COLOR_GREEN RGB5(0, 31, 0)
#define COLOR_BLUE RGB5(0, 0, 31)

#define COLOR_YELLOW RGB5(31, 31, 0)
#define COLOR_ORANGE RGB5(31, 18, 0)
#define COLOR_GOLD RGB5(31, 24, 4)

#define COLOR_CREAM RGB5(31, 29, 18)
#define COLOR_AMBER RGB5(31, 21, 0)
#define COLOR_PEACH RGB5(31, 22, 12)

#define CR_BADGE_TARGET_COLOR COLOR_GOLD
typedef struct
{
    /* 00 */ PROC_HEADER;
    /* 2c */ u8 id; // menu id
    u8 offset;
    u8 handleID;
    u8 redraw;
    u8 updateSMS;
    u8 cannotCatch;
    u8 cannotEvolve;
    u8 cannotGainExp;
    u8 allRandomizerOptions;
    u8 enemySkills;
    u8 nuzlocke;
    u8 displayedBadgeOption;
    u8 pkmn[7];
    u16 badgePalBase[CR_BADGE_RING_COLOR_COUNT];
    // s8 Option[15];
} ChallengeRunProc;

static void ChallengeRunLoop(ChallengeRunProc * proc);
const struct ProcCmd ChallengeRunProcCmd[] = {
    PROC_CALL(LockGame),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_YIELD,
    PROC_REPEAT(ChallengeRunLoop),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),
    PROC_CALL(BMapDispResume),
    PROC_END,
};

#define MENU_X 18
#define MENU_Y 16
#define CR_VISIBLE_OPTIONS 6
#define RULES_X 1
#define RULES_Y 13

enum
{
    CR_OPTION_NEW_NAME,
    CR_OPTION_LITTLE_CUP,
    CR_OPTION_VOID,
    CR_OPTION_CHAOS,
    CR_OPTION_PLUS,
    CR_OPTION_NUZLOCKE,
    CR_OPTION_ASH,
    CR_OPTION_GARY,
    CR_OPTION_OAK,
    CR_OPTION_BILL,
    CR_OPTION_BROCK,
    CR_OPTION_MISTY,
    CR_OPTION_LT_SURGE,
    CR_OPTION_ERIKA,
    CR_OPTION_KOGA,
    CR_OPTION_SABRINA,
    CR_OPTION_BLAINE,
    CR_OPTION_GIOVANNI,
    CR_OPTION_LORELEI,
    CR_OPTION_BRUNO,
    CR_OPTION_AGATHA,
    CR_OPTION_LANCE,
    CR_OPTION_VESLY,
    CR_OPTION_CHEATER,
    CR_OPTION_COUNT,
};

enum
{
    CR_TEXT_TITLE,
    CR_TEXT_RULE_HEADER,
    CR_TEXT_RULE_NONE,
    CR_TEXT_RULE_CANNOT_EVOLVE,
    CR_TEXT_RULE_CANNOT_CAPTURE_CERTAIN,
    CR_TEXT_RULE_CANNOT_CAPTURE,
    CR_TEXT_RULE_CANNOT_GAIN_EXP,
    CR_TEXT_RULE_RANDOMIZER,
    CR_TEXT_RULE_ENEMY_SKILLS,
    CR_TEXT_RULE_ENEMY_SKILLS_2,
    CR_TEXT_RULE_NUZLOCKE,
    CR_TEXT_COUNT,
};

enum
{
    CR_TYPE_NORMAL,
    CR_TYPE_FIGHTING,
    CR_TYPE_FLYING,
    CR_TYPE_POISON,
    CR_TYPE_GROUND,
    CR_TYPE_ROCK,
    CR_TYPE_BUG,
    CR_TYPE_GHOST,
    CR_TYPE_STEEL,
    CR_TYPE_FIRE,
    CR_TYPE_WATER,
    CR_TYPE_GRASS,
    CR_TYPE_ELECTRIC,
    CR_TYPE_PSYCHIC,
    CR_TYPE_ICE,
    CR_TYPE_DRAGON,
    CR_TYPE_DARK,
    CR_TYPE_FAIRY,
};

#define CR_BADGE_BG 3
#define CR_BADGE_TILE_BASE 0x440
#define CR_BADGE_TILE_WIDTH 17
#define CR_BADGE_TILE_HEIGHT 17
#define CR_BADGE_PAL_SLOT 7
#define CR_BADGE_X 8
#define CR_BADGE_Y (-1)
#define CR_BADGE_PLACEHOLDER 0xFF
#define CR_BADGE_RING_FIRST_COLOR 7
#define CR_BADGE_CYCLE_HALF_LENGTH 16
#define CR_BADGE_CYCLE_LENGTH (CR_BADGE_CYCLE_HALF_LENGTH * 2)
#define CR_BADGE_PIXEL_X (CR_BADGE_X * 8)
#define CR_BADGE_PIXEL_Y (CR_BADGE_Y * 8)
#define CR_BADGE_GRAY_BLEND_PERCENT 60

typedef const struct
{
    u32 x;
    u32 y;
} LocationTable;

static const LocationTable CR_CursorLocationTable[] = {
    { MENU_X, MENU_Y + (16 * 0) }, { MENU_X, MENU_Y + (16 * 1) }, { MENU_X, MENU_Y + (16 * 2) },
    { MENU_X, MENU_Y + (16 * 3) }, { MENU_X, MENU_Y + (16 * 4) }, { MENU_X, MENU_Y + (16 * 5) },
    { MENU_X, MENU_Y + (16 * 6) }, //,
    { MENU_X, MENU_Y + (16 * 7) }  //,
                                   // {10, 0x88} //leave room for a description?
};

static const LocationTable CR_PokemonSpriteLocationTable[] = {
    { CR_BADGE_PIXEL_X + 38, CR_BADGE_PIXEL_Y + 32 },  // 11 o'clock
    { CR_BADGE_PIXEL_X + 82, CR_BADGE_PIXEL_Y + 32 },  // 1 o'clock
    { CR_BADGE_PIXEL_X + 20, CR_BADGE_PIXEL_Y + 70 },  // 9 o'clock
    { CR_BADGE_PIXEL_X + 100, CR_BADGE_PIXEL_Y + 70 }, // 3 o'clock
    { CR_BADGE_PIXEL_X + 38, CR_BADGE_PIXEL_Y + 104 }, // 7 o'clock
    { CR_BADGE_PIXEL_X + 82, CR_BADGE_PIXEL_Y + 104 }, // 5 o'clock
};

extern u16 * bg_table[4]; // = {gBG0TilemapBuffer, gBG1TilemapBuffer, gBG2TilemapBuffer, gBG3TilemapBuffer};
// #define BG_SYNC_BIT(aBg) (1 << (aBg))
// static void InitMultiline(struct Text th[], int lines, int x, int y, int bg, int color, int textID);
// static void PrepareMultiline(struct Text th[], int textID);
// static void DrawMultiline(struct Text th[], int lines, int x, int y, int bg);
// static int CountTextIDLines(int textID);
// static char *GetStrNextLine(char *str);

void InitLine(int handleID, int x, int y, int color, int width, const char * str);
void PrepareLine(int handleID, const char * str);
void DrawLine(int handleID, int x, int y, int bg);
void DrawChallengeRun(ChallengeRunProc * proc);
void DrawAdditionalRulesText(ChallengeRunProc * proc);
void DrawChallengeRunBadge(ChallengeRunProc * proc);

extern const u8 * const CR_TypeBadgeBGTable[];
extern const u8 * const CR_TypeBadgePalTable[];
extern const u8 CR_PlaceholderBG[];
extern const u8 CR_PlaceholderBG_pal[];

#define white TEXT_COLOR_SYSTEM_WHITE
#define gray TEXT_COLOR_SYSTEM_GRAY
#define grey TEXT_COLOR_SYSTEM_GRAY
#define blue TEXT_COLOR_SYSTEM_BLUE
#define gold TEXT_COLOR_SYSTEM_GOLD
#define green TEXT_COLOR_SYSTEM_GREEN
#define black TEXT_COLOR_SYSTEM_BLACK

void CR_EraseText(ChallengeRunProc * proc)
{
    // BG_Fill(gBG0TilemapBuffer, 0);
    // BG_EnableSyncByMask(BG0_SYNC_BIT);
    // ResetTextFont();
    DrawChallengeRun(proc);
    // DrawAdditionalRulesText(proc);
}
extern int RandomizeClassNow(int classID);
extern int RandomizeClassesFlag_Link;
extern const struct UnitDefinition * ChallengeRunUnitsTable[];
void SetPkmn(ChallengeRunProc * proc)
{
    const struct UnitDefinition * uDef = ChallengeRunUnitsTable[proc->id + proc->offset];
    int count;
    for (count = 0; count <= 6; count++)
    {
        proc->pkmn[count] = 0;
    }

    count = 0;
    int rand = CheckFlag(RandomizeClassesFlag_Link);

    while ((uDef->classIndex) && (count < 6))
    {
        if (rand)
        {
            proc->pkmn[count] = RandomizeClassNow(uDef->classIndex);
        }
        else
        {
            proc->pkmn[count] = uDef->classIndex;
        }
        uDef++;
        count++;
    }
}

void DrawCR_Sprites(ChallengeRunProc * proc, int bg)
{
    int i;
    // SetPkmn(proc);
    if (proc->offset)
    {
        DisplayUiVArrow(MENU_X + 8, MENU_Y - 8, 0x3240, 1); // up arrow
    }
    // should display down arrow?
    if ((CR_TotalOptions > 7) && (proc->offset < (CR_TotalOptions - CR_MaxDisplayed)))
    {
        DisplayUiVArrow(MENU_X + 8, MENU_Y + (16 * 8), 0x3240, 0);
    }
    DisplayUiHand(CR_CursorLocationTable[proc->id].x, CR_CursorLocationTable[proc->id].y);

    if (proc->updateSMS)
    {
        SetPkmn(proc);
        if (!proc->pkmn[0])
        {
            return;
        }
        ResetUnitSprites();
    }
    for (i = 0; i < 6; i++)
    {
        // if((yOff + 0xF) < 0x60 )
        // PutUnitSprite(0, (i & 1) * 56 + 0x70, yOff + 0x18,
        // GetUnit(1));
        if (!proc->pkmn[i])
        {
            break;
        }
        PutUnitSpriteForClassId(
            bg, CR_PokemonSpriteLocationTable[i].x, CR_PokemonSpriteLocationTable[i].y, 0xc800, proc->pkmn[i]);
    }
    if (proc->updateSMS)
    {
        proc->updateSMS = false;
        if (!proc->pkmn[0])
        {
            return;
        }
        ForceSyncUnitSpriteSheet();
        return;
    }
    SyncUnitSpriteSheet();
}
void ClearLine(int);
static const char * const ChallengeRunInfoText[CR_TEXT_COUNT] = {
    "Challenge Runs",
    "Additional Rules",
    "None",
    "Cannot evolve Pokémon",
    "Cannot capture certain Pokémon",
    "Cannot capture Pokémon",
    "Cannot gain EXP",
    "All randomizer options enabled",
    "Enemies have random,",
    "powerful skills",
    "Fainted Pokémon are released",
};

const char SpecialNames[CR_OPTION_COUNT][10] = {
    "New Name",
    "LittleCup",
    "Void",
    "Chaos",
    "Plus",
    "Nuzlocke",
    "Ash",
    "Gary",
    //"UnderUsed",
    //"OverUsed",
    //"Red",
    //"Blue",
    //"Green",
    //"Yellow",
    "Oak",
    "Bill",
    "Brock",
    "Misty",
    "Lt. Surge",
    "Erika",
    "Koga",
    "Sabrina",
    "Blaine",
    "Giovanni",
    "Lorelei",
    "Bruno",
    "Agatha",
    "Lance",
    "Vesly",
    "Cheater",
};

static int GetCurrentChallengeRunOption(ChallengeRunProc * proc)
{
    return proc->id + proc->offset;
}

static int GetChallengeRunBadgeType(int opt)
{
    switch (opt)
    {
        case CR_OPTION_BROCK:
            return CR_TYPE_ROCK;

        case CR_OPTION_MISTY:
            return CR_TYPE_WATER;

        case CR_OPTION_LT_SURGE:
            return CR_TYPE_ELECTRIC;

        case CR_OPTION_ERIKA:
            return CR_TYPE_GRASS;

        case CR_OPTION_KOGA:
            return CR_TYPE_POISON;

        case CR_OPTION_SABRINA:
            return CR_TYPE_PSYCHIC;

        case CR_OPTION_BLAINE:
            return CR_TYPE_FIRE;

        case CR_OPTION_GIOVANNI:
            return CR_TYPE_GROUND;

        case CR_OPTION_LORELEI:
            return CR_TYPE_ICE;

        case CR_OPTION_BRUNO:
            return CR_TYPE_FIGHTING;

        case CR_OPTION_AGATHA:
            return CR_TYPE_GHOST;

        case CR_OPTION_LANCE:
            return CR_TYPE_DRAGON;

        default:
            return CR_BADGE_PLACEHOLDER;
    }
}

static void UpdateChallengeRunRules(ChallengeRunProc * proc)
{
    int opt = GetCurrentChallengeRunOption(proc);

    proc->cannotCatch = false;
    proc->cannotEvolve = false;
    proc->cannotGainExp = false;
    proc->allRandomizerOptions = false;
    proc->enemySkills = false;
    proc->nuzlocke = false;

    if (opt == CR_OPTION_LITTLE_CUP)
    {
        proc->cannotEvolve = true;
    }
    else if (opt == CR_OPTION_VOID)
    {
        proc->cannotGainExp = true;
    }
    else if (opt == CR_OPTION_CHAOS)
    {
        proc->allRandomizerOptions = true;
    }
    else if (opt == CR_OPTION_PLUS)
    {
        proc->enemySkills = true;
    }
    else if (opt == CR_OPTION_NUZLOCKE)
    {
        proc->nuzlocke = true;
    }
    else if (opt == CR_OPTION_VESLY)
    {
        proc->cannotCatch = true;
        proc->cannotEvolve = true;
    }
    else if (opt >= CR_OPTION_ASH)
    {
        proc->cannotCatch = true;
    }
    if (opt == CR_OPTION_CHEATER)
    {
        proc->cannotCatch = false;
        proc->cannotEvolve = false;
    }
}

static void DrawChallengeRunRuleLine(ChallengeRunProc * proc, int textId, int y)
{
    DrawLine(proc->handleID + textId, RULES_X, y, 0);
}

void DrawAdditionalRulesText(ChallengeRunProc * proc)
{
    int y = RULES_Y;

    UpdateChallengeRunRules(proc);
    // StartFace(0, 0x99, 120, 100, 0);

    TileMap_FillRect(TILEMAP_LOCATED(bg_table[0], 0xC, 0xC), 18, 6, 0);
    // DrawChallengeRunRuleLine(proc, CR_TEXT_RULE_HEADER, y);
    y += 2;

    if (!proc->cannotCatch && !proc->cannotEvolve && !proc->cannotGainExp && !proc->allRandomizerOptions &&
        !proc->enemySkills && !proc->nuzlocke)
    {
        DrawChallengeRunRuleLine(proc, CR_TEXT_RULE_NONE, y);
        BG_EnableSyncByMask(BG_SYNC_BIT(0));
        return;
    }

    if (proc->cannotEvolve)
    {
        DrawChallengeRunRuleLine(proc, CR_TEXT_RULE_CANNOT_EVOLVE, y);
        y += 2;
    }

    if (GetCurrentChallengeRunOption(proc) == CR_OPTION_LITTLE_CUP)
    {
        DrawChallengeRunRuleLine(proc, CR_TEXT_RULE_CANNOT_CAPTURE_CERTAIN, y);
        y += 2;
    }

    if (proc->cannotCatch)
    {
        DrawChallengeRunRuleLine(proc, CR_TEXT_RULE_CANNOT_CAPTURE, y);
        y += 2;
    }

    if (proc->cannotGainExp)
    {
        DrawChallengeRunRuleLine(proc, CR_TEXT_RULE_CANNOT_GAIN_EXP, y);
        y += 2;
    }

    if (proc->allRandomizerOptions)
    {
        DrawChallengeRunRuleLine(proc, CR_TEXT_RULE_RANDOMIZER, y);
        y += 2;
    }

    if (proc->enemySkills)
    {
        DrawChallengeRunRuleLine(proc, CR_TEXT_RULE_ENEMY_SKILLS, y);
        y += 2;
        DrawChallengeRunRuleLine(proc, CR_TEXT_RULE_ENEMY_SKILLS_2, y);
        y += 2;
    }

    if (proc->nuzlocke)
    {
        DrawChallengeRunRuleLine(proc, CR_TEXT_RULE_NUZLOCKE, y);
    }

    BG_EnableSyncByMask(BG_SYNC_BIT(0));
}

static u16 BlendColorToward(u16 color, u16 target, int amount)
{
    int red = color & 0x1F;
    int green = (color >> 5) & 0x1F;
    int blue = (color >> 10) & 0x1F;

    int targetRed = target & 0x1F;
    int targetGreen = (target >> 5) & 0x1F;
    int targetBlue = (target >> 10) & 0x1F;

    int blendAmount = (amount * CR_BADGE_GRAY_BLEND_PERCENT) / 100;

    red = ((red * (CR_BADGE_CYCLE_HALF_LENGTH - blendAmount)) + (targetRed * blendAmount)) / CR_BADGE_CYCLE_HALF_LENGTH;
    green = ((green * (CR_BADGE_CYCLE_HALF_LENGTH - blendAmount)) + (targetGreen * blendAmount)) /
        CR_BADGE_CYCLE_HALF_LENGTH;
    blue =
        ((blue * (CR_BADGE_CYCLE_HALF_LENGTH - blendAmount)) + (targetBlue * blendAmount)) / CR_BADGE_CYCLE_HALF_LENGTH;

    return red | (green << 5) | (blue << 10);
}

static void StoreBadgePaletteBase(ChallengeRunProc * proc)
{
    int i;

    for (i = 0; i < CR_BADGE_RING_COLOR_COUNT; i++)
    {
        proc->badgePalBase[i] = PAL_BG_COLOR(CR_BADGE_PAL_SLOT, CR_BADGE_RING_FIRST_COLOR + i);
    }
}

static void ApplyBadgePaletteCycle(ChallengeRunProc * proc)
{
    int i;
    u32 amount = (GetGameClock() / 4) % CR_BADGE_CYCLE_LENGTH;

    if (amount > CR_BADGE_CYCLE_HALF_LENGTH)
        amount = CR_BADGE_CYCLE_LENGTH - amount;

    for (i = 0; i < CR_BADGE_RING_COLOR_COUNT; i++)
    {
        PAL_BG_COLOR(CR_BADGE_PAL_SLOT, CR_BADGE_RING_FIRST_COLOR + i) =
            BlendColorToward(proc->badgePalBase[i], CR_BADGE_TARGET_COLOR, amount);
    }

    EnablePaletteSync();
}

static void EnableChallengeRunBadgeBg(void)
{
    switch (CR_BADGE_BG)
    {
        case 1:
            gLCDControlBuffer.dispcnt.bg1_on = true;
            break;

        case 2:
            gLCDControlBuffer.dispcnt.bg2_on = true;
            break;

        case 3:
            gLCDControlBuffer.dispcnt.bg3_on = true;
            break;
    }
}

void DrawChallengeRunBadge(ChallengeRunProc * proc)
{
    int x, y;
    int opt = GetCurrentChallengeRunOption(proc);
    int type = GetChallengeRunBadgeType(opt);
    const u8 * img = CR_PlaceholderBG;
    const u8 * pal = CR_PlaceholderBG_pal;

    if (proc->displayedBadgeOption == opt)
    {
        return;
    }

    proc->displayedBadgeOption = opt;

    if (type != CR_BADGE_PLACEHOLDER)
    {
        img = CR_TypeBadgeBGTable[type];
        pal = CR_TypeBadgePalTable[type];
    }

    Decompress(img, BG_CHR_ADDR(CR_BADGE_TILE_BASE));
    CopyToPaletteBuffer(pal, 0x20 * CR_BADGE_PAL_SLOT, 0x20);
    StoreBadgePaletteBase(proc);
    ApplyBadgePaletteCycle(proc);

    TileMap_FillRect(
        TILEMAP_LOCATED(bg_table[CR_BADGE_BG], CR_BADGE_X, CR_BADGE_Y), CR_BADGE_TILE_WIDTH, CR_BADGE_TILE_HEIGHT, 0);

    for (y = 0; y < CR_BADGE_TILE_HEIGHT; y++)
    {
        for (x = 0; x < CR_BADGE_TILE_WIDTH; x++)
        {
            TILEMAP_LOCATED(bg_table[CR_BADGE_BG], CR_BADGE_X + x, CR_BADGE_Y + y)
            [0] = ((CR_BADGE_TILE_BASE & 0x3FF) + (y * CR_BADGE_TILE_WIDTH) + x) | (CR_BADGE_PAL_SLOT << 12);
        }
    }

    BG_EnableSyncByMask(BG_SYNC_BIT(CR_BADGE_BG));
}

void DrawChallengeRun(ChallengeRunProc * proc)
{
    int i, x, y, bg;

    ResetText();

    x = (MENU_X / 8) + 1;
    y = (MENU_Y / 8);
    bg = 0;

    for (i = 0; i < CR_VISIBLE_OPTIONS; i++)
    {
        InitLine(i, x, y + (2 * i), white, 0, SpecialNames[i + proc->offset]);
    }

    proc->handleID = CR_VISIBLE_OPTIONS;

    for (i = 0; i < CR_TEXT_COUNT; i++)
    {
        int color = (i == CR_TEXT_TITLE) ? green : white;
        int width = (GetStringTextLen(ChallengeRunInfoText[i]) + 8) / 8;
        InitLine(i + proc->handleID, 12, 1, color, width, ChallengeRunInfoText[i]);
    }

    for (i = 0; i < CR_VISIBLE_OPTIONS; i++)
    {
        PrepareLine(i, SpecialNames[i + proc->offset]);
        DrawLine(i, x, y + (2 * i), bg);
    }

    for (i = 0; i < CR_TEXT_COUNT; i++)
    {
        PrepareLine(i + proc->handleID, ChallengeRunInfoText[i]);
    }

    DrawLine(proc->handleID + CR_TEXT_TITLE, 12, 0, bg); // "Challenge Runs" // 22 1
    DrawAdditionalRulesText(proc);
    BG_EnableSyncByMask(BG_SYNC_BIT(bg));
}

void StartChallengeRun(ProcPtr parent)
{
    ClearBg0Bg1();
    // EnableBgSyncByIndex(0);
    ChallengeRunProc * proc;
    if (parent)
    {
        proc = (ChallengeRunProc *)Proc_StartBlocking((ProcPtr)&ChallengeRunProcCmd, parent);
    }
    else
    {
        proc = (ChallengeRunProc *)Proc_Start((ProcPtr)&ChallengeRunProcCmd, PROC_TREE_3);
    }
    if (proc)
    {
        proc->id = 0;
        proc->offset = 0;
        proc->redraw = false;
        proc->cannotCatch = false;
        proc->cannotEvolve = false;
        proc->cannotGainExp = false;
        proc->allRandomizerOptions = false;
        proc->enemySkills = false;
        proc->nuzlocke = false;
        proc->displayedBadgeOption = CR_OPTION_COUNT;
        proc->updateSMS = true;
        proc->handleID = 0;
        proc->pkmn[0] = 0;
        // ResetText();
        EnableChallengeRunBadgeBg();
        BG_Fill(gBG3TilemapBuffer, 0);
        BG_Fill(gBG2TilemapBuffer, 0);

        UnpackUiVArrowGfx(0x240, 3);
        StartFace(0, 0x99, 212, 80, 0);
        // DrawUiFrame2(1, 8, 14, 12, 0);
        DrawUiFrame(                          // menu
            gBG1TilemapBuffer,                // back BG
            1, 1, 8, 14, TILEREF(0, 0), 0);   // style as 0 ?
        DrawUiFrame(                          // rules text
            gBG1TilemapBuffer,                // back BG
            1, 0xF, 20, 5, TILEREF(0, 0), 1); // style as 0 ?
        SetBlendTargetA(0, 1, 0, 0, 0);       // transparent ui
                                              // SetBlendTargetB(0, 0, 0, 0, 1);
        // SetTextFontGlyphs(0);
        // SetTextFont(0);
        // ResetTextFont();
        SetupMapSpritesPalettes();
        // CR_EraseText(proc);
        DrawChallengeRun(proc);
        DrawChallengeRunBadge(proc);
        // DrawChallengeRun(proc);
        // BG_EnableSyncByMask(BG0_SYNC_BIT);
        StartGreenText(proc);
        BG_EnableSyncByMask(BG3_SYNC_BIT);
        BG_EnableSyncByMask(BG2_SYNC_BIT);
    }
}

void SetTactNameFromCase(int id)
{
    if (id > 1)
    {
        SetTacticianName(SpecialNames[id]);
    }
}

extern struct KeyStatusBuffer sKeyStatusBuffer;
static void ChallengeRunLoop(ChallengeRunProc * proc)
{

    DrawChallengeRunBadge(proc);
    ApplyBadgePaletteCycle(proc);
    DrawCR_Sprites(proc, 0);

    if (proc->redraw)
    {
        proc->redraw = false;
        DrawChallengeRun(proc);
    }

    u16 keys = sKeyStatusBuffer.newKeys;
    if (!keys)
    {
        keys = sKeyStatusBuffer.repeatedKeys;
    }
    if ((keys & START_BUTTON) || (keys & A_BUTTON))
    { // press A or Start to continue
        gEventSlots[0xC] = 0;

        int opt = proc->id + proc->offset;
        if (opt > 1)
        {
            gEventSlots[0xC] = 1;
        }
        // if (opt == 1) { SetFlag(CannotEvolveFlag_Link); }
        // if (opt > 1) { SetFlag(CannotCaptureFlag_Link); }
        // if (opt >= CR_TotalOptions) { SetFlag(CannotEvolveFlag_Link); }
        // asm("mov r11, r11");
        SetTactNameFromCase(opt);

        Proc_Break((ProcPtr)proc);
        m4aSongNumStart(0x6B);
    };

    if (keys & DPAD_DOWN)
    {
        proc->updateSMS = true;
        if (proc->id < CR_MaxDisplayed)
        {
            proc->id++;
            DrawAdditionalRulesText(proc);
            return;
        } // no need to redraw
        else if ((proc->offset + proc->id) < CR_TotalOptions)
        {
            proc->offset++;
        }
        else if (proc->id >= CR_MaxDisplayed)
        {
            proc->id = 0;
            proc->offset = 0;
        }
        CR_EraseText(proc);
        proc->redraw = true;
    }
    if (keys & DPAD_UP)
    {
        proc->updateSMS = true;
        if (proc->id)
        {
            proc->id--;
            DrawAdditionalRulesText(proc);
            return;
        } // no need to redraw
        else if (proc->offset)
        {
            proc->offset--;
        }

        else if (!proc->id)
        {
            proc->id = CR_MaxDisplayed;
            proc->offset = (CR_TotalOptions - CR_MaxDisplayed);
        }
        CR_EraseText(proc);
        proc->redraw = true;
    }

    // if (keys & DPAD_LEFT) {
    //	proc->Option[proc->id]--;
    //	if (proc->Option[proc->id] < 0) {
    //		proc->Option[proc->id] = CR_NumberOfOptionsPerEntryTable[proc->id] - 1;
    //	}
    //	DrawChallengeRun(proc);
    // }
    // if (keys & DPAD_RIGHT) {
    //	proc->Option[proc->id]++;
    //	if (proc->Option[proc->id] >= CR_NumberOfOptionsPerEntryTable[proc->id]) {
    //		proc->Option[proc->id] = 0;
    //	}
    //	DrawChallengeRun(proc);
    // }
}

extern struct Font * gActiveFont;

void ClearLine(int handleID)
{

    struct Text * th = &gStatScreen.text[handleID]; // max 34
    ClearText(th);
}

// extern u8* gPromoJidLutPoin[][2];
extern u32 AutolevelTable[256];
extern u16 * gPromoJidLutPoin[];

int IsTargetEvolved(struct Unit * unit)
{
    int classID = unit->pClassData->number;
    // if no possible promotions, they are evolved or single stage
    if (!(*gPromoJidLutPoin)[classID])
    {
        return true;
    }
    if (AutolevelTable[classID])
    {
        return true;
    } // evolves from something

    return false;
}

void InitLine(int handleID, int x, int y, int color, int width, const char * str)
{
    if (handleID > 34)
        return;
    // struct Text* th = &gPrepMainMenuTexts[handleID]; // max 10
    struct Text * th = &gStatScreen.text[handleID]; // max 34
    ClearText(th);
    if (!width)
    {
        width = 6;
    } //(GetStringTextLen(str)+8)/8;
    // cleartext goes before and after to definitively erase the text ?
    // th->chr_position = gActiveFont->chr_counter;
    // th->tile_width = width;
    // th->db_id = 0;
    // th->db_enabled = false;
    // th->is_printing = false;
    // gActiveFont->chr_counter += width;
    InitText(th, width); // calls ClearText(th);
    Text_SetColor(th, color);

    // TileMap_FillRect(
    //     TILEMAP_LOCATED(bg_table[bg], x, y),
    //     width+x, height+y, 0);
    // BG_EnableSyncByMask(BG_SYNC_BIT(bg));
}

void PrepareLine(int handleID, const char * str)
{
    if (handleID > 34)
        return;
    // struct Text* th = &gPrepMainMenuTexts[handleID]; // max 10
    struct Text * th = &gStatScreen.text[handleID]; // max 34

    while (1)
    {
        if ('\0' == *str) /* End for fetext */
            return;

        if ('\1' == *str)
        {           /* '\n' for fetext */
            return; // only draw 1 line
        }

        str = Text_DrawCharacter(th, str);
    }
}

void DrawLine(int handleID, int x, int y, int bg)
{
    if (handleID > 34)
        return;
    // struct Text* th = &gPrepMainMenuTexts[handleID]; // max 10
    struct Text * th = &gStatScreen.text[handleID]; // max 34
    bg &= 0x3;
    PutText(th, TILEMAP_LOCATED(bg_table[bg], x, y));

    // BG_EnableSyncByMask(BG_SYNC_BIT(bg));
}

/*
static void InitMultiline(struct Text th[], int lines, int x, int y, int bg, int color, int textID)
{
        if (!textID) return;
        bg &= 0x3;
        if ((int)th < 10) { th = &gPrepMainMenuTexts[(int)th]; }
        if (!lines) { return; }
    int i;
    for (i = 0; i < lines; i++) {
        ClearText(&gPrepMainMenuTexts[i]);
        }

        char *str = GetStringFromIndex(textID);

        int width = 0;
        int max_width = 0;
        int height = 2 * (lines - 1) + y;



    BG_EnableSyncByMask(BG_SYNC_BIT(bg));
        for (i = 0; i < lines; i++) {
                width = (GetStringTextLen(str)+8)/8;
        InitText(&th[i], width);
                Text_SetColor(&th[i], color);
                if (width > max_width) { max_width = width; }
                str = GetStrNextLine(str);
                if (!str) break;

        }


        //asm("mov r11, r11");
    TileMap_FillRect(
        TILEMAP_LOCATED(bg_table[bg], x, y),
        max_width+x, height+y, 0);

}

static int CountStrLines(char *str) {
        int i = 0;
        while (*str) {
        i++;
        str = GetStrNextLine(str); }
        return i;
}
static int CountTextIDLines(int textID) {
        if (!textID) return 0;
        char *str = GetStringFromIndex(textID);
        return CountStrLines(str);
}
static char *GetStrNextLine(char *str) // char *GetStringLineEnd(char *str);
{
    char c = *str;
    while (c > 1) {
        str++;
        c = *str;
    }
        if (str) {
                str++;
                return str;
        }
        return NULL;
}

static void PrepareMultiline(struct Text th[], int textID)
{
        if (!textID) return;
        if ((int)th < 10) { th = &gPrepMainMenuTexts[(int)th]; }

    const char *str = GetStringFromIndex(textID);

    while (1) {
        if ('\0' == *str)        // End for fetext
            return;

        if ('\1' == *str) {      // '\n' for fetext
            th++;
            str++;
            continue;
        }

        str = Text_DrawCharacter(th, str);
    }
}

static void DrawMultiline(struct Text th[], int lines, int x, int y, int bg)
{
        if (!lines) { return; }
        bg &= 0x3;
        if ((int)th < 10) { th = &gPrepMainMenuTexts[(int)th]; }
    for (int i = 0; i < lines; i++) {
        PutText(
            &th[i],
            TILEMAP_LOCATED(bg_table[bg], x, (2 * i) + y));
    }

    BG_EnableSyncByMask(BG_SYNC_BIT(bg));
}

*/
