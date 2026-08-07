
#include "StartingOptionsMenu.h"

// lovingly borrowed from circles' self-rando
static const ProcCode StartingOptionsProc[] = {
    PROC_SET_NAME("StartingOptions"), PROC_CALL_ROUTINE(LockGameLogic), PROC_END_ALL(0x8a20b1c),
    // PROC_END_ALL(0x8a206a8), //savemenu drawing

    PROC_CALL_ROUTINE(StartingOptionsSetup),
    // PROC_CALL_ROUTINE(0x80b1a09), //original config drawing

    PROC_CALL_ROUTINE_ARG(NewFadeIn, 8), PROC_WHILE_ROUTINE(FadeInExists), PROC_SLEEP(1),

    PROC_LOOP_ROUTINE(StartingOptionsLoop), // wait for B button

    PROC_CALL_ROUTINE_ARG(NewFadeOut, 0x10), PROC_WHILE_ROUTINE(FadeOutExists), PROC_SLEEP(10),

    PROC_END
};

static const ProcCode StartingOptionsSavedProc[] = { PROC_SET_NAME("StartingOptionsSaved"), PROC_SLEEP(1),
                                                     PROC_LOOP_ROUTINE(SaveStartingOptionsLoop), PROC_END };

static const ProcCode SpinProc[] = { PROC_SET_NAME("SpinnyBoi"), PROC_SET_MARK(0xD), PROC_CALL_ROUTINE(&SpinRoutine1),
                                     PROC_LOOP_ROUTINE(&SpinRoutine2), PROC_END };

static const ProcCode NewGameDifficultySelect[] = {
    PROC_SET_NAME("DifficultySelect"),

    PROC_SET_DESTRUCTOR(0x80ac078 + 1), PROC_CALL_ROUTINE(0x80ad5b4 + 1), PROC_YIELD, PROC_CALL_ROUTINE(0x80ac1a8 + 1),
    PROC_SLEEP(1),
    PROC_CALL_ROUTINE(EnableAllGfx), // EnableAllGfx
    PROC_CALL_ROUTINE_ARG(NewFadeIn, 8), PROC_WHILE_ROUTINE(FadeInExists), PROC_LABEL(0),
    PROC_LOOP_ROUTINE(0x80ac288 + 1), PROC_LABEL(1), PROC_CALL_ROUTINE_ARG(NewFadeOut, 8),
    PROC_WHILE_ROUTINE(FadeOutExists), PROC_SLEEP(10),

    PROC_NEW_CHILD(SpinProc), // one spinny boi

    PROC_NEW_CHILD_BLOCKING(StartingOptionsProc),

    // PROC_NEW_CHILD_BLOCKING(0x8a2ece0), //config proc
    PROC_SLEEP(10),

    PROC_LABEL(2), PROC_CALL_ROUTINE_ARG(NewFadeOut, 8), PROC_WHILE_ROUTINE(FadeOutExists),
    PROC_CALL_ROUTINE(nullsub_64),

    PROC_YIELD,

    PROC_CALL_ROUTINE(0x80a8c2c + 1), PROC_YIELD, PROC_CALL_ROUTINE(0x80a8cd4 + 1), PROC_CALL_ROUTINE(0x80a8f04 + 1),
    PROC_YIELD, PROC_CALL_ROUTINE(UnlockGameLogic), PROC_END
};

extern int PAGE1MAXINDEX;
extern const u8 NumberOfOptionsPerEntryTable[];

static const LocationTable CursorLocationTable[] = {
    { 10, 0x18 }, { 10, 0x28 }, { 10, 0x38 }, { 10, 0x48 }, { 10, 0x58 }, { 10, 0x68 }, { 10, 0x78 }, //,
    { 10, 0x88 }                                                                                      //,
    // {10, 0x88} //leave room for a description?
};

// POIN to this at $a20164
void NewDifficultySelectFunc(ProcState * input)
{
    ProcStartBlocking(NewGameDifficultySelect, input);
};

