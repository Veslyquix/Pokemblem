
#include "gbafe.h"

struct StatScreenSt
{
    /* 00 */ u8 page;
    /* 01 */ u8 pageAmt;
    /* 02 */ u16 pageSlideKey; // 0, DPAD_RIGHT or DPAD_LEFT
    /* 04 */ short xDispOff;   // Note: Always 0, not properly taked into account by
                               // most things
    /* 06 */ short yDispOff;
    /* 08 */ s8 inTransition;
    /* 0C */ struct Unit * unit;
    /* 10 */ struct MUProc * mu;
    /* 14 */ const struct HelpBoxInfo * help;
    /* 18 */ struct TextHandle text[34];
};
extern struct StatScreenSt gStatScreen; // statscreen state
enum
{
    UNIT_MOVE_COUNT = 5
};

extern u16 gBG0MapBuffer[32][32];
extern u16 gBG1MapBuffer[32][32]; // 0x020234A8.

#define item_name_offset 16
#define new_item_name_offset 48
#define new_item_icon_offset 0 // 13
#define new_item_desc_offset 72

#define menu_tile_X 1
#define menu_tile_Y 0
#define menu_Length 10 // 29

extern int LearnNewSpell(struct Unit * unit, int move);
extern const struct ProcInstruction pProc_NewSpellLearn[];
extern const struct ProcInstruction pProc_ReplaceSpellLearn[];

struct ReplaceMoveProc
{
    /* 00 */ PROC_HEADER; // this ends at +29
    /* 2C */ struct Unit * unit;
    /* 30 */ u8 movesUpdated;
    u8 moveSelected;
    u8 hover_move_Updated;
    u8 move_hovering;    //
    u16 moveReplacement; // 0x34
    u16 tileNext;
    u16 returnTm;
    struct TextHandle handle[3]; // 0x38 - 0x4F
};

extern void RefreshMinesOnBmMap(void);
extern void RefreshBMapGraphics(void);
void ReplaceMove(struct Unit * unit, int move, int slot)
{
    unit->ranks[slot] = move;
}

int DoesUnitKnowMoveAlready(struct Unit * unit, int moveID)
{
    for (int i = 0; i < 5; ++i)
    {
        if (unit->ranks[i] == moveID)
        {
            return true;
        }
    }
    return false;
}

static const struct MenuDefinition Menu_ReplaceMoveDebug;
struct ReplaceMoveProc * prLearnNewSpell(struct Unit * unit, int move, struct Proc * parent)
{

    struct ReplaceMoveProc * proc = NULL;
    if (!UNIT_IS_VALID(unit))
    {
        return proc;
    }
    if (DoesUnitKnowMoveAlready(unit, move))
    {
        return proc;
    }
    if (LearnNewSpell(unit, move))
    {
        if (parent)
        {
            proc = (struct ReplaceMoveProc *)ProcStartBlocking(pProc_NewSpellLearn, parent);
        }
        else
        {
            proc = (struct ReplaceMoveProc *)ProcStart(pProc_NewSpellLearn, ROOT_PROC_3);
        }
        return proc;
    }
    else
    {
        if (parent)
        {
            proc = (struct ReplaceMoveProc *)ProcStartBlocking(pProc_ReplaceSpellLearn, parent);
        }
        else
        {
            proc = (struct ReplaceMoveProc *)ProcStart(pProc_ReplaceSpellLearn, ROOT_PROC_3);
        }
    }

    if (proc)
    {
        proc->unit = unit;
        proc->moveReplacement = move;
        proc->movesUpdated = FALSE;
        proc->moveSelected = 0;
        proc->returnTm = false;
        proc->hover_move_Updated = FALSE;
        proc->move_hovering = 0;
    }
    StartMenuChild(&Menu_ReplaceMoveDebug, (void *)proc);
    return proc;
}
extern void UnitRemoveInvalidItems(struct Unit * unit);
void MultiSpellScrollEffect2(struct Proc * proc)
{
    struct Unit * unit = GetUnit(gActionData.subjectIndex);
    if (!UNIT_IS_VALID(unit))
    {
        return;
    }

    int slot = gActionData.itemSlotIndex;
    int returnTm = unit->items[slot];
    int move = (returnTm & 0xFF00) >> 8;
    unit->items[slot] = 0;
    UnitRemoveInvalidItems(unit);

    struct ReplaceMoveProc * learnSpellProc = prLearnNewSpell(unit, move, proc);
    if (learnSpellProc)
    {
        learnSpellProc->returnTm = returnTm;
    }
}

