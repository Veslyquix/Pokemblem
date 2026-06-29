#include "gbafe.h"
//! This file uses decomp-based headers
// https://github.com/MokhaLeee/FE-CLib-Mokha
#define brk asm("mov r11, r11");
#define CHR_LINE 0x20
extern int gSMSSyncFlag;
extern UnitIconWait unit_icon_wait_table[];
extern struct SMSHandle gSMSHandleArray[100];
extern struct SMSHandle * gSMSHandleIt;
extern int GetUnitDisplayedSpritePalette(const struct Unit * unit);
extern u32 gMirrorSpriteOptions;

enum
{
    FLIP_PLAYER = 0x1,
    FLIP_ENEMY = 0x2,
    FLIP_NPC = 0x4,
    FLIP_FOURTH = 0x8,
};

#define GetInfo(id) (unit_icon_wait_table[(id) & ((1 << 7) - 1)])

const u16 gObject_16x16_HFlipped[] = {
    1,
    OAM0_SHAPE_16x16,
    OAM1_SIZE_16x16 + OAM1_HFLIP,
    0,
};

const u16 gObject_16x32_HFlipped[] = {
    1,
    OAM0_SHAPE_16x32,
    OAM1_SIZE_16x32 + OAM1_HFLIP,
    0,
};

const u16 gObject_32x32_HFlipped[] = {
    1,
    OAM0_SHAPE_32x32,
    OAM1_SIZE_32x32 + OAM1_HFLIP,
    0,
};

/*
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

        if (unit->statusIndex == UNIT_STATUS_PETRIFY || unit->statusIndex ==
UNIT_STATUS_13) unit->state |= US_UNSELECTABLE;

        smsHandle = AddUnitSprite(unit->yPos * 16);

        smsHandle->yDisplay = unit->yPos * 16;
        smsHandle->xDisplay = unit->xPos * 16;

        smsHandle->oam2Base = UseUnitSprite(FMU_GetUnitSMSId(unit)) + 0x80 +
(GetUnitDisplayedSpritePalette(unit) & 0xf) * 0x1000;
*/

void SetMirrorSpriteInSmsHandle(struct Unit * unit, struct SMSHandle * smsHandle)
{
    // SMSHandle._u0A appears to be unused, so I'll use it to track who should be
    // flipped
    smsHandle->_u0A = 0;
    int unitID = unit->pCharacterData->number;
    if ((unitID >= 0xE0))
    {
        return;
    }
    switch (UNIT_FACTION(unit))
    {
        case FACTION_BLUE:
            if (gMirrorSpriteOptions & FLIP_PLAYER)
            {
                smsHandle->_u0A = 1;
            }
            break;
        case FACTION_RED:
            if (gMirrorSpriteOptions & FLIP_ENEMY)
            {
                smsHandle->_u0A = 1;
            }
            break;
        case FACTION_GREEN:
            if (gMirrorSpriteOptions & FLIP_NPC)
            {
                smsHandle->_u0A = 1;
            }
            break;
        case FACTION_PURPLE:
            if (gMirrorSpriteOptions & FLIP_FOURTH)
            {
                smsHandle->_u0A = 1;
            }
            break;
    }
}

// 0x2033F40 sUnitSpriteSlots changed to 0x201F148 gUnk_SoundRoom_0201F148
// // Make SMS_RegisterUsage return SMS ram+index in r2
// needs new SMS table
// size changed to 0xFF
extern const UnitIconWait NewStandingMapSpriteTable[];
extern void * FMU_idleSMSGfxTable_left[0xFF];
extern void * FMU_idleSMSGfxTable_right[0xFF];
extern void * FMU_idleSMSGfxTable_up[0xFF];
extern UnitIconWait unit_icon_wait_table[];
#define GetInfo(id) (unit_icon_wait_table[(id) & ((1 << 7) - 1)])

#define LVFACEDOWN 0 // became 2 in HookUnitLoadForDirection previously
#define LVFACERIGHT 1
#define LVFACELEFT 2 // -> became 0 when calling HookUnitLoadForDirection
#define LVFACEUP 3

