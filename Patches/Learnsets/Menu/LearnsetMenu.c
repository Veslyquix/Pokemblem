
#include "gbafe.h"


enum { UNIT_MOVE_COUNT = 5 };


extern u16 gBG0MapBuffer[32][32];
extern u16 gBG1MapBuffer[32][32]; // 0x020234A8.


#define item_name_offset 16
#define new_item_name_offset 48
#define new_item_icon_offset 0 //13
#define new_item_desc_offset 72

#define menu_tile_X 1
#define menu_tile_Y 0
#define menu_Length 10 //29



extern u8* MoveListTable[256*4]; 

 
/*extern const ItemData gItemData[]; */ 
char* GetItemName(int item); 

static
u8* UnitGetMoveList(struct Unit* unit, int offset)
{

	return MoveListTable[(unit->pClassData->number)]; //[offset]; 
}

static
int IsMove(int moveId)
{
    if (moveId == 0)
        return FALSE;

    if (moveId == 255)
        return FALSE;

    return GetItemDescId(moveId);
}











static void MoveListCommandDraw(struct MenuProc* menu, struct MenuCommandProc* command);
static int MoveCommandSelect(struct MenuProc* menu, struct MenuCommandProc* command);
//static int MoveCommandConfirm(struct MenuProc* menu, struct MenuCommandProc* command);
//static int MoveCommandDecline(struct MenuProc* menu, struct MenuCommandProc* command);
static int List_Idle(struct MenuProc* menu, struct MenuCommandProc* command);
static void ReplaceMoveCommandDraw(struct MenuProc* menu, struct MenuCommandProc* command);
static void ReplaceMoveMenuEnd(struct MenuProc* menu);



struct ReplaceMoveProc
{
    /* 00 */ PROC_HEADER; // this ends at +29
    /* 2C */ struct Unit* unit;
    /* 30 */ u8 movesUpdated;
			u8 moveSelected;
			u8 hover_move_Updated; 
			u8 move_hovering; // 
			u16 offset; // 0x34 
			u16 tileNext; 
			struct TextHandle handle[3]; // 0x38 - 0x4F 
};


static const struct ProcInstruction Proc_ReplaceMove[] =
{
    PROC_CALL_ROUTINE(LockGameLogic),

    PROC_YIELD,
    PROC_CALL_ROUTINE(UnlockGameLogic),
    PROC_END,
};

static const struct MenuCommandDefinition MenuCommands_ReplaceMove[] =
{
    {
        .isAvailable = MenuCommandAlwaysUsable,
        .onDraw = ReplaceMoveCommandDraw,
		.onIdle = List_Idle

    },

    {
        .isAvailable = MenuCommandAlwaysUsable,

        .onDraw = MoveListCommandDraw,
		.onIdle = List_Idle,
        //.onEffect = MoveCommandSelect,
    },
	
	
    {
		.isAvailable = MenuCommandAlwaysUsable,

        .onDraw = MoveListCommandDraw,
		.onIdle = List_Idle,
		
        //.onEffect = MoveCommandSelect,
    },
	
    {
		.isAvailable = MenuCommandAlwaysUsable,

        .onDraw = MoveListCommandDraw,
		.onIdle = List_Idle,
        //.onEffect = MoveCommandSelect,
    },
	
	
    {
		.isAvailable = MenuCommandAlwaysUsable,

        .onDraw = MoveListCommandDraw,
		.onIdle = List_Idle,
        //.onEffect = MoveCommandSelect,
    },
    {
		.isAvailable = MenuCommandAlwaysUsable,

        .onDraw = MoveListCommandDraw,
		.onIdle = List_Idle,
        //.onEffect = MoveCommandSelect,
    },

	
    {} // END
};

void DrawItemInfo_Learnset(struct MenuProc* menu, struct MenuCommandProc* command, struct ReplaceMoveProc* proc);
void UpdateItemInfo_Learnset(struct MenuProc* menu, struct MenuCommandProc* command, struct ReplaceMoveProc* proc);


static const struct MenuDefinition Menu_ReplaceMoveDebug =
{
    .geometry = { menu_tile_X, menu_tile_Y, menu_Length },
    .commandList = MenuCommands_ReplaceMove,

    .onEnd = ReplaceMoveMenuEnd,
	
    .onBPress = (void*) (0x08022860+1), // FIXME
};