/*extern const ItemData gItemData[]; */
char * GetItemName(int item);

static u8 * UnitGetMoveList(struct Unit * unit)
{
    return unit->ranks;
}

static int IsMove(int moveId)
{
    if (moveId == 0)
        return FALSE;

    if (moveId == 255)
        return FALSE;

    return GetItemDescId(moveId);
}
extern struct FontData gItemSelectMenuFont;
static void MoveListCommandDraw(struct MenuProc * menu, struct MenuCommandProc * command);
static int MoveCommandSelect(struct MenuProc * menu, struct MenuCommandProc * command);
// static int MoveCommandConfirm(struct MenuProc* menu, struct MenuCommandProc*
// command); static int MoveCommandDecline(struct MenuProc* menu, struct
// MenuCommandProc* command);
static int List_Idle(struct MenuProc * menu, struct MenuCommandProc * command);
static int MoveListCommandSelect(struct MenuProc * menu, struct MenuCommandProc * command);
static void ReplaceMoveCommandDraw(struct MenuProc * menu, struct MenuCommandProc * command);
static void ReplaceMoveMenuEnd(struct MenuProc * menu);

extern void RenderBmMap();
extern void RefreshUnitsOnBmMap();
extern void PostForgetOldMoveMenu(void);

static const struct MenuCommandDefinition MenuCommands_ReplaceMove[] = {
    { .isAvailable = MenuCommandAlwaysUsable,
      .onEffect = MoveListCommandSelect,
      .onDraw = ReplaceMoveCommandDraw,
      .onIdle = List_Idle

    },

    {
        .isAvailable = MenuCommandAlwaysUsable,

        .onDraw = MoveListCommandDraw,
        .onIdle = List_Idle,
        .onEffect = MoveCommandSelect,
    },

    {
        .isAvailable = MenuCommandAlwaysUsable,

        .onDraw = MoveListCommandDraw,
        .onIdle = List_Idle,

        .onEffect = MoveCommandSelect,
    },

    {
        .isAvailable = MenuCommandAlwaysUsable,

        .onDraw = MoveListCommandDraw,
        .onIdle = List_Idle,
        .onEffect = MoveCommandSelect,
    },

    {
        .isAvailable = MenuCommandAlwaysUsable,

        .onDraw = MoveListCommandDraw,
        .onIdle = List_Idle,
        .onEffect = MoveCommandSelect,
    },
    {
        .isAvailable = MenuCommandAlwaysUsable,

        .onDraw = MoveListCommandDraw,
        .onIdle = List_Idle,
        .onEffect = MoveCommandSelect,
    },

    {} // END
};
u8 BPressConfirmGiveUpOnMoveMenu(struct MenuProc * menu, struct MenuCommandProc * command);
void DrawItemInfo(struct MenuProc * menu, struct MenuCommandProc * command, struct ReplaceMoveProc * proc);
void UpdateItemInfo(struct MenuProc * menu, struct MenuCommandProc * command, struct ReplaceMoveProc * proc);

static const struct MenuDefinition Menu_ReplaceMoveDebug = {
    .geometry = { menu_tile_X, menu_tile_Y, menu_Length },
    .commandList = MenuCommands_ReplaceMove,

    .onEnd = ReplaceMoveMenuEnd,

    .onBPress = BPressConfirmGiveUpOnMoveMenu, // Now in the proc call routine
};

extern const ProcCode gProc_8A01650[];

