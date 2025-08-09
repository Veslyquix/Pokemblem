#include "FreeMU.h"
// Unit* GetUnitStructFromEventParameter(u16);
extern const ProcCode gProc_CpPhase[];                              // 0x85A7F08
extern u8 MuCtr_StartMoveTowards(Unit *, u8 x, u8 y, u8, u8 flags); // 0x8079DDD

extern const struct SMSData g_StandingMapSpriteData[];

#define SMSSIZE(aId) (g_StandingMapSpriteData[(aId)].size)

unsigned SMS_RegisterUsage(unsigned id); //!< FE8U:080267FD

void SMS_SyncIndirect(void); //!< FE8U:08026F95

unsigned GetUnitBattleMapSpritePaletteIndex(struct Unit *); //!< FE8U:0802713D
unsigned GetUnitMapSpritePaletteIndex(struct Unit *);       //!< FE8U:08027169

struct SMSHandle * SMS_GetNewInfoStruct(int y); //!< FE8U:0802736D

/*
 * Basic!
 */
int DoesUnitHaveItemWithSpecificDurability(struct Unit * unit, int id)
{
    for (int c = 0; c < 5; c++)
    {
        int item = unit->items[c];
        if (!item)
        {
            break;
        }
        if (item == id)
        {
            return true;
        }
    }
    return false;
}
int DoesActorHaveCleatsOrBalloonEquipped(void)
{
    int result = false;
    result |= DoesUnitHaveItemWithSpecificDurability(gActiveUnit, EquippedAirBalloon_Link);
    result |= DoesUnitHaveItemWithSpecificDurability(gActiveUnit, EquippedCleats_Link);
    return result;
}

extern int IceTerrainTypeLink;
bool FMU_CheckForIce(struct FMUProc * proc, int x, int y)
{ // checks tile we're moving to
    if (gMapTerrain[y][x] == IceTerrainTypeLink)
    {
        if (FMU_CanUnitBeOnPos(gActiveUnit, x, y, proc))
        {
            if (!IsPosInvaild(x, y))
            {
                if (!DoesActorHaveCleatsOrBalloonEquipped())
                {
                    proc->usedIce = true;
                    proc->commandID = 0;
                    proc->command[0] = proc->smsFacing;
                    proc->command[1] = 0xFF;
                    // proc->yield_move = true;
                    // proc->yield = true;
                    // proc->countdown = 20;
                    // MuCtr_StartMoveTowards(gActiveUnit, x, y, 0x10, 0x0);
                    UpdateDestCoord(proc, x, y);

                    struct MUProc * muProc = MU_GetByUnit(gActiveUnit);
                    if (!muProc)
                    {
                        MuCtr_StartMoveTowards(gActiveUnit, x, y, 0x10, 0x0);
                        struct MUProc * muProc = MU_GetByUnit(gActiveUnit);
                        MU_EnableAttractCamera(muProc);
                    }

                    return true;

                    // return true;
                }
            }
        }
    }
    proc->usedIce = false;
    return false;
}

bool FMU_CheckForLedge(struct FMUProc * proc, int x, int y)
{
    if ((gMapTerrain[y][x] == LEDGE_JUMP) && (proc->smsFacing == MU_FACING_DOWN))
    {
        y += (proc->smsFacing == MU_FACING_DOWN);
        if (FMU_CanUnitBeOnPos(gActiveUnit, x, y, proc))
        {
            if (!IsPosInvaild(x, y))
            {
                proc->usedLedge = true;
                proc->commandID = 0;
                proc->command[0] = MU_COMMAND_MOVE_DOWN;
                proc->command[1] = 0xFF;
                // proc->yield_move = true;
                // proc->yield = true;
                // proc->countdown = 10;
                gMapTerrain[y - 1][x] = 1;
                proc->ledgeX = x;
                proc->ledgeY = y - 1;
                // MuCtr_StartMoveTowards(gActiveUnit, x, y, 0x10, 0x0);
                UpdateDestCoord(proc, x, y);

                return false;

                // return true;
            }
        }
    }
    return false;
}

int IsUnitProtag(struct Unit * unit)
{
    return unit->pCharacterData->number == ProtagID_Link;
}
enum
{
    TERRAIN_RIVER = 0x10, // unused I think
    TERRAIN_SEA = 0x15,   // sea
    TERRAIN_LAKE = 0x16,  // shallow
    TERRAIN_WATER = 0x3C, // unused I think
};