extern const ProcCode gProc_8A01650[]; 
int ViewLearnsetCommand_OnSelect(struct MenuProc* menu, struct MenuCommandProc* command)
{
    struct ReplaceMoveProc* proc = (void*) ProcStart(Proc_ReplaceMove, ROOT_PROC_3);
    //struct ReplaceMoveProc* proc2 = (void*) ProcStart(&gProc_8A01650[0], ROOT_PROC_3);
	
	int* gCurrentUnit = (int*) 0x3004E50;
    proc->unit = (struct Unit*) *gCurrentUnit; // Struct UnitRamPointer 
	proc->offset = 0;
    proc->movesUpdated = FALSE;
    proc->moveSelected = 0;
	
	
	proc->hover_move_Updated = FALSE; 
	proc->move_hovering = 0;
    StartMenuChild(&Menu_ReplaceMoveDebug, (void*) proc);
    return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}




// stuff from A00AD0 HelpTextBubble
// 203E784
extern void* gHelpBox_RMenu; // RMenu(up,down,left,right,xcoord,ycoord,SlotID,Looper,Getter) "POIN up down left right; BYTE xcoord ycoord; SHORT SlotID; POIN Looper|1 Getter|1"

extern void* gText_HelpBox; // 0x203E794 
extern void* gText_HelpBoxTextOffset; //  0x203E7AC



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

static void PrepareText(TextHandle* handle, char* string)
{
	//Text_Clear(handle);
	//Text_InitClear(handle, handle->tileWidth); 
	u32 width = (Text_GetStringTextWidth(string)+8)/8;
	Text_InitClear(handle, width); 
    handle->tileWidth = width;
	
	Text_SetColorId(handle,TEXT_COLOR_GOLD);
	Text_DrawString(handle,string);
	//Text_Display(&handle,&gBG0MapBuffer[y][x]);
}



