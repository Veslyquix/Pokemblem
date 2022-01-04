
#include "FE-CLib-master/include/gbafe.h"
typedef struct CreatorClassProcStruct CreatorClassProcStruct;
typedef struct Struct_SelectCharacterProc Struct_SelectCharacterProc;
typedef struct SomeAISStruct SomeAISStruct;

extern const MenuDefinition gSelectUnitMenuDefs;

int SelectCharacter_ASMC(struct MenuProc* menu, struct MenuCommandProc* command);
static int SelectClass(struct MenuProc* menu, struct MenuCommandProc* command);
static int SelectYes(struct MenuProc* menu, struct MenuCommandProc* command);
static int SelectNo(struct MenuProc* menu, struct MenuCommandProc* command);
static void SelectCharacterMenuEnd(struct MenuProc* menu);
static void DrawSelectCharacterCommands(struct MenuProc* menu, struct MenuCommandProc* command, int i);
static void DrawSelect_0(struct MenuProc* menu, struct MenuCommandProc* command);
static void DrawSelect_1(struct MenuProc* menu, struct MenuCommandProc* command);
static void DrawSelect_2(struct MenuProc* menu, struct MenuCommandProc* command);
static void SwitchInCharacter(MenuProc* proc, MenuCommandProc* commandProc);
static void SwitchOutCharacter(MenuProc* proc, MenuCommandProc* commandProc);
static void StartPlatform(CreatorClassProcStruct* proc);
static void CreatorClassEndProc(CreatorClassProcStruct* proc);

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
struct CreatorClassProcStruct
{
	PROC_HEADER
	u8 unk1[0x2C-0x29]; // 0x29.
	u16 classes[5]; // 0x2C.
	u8 unk2[0x40 - 0x36]; // 0x36.
	u8 mode; // 0x40.
	u8 menuItem; // 0x41.
	u16 charID; // 0x42.
	u8 unk3[0x50 - 0x44]; // 0x44.
	u8 platformType; // 0x50.
};

struct SomeAISStruct {};
static void ApplyBGBox(u16 map[32][32], TSA* tsa, int x, int y);

#define DrawSkillIcon(map,id,oam2base) DrawIcon(map,id|0x100,oam2base)


extern AnimationInterpreter gSomeAISStruct; // 0x030053A0.
extern SomeAISStruct gSomeAISRelatedStruct; // 0x0201FADC.

extern u8 gCharacterSelectorBattleSpriteHeight, gCharacterSelectorPlatformHeight;

extern TSA gCreatorClassUIBoxTSA;
extern u16 gBG0MapBuffer[32][32]; // 0x02022CA8. Snek: Ew why does FE-CLib-master not do it like this?
extern u16 gBG1MapBuffer[32][32]; // 0x020234A8.

extern void StartMovingPlatform(int always0x9, int always0x118, int height); // 0x080CD408.
extern void SetupMovingPlatform(int always0x0, int alwaysNeg1, int always0x1F6, int always0x58, int always0x6); // 0x080CD47C.
extern void DeleteSomeAISStuff(AnimationInterpreter* interpreter); // 0x0805AA28.
extern void DeleteSomeAISProcs(struct SomeAISStruct* obj); // 0x0805AE14.
extern void EndEkrAnimeDrvProc(void);

extern unsigned gEventSlot[];

extern MenuCommandDefinition gRAMMenuCommands[]; // 0x0203EFB8.

static void DrawStatNames(TextHandle handle, char* string, int x, int y);

extern void CreatorClassSetup();
extern void CreatorClassDisplayLoop();


struct Struct_SelectCharacterProc
{
	PROC_HEADER;
	u8 currMenu; // 0x29.
	u8 platformType; // 0x2A.
	u8 currOptionIndex; // 0x2B. 0 = first option, 1 = 2nd option, etc. 
	Unit* activeUnit; // 0x2C. 
	struct
	{
		Unit* unitRam; // 0x30, 0x34, 0x38, 0x3c, 0x40, 0x44 
	} list[5];
};

struct Struct_ConfirmationProc
{
	PROC_HEADER;
};

