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

SET_DATA gSMSGfxBuffer1, 0x8026958
SET_DATA gSMSGfxBuffer2, 0x8026F8C
SET_DATA gSMSGfxBuffer3, 0x8026F90
SET_DATA sUnitSpriteSlots, 0x80266B8
SET_DATA sStandingMapSpriteTable, 0x8027BB0
SET_DATA classTablePoin, 0x8017AB8 
SET_DATA NewgSMSGfxIndexLookup, 0x201F148 // sound room buffer 
