#include "C_Code.h"
#include "global.h"

#include "hardware.h"
#include "unit_icon_data.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "chapterdata.h"
#include "ctc.h"
#include "mu.h"
#include "worldmap.h"

#include "bmudisp.h"
#include "bmlib.h"
#include "constants/terrains.h"
#include "constants/event-flags.h"
#include "constants/video-global.h"

/* fix div mod
SET_FUNC Div, __aeabi_idiv
SET_FUNC Div, __aeabi_idivmod
SET_FUNC Div, __aeabi_uidiv
SET_FUNC Div, __aeabi_uidivmod
*/

// #define UNITSPRITE_MAX_NEW 0xFF
#define UNITSPRITE_MAX_NEW 0xD0
extern UnitIconWait * const sStandingMapSpriteTable;
int __umodsi3(int a, int b);
extern u8 EWRAM_DATA NewgSMSGfxIndexLookup[0xFF];
/**
 * Display standing map sprites and various tile/unit markers
 */

extern u8 * const sUnitSpriteSlots;

extern u16 SmsObjVramLowerChr;
extern u16 SmsObjVramUpperChr;

#define SMS_VRAM_TILE_ROWS 16
#define SMS_GFX_BUFFER_SIZE (SMS_VRAM_TILE_ROWS * 0x20 * CHR_SIZE)
#define SMS_GFX_BUFFER_SPLIT_SIZE (SMS_GFX_BUFFER_SIZE / 2)
#define SMS_OBJ_VRAM_LOWER ((u8 *)0x06011000)
#define SMS_OBJ_CHR_REMAP_THRESHOLD (SMS_GFX_BUFFER_SPLIT_SIZE / CHR_SIZE)
#define SMS_OBJ_CHR_REMAP_OFFSET (SMS_GFX_BUFFER_SPLIT_SIZE / CHR_SIZE)
#define SMS_16X16_GFX_SLOT_COUNT 0x80
#define SMS_16X32_GFX_SLOT_STRIDE 2
#define SMS_32X32_GFX_SLOT_STRIDE 4
extern int TradeLeftFaceChr;
extern int TradeRightFaceChr;
// Capture hack hooks this for enemies to use portrait fid 1
void TradeMenu_InitItemDisplay(struct TradeMenuProc * proc)
{
    DrawUiFrame2(1, 8, 14, 12, 0);
    DrawUiFrame2(15, 8, 14, 12, 0);

    ResetTextFont();

    ResetIconGraphics();
    LoadIconPalettes(4); // TODO: palette id constant

    TradeMenu_InitItemText(proc);
    TradeMenu_RefreshItemText(proc);

    // TODO: face display type (arg 5) constants
    // StartFaceChibiSpr(int x, int y, int fid, int chr, int pal, s8 isFlipped, ProcPtr parent)
    StartFaceChibiSpr(56, -4, GetUnitPortraitId(proc->units[0]), TradeLeftFaceChr, 3, 0, (void *)proc);
    StartFaceChibiSpr(152, -4, GetUnitPortraitId(proc->units[1]), TradeRightFaceChr, 2, 1, (void *)proc);
    // StartFace(0, GetUnitPortraitId(proc->units[0]), 64,  -4, 3);
    // StartFace(1, GetUnitPortraitId(proc->units[1]), 176, -4, 2);

    SetFaceBlinkControlById(0, 5);
    SetFaceBlinkControlById(1, 5);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

extern u8 * const gSMSGfxBuffer1;
extern u8 * const gSMSGfxBuffer2;
extern u8 * const gSMSGfxBuffer3;

u8 * GetSMSGfxBuffer(int frame)
{
    switch (frame)
    {
        case 0:
            return gSMSGfxBuffer1;

        case 1:
            return gSMSGfxBuffer2;

        default:
            return gSMSGfxBuffer3;
    }
}

int GetSMSObjChr(int chr)
{
    if (chr >= SMS_OBJ_CHR_REMAP_THRESHOLD)
        return chr - SMS_OBJ_CHR_REMAP_THRESHOLD + SmsObjVramUpperChr - SmsObjVramLowerChr;

    return chr;
}

int GetSMSBufferChr(int chr)
{
    int upperChr = SmsObjVramUpperChr - SmsObjVramLowerChr;

    if (chr >= upperChr)
        return chr - upperChr + SMS_OBJ_CHR_REMAP_THRESHOLD;

    return chr;
}

static int GetSMSBufferChrFromObjChr(int chr)
{
    if (chr >= SmsObjVramUpperChr)
        return chr - SmsObjVramUpperChr + SMS_OBJ_CHR_REMAP_THRESHOLD;

    return chr - SmsObjVramLowerChr;
}

static u8 * GetSMSObjVramOffset(int offset)
{
    if (offset >= SMS_GFX_BUFFER_SPLIT_SIZE)
        return (void *)(OBJ_VRAM0 + (SmsObjVramUpperChr << 5)) + offset - SMS_GFX_BUFFER_SPLIT_SIZE;

    return SMS_OBJ_VRAM_LOWER + offset;
}

void CopySMSGfxBufferToObjVram(int frame)
{
    u8 * src = GetSMSGfxBuffer(frame);

    CpuFastCopy(src, SMS_OBJ_VRAM_LOWER, SMS_GFX_BUFFER_SPLIT_SIZE);
    CpuFastCopy(
        src + SMS_GFX_BUFFER_SPLIT_SIZE, (void *)(OBJ_VRAM0 + (SmsObjVramUpperChr << 5)), SMS_GFX_BUFFER_SPLIT_SIZE);
}

static void RegisterSMSGfxBufferMoveToObjVram(int frame)
{
    u8 * src = GetSMSGfxBuffer(frame);

    RegisterDataMove(src, SMS_OBJ_VRAM_LOWER, SMS_GFX_BUFFER_SPLIT_SIZE);
    RegisterDataMove(
        src + SMS_GFX_BUFFER_SPLIT_SIZE, (void *)(OBJ_VRAM0 + (SmsObjVramUpperChr << 5)), SMS_GFX_BUFFER_SPLIT_SIZE);
}

extern int EWRAM_DATA gSMS16xGfxIndexCounter;
extern int EWRAM_DATA gSMS32xGfxIndexCounter;

extern struct SMSHandle EWRAM_DATA gSMSHandleArray[100];
extern struct SMSHandle * EWRAM_DATA gSMSHandleIt;

extern int EWRAM_DATA gSMSSyncFlag;

extern int EWRAM_DATA gMapSpriteSwitchHoverTimer;

u8 * const UnitSpriteUnpackBuf2 = gGenericBuffer;

int const NewgSomeSMSLookupTable_859B66C[] = {
    0,
    8,
    4,
    16,
};

extern u16 const sSlotToChrLut2[];

u16 const gUnknown_0859B73C_2[] = {
    0x15, 0x29, 0x39, 0x2C, 0x19, 0x1D, 0x00, 0x07, 0x08, 0x09, 0x17, 0x1A, 0x31, 0x0C, 0x21, 0x1C,
    0x18, 0x2B, 0x1B, 0x13, 0x04, 0x0B, 0x35, 0x2A, 0x26, 0x36, 0x2D, 0x2F, 0x06, 0x02, 0x11, 0x30,
    0x1F, 0x3D, 0x25, 0x33, 0x0D, 0x10, 0x3A, 0x27, 0x03, 0x32, 0x23, 0x28, 0x3F, 0x37, 0x0A, 0x14,
    0x01, 0x12, 0x3E, 0x2E, 0x1E, 0x20, 0x05, 0x22, 0x34, 0x38, 0x3B, 0x0E, 0x24, 0x0F, 0x16, 0x3C,
};

u16 const sSprite_SleepIconA2[] = {
    1,
    0x0000,
    0x0000,
    0x1864,
};

u16 const sSprite_SleepIconB2[] = {
    1,
    0x00FF,
    0x0000,
    0x1864,
};

u16 const sSprite_SleepIconC2[] = {
    1,
    0x00FE,
    0x01FF,
    0x1864,
};

u16 const sSprite_SleepIconD2[] = {
    1,
    0x00FD,
    0x41FF,
    0x184A,
};

u16 const sSprite_SleepIconE2[] = {
    1,
    0x00FC,
    0x41FE,
    0x184A,
};

u16 const sSprite_SleepIconF2[] = {
    1,
    0x00FB,
    0x41FE,
    0x184A,
};

u16 const sSprite_SleepIconG2[] = {
    1,
    0x00FA,
    0x41FD,
    0x184A,
};

const u16 * const sSleepIconSprites2[] = {
    sSprite_SleepIconA2, sSprite_SleepIconB2, sSprite_SleepIconC2, sSprite_SleepIconD2,
    sSprite_SleepIconE2, sSprite_SleepIconF2, sSprite_SleepIconG2,
};

u16 const sSprite_BerserkIconA2[] = {
    1,
    0x4000,
    0x0000,
    0x1842,
};

u16 const sSprite_BerserkIconB2[] = {
    1,
    0x4001,
    0x0001,
    0x1862,
};

u16 const sSprite_BerserkIconC2[] = {
    1,
    0x4001,
    0x0000,
    0x1844,
};

u16 const sSprite_BerserkIconD2[] = {
    1,
    0x4000,
    0x0001,
    0x1842,
};

u16 const sSprite_BerserkIconE2[] = {
    1,
    0x4000,
    0x0002,
    0x1862,
};

u16 const sSprite_BerserkIconF2[] = {
    1,
    0x4001,
    0x0000,
    0x1844,
};

u16 const sSprite_BerserkIconG2[] = {
    1,
    0x4000,
    0x01FF,
    0x1842,
};

u16 const sSprite_BerserkIconH2[] = {
    1,
    0x4001,
    0x0001,
    0x1862,
};

u16 const sSprite_BerserkIconI2[] = {
    1,
    0x4001,
    0x0002,
    0x1844,
};

const u16 * const sBerserkIconSprites2[] = {
    sSprite_BerserkIconA2, sSprite_BerserkIconB2, sSprite_BerserkIconC2, sSprite_BerserkIconD2, sSprite_BerserkIconE2,
    sSprite_BerserkIconF2, sSprite_BerserkIconG2, sSprite_BerserkIconH2, sSprite_BerserkIconI2,
};

u16 const sSprite_None2[] = {
    0,
};

u16 const sSprite_SilenceIconA2[] = {
    1,
    0x4000,
    0x0000,
    0x1866,
};

u16 const sSprite_SilenceIconB2[] = {
    1,
    0x40FF,
    0x0000,
    0x1846,
};

u16 const sSprite_SilenceIconC2[] = {
    1,
    0x00FE,
    0x4000,
    0x1848,
};

const u16 * const sSilenceIconSprites2[] = {
    sSprite_SilenceIconA2, sSprite_SilenceIconB2, sSprite_SilenceIconC2, sSprite_SilenceIconC2, sSprite_SilenceIconC2,
    sSprite_SilenceIconC2, sSprite_SilenceIconC2, sSprite_SilenceIconC2, sSprite_SilenceIconC2, sSprite_SilenceIconC2,
    sSprite_SilenceIconC2, sSprite_SilenceIconB2, sSprite_SilenceIconA2, sSprite_None2,         sSprite_None2,
    sSprite_None2,         sSprite_None2,         sSprite_None2,
};

u16 const sSprite_PoisonIconA2[] = {
    2, 0x8000, 0x0002, 0x1840, 0x8003, 0x000A, 0x1841,
};

u16 const sSprite_PoisonIconB2[] = {
    2, 0x80FF, 0x1002, 0x1840, 0x8002, 0x1008, 0x1841,
};

u16 const sSprite_PoisonIconC2[] = {
    2, 0x80FE, 0x0002, 0x1840, 0x8001, 0x000A, 0x1841,
};

u16 const sSprite_PoisonIconD2[] = {
    2, 0x80FD, 0x1002, 0x1840, 0x8000, 0x1008, 0x1841,
};

u16 const sSprite_PoisonIconE2[] = {
    1,
    0x80FC,
    0x0004,
    0x1840,
};

u16 const sSprite_PoisonIconF2[] = {
    1,
    0x80FB,
    0x0004,
    0x1841,
};

u16 const sSprite_PoisonIconG2[] = {
    1,
    0x80FA,
    0x0004,
    0x1840,
};

u16 const sSprite_PoisonIconH2[] = {
    1,
    0x80F9,
    0x1004,
    0x1841,
};

const u16 * const sPoisonIconSprites2[] = {
    sSprite_PoisonIconA2, sSprite_PoisonIconB2, sSprite_PoisonIconC2, sSprite_PoisonIconD2,
    sSprite_PoisonIconE2, sSprite_PoisonIconF2, sSprite_PoisonIconG2, sSprite_PoisonIconH2,
    sSprite_PoisonIconH2, sSprite_None2,        sSprite_None2,        sSprite_None2,
};

u16 const sSprite_0859B968_2[] = {
    2, 0x4000, 0x0000, 0x1830, 0x0008, 0x0000, 0x1850,
};

u16 const sSprite_16x16_Blend2[] = {
    1,
    0x0400,
    0x4000,
    0x0000,
};

u16 const sSprite_16x32_Blend2[] = {
    1,
    0x8400,
    0x8000,
    0x0000,
};

u16 const sSprite_32x32_Blend2[] = {
    1,
    0x0400,
    0x8000,
    0x0000,
};

u16 const sSprite_16x16_Window2[] = {
    1,
    0x0800,
    0x4000,
    0x0000,
};

u16 const sSprite_16x32_Window2[] = {
    1,
    0x8800,
    0x8000,
    0x0000,
};

u16 const sSprite_32x32_Window2[] = {
    1,
    0x0800,
    0x8000,
    0x0000,
};

#define GetInfo(id) (sStandingMapSpriteTable[(id)])
// #define GetInfo(id) (unit_icon_wait_table[(id) & ((1 << 7) - 1)])

/*
// These functions are too small to be repointed automatically by lyn and should not be adjusted here
void sub_8026618(void)
{
    gSMSSyncFlag++;
}
void sub_8027A30(void)
{
    gBmSt.cursorPrevious.x = -1;
    return;
}

void ResetUnitSpriteHover(void)
{
    gMapSpriteSwitchHoverTimer = 0;
    return;
}
*/

/*
void ApplyUnitSpritePalettes(void)
{
    ApplyPalettes(gPal_MapSprite, 0x1C, 4);

    if (gBmSt.gameStateBits & BM_FLAG_LINKARENA)
        ApplyPalette(gPal_MapSpriteArena, 0x10 + OBJPAL_UNITSPRITE_PURPLE);
    else
        ApplyPalette(Pal_LightRune, 0x10 + OBJPAL_UNITSPRITE_PURPLE);
}

void sub_8026670(void)
{
    ApplyPalette(gPal_MapSpriteSepia, 0x1E);
}
*/

void ResetUnitSprites(void)
{
    int i;
    for (i = UNITSPRITE_MAX_NEW - 1; i >= 0; i--)
        sUnitSpriteSlots[i] |= 0xFF;

    gSMS32xGfxIndexCounter = 0;
    gSMS16xGfxIndexCounter = SMS_16X16_GFX_SLOT_COUNT - 1;
}

void ResetUnitSpritesB(void)
{
    int i;

    for (i = UNITSPRITE_MAX_NEW - 1; i >= 0; i--)
        sUnitSpriteSlots[i] |= 0xFF;

    gSMS32xGfxIndexCounter = 0;
    gSMS16xGfxIndexCounter = SMS_16X16_GFX_SLOT_COUNT - 1;
}
/*
// commented here
int StartUiSMS(int smsId, int frameId)
{
    int slot = NewgSomeSMSLookupTable_859B66C[frameId];
    Decompress(GetInfo(smsId).sheet, UnitSpriteUnpackBuf2);

    switch (GetInfo(smsId).size)
    {
        case UNIT_ICON_SIZE_16x16:
            sUnitSpriteSlots[frameId] = ApplyUnitSpriteUiImage16x16(slot, smsId) / 2;
            break;

        case UNIT_ICON_SIZE_16x32:
            sUnitSpriteSlots[frameId] = ApplyUnitSpriteImage16x32(slot, smsId) / 2;
            break;

        case UNIT_ICON_SIZE_32x32:
            sUnitSpriteSlots[frameId] = ApplyUnitSpriteImage32x32(slot, smsId) / 2;
            break;
    }

    return GetSMSObjChr(sUnitSpriteSlots[frameId] << 1);
}

int StartWorldMapSMS(int smsId, int frameId, int slot)
{
    Decompress(GetInfo(smsId).sheet, UnitSpriteUnpackBuf2);

    switch (GetInfo(smsId).size)
    {
        case UNIT_ICON_SIZE_16x16:
            sUnitSpriteSlots[frameId] = ApplyUnitSpriteUiImage16x16(slot, smsId) / 2;
            break;

        case UNIT_ICON_SIZE_16x32:
            sUnitSpriteSlots[frameId] = ApplyUnitSpriteImage16x32(slot, smsId) / 2;
            break;

        case UNIT_ICON_SIZE_32x32:
            sUnitSpriteSlots[frameId] = ApplyUnitSpriteImage32x32(slot, smsId) / 2;
            break;
    }

    return GetSMSObjChr(sUnitSpriteSlots[frameId] << 1);
}

static void EnsureSMS32xGfxCounterHasRoom(int slotCount)
{
    if (gSMS32xGfxIndexCounter > SMS_16X16_GFX_SLOT_COUNT - slotCount)
        gSMS32xGfxIndexCounter = 0;
}

int UseUnitSprite2(u32 id)
{
    if (sUnitSpriteSlots[id] == 0xFF)
    {
        Decompress(GetInfo(id).sheet, UnitSpriteUnpackBuf2);

        switch (GetInfo(id).size)
        {
            case UNIT_ICON_SIZE_16x16:
                sUnitSpriteSlots[id] = ApplyUnitSpriteImage16x16(gSMS16xGfxIndexCounter, id) / 2;
                gSMS16xGfxIndexCounter -= 1;
                break;

            case UNIT_ICON_SIZE_16x32:
                EnsureSMS32xGfxCounterHasRoom(SMS_16X32_GFX_SLOT_STRIDE);
                sUnitSpriteSlots[id] = ApplyUnitSpriteImage16x32(gSMS32xGfxIndexCounter, id) / 2;
                gSMS32xGfxIndexCounter += SMS_16X32_GFX_SLOT_STRIDE;
                break;

            case UNIT_ICON_SIZE_32x32:
                if ((gSMS32xGfxIndexCounter & 0x1E) == 0x1E)
                    gSMS32xGfxIndexCounter += SMS_16X32_GFX_SLOT_STRIDE;

                EnsureSMS32xGfxCounterHasRoom(SMS_32X32_GFX_SLOT_STRIDE);
                sUnitSpriteSlots[id] = ApplyUnitSpriteImage32x32(gSMS32xGfxIndexCounter, id) / 2;
                gSMS32xGfxIndexCounter += SMS_32X32_GFX_SLOT_STRIDE;
                break;
        }

        gSMSSyncFlag++;
    }
    return GetSMSObjChr(sUnitSpriteSlots[id] << 1);
}
// commented here
*/
/*
static void EnsureSMS32xGfxCounterHasRoom(int slotCount)
{
    if (gSMS32xGfxIndexCounter > SMS_16X16_GFX_SLOT_COUNT - slotCount)
        gSMS32xGfxIndexCounter = 0;
}

int UseUnitSprite(u32 id)
{
    if (sUnitSpriteSlots[id] == 0xFF)
    {
        Decompress(GetInfo(id).sheet, UnitSpriteUnpackBuf2);
        // brk;

        switch (GetInfo(id).size)
        {
            case UNIT_ICON_SIZE_16x16:
                sUnitSpriteSlots[id] = ApplyUnitSpriteImage16x16(gSMS16xGfxIndexCounter, id) / 2;
                gSMS16xGfxIndexCounter -= 1;
                break;

            case UNIT_ICON_SIZE_16x32:

                EnsureSMS32xGfxCounterHasRoom(SMS_16X32_GFX_SLOT_STRIDE);
                sUnitSpriteSlots[id] = ApplyUnitSpriteImage16x32(gSMS32xGfxIndexCounter, id) / 2;
                gSMS32xGfxIndexCounter += SMS_16X32_GFX_SLOT_STRIDE;
                break;

            case UNIT_ICON_SIZE_32x32:
                if ((gSMS32xGfxIndexCounter & 0x1E) == 0x1E)
                    gSMS32xGfxIndexCounter += SMS_16X32_GFX_SLOT_STRIDE;

                EnsureSMS32xGfxCounterHasRoom(SMS_32X32_GFX_SLOT_STRIDE);
                sUnitSpriteSlots[id] = ApplyUnitSpriteImage32x32(gSMS32xGfxIndexCounter, id) / 2;
                gSMS32xGfxIndexCounter += SMS_32X32_GFX_SLOT_STRIDE;
                break;
        }

        gSMSSyncFlag++;
    }

    return GetSMSObjChr(sUnitSpriteSlots[id] << 1);
}
*/
int ApplyUnitSpriteImage16x16(int slot, u32 id)
{
    int i;
    int bufferChr = GetSMSBufferChrFromObjChr(sSlotToChrLut2[slot]);
    int outOff = bufferChr * CHR_SIZE;
    id = ((id >> UNITSPRITE_ID_BITS) ^ 1) & 1;

    for (i = 0; i < 3; i++)
    {
        int imgOff = (i * id) * 4 * CHR_SIZE;

        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 0 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 0 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE);
        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 2 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 1 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE);
    }
    return bufferChr;
}