void StartingOptionsSetup(OptionsProc * CurrentProc)
{
    // set up bg graphics
    ClearBG0BG1();
    EnableBgSyncByIndex(0);
    CpuSet((void *)0x859ED70, ((void *)0x020228A8 + 16 * 0x20), 0x20); // ui palette

    CpuSet((void *)0x8b1754c + 0x20, ((void *)0x020228A8 + 8 * 0x20), 0x20); // bg palette

    VBlankIntrWait();
    LZ77UnCompVram((void *)0x8b12db4, (void *)0x6003000); // bg (changed from 0x6008000)
    GenerateBGTsa((u16 *)BG1Buffer, 0x280, 8, 0x180);     // was BG1Buffer
    // BG_Fill((void*)0x6007000, 0); //clear bg0 tilemap
    // BG_Fill((void*)0x6007800, 0); //clear bg1 tilemap
    VBlankIntrWait();
    *gColorSpecialEffectsSelectionBuffer = 0xA44; // blending set
    *gBg1ControlBuffer = 0xD03;                   // priority set

    // Load fonts
    //  SetupDebugFontForBG(2, 0);
    //  SetupDebugFontForOBJ(-1, 14);
    //  SetupDebugFontForOBJ(0x6017800, 14);
    InitDefaultFont();
    // InitText(0, 0);

    // set up cursor
    CurrentProc->CursorIndex = 0;
    CurrentProc->Page = 1;
    CurrentProc->Option[0] = 0;
    CurrentProc->Option[1] = 0;
    CurrentProc->Option[2] = 0;
    CurrentProc->Option[3] = 0;
    CurrentProc->Option[4] = 0;
    CurrentProc->Option[5] = 0;
    CurrentProc->Option[6] = 0;
    CurrentProc->Option[7] = 0;

    OptionsSavedProc * proc = (void *)ProcStart(StartingOptionsSavedProc, (void *)3);
    for (int i = 0; i < 21; i++)
    {
        proc->FlagOn[i] = 0; // init to 0
    }
    proc->timer = 0; // init game time as 0

    updateOptionsPage(CurrentProc);
};

void GenerateBGTsa(u16 * MapOffset, u32 NumberOfTiles, u8 PaletteId, u16 baseTile)
{
    for (u16 i = baseTile; i < (baseTile + NumberOfTiles / 2) + 1; i++)
    {
        MapOffset[i - baseTile] = (i | (PaletteId << 12));
        MapOffset[NumberOfTiles - (i - baseTile)] = (i | (PaletteId << 12) | (3 << 10)); // v and h flipped
    }
}
extern u16 Title_Text_Link;
extern u16 OptionsCommand0_Text_Link;
extern u16 OptionsCommand1_Text_Link;
extern u16 OptionsCommand2_Text_Link;
extern u16 OptionsCommand3_Text_Link;
extern u16 OptionsCommand4_Text_Link;
extern u16 OptionsCommand5_Text_Link;
extern u16 OptionsCommand6_Text_Link;
extern u16 OptionsCommand7_Text_Link;
extern u16 Command0_Option0_Text_Link;
extern u16 Command0_Option1_Text_Link;
extern u16 Command0_Option2_Text_Link;
extern u16 Command0_Option3_Text_Link;
extern u16 Command0_Option4_Text_Link;
extern u16 Command0_Option5_Text_Link;
extern u16 Command0_Option6_Text_Link;
extern u16 Command0_Option7_Text_Link;
extern u16 Command1_Option0_Text_Link;
extern u16 Command1_Option1_Text_Link;
extern u16 Command1_Option2_Text_Link;
extern u16 Command1_Option3_Text_Link;
extern u16 Command1_Option4_Text_Link;
extern u16 Command1_Option5_Text_Link;
extern u16 Command1_Option6_Text_Link;
extern u16 Command1_Option7_Text_Link;
extern u16 Command2_Option0_Text_Link;
extern u16 Command2_Option1_Text_Link;
extern u16 Command2_Option2_Text_Link;
extern u16 Command2_Option3_Text_Link;
extern u16 Command2_Option4_Text_Link;
extern u16 Command2_Option5_Text_Link;
extern u16 Command2_Option6_Text_Link;
extern u16 Command2_Option7_Text_Link;
extern u16 Command3_Option0_Text_Link;
extern u16 Command3_Option1_Text_Link;
extern u16 Command3_Option2_Text_Link;
extern u16 Command3_Option3_Text_Link;
extern u16 Command3_Option4_Text_Link;
extern u16 Command3_Option5_Text_Link;
extern u16 Command3_Option6_Text_Link;
extern u16 Command3_Option7_Text_Link;
extern u16 Command4_Option0_Text_Link;
extern u16 Command4_Option1_Text_Link;
extern u16 Command4_Option2_Text_Link;
extern u16 Command4_Option3_Text_Link;
extern u16 Command4_Option4_Text_Link;
extern u16 Command4_Option5_Text_Link;
extern u16 Command4_Option6_Text_Link;
extern u16 Command4_Option7_Text_Link;
extern u16 Command5_Option0_Text_Link;
extern u16 Command5_Option1_Text_Link;
extern u16 Command5_Option2_Text_Link;
extern u16 Command5_Option3_Text_Link;
extern u16 Command5_Option4_Text_Link;
extern u16 Command5_Option5_Text_Link;
extern u16 Command5_Option6_Text_Link;
extern u16 Command5_Option7_Text_Link;
extern u16 Command6_Option0_Text_Link;
extern u16 Command6_Option1_Text_Link;
extern u16 Command6_Option2_Text_Link;
extern u16 Command6_Option3_Text_Link;
extern u16 Command6_Option4_Text_Link;
extern u16 Command6_Option5_Text_Link;
extern u16 Command6_Option6_Text_Link;
extern u16 Command6_Option7_Text_Link;
extern u16 Command7_Option0_Text_Link;
extern u16 Command7_Option1_Text_Link;
extern u16 Command7_Option2_Text_Link;
extern u16 Command7_Option3_Text_Link;
extern u16 Command7_Option4_Text_Link;
extern u16 Command7_Option5_Text_Link;
extern u16 Command7_Option6_Text_Link;
extern u16 Command7_Option7_Text_Link;
extern u16 StartingOptionsNA_Text_Link;