int IsTerrainWater(int terrain)
{
    return (terrain == TERRAIN_SEA || terrain == TERRAIN_LAKE);
}

int IsCoordWater(s8 x, s8 y)
{
    return IsTerrainWater(gMapTerrain[y][x]);
}
int IsUnitOnWater(struct Unit * unit) // used in GetUnitSMSId
{
    return IsCoordWater(unit->xPos, unit->yPos);
}

extern int CheckFlag(int);
extern int MarshbadgeObtained_Link;
inline s8 FMU_CanUnitCrossTerrain(struct Unit * unit, int terrain)
{
    if (CheckFlag(MarshbadgeObtained_Link))
    {
        if (IsUnitProtag(unit))
        {
            if (IsTerrainWater(terrain))
            {
                return true;
            }
        }
        else
        { // shouldn't reach this
            return CanUnitCrossTerrain(unit, terrain);
        }
    }
    const s8 * lookup = (s8 *)GetUnitMovementCost(unit);
    return (lookup[terrain] > 0) ? TRUE : FALSE;
}

extern int SurfingClass_Link;
extern int SurfingClass2_Link;
// previously had a hook: PrepScreenShowPokeballSprites
extern u8 PokecenterChLabel;
extern u8 RedPokeballSMS_Link;
int FMU_GetUnitSMSId(Unit * unit)
{
    if (gChapterData.chapterIndex == PokecenterChLabel)
    {
        return RedPokeballSMS_Link;
    }
    // if (IsUnitProtag(unit))
    // {
    // if (IsUnitOnWater(unit))
    // {
    // return 6;
    // }
    // }
    return unit->pClassData->SMSId;
}

extern int GirlProtagFlag_Link;
extern struct MuProc * GetUnitMu(Unit * unit);
extern const u16 gPal_MapSprite[];
extern void SetMuSpecialSprite(struct MuProc * proc, int jid, const u16 * pal);
extern void FMU_SetMuSpecialSprite(struct MuProc * proc, Unit * unit, const u16 * pal);
extern int GetUnitSpritePalette(Unit * unit);
extern void RefreshUnitSprites(void);
void AdjustSpriteForWater(Unit * unit, struct FMUProc * proc, int ontoWater)
{
    // int savedClass = proc->savedClass;
    if (ontoWater)
    {
        proc->savedClass = unit->pClassData->number;
        if (CheckFlag(GirlProtagFlag_Link))
        {
            unit->pClassData = GetClassData(SurfingClass2_Link);
        }
        else
        {
            unit->pClassData = GetClassData(SurfingClass_Link);
        }
    }
    else
    {
        unit->pClassData = GetClassData(proc->savedClass);
    }
    // RefreshUnitSprites();
    struct MuProc * muProc = GetUnitMu(unit);
    if (muProc)
    {
        FMU_SetMuSpecialSprite(muProc, unit, gPal_MapSprite);
    }
    FreeMoveRam->onWater = ontoWater;
    // ram
}

void SurfingCheck(Unit * unit, s8 x, s8 y, struct FMUProc * proc)
{
    int onWater = FreeMoveRam->onWater;
    int ontoWater = IsCoordWater(x, y);
    if (ontoWater && onWater)
    { // already on water
        return;
    }
    if (!ontoWater && !onWater)
    { // not on water / not moving onto water
        return;
    }
    if (ontoWater)
    {
        AdjustSpriteForWater(unit, proc, true);
        return;
    }
    else
    {
        AdjustSpriteForWater(unit, proc, false);
    }
}

bool FMU_CanUnitBeOnPos(Unit * unit, s8 x, s8 y, struct FMUProc * proc)
{
    if (x < 0 || y < 0)
        return 0; // position out of bounds
    if (x >= gMapSize.x || y >= gMapSize.y)
        return 0; // position out of bounds
    if (gMapUnit[y][x] > 0x3F)
        return 0;
    // if (gMapHidden[y][x] & 1)
    // return 0; // a hidden unit is occupying this position
    int result = FMU_CanUnitCrossTerrain(unit, gMapTerrain[y][x]); // CanUnitCrossTerrain(unit, gMapTerrain[y][x]);
    if (result)
    {
        SurfingCheck(unit, x, y, proc);
    }

    return result;
}