static const struct ProcInstruction ProcInstruction_SelectCharacter[] =
{
    PROC_CALL_ROUTINE(LockGameLogic),

    PROC_YIELD,
	
    PROC_CALL_ROUTINE(UnlockGameLogic),
    PROC_END,
};

static const struct ProcInstruction ProcInstruction_CreatorClassProc[] =
{
	PROC_YIELD,
	PROC_CALL_ROUTINE(StartPlatform),
	PROC_LOOP_ROUTINE(CreatorClassDisplayLoop),
	PROC_CALL_ROUTINE(CreatorClassEndProc),
	PROC_END, 
}; 

static const struct ProcInstruction ProcInstruction_Confirmation[] =
{
    PROC_YIELD,
    PROC_END,
};

void CreatorClassEndProc(CreatorClassProcStruct* proc)
{
	CPU_FILL(0,(char*)&gBG0MapBuffer[13][0]-1,(32-13)*32*2,32);
	DeleteSomeAISStuff(&gSomeAISStruct);
	DeleteSomeAISProcs(&gSomeAISRelatedStruct);
	EndEkrAnimeDrvProc();
	//UnlockGameGraphicsLogic();
	//RefreshEntityMaps();
	//DrawTileGraphics();
	SMS_UpdateFromGameData();
	MU_EndAll();
}

static const struct MenuCommandDefinition MenuCommands_CharacterProc[] =
{
    {

        .isAvailable = MenuCommandAlwaysUsable,
		.rawName = " ",
        .onEffect = SelectClass,
		.onDraw = DrawSelect_0,
		.onSwitchIn = SwitchInCharacter, 
		.onSwitchOut = SwitchOutCharacter, 
    },

    {
        .isAvailable = MenuCommandAlwaysUsable,

        .rawName = " ",
        .onEffect = SelectClass,
		.onDraw = DrawSelect_1,
		.onSwitchIn = SwitchInCharacter, 
		.onSwitchOut = SwitchOutCharacter, 
    },
    {
        .isAvailable = MenuCommandAlwaysUsable,

        .rawName = " ",
        .onEffect = SelectClass,
		.onDraw = DrawSelect_2,
		.onSwitchIn = SwitchInCharacter, 
		.onSwitchOut = SwitchOutCharacter, 
    },
    {} // END
};


static const struct MenuCommandDefinition MenuCommands_ConfirmationProc[] =
{
    {
        .isAvailable = MenuCommandAlwaysUsable,
		.rawName = " Yes",
        .onEffect = SelectYes,
    },

    {
        .isAvailable = MenuCommandAlwaysUsable,

        .rawName = " No",
        .onEffect = SelectNo,
    },
    {} // END
};


static const struct MenuDefinition MenuDef_SelectCharacter =
{
    //.geometry = { 23, 12, 7 },
    .geometry = { 2, 3, 7 },
	.style = 0,
    .commandList = MenuCommands_CharacterProc,
	._u14 = 0,
    .onEnd = SelectCharacterMenuEnd,
	.onInit = 0,
	.onBPress = 0, //(void*) (0x08022860+1), // FIXME
	.onRPress = 0,
	.onHelpBox = 0, 	
};


static const struct MenuDefinition MenuDef_ConfirmCharacter =
{
    //.geometry = { 25, 12, 5 },
    .geometry = { 4, 3, 5 },
    .commandList = MenuCommands_ConfirmationProc, 

    .onEnd = SelectCharacterMenuEnd,
    //.onBPress = (void*) (SelectCharacter_ASMC), 
};


// ASMC 
int SelectCharacter_ASMC(struct MenuProc* menu, struct MenuCommandProc* command) // ASMC 
{
    struct Struct_SelectCharacterProc* proc = (void*) ProcStart(ProcInstruction_SelectCharacter, ROOT_PROC_3);
    proc->activeUnit = gActiveUnit;


	for ( int i = 0 ; i < 5 ; i++ ) // Mem slots 1 - 5 as unit groups to load 
	{ 	
		if (gEventSlot[i+1] != 0) // Non-zero Character ID in unit group to load and non-zero memory slot 
		{
			proc->list[i].unitRam = LoadUnit(gEventSlot[i+1]); //Unit* 
		}

	}
	
	
	
	proc->currOptionIndex = 0;
    StartMenuChild(&MenuDef_SelectCharacter, (void*) proc);

    return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}