static const u16 * const StartingOptionsCommandTextIds[8] = {
    &OptionsCommand0_Text_Link,
    &OptionsCommand1_Text_Link,
    &OptionsCommand2_Text_Link,
    &OptionsCommand3_Text_Link,
    &OptionsCommand4_Text_Link,
    &OptionsCommand5_Text_Link,
    &OptionsCommand6_Text_Link,
    &OptionsCommand7_Text_Link,
};

static const u16 * const StartingOptionsOptionTextIds[8][8] = {
    { &Command0_Option0_Text_Link, &Command0_Option1_Text_Link, &Command0_Option2_Text_Link, &Command0_Option3_Text_Link, &Command0_Option4_Text_Link, &Command0_Option5_Text_Link, &Command0_Option6_Text_Link, &Command0_Option7_Text_Link },
    { &Command1_Option0_Text_Link, &Command1_Option1_Text_Link, &Command1_Option2_Text_Link, &Command1_Option3_Text_Link, &Command1_Option4_Text_Link, &Command1_Option5_Text_Link, &Command1_Option6_Text_Link, &Command1_Option7_Text_Link },
    { &Command2_Option0_Text_Link, &Command2_Option1_Text_Link, &Command2_Option2_Text_Link, &Command2_Option3_Text_Link, &Command2_Option4_Text_Link, &Command2_Option5_Text_Link, &Command2_Option6_Text_Link, &Command2_Option7_Text_Link },
    { &Command3_Option0_Text_Link, &Command3_Option1_Text_Link, &Command3_Option2_Text_Link, &Command3_Option3_Text_Link, &Command3_Option4_Text_Link, &Command3_Option5_Text_Link, &Command3_Option6_Text_Link, &Command3_Option7_Text_Link },
    { &Command4_Option0_Text_Link, &Command4_Option1_Text_Link, &Command4_Option2_Text_Link, &Command4_Option3_Text_Link, &Command4_Option4_Text_Link, &Command4_Option5_Text_Link, &Command4_Option6_Text_Link, &Command4_Option7_Text_Link },
    { &Command5_Option0_Text_Link, &Command5_Option1_Text_Link, &Command5_Option2_Text_Link, &Command5_Option3_Text_Link, &Command5_Option4_Text_Link, &Command5_Option5_Text_Link, &Command5_Option6_Text_Link, &Command5_Option7_Text_Link },
    { &Command6_Option0_Text_Link, &Command6_Option1_Text_Link, &Command6_Option2_Text_Link, &Command6_Option3_Text_Link, &Command6_Option4_Text_Link, &Command6_Option5_Text_Link, &Command6_Option6_Text_Link, &Command6_Option7_Text_Link },
    { &Command7_Option0_Text_Link, &Command7_Option1_Text_Link, &Command7_Option2_Text_Link, &Command7_Option3_Text_Link, &Command7_Option4_Text_Link, &Command7_Option5_Text_Link, &Command7_Option6_Text_Link, &Command7_Option7_Text_Link },
};

static const char * GetStartingOptionsText(const u16 * textIdLink)
{
    return GetStringFromIndex(*textIdLink);
}

static void DrawStartingOptionsText(int x, int y, int color, const char * string)
{
    DrawTextInline(0, BGLoc(BG0Buffer, x, y), color, 0, (Text_GetStringTextWidth(string) + 8) / 8, string);
}

void updateOptionsPage(OptionsProc * CurrentProc)
{
    Text_ResetTileAllocation();
    BG_Fill((u16 *)BG0Buffer, 0);
    EnableBgSyncByIndex(0);

    const char * string = GetStartingOptionsText(&Title_Text_Link);
    DrawStartingOptionsText(2, 0, 4, string);

    if (thisPage == 1)
    {
        for (int i = 0; i < 8; i++)
        {
            string = GetStartingOptionsText(StartingOptionsCommandTextIds[i]);
            DrawStartingOptionsText(2, 3 + (i * 2), 3, string);

            int option = CurrentProc->Option[i];
            if (option < 0 || option >= 8)
                string = GetStartingOptionsText(&StartingOptionsNA_Text_Link);
            else
                string = GetStartingOptionsText(StartingOptionsOptionTextIds[i][option]);

            DrawStartingOptionsText(15, 3 + (i * 2), 2, string);
        }
    }
};
void SaveOptionsData(void * target, unsigned size)
{
    WriteAndVerifySramFast(&OptionsSaved, target, size);
}