int ApplyUnitSpriteUiImage16x16(int slot, u32 id)
{
    int i;
    int bufferChr = GetSMSBufferChrFromObjChr(sSlotToChrLut2[slot]);
    int outOff = bufferChr * CHR_SIZE;
    id = ((id >> UNITSPRITE_ID_BITS) ^ 1) & 1;

    for (i = 0; i < 3; i++)
    {
        int imgOff = (i * id) * 4 * CHR_SIZE;

        CpuFastFill(0, GetSMSGfxBuffer(i) + 0 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);
        CpuFastFill(0, GetSMSGfxBuffer(i) + 1 * CHR_SIZE * CHR_LINE + outOff, 2 * CHR_SIZE);

        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 0 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 2 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE);
        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 2 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 3 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE);
    }
    return bufferChr;
}

int ApplyUnitSpriteImage16x32(int slot, u32 id)
{
    int i;

    int bufferChr = GetSMSBufferChrFromObjChr(sSlotToChrLut2[slot]);
    int outOff = bufferChr * CHR_SIZE;
    id = ((id >> UNITSPRITE_ID_BITS) ^ 1) & 1;

    for (i = 0; i < 3; i++)
    {
        int imgOff = (i * id) * 8 * CHR_SIZE;

        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 0 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 0 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE);
        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 2 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 1 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE);
        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 4 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 2 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE);
        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 6 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 3 * CHR_SIZE * CHR_LINE + outOff,
            2 * CHR_SIZE);
    }
    return bufferChr;
}

