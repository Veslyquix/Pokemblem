.include "fe8.s" 

.macro SET_FUNC name, value
	.global \name
	.type   \name, function
	.set    \name, \value
.endm

.macro SET_DATA name, value
	.global \name
	.type   \name, object
	.set    \name, \value
.endm

@ division & other libgcc functions
SET_FUNC Div, __aeabi_idiv
SET_FUNC Div, __aeabi_idivmod
SET_FUNC Div, __aeabi_uidiv
SET_FUNC Div, __aeabi_uidivmod

SET_DATA sGfx_MiscUiGraphics, 0x80156ac
SET_DATA sImg_DifficultyMenuObjs, 0x80ac188
SET_DATA sImg_SaveScreenSprits, 0x80a8edc
SET_DATA sPal_MiscUiGraphics, 0x80156b8
SET_DATA sPal_08A295B4, 0x80a8ee8
SET_DATA sChapterDataTable, 0x803462C
SET_DATA sPortrait_data, 0x8005524
SET_DATA sUnit_icon_wait_table, 0x8027bb0
SET_DATA sUnit_icon_move_table, 0x8079584
SET_DATA sConvoBackgroundData, 0x800e894
SET_DATA sCGDataTable, 0x80b65F0 
SET_FUNC IsCoordHiddenByMinimug, 0x809a21d
SET_FUNC PutClassSpriteForSecretShop, 0x809a231
SET_DATA gSMSGfxBuffer1, 0x8026958
SET_DATA gSMSGfxBuffer2, 0x8026F8C
SET_DATA gSMSGfxBuffer3, 0x8026F90
SET_DATA sUnitSpriteSlots, 0x80266B8
SET_DATA sStandingMapSpriteTable, 0x8027BB0
SET_DATA classTablePoin, 0x8017AB8 
SET_DATA NewgSMSGfxIndexLookup, 0x201F148 // sound room buffer 