// stuff from A00AD0 HelpTextBubble
// 203E784
extern void * gHelpBox_RMenu; // RMenu(up,down,left,right,xcoord,ycoord,SlotID,Looper,Getter)
                              // "POIN up down left right; BYTE xcoord ycoord;
                              // SHORT SlotID; POIN Looper|1 Getter|1"

extern void * gText_HelpBox;           // 0x203E794
extern void * gText_HelpBoxTextOffset; //  0x203E7AC

extern void StartDrawDialogProcs(int item, u16 descTextId); // 0x808A0FC

extern void DrawHelpBoxWeaponStatLabels(int item); // 0x8089C40
extern void MakeHelpDialog_WeaponDetail(int item); // 0x8089CD4
typedef struct Tile Tile;
typedef struct TSA TSA;
struct Tile
{
    u16 tileID : 10;
    u16 horizontalFlip : 1;
    u16 verticalFlip : 1;
    u16 paletteID : 4;
};

struct TSA
{
    u8 width, height;
    Tile tiles[];
};
extern TSA ReplaceMovesTSA;
extern TSA DescBoxTSA;
extern TSA PkmnDetailsTSA;

static void PrepareText(TextHandle * handle, char * string)
{
    // Text_Clear(handle);
    // Text_InitClear(handle, handle->tileWidth);
    u32 width = (Text_GetStringTextWidth(string) + 8) / 8;
    Text_InitClear(handle, width);
    handle->tileWidth = width;

    Text_SetColorId(handle, TEXT_COLOR_GOLD);
    Text_DrawString(handle, string);
    // Text_Display(&handle,&gBG0MapBuffer[y][x]);
}

#define BottomBoxX 4
void DrawItemInfo(struct MenuProc * menu, struct MenuCommandProc * command, struct ReplaceMoveProc * proc)
{
    // for (int x = 0; x < 30; x++) { // clear out most of bg0
    // for (int y = 0; y < 20; y++) {
    // gBG0MapBuffer[y][x] = 0;
    // }
    // }
    BgMap_ApplyTsa(&gBG1MapBuffer[9][11], &PkmnDetailsTSA, 0);
    BgMap_ApplyTsa(&gBG1MapBuffer[14][BottomBoxX], &ReplaceMovesTSA, 0);
    BgMap_ApplyTsa(&gBG1MapBuffer[1][10], &DescBoxTSA, 0);
    // [2000932..2000933]!!
    // [2028E6a..2028E6b]!!
    // 0x8004a9e
    Text_SetFont(0);
    Text_ResetTileAllocation();
    Text_SetFontStandardGlyphSet(0); // tile text numbers
    CpuFastFill(0, (void *)VRAM + 0x1000, 0x4000);

    // u16 tile = gpCurrentFont->tileNext;
    //  u16 tileNext starts at 0 when ResetTileAllocation is used (vram 0x6001000)
    //

    // menu->pCommandProc[0]->text.tileIndexOffset = gpCurrentFont->tileNext;

    // menu->pCommandProc[0]->text.tileWidth = 0; // 92;
    // update tileNext to be whatever we offset it to
    // in this case it's 0, but it would be important if it wasn't
    // menu starts at tileNext as 0 (and draws spaces as needed)
    // asm("mov r11, r11");
    // for (u8 c = 1; c <= menu->commandCount; c++)
    // {
    // gpCurrentFont->tileNext =
    // menu->pCommandProc[c - 1]->text.tileIndexOffset + menu->pCommandProc[c - 1]->text.tileWidth;
    // if (c < menu->commandCount)
    // {
    // menu->pCommandProc[c]->text.tileIndexOffset = gpCurrentFont->tileNext;
    // }
    // }

    // menu->pCommandProc[1]->text.currentBufferId = 0;
    // //handles[i].currentBufferId;
    // MoveListCommandDraw(menu, menu->pCommandProc[1]);
    // MoveListCommandDraw(menu, menu->pCommandProc[2]);
    // MoveListCommandDraw(menu, menu->pCommandProc[3]);
    // MoveListCommandDraw(menu, menu->pCommandProc[4]);
    // MoveListCommandDraw(menu, menu->pCommandProc[5]);

    // u16 tile = menu->tileBase+20;

    // PrepareText(&handles[i], " Rng");
    // Text_Display(&handles[i], &gBG0MapBuffer[15][7+x]); i++;
    //
    // PrepareText(&handles[i], " Wt");
    // Text_Display(&handles[i], &gBG0MapBuffer[15][14+x]); i++;
    //
    // PrepareText(&handles[i], "Dmg");
    // Text_Display(&handles[i], &gBG0MapBuffer[17][0+x]); i++;
    // PrepareText(&handles[i], " Hit");
    // Text_Display(&handles[i], &gBG0MapBuffer[17][7+x]); i++;
    // PrepareText(&handles[i], " Crit");
    // Text_Display(&handles[i], &gBG0MapBuffer[17][14+x]); i++;

    // u8* const moves = UnitGetMoveList(proc->unit);
    u16 * const out = gBg0MapBuffer + TILEMAP_INDEX(2, 1);
    LoadIconPalettes(4);
    DrawIcon(out + TILEMAP_INDEX(new_item_icon_offset, 0), GetItemIconId(proc->moveReplacement), TILEREF(0, 4));

    EnableBgSyncByMask(BG0_SYNC_BIT);
    EnableBgSyncByMask(BG1_SYNC_BIT);

    // asm("mov r11, r11");

    UpdateItemInfo(menu, command, proc);
}