// We need to draw the names of each menu item before hovering over them 
static void DrawSelect_0(struct MenuProc* menu, struct MenuCommandProc* command)
{
	int i = 0;
	DrawSelectCharacterCommands(menu, command, i);
}
static void DrawSelect_1(struct MenuProc* menu, struct MenuCommandProc* command)
{
	int i = 1;
	DrawSelectCharacterCommands(menu, command, i);
}
static void DrawSelect_2(struct MenuProc* menu, struct MenuCommandProc* command)
{
	int i = 2;
	DrawSelectCharacterCommands(menu, command, i);
}


void CharacterSelectDrawUIBox(Struct_SelectCharacterProc* proc)
{
	ApplyBGBox(gBG1MapBuffer,&gCreatorClassUIBoxTSA,0,12);
	EnableBgSyncByMask(2);
}

static void DrawSelectCharacterCommands(struct MenuProc* menu, struct MenuCommandProc* command, int i)
{
    struct Struct_SelectCharacterProc* proc = (void*) menu->parent;
	Unit* unit = (proc->list[i].unitRam);
	
   

	CharacterSelectDrawUIBox(proc);
	
	
	
	u16* const out = gBg0MapBuffer + TILEMAP_INDEX(command->xDrawTile, command->yDrawTile);
	TextHandle* currHandle = &command->text;
    Text_Clear(currHandle);
	Text_SetColorId(currHandle, TEXT_COLOR_NORMAL);

	
	u16 textID = unit->pClassData->nameTextId; 
	//pCharacterData->nameTextId;
	
	//asm("mov r11,r11");

	Text_InsertString(currHandle,0,TEXT_COLOR_NORMAL,GetStringFromIndex(textID));
    Text_Display(currHandle, out);

    /*
	LoadIconPalettes(4);

    for (int i = 0; i < UNIT_SKILL_COUNT; ++i)
    {
        if (IsSkill(skills[i]))
            DrawIcon(out + TILEMAP_INDEX(2*i, 0), SKILL_ICON(skills[i]), TILEREF(0, 4));
    }

    command->onCycle = (void*) SkillListCommandDrawIdle;
	*/
	
}

static void ApplyBGBox(u16 map[32][32], TSA* tsa, int x, int y)
{
	for ( int i = 0 ; i < tsa->height+1 ; i++ )
	{
		for ( int j = 0 ; j < tsa->width+1 ; j++ )
		{
			map[i+y][j+x] = ((u16*)(tsa->tiles))[i*(tsa->width+1)+j];
		}
	}
}


void StartPlatform(CreatorClassProcStruct* proc) 
{


	Struct_SelectCharacterProc* parent_proc = (void*)(Struct_SelectCharacterProc*)ProcFind(&ProcInstruction_SelectCharacter[0]);
	parent_proc->platformType = 1; 
	for ( int i = 0 ; i < 5 ; i++ ) { proc->classes[i] = parent_proc->list[i].unitRam->pClassData->number; }
	proc->menuItem = parent_proc->currOptionIndex;
	proc->charID = parent_proc->list[proc->menuItem].unitRam->pCharacterData->number;
	
	//proc->menuItem = creator->lastClassIndex;
	//proc->charID = creator->tempUnit->pCharacterData->number;
	SetupMovingPlatform(0,-1,0x1F6,0x58,6);
	StartMovingPlatform(proc->platformType,0x118,gCharacterSelectorPlatformHeight);
}

static void DrawStatNames(TextHandle handle, char* string, int x, int y)
{
	Text_Clear(&handle);
	Text_SetColorId(&handle,TEXT_COLOR_GOLD);
	Text_AppendStringAscii(&handle,string);
	Text_Display(&handle,&gBG0MapBuffer[y][x]);
}

