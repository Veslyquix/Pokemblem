.align 4
.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm
	.thumb

	.equ MemorySlot, 0x30004B8 
	.equ GetUnit, 0x8019430
	.equ GetUnitByEventParameter, 0x0800BC50
	.equ GetActiveUnitPointer, 0x3004E50 


	.global CustomGetActiveUnit
	.type   CustomGetActiveUnit, function

CustomGetActiveUnit:
	push {lr}	
ldr r0, =GetActiveUnitPointer
b Exit2 

ldr r2, =GetActiveUnitPointer
ldr r1, [r2] @active unit pointer ? 
ldr r1, [r1] @character table 
ldrb r0, [r1, #4] @if unit ID does not match, exit 
blh GetUnitByEventParameter @ 19430
b 	Exit2

Exit2:
pop {r1}
bx r1


Old:
	push {r4-r7, lr}
mov r4,#1 @ current deployment id
ldr r0, =GetActiveUnitPointer
ldr r1, [r0] @active unit pointer 
ldr r1, [r1] 
ldrb r5, [r1, #4] @active unit ID 


LoopThroughUnits:
mov r0,r4
blh GetUnit @ 19430
cmp r0,#0
beq NextUnit
ldr r3,[r0] @if no unit, exit 
cmp r3,#0
beq NextUnit
ldrb r2, [r3, #4] @if unit ID does not match, exit 
cmp r2, r5 
bne NextUnit 
b 	Exit 		@now we have active unit ID 

NextUnit:
add r4,#1
cmp r4,#0xAF
ble LoopThroughUnits
mov r0, #0

Exit:
pop {r4-r7}
pop {r1}
bx r1

.ltorg

	