/*
static void PrepareNum(TextHandle* handle, int num)
{
        u32 width = 1;
        for (int n = num; n>0;) {
                n = n/10;
                width++;
        }

        //(Text_GetStringTextWidth(string)+8)/8;
        Text_InitClear(handle, width);
    //handle->tileWidth = width;


        Text_SetColorId(handle,TEXT_COLOR_GOLD);
        Text_DrawNumber(handle, num);
}
*/

extern u8 gSpecialUiCharAllocationTable[]; // 0x2028E78
enum
{
    NL = 1, // Text control code for new line.
};

static void DrawMultiline(
    TextHandle * handles, char * string,
    int lines) // There's a TextHandle for every line we need to pass in.
{
    // We're going to copy each line of the string to gGenericBuffer then draw the
    // string from there.
    int j = 0;
    for (int i = 0; i < lines; i++)
    {
        int k = 0;
        for (; string[j] && string[j] != NL; k++)
        {
            gGenericBuffer[k] = string[j];
            j++;
        }
        gGenericBuffer[k] = 0;

        u32 width = ((Text_GetStringTextWidth((char *)gGenericBuffer)) + 8) / 8;

        Text_InitClear(&handles[i], width);
        handles[i].tileWidth = width;
        // handles[i].xCursor = 0;
        // handles[i].colorId = TEXT_COLOR_NORMAL;
        // handles[i].useDoubleBuffer = 0;
        // handles[i].currentBufferId = 0;
        // handles[i].unk07 = 0;

        Text_InsertString(&handles[i], 0, handles->colorId, (char *)gGenericBuffer);
        // Text_DrawString(&handles[i],(char*)gGenericBuffer);
        // handles++;
        j++;
    }
}
static int GetNumLines(char * string) // Basically count the number of NL codes.
{
    int sum = 1;
    for (int i = 0; string[i]; i++)
    {
        if (string[i] == NL)
        {
            sum++;
        }
    }
    return sum;
}

