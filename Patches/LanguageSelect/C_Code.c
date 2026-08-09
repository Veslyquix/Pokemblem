#include "C_Code.h"

extern u16 ** sGfx_MiscUiGraphics;     // 0x80156ac
extern u16 ** sImg_DifficultyMenuObjs; // 0x80ac188
extern u16 ** sImg_SaveScreenSprits;   // 0x80a8edc
extern u16 ** sPal_MiscUiGraphics;     // 0x80156b8
extern u16 ** sPal_08A295B4;           // 0x80a8ee8

extern u16 LevelSelect_CN;
extern u16 SaveControl_CN;
extern u16 SystemIcon_CN;
extern const u8 titlebackgroundimage[];
extern const u16 titlebackgroundpalette[];
extern const u16 titlebackgroundtsa[];
extern const u8 TitleBackgroundImage_CN[];
extern const u16 TitleBackgroundPalette_CN[];
extern u8 * CurrentLanguage_Link;
int GetLanguage()
{
    return *CurrentLanguage_Link;
}

static void CopyTitleBackgroundTsa(const void * tsa)
{
    const u32 * src = tsa;
    u32 * dst = (u32 *)BG_GetMapBuffer(BG_0);
    u32 * end = (u32 *)BG_GetMapBuffer(BG_1);

    while (dst < end)
    {
        *dst++ = *src++;
    }
}

void Hook_LoadTitleBackground(void)
{
    const void * image = titlebackgroundimage;
    const void * palette = titlebackgroundpalette;

    if (GetLanguage() == 2)
    {
        image = TitleBackgroundImage_CN;
        palette = TitleBackgroundPalette_CN;
    }

    BG_SetColorBpp(BG_0, 8);

    Decompress(image, (void *)0x06002E00);
    Decompress(image, (void *)0x06000000);

    CopyToPaletteBuffer(palette, 0, 0x200);
    CopyTitleBackgroundTsa(titlebackgroundtsa);

    EnablePaletteSync();
    BG_EnableSyncByMask(BG_SYNC_BIT(BG_0));
}
void LoadObjUIGfx(void)
{
    if (GetLanguage() == 2)
    {
        Decompress(&SystemIcon_CN, gGenericBuffer);
    }
    else
    {
        Decompress(sGfx_MiscUiGraphics, gGenericBuffer);
    }

    Copy2dChr(gGenericBuffer, (void *)0x06010000, 0x18, 4);

    ApplyPalettes(sPal_MiscUiGraphics, 0x10, 2);

    return;
}

// InitDifficultySelectScreen  80AC084 Img_DifficultyMenuObjs 8A28A0C
void Hook_InitDifficultySelectScreen(void)
{

    ApplyPalette(*sPal_08A295B4, 2);
    if (GetLanguage() == 2)
    {
        Decompress(&LevelSelect_CN, (void *)0x06010800);
    }

    else
    {
        Decompress(sImg_DifficultyMenuObjs, (void *)0x06010800);
    }
}

// SaveMenu_InitScreen 0x080A8CD4 Img_SaveScreenSprits 8A26A74
// SaveMenu_ReloadScreenFormDifficulty 0x080AA30C
void Hook_LoadDifficultyGfx(void)
{
    CallARM_FillTileRect(
        gBG2TilemapBuffer, gGenericBuffer,
        OBJ_PALETTE(BGPAL_SAVEMENU_BGFOG) + OBJ_PRIORITY(0) + OBJ_CHAR(BGCHR_SAVEMENU_BGFOG));
    if (GetLanguage() == 2)
    {
        Decompress(&SaveControl_CN, OBJ_VRAM0 + OBJCHR_SAVEMENU_SPRITES * TILE_SIZE_4BPP);
    }
    else
    {
        Decompress(sImg_SaveScreenSprits, OBJ_VRAM0 + OBJCHR_SAVEMENU_SPRITES * TILE_SIZE_4BPP);
    }
}

#define LS_LANGUAGE_COUNT 3

#define LS_OPTION_X 19
#define LS_OPTION_Y 5
#define LS_OPTION_Y_STEP 3
#define LS_HAND_X ((LS_OPTION_X - 1) * 8)
#define LS_HAND_Y_BASE ((LS_OPTION_Y * 8))
#define LS_HAND_Y_STEP (LS_OPTION_Y_STEP * 8)

#define LS_RIGHT_FRAME_X 14
#define LS_RIGHT_FRAME_Y 2
#define LS_RIGHT_FRAME_W 14
#define LS_RIGHT_FRAME_H 16