int ApplyUnitSpriteImage32x32(int slot, u32 id)
{
    int i;
    int bufferChr = GetSMSBufferChrFromObjChr(sSlotToChrLut2[slot]);
    int outOff = bufferChr * CHR_SIZE;

    id = ((id >> UNITSPRITE_ID_BITS) ^ 1) & 1;

    for (i = 0; i < 3; i++)
    {
        int imgOff = (i * id) * 16 * CHR_SIZE;

        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 0 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 0 * CHR_SIZE * CHR_LINE + outOff,
            4 * CHR_SIZE);
        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 4 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 1 * CHR_SIZE * CHR_LINE + outOff,
            4 * CHR_SIZE);
        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 8 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 2 * CHR_SIZE * CHR_LINE + outOff,
            4 * CHR_SIZE);
        CpuFastCopy(
            UnitSpriteUnpackBuf2 + 12 * CHR_SIZE + imgOff, GetSMSGfxBuffer(i) + 3 * CHR_SIZE * CHR_LINE + outOff,
            4 * CHR_SIZE);
    }
    return bufferChr;
}

void TornOutUnitSprite(struct Unit * unit, int timer)
{
    u8 r4;
    u16 r6;
    int r7;
    int i, j;
    int slot;

    slot = GetUnitSMSId(unit);
    r7 = GetSMSBufferChr(UseUnitSprite(slot)) * CHR_SIZE;
    r6 = gUnknown_0859B73C_2[timer];

    r4 = 0;
    i = GetGameClock() % 0x48;

    if (i >= 0x44)
        r4 = 1;
    if (i >= 0x24)
        r4 = 2;
    if (i >= 0x20)
        r4 = 1;
    if (i >= 0)
        r4 = 0;

    switch (GetInfo(slot).size)
    {
        case 0:
            for (i = 0; i < 3; i++)
            {
                for (j = 0; j < 2; j++)
                {
                    {
                        int offset = 0 * CHR_SIZE * CHR_LINE + j * CHR_SIZE;
                        GetSMSGfxBuffer(i)[r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);
                    }
                    {
                        int offset = 1 * CHR_SIZE * CHR_LINE + j * CHR_SIZE;
                        GetSMSGfxBuffer(i)[r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);
                    }
                }
            }

            CpuFastCopy(
                &GetSMSGfxBuffer(r4)[r7 + 0 * CHR_SIZE * CHR_LINE], GetSMSObjVramOffset(r7 + 0 * CHR_SIZE * CHR_LINE),
                2 * CHR_SIZE);
            CpuFastCopy(
                &GetSMSGfxBuffer(r4)[r7 + 1 * CHR_SIZE * CHR_LINE], GetSMSObjVramOffset(r7 + 1 * CHR_SIZE * CHR_LINE),
                2 * CHR_SIZE);
            break;

        case 1:
            for (i = 0; i < 3; i++)
            {
                int var = 2; // for reordering the unrolled expressions
                for (j = 0; j < 2; j++)
                {
                    {
                        int offset = 0 * CHR_SIZE * CHR_LINE + j * CHR_SIZE;
                        GetSMSGfxBuffer(i)[r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << var);
                    }
                    {
                        int offset = 1 * CHR_SIZE * CHR_LINE + j * CHR_SIZE;
                        GetSMSGfxBuffer(i)[r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);
                    }
                    {
                        int offset = 2 * CHR_SIZE * CHR_LINE + j * CHR_SIZE;
                        GetSMSGfxBuffer(i)[r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);
                    }
                    {
                        int offset = 3 * CHR_SIZE * CHR_LINE + j * CHR_SIZE;
                        GetSMSGfxBuffer(i)[r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);
                    }
                }
            }

            CpuFastCopy(
                &GetSMSGfxBuffer(r4)[r7 + 0 * CHR_SIZE * CHR_LINE], GetSMSObjVramOffset(r7 + 0 * CHR_SIZE * CHR_LINE),
                2 * CHR_SIZE);
            CpuFastCopy(
                &GetSMSGfxBuffer(r4)[r7 + 1 * CHR_SIZE * CHR_LINE], GetSMSObjVramOffset(r7 + 1 * CHR_SIZE * CHR_LINE),
                2 * CHR_SIZE);
            CpuFastCopy(
                &GetSMSGfxBuffer(r4)[r7 + 2 * CHR_SIZE * CHR_LINE], GetSMSObjVramOffset(r7 + 2 * CHR_SIZE * CHR_LINE),
                2 * CHR_SIZE);
            CpuFastCopy(
                &GetSMSGfxBuffer(r4)[r7 + 3 * CHR_SIZE * CHR_LINE], GetSMSObjVramOffset(r7 + 3 * CHR_SIZE * CHR_LINE),
                2 * CHR_SIZE);
            break;

        case 2:
            for (i = 0; i < 3; i++)
            {
                int var = 2;
                for (j = 0; j < 4; j++)
                {
                    {
                        int offset = 0 * CHR_SIZE * CHR_LINE + j * CHR_SIZE;
                        GetSMSGfxBuffer(i)[r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << var);
                    }
                    {
                        int offset = 1 * CHR_SIZE * CHR_LINE + j * CHR_SIZE;
                        GetSMSGfxBuffer(i)[r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);
                    }
                    {
                        int offset = 2 * CHR_SIZE * CHR_LINE + j * CHR_SIZE;
                        GetSMSGfxBuffer(i)[r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);
                    }
                    {
                        int offset = 3 * CHR_SIZE * CHR_LINE + j * CHR_SIZE;
                        GetSMSGfxBuffer(i)[r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);
                    }
                }
            }

            CpuFastCopy(
                &GetSMSGfxBuffer(r4)[r7 + 0 * CHR_SIZE * CHR_LINE], GetSMSObjVramOffset(r7 + 0 * CHR_SIZE * CHR_LINE),
                4 * CHR_SIZE);
            CpuFastCopy(
                &GetSMSGfxBuffer(r4)[r7 + 1 * CHR_SIZE * CHR_LINE], GetSMSObjVramOffset(r7 + 1 * CHR_SIZE * CHR_LINE),
                4 * CHR_SIZE);
            CpuFastCopy(
                &GetSMSGfxBuffer(r4)[r7 + 2 * CHR_SIZE * CHR_LINE], GetSMSObjVramOffset(r7 + 2 * CHR_SIZE * CHR_LINE),
                4 * CHR_SIZE);
            CpuFastCopy(
                &GetSMSGfxBuffer(r4)[r7 + 3 * CHR_SIZE * CHR_LINE], GetSMSObjVramOffset(r7 + 3 * CHR_SIZE * CHR_LINE),
                4 * CHR_SIZE);
            break;
    }

    if (timer == 0x3f)
        sUnitSpriteSlots[slot] |= 0xff;
}