// Add labels to strmag/growthgetters.event have the |1 for thumb 
extern int  Get_Hp_Growth2(Unit* unit);
extern int Get_Str_Growth2(Unit* unit);
extern int Get_Mag_Growth2(Unit* unit);
extern int Get_Skl_Growth2(Unit* unit);
extern int Get_Spd_Growth2(Unit* unit);
extern int Get_Def_Growth2(Unit* unit);
extern int Get_Res_Growth2(Unit* unit);


static
u8* UnitGetSkillList(struct Unit* unit)
{
    extern u8 gBWLDataStorage[];

    return gBWLDataStorage + 0x10 * (unit->pCharacterData->number - 1) + 1;
}


void SwitchInCharacter(MenuProc* proc, MenuCommandProc* commandProc) // Whenever you scroll or exit / confirm the character menu  
{

	
	struct Struct_SelectCharacterProc* parent_proc = (void*) proc->parent;
	parent_proc->currOptionIndex = proc->commandIndex;
	
	Unit* unit = (parent_proc->list[parent_proc->currOptionIndex].unitRam);

	
	
	int iconX = 12;
	for ( int i = 0 ; i < 8 ; i++ )
	{
		if ( unit->ranks[i] )
		{
			DrawIcon(&gBG0MapBuffer[1][iconX],0x70+i,0x5000);
			iconX += 2;
		}
	}
	
	
	u8* skillList = UnitGetSkillList(unit); 
	iconX = 20;
	int c = 0;
	while ( skillList[c] )
	{
		DrawSkillIcon(&gBG0MapBuffer[1][iconX],skillList[c],0x4000);
		c++;
		iconX += 2;
	}
	
	
	
	
	
	
	
	
	
	
	// Draw stats / growths 
	DrawUiNumber(&gBG0MapBuffer[15][8],TEXT_COLOR_GOLD,unit->maxHP);
	DrawUiNumber(&gBG0MapBuffer[15][11],TEXT_COLOR_GOLD,unit->pow);
	DrawUiNumber(&gBG0MapBuffer[15][14],TEXT_COLOR_GOLD,unit->unk3A); // Magic.
	DrawUiNumber(&gBG0MapBuffer[15][17],TEXT_COLOR_GOLD,unit->skl);
	DrawUiNumber(&gBG0MapBuffer[15][20],TEXT_COLOR_GOLD,unit->spd);
	DrawUiNumber(&gBG0MapBuffer[15][23],TEXT_COLOR_GOLD,unit->def);
	DrawUiNumber(&gBG0MapBuffer[15][26],TEXT_COLOR_GOLD,unit->res);
	
	DrawUiNumber(&gBG0MapBuffer[17][8],TEXT_COLOR_GOLD,Get_Hp_Growth2(unit));
	DrawUiNumber(&gBG0MapBuffer[17][11],TEXT_COLOR_GOLD,Get_Str_Growth2(unit));
	DrawUiNumber(&gBG0MapBuffer[17][14],TEXT_COLOR_GOLD,Get_Mag_Growth2(unit));
	DrawUiNumber(&gBG0MapBuffer[17][17],TEXT_COLOR_GOLD,Get_Skl_Growth2(unit));
	DrawUiNumber(&gBG0MapBuffer[17][20],TEXT_COLOR_GOLD,Get_Spd_Growth2(unit));
	DrawUiNumber(&gBG0MapBuffer[17][23],TEXT_COLOR_GOLD,Get_Def_Growth2(unit));
	DrawUiNumber(&gBG0MapBuffer[17][26],TEXT_COLOR_GOLD,Get_Res_Growth2(unit));
	int tile = 0;
	TextHandle baseHandle =	{
		.tileIndexOffset = gpCurrentFont->tileNext+tile,
		.tileWidth = 4
	};
	tile += 4;
	Text_Clear(&baseHandle);
	Text_SetColorId(&baseHandle,TEXT_COLOR_GOLD);
	Text_InsertString(&baseHandle,0,TEXT_COLOR_GOLD,"Base");
	Text_Display(&baseHandle,&gBG0MapBuffer[15][2]);
	
	TextHandle growthHandle = {
		.tileIndexOffset = gpCurrentFont->tileNext+tile,
		.tileWidth = 4
	};
	tile += 4;
	Text_Clear(&growthHandle);
	Text_SetColorId(&growthHandle,TEXT_COLOR_GOLD);
	Text_InsertString(&growthHandle,0,TEXT_COLOR_GOLD,"Growth");
	Text_Display(&growthHandle,&gBG0MapBuffer[17][2]);
	
	TextHandle hpHandle = {
		.tileIndexOffset = gpCurrentFont->tileNext+tile,
		.tileWidth = 2
	};
	tile += 2;
	DrawStatNames(hpHandle,"HP",7,13);
	
	TextHandle strHandle = {
		.tileIndexOffset = gpCurrentFont->tileNext+tile,
		.tileWidth = 3
	};
	tile += 3;
	DrawStatNames(strHandle,"Str",10,13);
	
	TextHandle magHandle = {
		.tileIndexOffset = gpCurrentFont->tileNext+tile,
		.tileWidth = 3
	};
	tile += 3;
	DrawStatNames(magHandle,"Mag",13,13);
	
	TextHandle sklHandle = {
		.tileIndexOffset = gpCurrentFont->tileNext+tile,
		.tileWidth = 3
	};
	tile += 3;
	DrawStatNames(sklHandle,"Skl",16,13);
	
	TextHandle spdHandle = {
		.tileIndexOffset = gpCurrentFont->tileNext+tile,
		.tileWidth = 3
	};
	tile += 3;
	DrawStatNames(spdHandle,"Spd",19,13);
	
	TextHandle defHandle = {
		.tileIndexOffset = gpCurrentFont->tileNext+tile,
		.tileWidth = 3
	};
	tile += 3;
	DrawStatNames(defHandle,"Def",22,13);
	
	TextHandle resHandle = {
		.tileIndexOffset = gpCurrentFont->tileNext+tile,
		.tileWidth = 3
	};
	tile += 3;
	DrawStatNames(resHandle,"Res",25,13);
	
	EnableBgSyncByMask(1);
	//BgMapFillRect(&gBG0MapBuffer[1][12],30-12,2,0);
	ClearIcons();
	
	CreatorClassProcStruct* classProc = (CreatorClassProcStruct*)ProcFind(ProcInstruction_CreatorClassProc);
	if ( !classProc ) { ProcStart(ProcInstruction_CreatorClassProc,(Proc*)parent_proc); } // If the creator class proc doesn't exist yet, make one.
	else
	{
		// Otherwise, update relevant fields.
		classProc->mode = 1;
		for ( int i = 0 ; i < 5 ; i++ ) { classProc->classes[i] = parent_proc->list[i].unitRam->pClassData->number; }
		classProc->menuItem = commandProc->commandDefinitionIndex;
		classProc->charID = parent_proc->list[commandProc->commandDefinitionIndex].unitRam->pCharacterData->number;
	}
	
	
}