// first turn / after resume on first turn, all sprites face down fsr
// up works
// left in level makes down
//

extern int FMU_GetUnitSMSId(struct Unit * unit);
extern int GetUnitFacing(struct Unit * unit);
int GetUnitSMSAndDir(struct Unit * unit)
{
    int dir = GetUnitFacing(unit);

    return FMU_GetUnitSMSId(unit) | (dir << 8);
};
extern u8 * const sUnitSpriteSlots;
extern u8 NewgSMSGfxIndexLookup[0xFF];
extern int gSMS16xGfxIndexCounter;
extern int gSMS32xGfxIndexCounter;
extern int GetSMSObjChr(int chr);
extern int GetSMSBufferChr(int chr);
extern u8 * GetSMSGfxBuffer(int frame);
#define SMS_16X32_GFX_SLOT_STRIDE 2
#define SMS_32X32_GFX_SLOT_STRIDE 4
extern u8 NewgSMSGfxIndexLookup[0xFF];
extern int gSMS16xGfxIndexCounter;
extern int gSMS32xGfxIndexCounter;
extern int GetSMSObjChr(int chr);
extern int GetSMSBufferChr(int chr);
extern void SMSCopySheetToBuffers(void * data, int dstChr, u16 size, u32 id);
extern void EnsureSMS32xGfxCounterHasRoom(int slotCount);
int UseUnitSprite(u32 id)
{
    int dir = (id & 0xFF00) >> 8;
    id &= 0xFF;
    u16 size = NewStandingMapSpriteTable[id].size;
    void * data = NewStandingMapSpriteTable[id].sheet;

    switch (dir)
    {
        case LVFACELEFT: //
        {
            data = FMU_idleSMSGfxTable_left[id];
            break;
        } // down
        case LVFACERIGHT:
        {
            data = FMU_idleSMSGfxTable_right[id];
            break;
        }
        case LVFACEDOWN:
        {
            data = NewStandingMapSpriteTable[id].sheet;
            break;
        }
        case LVFACEUP:
        {
            data = FMU_idleSMSGfxTable_up[id];
            break;
        }
        default:
    }
    if (!data)
    {
        data = NewStandingMapSpriteTable[id].sheet;
    }

    if (sUnitSpriteSlots[id] == 0xFF)
    {
        Decompress(data, gGenericBuffer);

        switch (size)
        {
            case UNIT_ICON_SIZE_16x16:
                sUnitSpriteSlots[id] = ApplyUnitSpriteImage16x16(gSMS16xGfxIndexCounter, id) / 2;
                gSMS16xGfxIndexCounter -= 1;
                break;

            case UNIT_ICON_SIZE_16x32:
                EnsureSMS32xGfxCounterHasRoom(SMS_16X32_GFX_SLOT_STRIDE);
                sUnitSpriteSlots[id] = ApplyUnitSpriteImage16x32(gSMS32xGfxIndexCounter, id) / 2;
                gSMS32xGfxIndexCounter += 2;
                break;

            case UNIT_ICON_SIZE_32x32:
                if ((gSMS32xGfxIndexCounter & 0x1E) == 0x1E)
                    gSMS32xGfxIndexCounter += 2;

                EnsureSMS32xGfxCounterHasRoom(SMS_32X32_GFX_SLOT_STRIDE);
                sUnitSpriteSlots[id] = ApplyUnitSpriteImage32x32(gSMS32xGfxIndexCounter, id) / 2;
                gSMS32xGfxIndexCounter += 4;
                break;
        }
        int val = GetSMSBufferChr(GetSMSObjChr(sUnitSpriteSlots[id] << 1));
        SMSCopySheetToBuffers(data, val, size, id);
        gSMSSyncFlag++;
    }

    int result = GetSMSObjChr(sUnitSpriteSlots[id] << 1);
    __asm__("mov r2, %[val]\n" : : [val] "r"(id) : "r2");
    return result;
    // return sUnitSpriteSlots[id] << 1;
}

