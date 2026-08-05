.align 4
.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm
.thumb

	.equ CheckEventId,0x8083da8
	.equ SetEventId, 0x8083d80 
	.equ UnsetEventId, 0x8083d94
	.equ GameOptionHandler, 0x80B1D14
	.equ gConfigUiState, 0x8A2E974
	.equ DrawGameOptionIcon, 0x80B1700
	.equ DrawGameOptionText, 0x80B17E4
	.equ DrawOptionValueTexts, 0x80B1850
	.equ GetConfigTextSlot, 0x80D1994
	.equ GameOptionsOrderListPointer, 0x80B16F8
	.global LanguageCurrentLanguageLink
	


	
.type GenericToggleFunc, %function
.global GenericToggleFunc

GenericToggleFunc:
push {r4, lr}
mov r4, r0 @ ID 
@ vanilla just pushed lr 
mov r0, r4 
blh CheckEventId
cmp r0, #0 
beq SetFlagOn
mov r0, r4
blh UnsetEventId
b End 
SetFlagOn:
mov r0, r4
blh SetEventId 
End:
pop {r4}
pop {r1}
pop {r1}
bx r1 

.ltorg 
.align 

.type LanguageCheckCurrentOption, %function
.global LanguageCheckCurrentOption
LanguageCheckCurrentOption:
ldr r0, =LanguageCurrentLanguageLink
ldr r0, [r0]
ldrb r0, [r0]
cmp r0, #2
bls LanguageCheckEnd
mov r0, #0
LanguageCheckEnd:
pop {r1}
bx r1

.ltorg
.align

.type LanguageSetOption, %function
.global LanguageSetOption
LanguageSetOption:
ldr r0, =LanguageCurrentLanguageLink
ldr r0, [r0]
cmp r3, #2
bls LanguageSetStore
mov r3, #0
LanguageSetStore:
strb r3, [r0]
bl RedrawVisibleConfigOptions
pop {r0}
bx r0

.ltorg
.align

.type RedrawVisibleConfigOptions, %function
RedrawVisibleConfigOptions:
push {r4-r7, lr}
ldr r0, =gConfigUiState
ldr r0, [r0]
cmp r0, #0
beq RedrawVisibleConfigOptionsEnd
@blh 0x8002D6C @ ProcEnd
@ldr r0, =0x8022638
@ldr r0, [r0] @ ProcScr_Config_Field
@blh 0x8002C7C @ ProcStart

@blh 0x80B1A08@Config_Init
@b RedrawVisibleConfigOptionsEnd
ldrh r4, [r0, #0x2C] @ top visible option index
ldrh r5, [r0, #0x34] @ visible option count
add r5, r4
RedrawVisibleConfigOptionsLoop:
cmp r4, r5
bge RedrawVisibleConfigOptionsEnd
mov r0, r4
ldr r0, =GameOptionsOrderListPointer
ldr r0, [r0]
ldrb r0, [r0, r4]
mov r1, #7
blh GetConfigTextSlot
mov r7, r0
mov r6, r4
lsl r6, r6, #1
add r6, #1
mov r0, #31
and r6, r0
mov r0, r4
mov r1, #5
blh DrawGameOptionIcon
mov r0, r4
mov r1, r7
mov r2, r6
blh DrawGameOptionText
mov r0, r4
mov r1, r7
mov r2, r6
blh DrawOptionValueTexts
add r4, #1
b RedrawVisibleConfigOptionsLoop
RedrawVisibleConfigOptionsEnd:
pop {r4-r7}
pop {r0}
bx r0

.ltorg
.align

.type GenericCheckOption, %function 
.global GenericCheckOption
@ pop lr twice 
GenericCheckOption:
push {r4, lr}
blh CheckEventId
pop {r4}
pop {r1}
pop {r1}
bx r1 

.ltorg 
.align 