void UpdateItemInfo(struct MenuProc * menu, struct MenuCommandProc * command, struct ReplaceMoveProc * proc)
{

    for (int x = 0; x < 30; x++)
    { // clear out most of bg0
        for (int y = 14; y < 20; y++)
        {
            gBG0MapBuffer[y][x] = 0;
        }
    }
    for (int x = 11; x < 30; x++)
    { // clear out most of bg0
        for (int y = 0; y < 8; y++)
        {
            gBG0MapBuffer[y][x] = 0;
        }
    }

    u8 x = BottomBoxX + 1;

    u8 i = 0;

    Text_InitFontExt(&gItemSelectMenuFont, (void *)VRAM + 0x4000, 0x200, 0);

    TextHandle * handles = gStatScreen.text;

    u32 width;
    // = (Text_GetStringTextWidth(GetStringFromIndex(GetItemDescId(proc->moveReplacement))) + 8) / 8;

    // Text_SetXCursor(&handles[i], new_item_desc_offset+new_item_name_offset);
    width = (Text_GetStringTextWidth(GetItemName(proc->moveReplacement)) + 8) / 8;
    Text_InitClear(&handles[i], width);
    handles[i].tileWidth = width;
    // Text_SetXCursor(&handles[i], new_item_name_offset);
    Text_SetColorId(&handles[i], TEXT_COLOR_GREEN);
    Text_DrawString(&handles[i], GetItemName(proc->moveReplacement));
    Text_Display(&handles[i], &gBG0MapBuffer[1][4]);
    i++;

    char * className = GetStringFromIndex(proc->unit->pClassData->nameTextId);
    width = (Text_GetStringTextWidth(className) + 8 + 24) / 8;
    Text_InitClear(&handles[i], width);
    handles[i].tileWidth = width;
    Text_SetXCursor(&handles[i], 24);
    Text_SetColorId(&handles[i], TEXT_COLOR_GREEN);
    Text_DrawString(&handles[i], className);
    Text_Display(&handles[i], &gBG0MapBuffer[9][11]);
    i++;

    char * strName = (void *)&"Str";
    width = (Text_GetStringTextWidth(strName) + 8 + 8) / 8;
    Text_InitClear(&handles[i], width);
    handles[i].tileWidth = width;
    Text_SetXCursor(&handles[i], 4);
    Text_SetColorId(&handles[i], TEXT_COLOR_GOLD);
    Text_DrawString(&handles[i], strName);
    Text_Display(&handles[i], &gBG0MapBuffer[11][11]);
    i++;

    char * magName = (void *)&"Mag";
    width = (Text_GetStringTextWidth(magName) + 8 + 8) / 8;
    Text_InitClear(&handles[i], width);
    handles[i].tileWidth = width;
    Text_SetXCursor(&handles[i], 4);
    Text_SetColorId(&handles[i], TEXT_COLOR_GOLD);
    Text_DrawString(&handles[i], magName);
    Text_Display(&handles[i], &gBG0MapBuffer[11][17]);
    i++;

    u8 hover = proc->move_hovering - 1;
    u16 item;

    if (proc->move_hovering == 0)
    { // UNIT_MOVE_COUNT) {
        item = proc->moveReplacement;
    }
    else
    {
        item = UnitGetMoveList(proc->unit)[hover];
    }

    handles = &gStatScreen.text[10];
    i = 0;
    // for (int i = 0; i < 8; i++)
    // {
    // handles[i].xCursor = 0;
    // handles[i].colorId = TEXT_COLOR_NORMAL;
    // handles[i].useDoubleBuffer = 0;
    // handles[i].currentBufferId = 0;
    // handles[i].unk07 = 0;
    // }

    PrepareText(&handles[i], " Rng");
    Text_Display(&handles[i], &gBG0MapBuffer[15][7 + x]);
    i++;

    PrepareText(&handles[i], " Wt");
    Text_Display(&handles[i], &gBG0MapBuffer[15][14 + x]);
    i++;

    PrepareText(&handles[i], "Dmg");
    Text_Display(&handles[i], &gBG0MapBuffer[17][0 + x]);
    i++;
    PrepareText(&handles[i], " Hit");
    Text_Display(&handles[i], &gBG0MapBuffer[17][7 + x]);
    i++;
    PrepareText(&handles[i], " Crit");
    Text_Display(&handles[i], &gBG0MapBuffer[17][14 + x]);
    i++;

    PrepareText(&proc->handle[0], GetItemDisplayRankString(item));
    Text_Display(&proc->handle[0], &gBG0MapBuffer[15][5 + x]);
    i++;
    //  0x8004AE8 = POIN gSpecialUiCharAllocationTable
    gStatScreen.unit = proc->unit;
    PrepareText(&proc->handle[1], GetItemDisplayRangeString(item));
    Text_Display(&proc->handle[1], &gBG0MapBuffer[15][10 + x]);
    i++;

    // PrepareText(&proc->handle[2], GetWeaponTypeDisplayString(GetItemType(item)));

    Text_InitClear(&proc->handle[2], 6);
    proc->handle[2].tileWidth = 6;

    Text_SetColorId(&proc->handle[2], TEXT_COLOR_GOLD);
    Text_DrawString(&proc->handle[2], GetWeaponTypeDisplayString(GetItemType(item)));

    Text_Display(&proc->handle[2], &gBG0MapBuffer[15][0 + x]);
    i++;

    // gSpecialUiCharAllocationTable[0] = 0xFF; // no clue but it made DrawUiNumber work properly
    Text_SetFont(0);
    DrawUiNumber(&gBG0MapBuffer[15][18 + x], TEXT_COLOR_GOLD, GetItemWeight(item));
    DrawUiNumber(&gBG0MapBuffer[17][5 + x], TEXT_COLOR_GOLD, GetItemMight(item));
    DrawUiNumber(&gBG0MapBuffer[17][12 + x], TEXT_COLOR_GOLD, GetItemHit(item));
    DrawUiNumberOrDoubleDashes(&gBG0MapBuffer[17][18 + x], TEXT_COLOR_GOLD, GetItemCrit(item));
    DrawUiNumber(&gBG0MapBuffer[11][15], TEXT_COLOR_GOLD, (proc->unit->pow));
    DrawUiNumber(&gBG0MapBuffer[11][22], TEXT_COLOR_GOLD,
                 (proc->unit->unk3A)); // Magic.

    Text_SetFont(&gItemSelectMenuFont);
    char * string = GetStringFromIndex(GetItemDescId(item));
    int lines = GetNumLines(string);
    DrawMultiline(&handles[i], string, lines);

    for (int c = 0; c < lines; c++)
    {
        Text_Display(&handles[c + i], &gBG0MapBuffer[2 + c * 2][11]);
    }
    i++;
    i++;
    i++;
    Text_SetFont(0);
    EnableBgSyncByMask(BG0_SYNC_BIT);
}