#define LS_FLAG_FRAME_X 3
#define LS_FLAG_FRAME_Y 5
#define LS_FLAG_FRAME_W 10
#define LS_FLAG_FRAME_H 9
#define LS_FLAG_X 5
#define LS_FLAG_Y 8
#define LS_FLAG_W 6
#define LS_FLAG_H 4

#define LS_FLAG_TILE_BASE 0x280
#define LS_FLAG_PAL_SLOT 10

#define RGB5(r, g, b) ((r) | ((g) << 5) | ((b) << 10))

extern u8 * LanguageSelect_CurrentLanguageLink;
extern u16 * bg_table[4];
extern struct KeyStatusBuffer sKeyStatusBuffer;
extern const u8 LanguageSelectFlagGfxEnglish[];
extern const u8 LanguageSelectFlagGfxSpanish[];
extern const u8 LanguageSelectFlagGfxChinese[];
extern const u16 LanguageSelectFlagPalEnglish[];
extern const u16 LanguageSelectFlagPalSpanish[];
extern const u16 LanguageSelectFlagPalChinese[];
extern u16 EnglishText_Link;
extern u16 SpanishText_Link;
extern u16 ChineseText_Link;

typedef struct
{
    PROC_HEADER;

    u8 selected;
    u8 redraw;
    u8 textHandleBase;
    u8 pad;
    u16 timer;
    struct Text text[LS_LANGUAGE_COUNT + 2];
} LanguageSelectProc;

static u16 * const sLanguageTextLinks[LS_LANGUAGE_COUNT] = {
    &EnglishText_Link,
    &SpanishText_Link,
    &ChineseText_Link,
};

static const u8 * const sFlagGfxTable[LS_LANGUAGE_COUNT] = {
    LanguageSelectFlagGfxEnglish,
    LanguageSelectFlagGfxSpanish,
    LanguageSelectFlagGfxChinese,
};

static const u16 * const sFlagPalTable[LS_LANGUAGE_COUNT] = {
    LanguageSelectFlagPalEnglish,
    LanguageSelectFlagPalSpanish,
    LanguageSelectFlagPalChinese,
};

static void DrawLanguageFlag(int language)
{
    int x, y;

    if (language < 0 || language >= LS_LANGUAGE_COUNT)
    {
        language = 0;
    }

    Decompress(sFlagGfxTable[language], BG_CHR_ADDR(LS_FLAG_TILE_BASE));
    CopyToPaletteBuffer(sFlagPalTable[language], 0x20 * LS_FLAG_PAL_SLOT, 0x20);
    EnablePaletteSync();

    for (y = 0; y < LS_FLAG_H; y++)
    {
        for (x = 0; x < LS_FLAG_W; x++)
        {
            TILEMAP_LOCATED(gBG1TilemapBuffer, LS_FLAG_X + x, LS_FLAG_Y + y)
            [0] = TILEREF(LS_FLAG_TILE_BASE + (y * LS_FLAG_W) + x, LS_FLAG_PAL_SLOT);
        }
    }
}

static void InitLine(struct Text * text, int x, int y, int color, int width, const char * str)
{
    ClearText(text);
    InitText(text, width);
    Text_SetColor(text, color);
    Text_SetCursor(text, 0);
    Text_DrawString(text, str);
    PutText(text, TILEMAP_LOCATED(gBG0TilemapBuffer, x, y));
}

static void DrawLanguageText(LanguageSelectProc * proc)
{
    int i;

    ResetText();
    BG_Fill(gBG0TilemapBuffer, 0);

    InitLine(&proc->text[0], 5, 6, TEXT_COLOR_SYSTEM_GOLD, 8, " LANGUAGE");

    for (i = 0; i < LS_LANGUAGE_COUNT; i++)
    {
        int color = (i == proc->selected) ? TEXT_COLOR_SYSTEM_GOLD : TEXT_COLOR_SYSTEM_WHITE;
        InitLine(
            &proc->text[i + 1], LS_OPTION_X, LS_OPTION_Y + (i * LS_OPTION_Y_STEP), color, 8,
            GetStringFromIndex(*sLanguageTextLinks[i]));
    }

    InitLine(&proc->text[LS_LANGUAGE_COUNT + 1], LS_OPTION_X - 2, 15, TEXT_COLOR_SYSTEM_GREEN, 11, " Press A/START");

    BG_EnableSyncByMask(BG_SYNC_BIT(0));
}