/*
        smsHandle->config = GetInfo(FMU_GetUnitSMSId(unit)).size;

        if (unit->state & 0x100) {
            smsHandle->config += 3;
        }

        if (unit->state & 0x1000000) {
            smsHandle->config += 0x40;
        }

        unit->pMapSpriteHandle = smsHandle;
    }

    for (trap = GetTrap(0); trap->type != 0; trap++)
    {
        if (trap->type == 1 && trap->data[1] == 0)
        {
            switch (trap->extra) {
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
*/

void PutUnitSpritesOam(void)
{
    struct SMSHandle * it = gSMSHandleArray->pNext;

    PutUnitSpriteIconsOam();

    if (it == NULL)
        return;

    for (; it != NULL; it = it->pNext)
    {
        int horizontalShake = 0;
        int verticalShake = 0;

        int x = it->xDisplay - gBmSt.camera.x;
        int y = it->yDisplay - gBmSt.camera.y;

        if (x < -16 || x > DISPLAY_WIDTH)
            continue;

        if (y < -32 || y > DISPLAY_HEIGHT)
            continue;

        if (it->config & 0x80)
            continue;

        if (it->config & 0x40)
        {
            horizontalShake = (GetGameClock() >> 0) & 1;
            verticalShake = ((GetGameClock() >> 1) & 1) + 2;
        }

        if (it->_u0A == 1)
        {
            switch ((it->config & 0xf))
            {
                case 0:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X(x + horizontalShake + 0x200), OAM0_Y(0x100 + y + verticalShake), gObject_16x16_HFlipped,
                        it->oam2Base + OAM2_LAYER(2));
                    break;

                case 1:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X(x + horizontalShake + 0x200), OAM0_Y(0x100 + y - 16 + verticalShake),
                        gObject_16x32_HFlipped, it->oam2Base + OAM2_LAYER(2));
                    break;

                case 2:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X((x - 8) + horizontalShake + 0x200), OAM0_Y(0x100 + y - 16 + verticalShake),
                        gObject_32x32_HFlipped, it->oam2Base + OAM2_LAYER(2));
                    break;

                case 3:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X(x + horizontalShake + 0x200), OAM0_Y(0x100 + y + verticalShake), gObject_16x16_HFlipped,
                        it->oam2Base + OAM2_LAYER(3));
                    ;
                    break;

                case 4:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X(x + horizontalShake + 0x200), OAM0_Y(0x100 + y - 16 + verticalShake),
                        gObject_16x32_HFlipped, it->oam2Base + OAM2_LAYER(3));
                    break;

                case 5:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X((x - 8) + horizontalShake + 0x200), OAM0_Y(0x100 + y - 16 + verticalShake),
                        gObject_32x32_HFlipped, it->oam2Base + OAM2_LAYER(3));
                    break;
            }
        }

        else
        {
            switch ((it->config & 0xf))
            {
                case 0:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X(x + horizontalShake + 0x200), OAM0_Y(0x100 + y + verticalShake), gObject_16x16,
                        it->oam2Base + OAM2_LAYER(2));
                    break;

                case 1:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X(x + horizontalShake + 0x200), OAM0_Y(0x100 + y - 16 + verticalShake), gObject_16x32,
                        it->oam2Base + OAM2_LAYER(2));
                    break;

                case 2:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X((x - 8) + horizontalShake + 0x200), OAM0_Y(0x100 + y - 16 + verticalShake),
                        gObject_32x32, it->oam2Base + OAM2_LAYER(2));
                    break;

                case 3:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X(x + horizontalShake + 0x200), OAM0_Y(0x100 + y + verticalShake), gObject_16x16,
                        it->oam2Base + OAM2_LAYER(3));
                    ;
                    break;

                case 4:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X(x + horizontalShake + 0x200), OAM0_Y(0x100 + y - 16 + verticalShake), gObject_16x32,
                        it->oam2Base + OAM2_LAYER(3));
                    break;

                case 5:
                    CallARM_PushToSecondaryOAM(
                        OAM1_X((x - 8) + horizontalShake + 0x200), OAM0_Y(0x100 + y - 16 + verticalShake),
                        gObject_32x32, it->oam2Base + OAM2_LAYER(3));
                    break;
            }
        }
    }
}