void SwitchOutCharacter(MenuProc* proc, MenuCommandProc* commandProc) // Whenever you scroll or exit / confirm the character menu  
{
	
	//BgMapFillRect(&gBG0MapBuffer[1][12],30-12,2,0);
	ClearIcons();
}


static int SelectClass(struct MenuProc* menu, struct MenuCommandProc* command)
{
	Proc* parent_proc = (void*)(Struct_SelectCharacterProc*)ProcFind(&ProcInstruction_SelectCharacter[0]);
	//Struct_SelectCharacterProc* proc_variables = (void*)(Struct_SelectCharacterProc*)ProcFind(&ProcInstruction_SelectCharacter[0]);
	// useful probably 
	struct Struct_ConfirmationProc* proc = (void*) ProcStartBlocking(ProcInstruction_Confirmation, parent_proc);



	StartMenuChild(&MenuDef_ConfirmCharacter, (void*) proc);
	//return ME_NONE;
	return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}


static int SelectYes(struct MenuProc* menu, struct MenuCommandProc* command)
{
	return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}

static int SelectNo(struct MenuProc* menu, struct MenuCommandProc* command)
{
	//(void*) (SelectCharacter_ASMC);
	return ME_DISABLE | ME_END | ME_PLAY_BEEP | ME_CLEAR_GFX;
}


static void SelectCharacterMenuEnd(struct MenuProc* menu)
{
    //EndFaceById(0);
}
