void SyncUnitSpriteSheet(void)
{
    int frame = GetGameClock() % 72;

    if (frame == 0)
        CopySMSGfxBufferToObjVram(0);

    if (frame == 32)
        CopySMSGfxBufferToObjVram(1);

    if (frame == 36)
        CopySMSGfxBufferToObjVram(2);

    if (frame == 68)
        CopySMSGfxBufferToObjVram(1);
}

void ForceSyncUnitSpriteSheet(void)
{
    int frame;
    gSMSSyncFlag = 0;

    frame = GetGameClock() % 72;

    if (frame >= 68)
    {
        RegisterSMSGfxBufferMoveToObjVram(1);
        return;
    }

    if (frame >= 36)
    {
        RegisterSMSGfxBufferMoveToObjVram(2);
        return;
    }

    if (frame >= 32)
    {
        RegisterSMSGfxBufferMoveToObjVram(1);
        return;
    }

    if (frame >= 0)
    {
        RegisterSMSGfxBufferMoveToObjVram(0);
        return;
    }
}

//! FE8U = 0x08026FF4
void sub_8026FF4(int frameId, u8 * dst)
{
    int i;
    int off;

    int frame = GetGameClock() % 72;

    u8 * src = NULL;

    if (frame == 0)
        src = GetSMSGfxBuffer(0);

    if (frame == 32)
        src = GetSMSGfxBuffer(1);

    if (frame == 36)
        src = GetSMSGfxBuffer(2);

    if (frame == 68)
        src = GetSMSGfxBuffer(1);

    if (src == NULL)
        return;

    off = NewgSomeSMSLookupTable_859B66C[frameId] * CHR_SIZE;

    for (i = 0; i <= 3; i++)
    {
        u32 a = off + 0 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        u32 b = off + 1 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        CpuFastCopy(src + a, dst + b, 2 * CHR_SIZE);
    }
}