void EnableFreeMovementBits(void)
{ // used by suspend after ending FMU
    // gChapterData.currentPhase = 0x40;
    FreeMoveRam->state = true;
    FreeMoveRam->use_dir = true;
    return;
}

void SuspendDisableFreeMovement(void)
{
    struct FMUProc * proc = (struct FMUProc *)ProcFind(FreeMovementControlProc);
    if (proc)
    {
        End6CInternal_FreeMU();
        EnableFreeMovementBits();
    }
}

void EnableFreeMovementASMC(void)
{
    // gChapterData.currentPhase = 0x40;
    FreeMoveRam->state = true;
    FreeMoveRam->use_dir = true;
    return;
}

void DisableFreeMovementASMC(void)
{
    EndAllMenus();
    FreeMoveRam->state = false;
    FreeMoveRam->use_dir = false;
    return;
}

extern void * EnableDangerRadiusEvent;
enum
{
    // Menu state bits

    MENU_STATE_GAMELOCKING = (1 << 0),
    MENU_STATE_UNUSED1 = (1 << 1),
    MENU_STATE_ENDING = (1 << 2),
    MENU_STATE_NOTSHOWN = (1 << 3),
    MENU_STATE_FLAT = (1 << 4),
    MENU_STATE_NOCURSOR = (1 << 5),
    MENU_STATE_FROZEN = (1 << 6),
    MENU_STATE_DOOMED = (1 << 7),
};

void PauseFreeMovementASMC(void)
{
    struct FMUProc * proc = (struct FMUProc *)ProcFind(FreeMovementControlProc);
    if (proc)
    {
        FreeMoveRam->pause = true;
        proc->updateCameraAfterEvent = true;
        proc->updateDangerZone = true;
        struct MenuProc * menu = (MenuProc *)ProcFind(&gProc_Menu);
        if (menu)
        {
            // menu->stateBits =
            // MENU_STATE_NOTSHOWN|MENU_STATE_NOCURSOR|MENU_STATE_DOOMED;
            EndAllMenus();
            ClearBG0BG1();
            // ClearMenuCommandOverride();
        }
    }
    else
    {
        CallMapEventEngine(&EnableDangerRadiusEvent, 1);
    }

    return;
}

u8 GetFreeMovementState(void)
{
    return FreeMoveRam->state;
}

void End6CInternal_FreeMU()
{
    struct FMUProc * proc = (struct FMUProc *)ProcFind(FreeMovementControlProc);
    FreeMoveRam->state = false;
    FreeMoveRam->use_dir = false;
    if (proc)
    {
        AdjustSpriteForWater(proc->FMUnit, proc, false); // ensure they aren't surfing now
        // EndAllMenus();
        ProcGoto((Proc *)proc, 0xF);
        BreakEachProcLoop(FMU_IdleProc);
        // EndProc((Proc *)proc);
    }
    return;
}

/*
 * On Game Control
 */

void ChangeControlledUnitASMC(struct FMUProc * proc)
{
    proc->FMUnit = GetUnitStructFromEventParameter(gEventSlot[1]);
    CenterCameraOntoPosition(0, proc->FMUnit->xPos, proc->FMUnit->yPos);
    return;
}

void pFMU_DoNothing(struct Proc * proc)
{
    return;
}

void FMU_StartPlayerPhase()
{
    ProcGoto(ProcFind(&gProc_MapMain), 0x5);
    // gChapterData.currentPhase = 0;
    // FreeMoveRam->silent = false;
    FreeMoveRam->state = false;
}

void NewPlayerPhaseEvaluationFunc(struct Proc * ParentProc)
{
    if (GetFreeMovementState())
    {
        // ProcStartBlocking(FreeMovementControlProc,ParentProc);
        ProcStartBlocking(FMU_IdleProc, ParentProc);
        ProcStart(FreeMovementControlProc, ROOT_PROC_3);
    }
    else
    {
        ProcGoto(ProcStartBlocking(gProc_PlayerPhase, ParentProc), 0x7);
        // gChapterData.currentPhase = 0;
        // FreeMoveRam->silent = false;
    }
    BreakProcLoop(ParentProc);
    return;
}