static void DrawLanguageSelector(LanguageSelectProc * proc)
{
    BG_Fill(gBG1TilemapBuffer, 0);

    DrawUiFrame(
        gBG1TilemapBuffer, LS_FLAG_FRAME_X, LS_FLAG_FRAME_Y, LS_FLAG_FRAME_W, LS_FLAG_FRAME_H, TILEREF(0, 0), 2);

    DrawUiFrame(
        gBG1TilemapBuffer, LS_RIGHT_FRAME_X, LS_RIGHT_FRAME_Y, LS_RIGHT_FRAME_W, LS_RIGHT_FRAME_H, TILEREF(0, 0), 1);

    DrawLanguageFlag(proc->selected);
    DrawLanguageText(proc);

    BG_EnableSyncByMask(BG_SYNC_BIT(1));
}
extern void DrawChallengeRunUiFrameBg();
extern u8 * LanguageSelect_SavedLanguageLink;
static void LanguageSelect_Init(LanguageSelectProc * proc)
{
    ResetKeyStatus(gKeyStatusPtr); // PrepareHealthAndSafetyScreen calls SetKeyStatus_IgnoreMask(0x3FF);
    int selected = *LanguageSelect_SavedLanguageLink;
    StartGreenText(proc);

    if (selected < 0 || selected >= LS_LANGUAGE_COUNT)
    {
        selected = 0;
    }

    proc->selected = selected;
    proc->redraw = true;
    proc->textHandleBase = 0;
    proc->timer = 0;

    gLCDControlBuffer.dispcnt.mode = 0;
    SetDispEnable(1, 1, 1, 1, 1);
    BG_SetPriority(0, 0);
    BG_SetPriority(1, 1);
    BG_SetPriority(2, 2);
    BG_SetPriority(3, 3);
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    SetBlendNone();

    PAL_BG_COLOR(0, 0) = RGB5(12, 14, 15);
    EnablePaletteSync();
    LoadObjUIGfx();
    LoadUiFrameGraphics();
    InitSystemTextFont();
    ResetTextFont();

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    DrawChallengeRunUiFrameBg();

    BG_EnableSyncByMask(BG_SYNC_BIT(0) | BG_SYNC_BIT(1));

    DrawLanguageSelector(proc);
}

static void LanguageSelect_End(LanguageSelectProc * proc)
{
    *LanguageSelect_CurrentLanguageLink = proc->selected;
    *LanguageSelect_SavedLanguageLink = proc->selected;
    EndGreenText();
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_EnableSyncByMask(BG_SYNC_BIT(0) | BG_SYNC_BIT(1));
}

void LanguageSelect_Loop(LanguageSelectProc * proc)
{
    proc->timer++;

    BG_SetPosition(BG_2, 0 - (proc->timer >> 1), 0 - (proc->timer >> 1));
    u16 keys;

    if (proc->redraw)
    {
        proc->redraw = false;
        DrawLanguageSelector(proc);
    }

    DisplayUiHand(LS_HAND_X, LS_HAND_Y_BASE + (proc->selected * LS_HAND_Y_STEP));

    keys = gKeyStatusPtr->newKeys;

    if ((keys & START_BUTTON) || (keys & A_BUTTON))
    {
        *LanguageSelect_CurrentLanguageLink = proc->selected;
        m4aSongNumStart(0x6A);
        Proc_Break((ProcPtr)proc);
        return;
    }

    if (keys & DPAD_DOWN)
    {
        proc->selected++;

        if (proc->selected >= LS_LANGUAGE_COUNT)
        {
            proc->selected = 0;
        }

        proc->redraw = true;
        m4aSongNumStart(0x66);
    }

    if (keys & DPAD_UP)
    {
        if (proc->selected == 0)
        {
            proc->selected = LS_LANGUAGE_COUNT - 1;
        }
        else
        {
            proc->selected--;
        }

        proc->redraw = true;
        m4aSongNumStart(0x66);
    }
}

const struct ProcCmd LanguageSelectProcCmd[] = {
    PROC_NAME("LanguageSelect"),
    PROC_CALL(PrepareHealthAndSafetyScreen), // prep graphics, if soft reset, go to 0x3E7
    PROC_CALL(LanguageSelect_Init),
    PROC_REPEAT(LanguageSelect_Loop),
    PROC_CALL(LanguageSelect_End),
    PROC_LABEL(0x3E7),
    PROC_END,
};
