
#include "include/global.h"
#include "include/functions.h"
#include "include/variables.h"
#include "include/hardware.h"
#include "include/fontgrp.h"
#include "include/bmunit.h"
#include "include/hardware.h"
#include "include/bmudisp.h"
#include "include/ctc.h"
#include "include/icon.h"
#include "include/uiutils.h"
#include "include/bm.h"
#include "include/face.h"
#include "include/bmitem.h"
#include "include/soundwrapper.h"
#include "include/statscreen.h"
#include "include/constants/video-global.h"
#include "include/bmlib.h"
#include "include/prepscreen.h"


void ProcPrepUnit_OnEnd(struct ProcPrepUnit *proc);
void ProcPrepUnit_OnInit(struct ProcPrepUnit *proc);
void ProcPrepUnit_InitScreen(struct ProcPrepUnit *proc);
void ProcPrepUnit_Idle(struct ProcPrepUnit *proc);
void ProcPrepUnit_OnGameStart(struct ProcPrepUnit *proc);
void sub_809B370(struct ProcPrepUnit *proc);
void sub_809B2DC(struct ProcPrepUnit *proc);
void sub_809B3B4(struct ProcPrepUnit *proc);
void sub_809B324(struct ProcPrepUnit *proc);
void sub_809B388(struct ProcPrepUnit *proc);
void sub_809B014();
void sub_809B458(struct ProcPrepUnit *proc);
void sub_809B478(struct ProcPrepUnit *proc);
void PrepUnitDisableDisp();
void PrepUnitEnableDisp();
void sub_809B504(struct ProcPrepUnit *proc);
void sub_809B520(struct ProcPrepUnit *proc);
void PrepUnit_DrawLeftUnitNameCur(struct ProcPrepUnit *proc);
void PrepUnit_DrawUnitListNames(struct ProcPrepUnit *proc, int line);

extern s8 CheckInLinkArena();






void StartPCBoxUnitSelect(struct Proc* proc);

static const struct ProcCmd ProcScr_PCBoxUnitScreen[] = {
    PROC_YIELD,
    PROC_SET_END_CB(ProcPrepUnit_OnEnd),

PROC_LABEL(PROC_LABEL_PREPUNIT_0),
    PROC_CALL(ProcPrepUnit_OnInit),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_CALL_ARG(NewFadeIn, 0x10),
    PROC_WHILE(FadeInExists),

PROC_LABEL(PROC_LABEL_PREPUNIT_IDLE),
    PROC_REPEAT(ProcPrepUnit_Idle),

PROC_LABEL(PROC_LABEL_PREPUNIT_2),
    PROC_CALL(sub_809B370),
    PROC_REPEAT(sub_809B2DC),
    PROC_REPEAT(sub_809B3B4),
    PROC_REPEAT(sub_809B324),
    PROC_CALL(sub_809B388),
    PROC_GOTO(PROC_LABEL_PREPUNIT_IDLE),

PROC_LABEL(PROC_LABEL_PREPUNIT_PRESS_SELECT),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(sub_809B014),
    PROC_CALL(sub_809B458),
    PROC_YIELD,
    PROC_CALL(sub_809B478),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_YIELD,
    PROC_CALL_ARG(NewFadeIn, 0x10),
    PROC_WHILE(FadeInExists),
    PROC_GOTO(PROC_LABEL_PREPUNIT_IDLE),

PROC_LABEL(PROC_LABEL_PREPUNIT_PRESS_R),
    PROC_CALL(PrepUnitDisableDisp),
    PROC_SLEEP(0x2),
    PROC_CALL(sub_809B014),
    PROC_CALL(sub_809B504),
    PROC_YIELD,
    PROC_CALL(sub_809B520),
    PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_SLEEP(0x2),
    PROC_CALL(PrepUnitEnableDisp),
    PROC_GOTO(0x1),

PROC_LABEL(PROC_LABEL_PREPUNIT_GAME_START),
    PROC_CALL(ProcPrepUnit_OnGameStart),
    PROC_SLEEP(0x1E),
    PROC_CALL_ARG(NewFadeOut, 0x8),
    PROC_WHILE(FadeOutExists),
    PROC_GOTO(PROC_LABEL_PREPUNIT_END),

PROC_LABEL(PROC_LABEL_PREPUNIT_PRESS_B),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),

PROC_LABEL(PROC_LABEL_PREPUNIT_END),
    PROC_END
};

