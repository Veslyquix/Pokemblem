.thumb
.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm




AoE_SpecificEffect:
push {lr}
ldr r2, =#0x0203F101
ldr r3, AoEID
strb r3, [r2]

bl AoE_Setup
@blh 0x8022b30 @ Copied from combat arts - take/give menu stuff ? 

@Effect/Idle Routine Return Value (r0 Bitfield):
@        & 0x01 | Does things? idunno - pause the hand selector ? 
@        & 0x02 | Ends the menu
@        & 0x04 | Plays the beep sound
@        & 0x08 | Plays the boop sound
@        & 0x10 | Clears menu graphics
@        & 0x20 | Deletes E_FACE #0
@        & 0x40 | Nothing (Not handled)
@        & 0x80 | Orrs 0x80 to E_Menu+0x63 bitfield (Ends the menu on next loop call (next frame))
@


mov r0, #0x97


pop {r1}
bx r1


.ltorg
.align 4

AoEID:
@WORD ID