static int List_Idle(struct MenuProc * menu, struct MenuCommandProc * command)
{
    struct ReplaceMoveProc * const proc = (void *)menu->parent;
    u8 * const moves = UnitGetMoveList(proc->unit);
    if (proc->move_hovering != menu->commandIndex)
    {
        proc->hover_move_Updated = TRUE;
        proc->move_hovering = menu->commandIndex;
        UpdateItemInfo(menu, command, proc);
        /*         proc->movesUpdated = TRUE; */
    }
    if (gKeyState.repeatedKeys & KEY_BUTTON_R)
    {
        if (proc->move_hovering)
        {
            MenuCallHelpBox(menu, GetItemDescId(moves[proc->move_hovering - 1]));
        }
        else
        {
            MenuCallHelpBox(menu, GetItemDescId(proc->moveReplacement));
        }
    }

    return ME_NONE;
}

static void MoveListCommandDraw(struct MenuProc * menu, struct MenuCommandProc * command)
{
    struct ReplaceMoveProc * const proc = (void *)menu->parent;
    u8 * const moves = UnitGetMoveList(proc->unit);
    int i = (command->commandDefinitionIndex) - 1;
    u16 * const out = gBg0MapBuffer + TILEMAP_INDEX(command->xDrawTile, command->yDrawTile);

    /*
  Text_Clear(&command->text);
    Text_SetXCursor(&command->text, new_item_desc_offset);
  Text_SetColorId(&command->text, TEXT_COLOR_BLUE);
  Text_DrawString(&command->text, GetStringFromIndex(GetItemDescId(moves[i])));
    */
    // Text_SetXCursor(&command->text, 0);

    Text_Display(
        &command->text,
        out);            // this needs to be before DrawIcon, as otherwise it will
                         // overwrite the icon with spaces
    LoadIconPalettes(4); /* Icon palette */
    if (IsMove(moves[i]))
    {
        Text_SetXCursor(&command->text, item_name_offset);
        Text_SetColorId(&command->text, TEXT_COLOR_BLUE);
        Text_DrawString(&command->text, GetItemName(moves[i]));
        Text_SetXCursor(&command->text, 0);
        DrawIcon(out + TILEMAP_INDEX(0, 0), GetItemIconId(moves[i]), TILEREF(0, 4));
    }
    else
    {
        Text_SetColorId(&command->text, TEXT_COLOR_GRAY);
        Text_DrawString(&command->text, " No Move");
    }

    EnableBgSyncByMask(BG0_SYNC_BIT);
}