void DrawItemInfo_Learnset(struct MenuProc* menu, struct MenuCommandProc* command, struct ReplaceMoveProc* proc)
{
	for (int x = 0; x < 30; x++) { // clear out most of bg0 
		for (int y = 0; y < 20; y++) { 
			gBG0MapBuffer[y][x] = 0;
		}
	}
	BgMap_ApplyTsa(&gBG1MapBuffer[9][11], &PkmnDetailsTSA, 0); 
	BgMap_ApplyTsa(&gBG1MapBuffer[14][5], &ReplaceMovesTSA, 0);
	BgMap_ApplyTsa(&gBG1MapBuffer[1][10], &DescBoxTSA, 0);
	// [2000932..2000933]!!
	// [2028E6a..2028E6b]!! 
	// 0x8004a9e 
	
	Text_ResetTileAllocation();

	//u16 tile = gpCurrentFont->tileNext; 
	// u16 tileNext starts at 0 when ResetTileAllocation is used (vram 0x6001000) 
	// 

	menu->pCommandProc[0]->text.tileIndexOffset = gpCurrentFont->tileNext; 
	
	menu->pCommandProc[0]->text.tileWidth = 0; //92;
	// update tileNext to be whatever we offset it to 
	// in this case it's 0, but it would be important if it wasn't 
	// menu starts at tileNext as 0 (and draws spaces as needed) 
	for (u8 c = 0; c < menu->commandCount; c++) { 
		gpCurrentFont->tileNext = menu->pCommandProc[c]->text.tileIndexOffset + menu->pCommandProc[c]->text.tileWidth; 
		menu->pCommandProc[c]->text.tileIndexOffset =  gpCurrentFont->tileNext; 
	} 
	//menu->pCommandProc[1]->text.currentBufferId = 0; //handles[i].currentBufferId;
	MoveListCommandDraw(menu, menu->pCommandProc[0]); 
	//MoveListCommandDraw(menu, menu->pCommandProc[1]); 
	//MoveListCommandDraw(menu, menu->pCommandProc[2]); 
	//MoveListCommandDraw(menu, menu->pCommandProc[3]); 
	//MoveListCommandDraw(menu, menu->pCommandProc[4]); 
	//MoveListCommandDraw(menu, menu->pCommandProc[5]); 
	
	//u16 tile = menu->tileBase+20;  
	
	TextHandle handles[4] = {};
	for ( int i = 0 ; i < 4 ; i++ )
	{
		//handles[i].tileIndexOffset = tile; // offset to start at 
		handles[i].xCursor = 0;
		//handles[i].tileIndexOffset = 0x180;
		handles[i].colorId = TEXT_COLOR_NORMAL;
		handles[i].useDoubleBuffer = 0;
		handles[i].currentBufferId = 0;
		handles[i].unk07 = 0;
	}
	
	u8 i = 0; 

	
	

	char* className = GetStringFromIndex(proc->unit->pClassData->nameTextId); 
	u32 width = (Text_GetStringTextWidth(className)+8+8)/8;
	Text_InitClear(&handles[i], width); 
    handles[i].tileWidth = width;
	Text_SetXCursor(&handles[i], 4);
    Text_SetColorId(&handles[i], TEXT_COLOR_GREEN);
    Text_DrawString(&handles[i], className); 
	Text_Display(&handles[i], &gBG0MapBuffer[9][11]); i++; 	
	
	char* strName = &"Str"; 
	width = (Text_GetStringTextWidth(strName)+8+8)/8;
	Text_InitClear(&handles[i], width); 
    handles[i].tileWidth = width;
	Text_SetXCursor(&handles[i], 4);
    Text_SetColorId(&handles[i], TEXT_COLOR_GOLD);
    Text_DrawString(&handles[i], strName); 
	Text_Display(&handles[i], &gBG0MapBuffer[11][11]); i++; 	
	
	char* magName = &"Mag"; 
	width = (Text_GetStringTextWidth(magName)+8+8)/8;
	Text_InitClear(&handles[i], width); 
    handles[i].tileWidth = width;
	Text_SetXCursor(&handles[i], 4);
    Text_SetColorId(&handles[i], TEXT_COLOR_GOLD);
    Text_DrawString(&handles[i], magName); 
	Text_Display(&handles[i], &gBG0MapBuffer[11][17]); i++; 	
	

	
	char* lvlName = &"Lvl"; 
	width = (Text_GetStringTextWidth(lvlName)+8+8)/8;
	Text_InitClear(&handles[i], width); 
    handles[i].tileWidth = width;
	Text_SetXCursor(&handles[i], 4);
    Text_SetColorId(&handles[i], TEXT_COLOR_GOLD);
    Text_DrawString(&handles[i], lvlName); 
	Text_Display(&handles[i], &gBG0MapBuffer[9][17]); i++; 
	
	
	

	


	proc->tileNext = gpCurrentFont->tileNext; 
	
	//PrepareText(&handles[i], " Rng");
	//Text_Display(&handles[i], &gBG0MapBuffer[15][7+x]); i++; 
	//
	//PrepareText(&handles[i], " Wt");
	//Text_Display(&handles[i], &gBG0MapBuffer[15][14+x]); i++; 
	//
	//PrepareText(&handles[i], "Dmg");
	//Text_Display(&handles[i], &gBG0MapBuffer[17][0+x]); i++; 
	//PrepareText(&handles[i], " Hit");
	//Text_Display(&handles[i], &gBG0MapBuffer[17][7+x]); i++; 
	//PrepareText(&handles[i], " Crit");
	//Text_Display(&handles[i], &gBG0MapBuffer[17][14+x]); i++; 


	LoadIconPalettes(4); 


	
	//asm("mov r11, r11");
	
	
	//UpdateItemInfo_Learnset(menu, command, proc); 

	
	
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
enum {
NL = 1, // Text control code for new line.
};

static void DrawMultiline(TextHandle* handles, char* string, int lines) // There's a TextHandle for every line we need to pass in.
{
    // We're going to copy each line of the string to gGenericBuffer then draw the string from there.
	int j = 0;
    for ( int i = 0 ; i < lines ; i++ )
    {
        int k = 0;
        for ( ; string[j] && string[j] != NL ; k++ )
        {
            gGenericBuffer[k] = string[j];
            j++;
        }
        gGenericBuffer[k] = 0;

		u32 width = ((Text_GetStringTextWidth((char*)gGenericBuffer))+8)/8;

		Text_InitClear(&handles[i], width);
		handles[i].tileWidth = width;
		//handles[i].xCursor = 0;
		//handles[i].colorId = TEXT_COLOR_NORMAL;
		//handles[i].useDoubleBuffer = 0;
		//handles[i].currentBufferId = 0;
		//handles[i].unk07 = 0;
		
        Text_InsertString(&handles[i],0,handles->colorId,(char*)gGenericBuffer);
        //Text_DrawString(&handles[i],(char*)gGenericBuffer);
        //handles++;
        j++;
    }
}
static int GetNumLines(char* string) // Basically count the number of NL codes.
{
	int sum = 1;
	for ( int i = 0 ; string[i] ; i++ )
	{
		if ( string[i] == NL ) { sum++; }
	}
	return sum;
}


void UpdateItemInfo_Learnset(struct MenuProc* menu, struct MenuCommandProc* command, struct ReplaceMoveProc* proc)
{

	for (int x = 0; x < 30; x++) { // clear out most of bg0 
		for (int y = 14; y < 20; y++) { 
			gBG0MapBuffer[y][x] = 0;
		}
	}
	for (int x = 11; x < 30; x++) { // clear out most of bg0 
		for (int y = 0; y < 8; y++) { 
			gBG0MapBuffer[y][x] = 0;
		}
	}

	u8 x = 6;
	
	u8 i = 0; 
	
	gpCurrentFont->tileNext = proc->tileNext; 
	u8 hover = proc->move_hovering; 
	u16 item; 
	

	item = UnitGetMoveList(proc->unit, 0)[(hover*2)+1]; 
	
	TextHandle handles[8] = {};
	for ( int i = 0 ; i < 8 ; i++ )
	{
		//handles[i].tileIndexOffset = tile; // offset to start at 
		handles[i].xCursor = 0;
		//handles[i].tileIndexOffset = 0x180;
		handles[i].colorId = TEXT_COLOR_NORMAL;
		handles[i].useDoubleBuffer = 0;
		handles[i].currentBufferId = 0;
		handles[i].unk07 = 0;
	}
	
	
	PrepareText(&handles[i], " Rng");
	Text_Display(&handles[i], &gBG0MapBuffer[15][7+x]); i++; 

	PrepareText(&handles[i], " Wt");
	Text_Display(&handles[i], &gBG0MapBuffer[15][14+x]); i++; 
	
	PrepareText(&handles[i], "Dmg");
	Text_Display(&handles[i], &gBG0MapBuffer[17][0+x]); i++; 
	PrepareText(&handles[i], " Hit");
	Text_Display(&handles[i], &gBG0MapBuffer[17][7+x]); i++; 
	PrepareText(&handles[i], " Crit");
	Text_Display(&handles[i], &gBG0MapBuffer[17][14+x]); i++; 


	char* string = GetStringFromIndex(GetItemDescId(item));
	int lines = GetNumLines(string);
	DrawMultiline(&handles[i], string, lines);
	
	
/*
	PrepareText(&handles[i], ); 
	Text_Display(&handles[i], &gBG0MapBuffer[2][12]); i++;
	char* strcpy(char* dest, const char* src);
	unsigned strlen(const char* cstr);
	PrepareText(&handles[i], Text_GetStringNextLine(GetStringFromIndex(GetItemDescId(item)))); 
	Text_Display(&handles[i], &gBG0MapBuffer[4][12]); i++;
	PrepareText(&handles[i], Text_GetStringNextLine(Text_GetStringNextLine(GetStringFromIndex(GetItemDescId(item))))); 
	Text_Display(&handles[i], &gBG0MapBuffer[6][12]); i++;
*/ 


	for ( int c = 0 ; c < lines ; c++ )
	{
		Text_Display(&handles[c+i],&gBG0MapBuffer[2+c*2][11]);
	}
	i++; i++; i++; 
	
	
	PrepareText(&proc->handle[0], GetItemDisplayRankString(item));
	Text_Display(&proc->handle[0], &gBG0MapBuffer[15][5+x]); i++; 
	//gpCurrentFont->tileNext = gpCurrentFont->tileNext + 3; 
	// 0x8004AE8 = POIN gSpecialUiCharAllocationTable 
	PrepareText(&proc->handle[1], GetItemDisplayRangeString(item));
	Text_Display(&proc->handle[1], &gBG0MapBuffer[15][10+x]); i++; 
	//gpCurrentFont->tileNext = gpCurrentFont->tileNext + 3; 

	PrepareText(&proc->handle[2], GetWeaponTypeDisplayString(GetItemType(item)));
	Text_Display(&proc->handle[2], &gBG0MapBuffer[15][0+x]); i++; 
	

	
	
	gSpecialUiCharAllocationTable[0] = 0xFF; //no clue but it made DrawUiNumber work properly 
	DrawUiNumber(&gBG0MapBuffer[9][22],TEXT_COLOR_GOLD, (hover*2)); 
	DrawUiNumber(&gBG0MapBuffer[15][18+x], TEXT_COLOR_GOLD, GetItemWeight(item)); 
	DrawUiNumber(&gBG0MapBuffer[17][5+x], TEXT_COLOR_GOLD, GetItemMight(item));
	DrawUiNumber(&gBG0MapBuffer[17][12+x], TEXT_COLOR_GOLD, GetItemHit(item)); 
	DrawUiNumberOrDoubleDashes(&gBG0MapBuffer[17][18+x], TEXT_COLOR_GOLD, GetItemCrit(item)); 
	
	DrawUiNumber(&gBG0MapBuffer[11][15],TEXT_COLOR_GOLD,	(proc->unit->pow	));
	DrawUiNumber(&gBG0MapBuffer[11][22],TEXT_COLOR_GOLD, (proc->unit->unk3A	)); // Magic.


	EnableBgSyncByMask(BG0_SYNC_BIT);
}

static int List_Idle(struct MenuProc* menu, struct MenuCommandProc* command)
{
    struct ReplaceMoveProc* const proc = (void*) menu->parent;
    u8* const moves = UnitGetMoveList(proc->unit, 0);		
	if (proc->move_hovering != menu->commandIndex)
	{   
		proc->hover_move_Updated = TRUE;
		proc->move_hovering = menu->commandIndex;
		UpdateItemInfo_Learnset(menu, command, proc); 
		/*         proc->movesUpdated = TRUE; */
	}
	if (gKeyState.repeatedKeys & KEY_BUTTON_R) { 
		if (proc->move_hovering) { 
			//MenuCallHelpBox(menu, GetItemDescId(moves[proc->move_hovering-1]));
		} 
		else { 
			//MenuCallHelpBox(menu, GetItemDescId(proc->moveReplacement));
		} 
	}
	
	
    return ME_NONE;
}


static void MoveListCommandDraw(struct MenuProc* menu, struct MenuCommandProc* command)
{
    struct ReplaceMoveProc* const proc = (void*) menu->parent;
	int offset = proc->offset; 
    u8* const moves = UnitGetMoveList(proc->unit, offset);
	int i = (command->commandDefinitionIndex);
	
    u16* const out = gBg0MapBuffer + TILEMAP_INDEX(command->xDrawTile, command->yDrawTile);

	
    Text_Clear(&command->text);
	/*
	Text_SetXCursor(&command->text, new_item_desc_offset);
    Text_SetColorId(&command->text, TEXT_COLOR_BLUE);
    Text_DrawString(&command->text, GetStringFromIndex(GetItemDescId(moves[i]))); 
	*/ 
	//Text_SetXCursor(&command->text, 0);
	
	Text_Display(&command->text, out); // this needs to be before DrawIcon, as otherwise it will overwrite the icon with spaces 
    LoadIconPalettes(4); /* Icon palette */
	if (IsMove(moves[(i*2)+1])) {
		Text_SetXCursor(&command->text, item_name_offset);
		Text_SetColorId(&command->text, TEXT_COLOR_BLUE);
		Text_DrawString(&command->text, GetItemName(moves[(i*2)+1])); 
		Text_SetXCursor(&command->text, 0);
		DrawIcon(out + TILEMAP_INDEX(0, 0), GetItemIconId(moves[(i*2)+1]), TILEREF(0, 4)); 
		}
	else {
		Text_SetColorId(&command->text, TEXT_COLOR_GRAY);
		Text_DrawString(&command->text, " No Move");
	}
	
	EnableBgSyncByMask(BG0_SYNC_BIT);

}

static void ReplaceMoveCommandDraw(struct MenuProc* menu, struct MenuCommandProc* command)
{
    struct ReplaceMoveProc* const proc = (void*) menu->parent;
	DrawItemInfo_Learnset(menu, command, proc); 
}








static int MoveCommandSelect(struct MenuProc* menu, struct MenuCommandProc* command)
{
	return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}


   





static void ReplaceMoveMenuEnd(struct MenuProc* menu)
{
    EndFaceById(0);
}