void NewMakePhaseControllerFunc(struct Proc * ParentProc)
{
    const ProcCode * pTmpProcCode = FreeMovementControlProc;
    if (0 == GetFreeMovementState())
    {
        // if not FMU, start PlayerPhase or AiPhase
        if (0 == gChapterData.currentPhase || FreeMoveRam->silent)
        {
            pTmpProcCode = gProc_PlayerPhase;
            // FreeMoveRam->silent = false;
            // gChapterData.currentPhase = 0;
            if (FreeMoveRam->silent)
            {
                // SetCursorMapPosition(gActiveUnit->xPos, gActiveUnit->yPos);
            }
        }
        else
        {
            pTmpProcCode = gProc_CpPhase; // ai phase
            ProcStartBlocking(pTmpProcCode, ParentProc);
            BreakProcLoop(ParentProc);
            // if ai phase, ensure FMU is not running
            struct FMUProc * proc = (struct FMUProc *)ProcFind(FreeMovementControlProc);
            if (proc)
            {
                ProcGoto((Proc *)proc, 0xF);
                End6CInternal_FreeMU();
            }
            return;
        }
    }

    // if FMU, start FMU phase
    if (pTmpProcCode == FreeMovementControlProc)
    {
        ProcStartBlocking(FMU_IdleProc, ParentProc);
        ProcStart(pTmpProcCode, ROOT_PROC_3);
    }
    else
    {
        ProcStartBlocking(pTmpProcCode, ParentProc);
        FMU_EnableDR();
    }
    BreakProcLoop(ParentProc);
    return;
}

/*
 * Inside Proc
 */
void pFMU_OnInit(struct FMUProc * proc)
{
    // vaild?
    gActiveUnit = GetUnitStructFromEventParameter(ProtagID_Link);
    gActionData.subjectIndex = gActiveUnit->index;
    proc->FMUnit = gActiveUnit;
    if (0 == proc->FMUnit)
        proc->FMUnit = gUnitArrayBlue; // if no protag unit, select the first player in ram
    // if( !( 1&(u32)(proc->FMUnit)>>0x11) )
    //	proc->FMUnit = gUnitArrayBlue;
    // if( !( 1&(u32)(proc->FMUnit)>>0x19) )
    //	proc->FMUnit = gUnitArrayBlue;

    gActiveUnit = proc->FMUnit;
    return;
}

void pFMU_InitTimer(struct FMUProc * proc)
{
    pFMU_OnInit(proc);
    proc->uTimer = 0;
    return;
}

int pFMU_CorrectCameraPosition(struct FMUProc * proc)
{

    // if (CenterCameraOntoPosition((Proc*)proc, gActiveUnit->xPos,
    // gActiveUnit->yPos)) if (EnsureCameraOntoPosition((Proc*)proc,
    // gActiveUnit->xPos, gActiveUnit->yPos)) return yield;
    return no_yield;
}

u8 FMU_ChkKeyForMUExtra(struct FMUProc * proc, u16 iKeyUse)
{

    struct EventEngineProc * eventProc = (struct EventEngineProc *)ProcFind(&gProc_MapEventEngine);
    if (eventProc)
    {
        if (eventProc->evStallTimer || eventProc->pUnitLoadData || eventProc->activeTextType)
        {
            // proc->usedLedge = false;
            return 0x10; // if this returns 0x10, the parent returns (-1)
        }
    }
    if (proc->commandID != 0xFF)
    {
        int command = proc->command[proc->commandID];
        if (command == 0xFF)
            proc->commandID = 0xFF;
        else
        {

            proc->commandID++;
            proc->updateSMS = true;
            // SMS_UpdateFromGameData();
            // CallMapEventEngine(&StallEvent, 1);
            return command; // down
        }
    }
    if (proc->end_after_movement)
    { // after any scripted movement is done
        FMU_EndFreeMoveSilent();
        return 0x10;
    }

    if ((!proc->range_event) && (!proc->usedLedge))
    {
        u16 iKeyCur = iKeyUse; // gKeyState.heldKeys;
        iKeyCur = FMU_FilterMovementInput(proc, iKeyCur);
        // FreeMoveRam->dir = proc->smsFacing;
        if (iKeyCur & 0x10) // right
            return MU_FACING_RIGHT;
        if (iKeyCur & 0x20) // left
            return MU_FACING_LEFT;
        if (iKeyCur & 0x40) // up
            return MU_FACING_UP;
        if (iKeyCur & 0x80) // down
            return MU_FACING_DOWN;
    }
    //}
    return 0x10;
}