static void ReplaceMoveCommandDraw(struct MenuProc * menu, struct MenuCommandProc * command)
{
    struct ReplaceMoveProc * const proc = (void *)menu->parent;
    DrawItemInfo(menu, command, proc);
}

static int MoveListCommandSelect(struct MenuProc * menu, struct MenuCommandProc * command)
{
    return ME_NONE;
}
u8 ClearYesNoBox(struct MenuProc * menu, struct MenuCommandProc * command);
static int MoveCommandConfirm(struct MenuProc * menu, struct MenuCommandProc * command);
static int MoveCommandDecline(struct MenuProc * menu, struct MenuCommandProc * command);
MenuProc * StartOrphanMenuAt(const MenuDefinition *, MenuGeometry);
MenuProc * StartOrphanMenu(const MenuDefinition *);

static const struct MenuCommandDefinition MenuCommands_Confirmation[] = {
    {
        .isAvailable = MenuCommandAlwaysUsable,
        .onEffect = MoveCommandConfirm,
        .rawName = " Yes",
    },
    {
        .isAvailable = MenuCommandAlwaysUsable,
        .onEffect = MoveCommandDecline,
        .rawName = " No",
    },
    {},
};

static const struct MenuCommandDefinition MenuCommands_GiveUpOnMove[];
static const struct MenuDefinition Menu_GiveUpOnMove = {
    .geometry = { 196, 0, 0, 0 }, // The box
                                  //.onInit = ClearStuff,
    .commandList = MenuCommands_GiveUpOnMove,

    .onBPress = ClearYesNoBox,
};

static int AbandonMove(struct MenuProc * menu, struct MenuCommandProc * command)
{
    EndAllMenus();
    struct ReplaceMoveProc * proc = (void *)menu->parent->parent;
    if (proc->returnTm)
    {
        struct Unit * unit = proc->unit;

        for (int i = 0; i < 5; ++i)
        {
            if (!unit->items[i])
            {
                unit->items[i] = proc->returnTm;
                break;
            }
        }
    }
    return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}

static int AbandonMove(struct MenuProc * menu, struct MenuCommandProc * command);
static const struct MenuCommandDefinition MenuCommands_GiveUpOnMove[] = {
    {
        .isAvailable = MenuCommandAlwaysUsable,
        .onEffect = AbandonMove,
        .rawName = " Yes",
    },
    {
        .isAvailable = MenuCommandAlwaysUsable,
        .onEffect = MoveCommandDecline,
        .rawName = " No",
    },
    {},

};

/*
struct MenuDefinition
{
struct MenuGeometry geometry;

u8 style;

const struct MenuCommandDefinition* commandList;

void(*onInit)(MenuProc*);
void(*onEnd)(MenuProc*);
void(*_u14)(MenuProc*);
u8(*onBPress)(MenuProc*, MenuCommandProc*); // I had to correct this to fix ReplaceMovesMenu
void(*onRPress)(MenuProc*);
void(*onHelpBox)(MenuProc*, MenuCommandProc*);
};
*/
#define YesNoX 0x19
extern void EndHelpBox(void);
#define YesNoY 0x9
#define YesNoW 5
#define YesNoH 6
u8 ClearYesNoBox(struct MenuProc * menu, struct MenuCommandProc * command)
{
    for (int x = YesNoX; x < (YesNoX + YesNoW); x++)
    { // clear out most of bg0
        for (int y = YesNoY; y < (YesNoY + YesNoH); y++)
        {
            gBG0MapBuffer[y][x] = 0;
            gBG1MapBuffer[y][x] = 0;
        }
    }
    EnableBgSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
    Text_SetFont(0);
    EndHelpBox();
    // ReplaceMoveCommandDraw((void *)menu->parent, command);
    return ME_DISABLE | ME_END | ME_PLAY_BEEP;
}