void SetStandingMuFacing(int frameId, u8 * dst)
{
    int i;
    int off;

    int frame = GetGameClock() % 72;

    u8 * src = NULL;

    if (frame >= 68)
        src = GetSMSGfxBuffer(1);
    else if (frame >= 36)
        src = GetSMSGfxBuffer(2);
    else if (frame >= 32)
        src = GetSMSGfxBuffer(1);
    else if (frame >= 0)
        src = GetSMSGfxBuffer(0);

    if (src == NULL)
        return;

    off = NewgSomeSMSLookupTable_859B66C[frameId] * 0x20;

    for (i = 0; i <= 3; i++)
    {
        u32 a = off + 0 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        u32 b = off + 1 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;

        RegisterDataMove(src + a, dst + b, 2 * CHR_SIZE);
    }
}

void SetStandingMuFacingWM(int frameId, u8 * dst)
{
    int a;
    int i;
    int frame = GetGameClock() % 72;
    u8 * src = NULL;

    do
    {
        if (frame >= 68)
            src = GetSMSGfxBuffer(1);
        else if (frame >= 36)
            src = GetSMSGfxBuffer(2);
        else if (frame >= 32)
            src = GetSMSGfxBuffer(1);
        else if (frame >= 0)
            src = GetSMSGfxBuffer(0);
    } while (0);

    if (src == NULL)
        return;

    for (a = frameId * CHR_SIZE, i = 0; i <= 3; a += CHR_SIZE * CHR_LINE, i++)
    {
        RegisterDataMove(src + (a), dst + (a), 4 * CHR_SIZE);
    }
}