void LoadOptionsData(void * source, unsigned size)
{
    ReadSramFast(source, (void *)&OptionsSaved, size);
}

extern u16 OptionsToFlagsList[];

u16 * GetOptionsToFlagData(int commandID)
{

    u16 * data = &OptionsToFlagsList[0];
    if (commandID == 0)
    {
        data++; // 0th entry is immediately after the ID
        return data;
    }

    while (*data != 0xFEDC)
    {
        data++;
        if (*data == 0xFFFF)
        {
            data++; // we want the entry immediately after SHORT 0xFFFF
            if (*data == commandID)
            {
                data++; // we also want to ignore the SHORT commandID
                return data;
            }
        }
    }
    return NULL;
}
extern struct ProcCode * ProcScr_StdEventEngine; // map event engine proc

extern u8 gPermanentFlagBits[];
void CallResetPermanentFlags(void)
{
    int i;

    for (i = 0; i < 25; i++)
    {
        gPermanentFlagBits[i] = 0;
    }

    return;
}

extern struct ProcCode * ProcScr_BmFadeOUT; // save screen fade out
void SaveStartingOptionsLoop(OptionsSavedProc * CurrentProc)
{
    CurrentProc->timer++;
    OptionsProc * proc = (void *)ProcFind((void *)&StartingOptionsProc);
    if (proc)
    {
        for (int commandID = 0; commandID <= PAGE1MAXINDEX; commandID++)
        {
            u16 * data = GetOptionsToFlagData(commandID);
            // asm("mov r11, r11");
            if (data)
                CurrentProc->FlagOn[commandID] = data[proc->Option[commandID]];
        }
        return;
    }

    Proc * saveFadeOut = (void *)ProcFind((void *)&ProcScr_BmFadeOUT);
    if (saveFadeOut)
    {
        // asm("mov r11, r11");
        CallResetPermanentFlags();
        // save flags and kill proc
        int flag = 0;
        for (int i = 0; i < 21; i++)
        {
            flag = CurrentProc->FlagOn[i];
            if (flag > 0)
            {
                SetEventId(flag);
            }
        }
        SetGameTime(CurrentProc->timer);
        // int slot = gChapterData.saveSlotIndex;

        BreakProcLoop((void *)CurrentProc);
        // when event engine runs, save to file?
    }

    return;
}

void StartingOptionsLoop(OptionsProc * CurrentProc)
{

    // make snowflakes white
    *(u32 *)0x5000262 = 0x739eFFFF; // fill in the only obj palette colour that matters lol

    // if (CurrentProc->CursorIndex != CurrentProc->LastCursorIndex) updateOptionsPage(CurrentProc);
    // CurrentProc->LastCursorIndex = CurrentProc->CursorIndex;

    // UpdateBG3HOffset();
    UpdateHandCursor(CursorLocationTable[CurrentProc->CursorIndex].x, CursorLocationTable[CurrentProc->CursorIndex].y);
    if ((newInput & InputStart) || (newInput & InputA))
    { // press A or Start to continue
        BreakProcLoop((Proc *)CurrentProc);
        m4aSongNumStart(0x6B);
    };

    if (thisPage == 1)
    {
        if (newInput & InputDown)
        {
            if (CurrentProc->CursorIndex < PAGE1MAXINDEX)
            {
                CurrentProc->CursorIndex++;
            }
            else
            {
                CurrentProc->CursorIndex = 0;
            }
            updateOptionsPage(CurrentProc);
        }
        if (newInput & InputUp)
        {
            if (CurrentProc->CursorIndex != 0)
            {
                CurrentProc->CursorIndex--;
            }
            else
            {
                CurrentProc->CursorIndex = PAGE1MAXINDEX;
            }
            updateOptionsPage(CurrentProc);
        }

        if (newInput & InputLeft)
        {
            CurrentProc->Option[CurrentProc->CursorIndex]--;
            if (CurrentProc->Option[CurrentProc->CursorIndex] < 0)
            {
                CurrentProc->Option[CurrentProc->CursorIndex] =
                    NumberOfOptionsPerEntryTable[CurrentProc->CursorIndex] - 1;
            }
            updateOptionsPage(CurrentProc);
        }
        if (newInput & InputRight)
        {
            CurrentProc->Option[CurrentProc->CursorIndex]++;
            if (CurrentProc->Option[CurrentProc->CursorIndex] >= NumberOfOptionsPerEntryTable[CurrentProc->CursorIndex])
            {
                CurrentProc->Option[CurrentProc->CursorIndex] = 0;
            }
            updateOptionsPage(CurrentProc);
        }
    }
};
