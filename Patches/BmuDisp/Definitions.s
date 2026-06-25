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

SET_DATA gSMSGfxBuffer1, 0x2008000
SET_DATA gSMSGfxBuffer2, 0x200C000
SET_DATA gSMSGfxBuffer3, 0x2034010
SET_DATA classTablePoin, 0x8017AB8 
SET_DATA NewgSMSGfxIndexLookup, 0x201F148 // sound room buffer 