/*
int GetUnitDisplayedSpritePalette(const struct Unit * unit)
{
    if (unit->state & US_BIT27)
        return 0xB;

    if (unit->state & US_UNSELECTABLE)
        return 0xF;

    return GetUnitSpritePalette(unit);
}

int GetUnitSpritePalette(const struct Unit * unit)
{
    switch (UNIT_FACTION(unit))
    {
        case FACTION_BLUE:
            return 0xC;

        case FACTION_RED:
            return 0xD;

        case FACTION_GREEN:
            return 0xE;

        case FACTION_PURPLE:
            return 0xB;
    }
    return 0xC;
}

void RefreshUnitSprites(void)
{
    struct SMSHandle * smsHandle;

    struct Trap * trap;
    int i;
    u16 oam2 = 0;
    struct SMSHandle * nullHandle = NULL;

    gSMSHandleIt = &gSMSHandleArray[0];

    gSMSHandleIt->pNext = nullHandle;
    gSMSHandleIt->yDisplay = 0x400;

    gSMSHandleIt = &gSMSHandleArray[1];

    for (i = 1; i < FACTION_PURPLE + 6; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        unit->pMapSpriteHandle = NULL;

        if (unit->state & (US_HIDDEN | US_BIT9))
            continue;

        if (gBmMapUnit[unit->yPos][unit->xPos] == 0)
            continue;

        if (unit->statusIndex == UNIT_STATUS_PETRIFY || unit->statusIndex == UNIT_STATUS_13)
            unit->state |= US_UNSELECTABLE;

        smsHandle = AddUnitSprite(unit->yPos * 16);

        smsHandle->yDisplay = unit->yPos * 16;
        smsHandle->xDisplay = unit->xPos * 16;

        smsHandle->oam2Base =
            UseUnitSprite(GetUnitSMSId(unit)) + 0x80 + (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000;

        smsHandle->config = GetInfo(GetUnitSMSId(unit)).size;

        if (unit->state & 0x100)
        {
            smsHandle->config += 3;
        }

        if (unit->state & 0x1000000)
        {
            smsHandle->config += 0x40;
        }

        unit->pMapSpriteHandle = smsHandle;
    }

    for (trap = GetTrap(0); trap->type != 0; trap++)
    {
        if (trap->type == 1 && trap->data[1] == 0)
        {
            switch (trap->extra)
            {
                case 0x35:
                    oam2 = UseUnitSprite(0x5b) - 0x4000 + 0x80;
                    break;

                case 0x36:
                    oam2 = UseUnitSprite(0x5c) - 0x4000 + 0x80;
                    break;

                case 0x37:
                    oam2 = UseUnitSprite(0x5d) - 0x4000 + 0x80;
                    break;
            }

            smsHandle = AddUnitSprite(trap->yPos * 16);

            smsHandle->yDisplay = trap->yPos * 16;
            smsHandle->xDisplay = trap->xPos * 16;

            smsHandle->oam2Base = oam2;

            smsHandle->config = GetInfo(0x5b).size;
        }

        if (trap->type == 0xd)
        {
            smsHandle = AddUnitSprite(trap->yPos * 16);
            smsHandle->yDisplay = trap->yPos * 16;
            smsHandle->xDisplay = trap->xPos * 16;

            smsHandle->oam2Base = UseUnitSprite(0x66) - 0x5000 + 0x80;

            smsHandle->config = GetInfo(0x66).size;
        }
    }

    if (gSMSSyncFlag != 0)
        ForceSyncUnitSpriteSheet();
}

struct SMSHandle * AddUnitSprite(int y)
{
    struct SMSHandle * it = gSMSHandleArray;

    while (1)
    {
        if (it->pNext == NULL || it->pNext->yDisplay < y)
        {
            gSMSHandleIt->pNext = it->pNext;
            gSMSHandleIt = (it->pNext = gSMSHandleIt) + 1;

            return it->pNext;
        }

        it = it->pNext;
    }
}

void PutUnitSpritesOam(void)
{
    struct SMSHandle * it = gSMSHandleArray->pNext;

    PutUnitSpriteIconsOam();

    if (it == NULL)
        return;

    for (; it != NULL; it = it->pNext)
    {
        int r3 = 0;

        int x = it->xDisplay - gBmSt.camera.x;
        int y = it->yDisplay - gBmSt.camera.y;

        if (x < -16 || x > DISPLAY_WIDTH)
            continue;

        if (y < -32 || y > DISPLAY_HEIGHT)
            continue;

        if (it->config & 0x80)
            continue;

        if (it->config & 0x40)
            r3 = GetGameClock() & 2;

        switch ((it->config & 0xf))
        {
            case 0:
                CallARM_PushToSecondaryOAM(
                    OAM1_X(x + r3 + 0x200), OAM0_Y(0x100 + y), gObject_16x16, it->oam2Base + OAM2_LAYER(2));
                break;

            case 1:
                CallARM_PushToSecondaryOAM(
                    OAM1_X(x + r3 + 0x200), OAM0_Y(0x100 + y - 16), gObject_16x32, it->oam2Base + OAM2_LAYER(2));
                break;

            case 2:
                CallARM_PushToSecondaryOAM(
                    OAM1_X((x - 8) + r3 + 0x200), OAM0_Y(0x100 + y - 16), gObject_32x32, it->oam2Base + OAM2_LAYER(2));
                break;

            case 3:
                CallARM_PushToSecondaryOAM(
                    OAM1_X(x + r3 + 0x200), OAM0_Y(0x100 + y), gObject_16x16, it->oam2Base + OAM2_LAYER(3));
                ;
                break;

            case 4:
                CallARM_PushToSecondaryOAM(
                    OAM1_X(x + r3 + 0x200), OAM0_Y(0x100 + y - 16), gObject_16x32, it->oam2Base + OAM2_LAYER(3));
                break;

            case 5:
                CallARM_PushToSecondaryOAM(
                    OAM1_X((x - 8) + r3 + 0x200), OAM0_Y(0x100 + y - 16), gObject_32x32, it->oam2Base + OAM2_LAYER(3));
                break;
        }
    }
}

void PutChapterMarkedTileIconOam(void)
{
    int x;
    int y;
    int xTile;
    int yTile;
    int shouldDisplay;

    xTile = GetROMChapterStruct(gPlaySt.chapterIndex)->destPosX;
    yTile = GetROMChapterStruct(gPlaySt.chapterIndex)->destPosY;

    shouldDisplay = (GetGameClock() & 0x1f) < 0x14 ? 1 : 0;

    if (xTile == 0xFF)
        return;

    if (shouldDisplay == 0)
        return;

    if (gBmMapFog[yTile][xTile] == 0)
        return;

    if (gBmMapTerrain[yTile][xTile] == TERRAIN_ROOF)
        return;

    x = xTile * 16 - gBmSt.camera.x;
    y = yTile * 16 - gBmSt.camera.y;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -16 || y > DISPLAY_HEIGHT)
        return;

    CallARM_PushToSecondaryOAM(OAM1_X(0x200 + x + 4), OAM0_Y(0x100 + y + 7), gObject_8x8, 0xC51);
}
void PutUnitSpriteIconsOam(void)
{
    u8 protectCharacterId;
    int i;
    int x;
    int y;
    s8 displayRescueIcon;

    int poisonIconFrame;
    int sleepIconFrame;
    int berserkIconFrame;
    int silenceIconFrame;

    u16 rescuePalLut[] = {
        0xC,
        0xE,
        0xD,
    };

    if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
    {
        protectCharacterId = GetROMChapterStruct(gPlaySt.chapterIndex)->protectCharacterIndex;
    }
    else
    {
        protectCharacterId = 0;
    }

    displayRescueIcon = (GetGameClock() % 32) < 20 ? 1 : 0;

    poisonIconFrame = GetGameClock() / 8 % ARRAY_COUNT(sPoisonIconSprites2);
    sleepIconFrame = GetGameClock() / 16 % ARRAY_COUNT(sSleepIconSprites2);
    berserkIconFrame = GetGameClock() / 8 % ARRAY_COUNT(sBerserkIconSprites2);
    silenceIconFrame = GetGameClock() / 4 % ARRAY_COUNT(sSilenceIconSprites2);

    if (CheckFlag(EVFLAG_HIDE_BLINKING_ICON) != 0)
        return;

    PutChapterMarkedTileIconOam();

    for (i = 1; i < 0xc0; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_HIDDEN)
            continue;

        if (GetUnitSpriteHideFlag(unit) != 0)
            continue;

        switch (unit->statusIndex)
        {
            case UNIT_STATUS_POISON:
                x = unit->xPos * 16 - gBmSt.camera.x;
                y = unit->yPos * 16 - gBmSt.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH)
                    break;

                if (y < -16 || y > DISPLAY_HEIGHT)
                    break;

                CallARM_PushToSecondaryOAM(
                    OAM1_X(0x200 + x - 2), OAM0_Y(0x100 + y - 4), sPoisonIconSprites2[poisonIconFrame], 0);
                break;

            case UNIT_STATUS_SILENCED:
                x = unit->xPos * 16 - gBmSt.camera.x;
                y = unit->yPos * 16 - gBmSt.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH)
                    break;

                if (y < -16 || y > DISPLAY_HEIGHT)
                    break;

                CallARM_PushToSecondaryOAM(
                    OAM1_X(0x200 + x - 2), OAM0_Y(0x100 + y - 4), sSilenceIconSprites2[silenceIconFrame], 0);
                break;

            case UNIT_STATUS_SLEEP:
                x = unit->xPos * 16 - gBmSt.camera.x;
                y = unit->yPos * 16 - gBmSt.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH)
                    break;

                if (y < -16 || y > DISPLAY_HEIGHT)
                    break;

                CallARM_PushToSecondaryOAM(
                    OAM1_X(0x200 + x + 2), OAM0_Y(0x100 + y), sSleepIconSprites2[sleepIconFrame], 0);
                break;

            case UNIT_STATUS_BERSERK:
                x = unit->xPos * 16 - gBmSt.camera.x;
                y = unit->yPos * 16 - gBmSt.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH)
                    break;

                if (y < -16 || y > DISPLAY_HEIGHT)
                    break;

                CallARM_PushToSecondaryOAM(
                    OAM1_X(0x200 + x + 1), OAM0_Y(0x100 + y - 5), sBerserkIconSprites2[berserkIconFrame], 0);
                break;

            case UNIT_STATUS_ATTACK:
            case UNIT_STATUS_DEFENSE:
            case UNIT_STATUS_CRIT:
            case UNIT_STATUS_AVOID:
                if (!displayRescueIcon)
                    continue;

                x = unit->xPos * 16 - gBmSt.camera.x;
                y = unit->yPos * 16 - gBmSt.camera.y;

                if (x < -16 || x > DISPLAY_WIDTH)
                    break;

                if (y < -16 || y > DISPLAY_HEIGHT)
                    break;

                CallARM_PushToSecondaryOAM(OAM1_X(0x200 + x - 1), OAM0_Y(0x100 + y - 5), sSprite_0859B968_2, 0);
                break;

            case UNIT_STATUS_SICK:
            case UNIT_STATUS_RECOVER:
                break;
        }

        if (!displayRescueIcon)
            continue;

        if (unit->state & US_RESCUING)
        {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                continue;

            if (y < -16 || y > DISPLAY_HEIGHT)
                continue;

            CallARM_PushToSecondaryOAM(
                OAM1_X(0x200 + x + 9), OAM0_Y(0x100 + y + 7), gObject_8x8,
                (rescuePalLut[unit->rescue >> 6] & 0xf) * 0x1000 + 0x803);
        }
        else if ((UNIT_FACTION(unit) != FACTION_BLUE) && (UNIT_CATTRIBUTES(unit) & CA_BOSS))
        {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                continue;

            if (y < -16 || y > DISPLAY_HEIGHT)
                continue;

            CallARM_PushToSecondaryOAM(OAM1_X(0x200 + x + 9), OAM0_Y(0x100 + y + 7), gObject_8x8, 0x810);
        }
        else if (protectCharacterId == unit->pCharacterData->number)
        {
            x = unit->xPos * 16 - gBmSt.camera.x;
            y = unit->yPos * 16 - gBmSt.camera.y;

            if (x < -16 || x > DISPLAY_WIDTH)
                continue;

            if (y < -16 || y > DISPLAY_HEIGHT)
                continue;

            CallARM_PushToSecondaryOAM(OAM1_X(0x200 + x + 9), OAM0_Y(0x100 + y + 7), gObject_8x8, 0x811);
        }
    }
}

void UnitSpriteHoverUpdate(void)
{
    struct Unit * unit;

    unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);
    if (unit)
    {
        if (!(unit->state & US_UNSELECTABLE) && (UNIT_FACTION(unit) == FACTION_BLUE) &&
            unit->statusIndex != UNIT_STATUS_BERSERK && unit->statusIndex != UNIT_STATUS_SLEEP)
        {
            gMapSpriteSwitchHoverTimer++;

            if (gMapSpriteSwitchHoverTimer == 5)
            {
                StartMu(unit);
                HideUnitSprite(unit);
                return;
            }
        }
    }

    if (gBmSt.cursorPrevious.x != gBmSt.playerCursor.x || gBmSt.cursorPrevious.y != gBmSt.playerCursor.y)
    {
        gMapSpriteSwitchHoverTimer = 0;
        unit = GetUnit(gBmMapUnit[gBmSt.cursorPrevious.y][gBmSt.cursorPrevious.x]);
        if (unit)
        {
            EndAllMus();
            ShowUnitSprite(unit);
        }
    }
}

s8 IsUnitSpriteHoverEnabledAt(int x, int y)
{
    struct Unit * unit = GetUnit(gBmMapUnit[y][x]);

    if (!unit)
        return false;

    if (unit->state & US_UNSELECTABLE)
        return false;

    if (UNIT_FACTION(unit) != FACTION_BLUE)
        return false;

    if (unit->statusIndex != UNIT_STATUS_BERSERK && unit->statusIndex != UNIT_STATUS_SLEEP)
        return true;

    return false;
}

void PutUnitSprite(int layer, int x, int y, struct Unit * unit)
{
    u32 id = GetUnitSMSId(unit);
    int chr = UseUnitSprite(id);

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, gObject_16x16, (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000 + 0x880 + chr);
            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(
                layer, x, y - 16, gObject_16x32, (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000 + 0x880 + chr);
            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(
                layer, x - 8, y - 16, gObject_32x32,
                (GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000 + 0x880 + chr);
            break;
    }
}

void PutUnitSpriteForClassId(int layer, int x, int y, u16 oam2, int class)
{
    u32 id = GetClassSMSId(class);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, gObject_16x16, oam2 + chr);
            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 16, gObject_16x32, oam2 + chr);
            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 16, gObject_32x32, oam2 + chr);
            break;
    }
}

void sub_8027CFC(int layer, int x, int y, int class)
{
    u32 id = GetClassSMSId(class);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
        case UNIT_ICON_SIZE_16x16:
            PutSpriteExt(layer, x, y + OAM0_WINDOW, gObject_16x16, chr);
            break;

        case UNIT_ICON_SIZE_16x32:
            PutSpriteExt(layer, x, OAM0_Y(y - 16) + OAM0_WINDOW, gObject_16x32, chr);
            break;

        case UNIT_ICON_SIZE_32x32:
            PutSpriteExt(layer, OAM1_X(x - 8), OAM0_Y(y - 16) + OAM0_WINDOW, gObject_32x32, chr);
            break;
    }
}

void sub_8027DB4(int layer, int x, int y, u16 oam2, int class, int idx)
{
    u32 id = GetClassSMSId(class);
    int chr = NewgSomeSMSLookupTable_859B66C[idx] + 1;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
        case UNIT_ICON_SIZE_16x16:
        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 16, gObject_16x32, (oam2) + chr);
            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 16, gObject_32x32, (oam2) + chr);
            break;
    }
}

void sub_8027E4C(int layer, int x, int y, int oam2, struct Unit * unit)
{
    u32 id = GetUnitSMSId(unit);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, gObject_16x16, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);
            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 16, gObject_16x32, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);
            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 16, gObject_32x32, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);
            break;
    }
}

void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, s8 isBlend)
{
    if (x < -16 || x > DISPLAY_WIDTH + 16)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT + 32)
        return;

    switch (GetInfo(GetClassSMSId(class)).size)
    {
        case UNIT_ICON_SIZE_16x16:
            PutSpriteExt(
                layer, OAM1_X(x - 8), isBlend ? OAM0_Y(y - 16) | OAM0_BLEND : OAM0_Y(y - 16), gObject_16x16,
                oam2 + 0x40);
            break;

        case UNIT_ICON_SIZE_16x32:
            PutSpriteExt(
                layer, OAM1_X(x - 8), isBlend ? OAM0_Y(y - 32) | OAM0_BLEND : OAM0_Y(y - 32), gObject_16x32, oam2);
            break;

        case UNIT_ICON_SIZE_32x32:
            PutSpriteExt(
                layer, OAM1_X(x - 16), isBlend ? OAM0_Y(y - 32) | OAM0_BLEND : OAM0_Y(y - 32), gObject_32x32, oam2);
            break;
    }
}

void PutBlendWindowUnitSprite(int layer, int x, int y, int oam2, struct Unit * unit)
{
    u32 id = GetUnitSMSId(unit);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size)
    {
        case UNIT_ICON_SIZE_16x16:
            PutSprite(layer, x, y, sSprite_16x16_Blend2, oam2 + chr);
            PutSprite(layer, x, y, sSprite_16x16_Window2, oam2 + chr);
            break;

        case UNIT_ICON_SIZE_16x32:
            PutSprite(layer, x, y - 16, sSprite_16x32_Blend2, oam2 + chr);
            PutSprite(layer, x, y - 16, sSprite_16x32_Window2, oam2 + chr);
            break;

        case UNIT_ICON_SIZE_32x32:
            PutSprite(layer, x - 8, y - 16, sSprite_32x32_Blend2, oam2 + chr);
            PutSprite(layer, x - 8, y - 16, sSprite_32x32_Window2, oam2 + chr);
            break;
    }
}

void sub_8028100(void)
{
    gSMSHandleArray[0].pNext = NULL;
}

void HideUnitSprite(struct Unit * unit)
{
    if (!unit)
        RefreshUnitSprites();

    if (!unit->pMapSpriteHandle)
        return;

    unit->pMapSpriteHandle->config |= 0x80;
}

//! FE8U = 0x08028130
void ShowUnitSprite(struct Unit * unit)
{
    if (!unit->pMapSpriteHandle)
        return;

    unit->pMapSpriteHandle->config &= ~(0x80);
}

u8 GetUnitSpriteHideFlag(struct Unit * unit)
{
    if (!unit->pMapSpriteHandle)
        return 0x80;

    return unit->pMapSpriteHandle->config & 0x80;
}

//! FE8U = 0x08028160
// attempt with 1D array gets very close
// https://decomp.me/scratch/wkkkM
void sub_8028160(u32 (*r8)[1][1], int r5, int r9, int d)
{
    int i, j;
    int r6 = gUnknown_0859B73C_2[d];

    for (i = 0; i < r9; i++)
    {
        for (j = 0; j < r5; j++)
        {
            u32 ip = ~(0xf << ((r6 & 7) << 2));
            r8[8 * j][0x100 * i][r6 >> 3] &= ip;
        }
    }

    return;
}
*/