#define HelpBoxX 126
#define HelpBoxY 60
extern int GiveUpOnMoveTextLink;
extern int ReplaceMoveTextLink;
extern void LoadHelpBoxGfx(void * dest, int pal);
void StartHelpBox_Unk(int x, int y, int mid);
u8 MenuFrozenHelpBox(struct MenuProc * proc, int msgid);
u8 BPressConfirmGiveUpOnMoveMenu(struct MenuProc * menu, struct MenuCommandProc * command)
{
    // struct ReplaceMoveProc * proc = (void *)menu->parent;
    LoadHelpBoxGfx(NULL, -1); // TODO: default constants?
    StartHelpBox_Unk(HelpBoxX, HelpBoxY, GiveUpOnMoveTextLink);
    // MenuFrozenHelpBox(menu, GiveUpOnMoveTextLink);
    struct MenuGeometry ConfirmationMenuGeometry = { .x = YesNoX, .y = YesNoY, .h = 0, .w = YesNoW };
    Text_InitFontExt(&gItemSelectMenuFont, (void *)VRAM + 0x3800, 0x1c0, 0);

    struct MenuProc * subMenu = StartMenuAt(&Menu_GiveUpOnMove, ConfirmationMenuGeometry, (void *)menu);
    subMenu->commandIndex = 1; // start on "No"

    return ME_DISABLE | ME_PLAY_BEEP;
}

static const struct MenuDefinition Menu_Confirmation = {
    .geometry = { 196, 0, 0, 0 }, // The box
                                  //.onInit = ClearStuff,
    .commandList = MenuCommands_Confirmation,

    // .onEnd = ReplaceMoveMenuEnd, // this clears all gfx if you press no/b
    .onBPress = ClearYesNoBox,
};

static int MoveCommandConfirm(struct MenuProc * menu, struct MenuCommandProc * command)
{

    struct ReplaceMoveProc * proc = (void *)menu->parent->parent;
    UnitGetMoveList(proc->unit)[proc->move_hovering - 1] = proc->moveReplacement; // replaces the move
    EndAllMenus();
    return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}

static int MoveCommandDecline(struct MenuProc * menu, struct MenuCommandProc * command)
{
    // struct ReplaceMoveProc * const proc = (void *)menu->parent;
    ClearYesNoBox(menu, command);
    return ME_DISABLE | ME_END | ME_PLAY_BEEP;
}

static int MoveCommandSelect(struct MenuProc * menu, struct MenuCommandProc * command)
{
    // struct ReplaceMoveProc * proc = (void *)menu->parent;
    LoadHelpBoxGfx(NULL, -1); // TODO: default constants?
    StartHelpBox_Unk(HelpBoxX, HelpBoxY, ReplaceMoveTextLink);
    // MenuFrozenHelpBox(menu, ReplaceMoveTextLink);
    struct MenuGeometry ConfirmationMenuGeometry = { .x = YesNoX, .y = YesNoY, .h = 0, .w = YesNoW };
    Text_InitFontExt(&gItemSelectMenuFont, (void *)VRAM + 0x3800, 0x1c0, 0);

    struct MenuProc * subMenu = StartMenuAt(&Menu_Confirmation, ConfirmationMenuGeometry, (void *)menu);
    subMenu->commandIndex = 1; // start on "No"

    return ME_DISABLE | ME_PLAY_BEEP;
    // return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}

static void ReplaceMoveMenuEnd(struct MenuProc * menu)
{
    // Proc_End(menu->parent);
    Text_SetFont(0);
    EndHelpBox();
    EndFaceById(0);
    RefreshUnitsOnBmMap();
    RefreshMinesOnBmMap();
    RenderBmMap();
    RefreshBMapGraphics();
}
