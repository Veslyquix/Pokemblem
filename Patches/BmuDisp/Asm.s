.thumb 
.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm

.global Hook_DrawBattleForecastContents
.type Hook_DrawBattleForecastContents, %function 
Hook_DrawBattleForecastContents: 
push {r5, lr} 
mov r1, #0 
str r1, [r4, #0x2C] 
add r0, #0x34 
strb r1, [r0] 
sub r0, #2 
ldrb r5, [r0] 

blh 0x8005B68 @ EndFaceChibiSpr 

blh 0x80364d8 @ GetBattleForecastPanelSide 
mov r1, r0 
mov r0, r4 
bl BattleForecastChibi




mov r0, r5 
pop {r5} 
pop {r3} 
bx r3 
.ltorg 




.global Hook_BattleForecast_LoopSlideIn 
.type Hook_BattleForecast_LoopSlideIn, %function 
Hook_BattleForecast_LoopSlideIn: 
push {lr} 
cmp r0, #4 
bne Exit 
mov r0, #0 
strb r0, [r6] 
mov r0, r7 
mov r1, #0x35 
ldrb r1, [r0, r1] @ side 
lsl r1, #24 
asr r1, #24 
bl BattleForecastChibi
Exit: 
pop {r3} 
bx r3 
.ltorg 

.global Hook_BattleForecast_LoopSlideOut
.type Hook_BattleForecast_LoopSlideOut, %function 
Hook_BattleForecast_LoopSlideOut: 
push {lr} 
cmp r0, #1 
beq EndChibi 
cmp r0, #4 
bne Exit2 
mov r0, #0 
strb r0, [r6] 
mov r0, r7 
blh 0x8002e94 @Proc_Break
b Exit 
EndChibi: 
blh 0x8005B68 @ EndFaceChibiSpr 
Exit2: 
pop {r3} 
bx r3 
.ltorg 



.global Hook_sub_80996E8
.type Hook_sub_80996E8, %function 
Hook_sub_80996E8:
push {lr} 

mov r0, #0 
ldr r3, =0x8005758 @ EndFaceById 
mov lr, r3 
.short 0xF800 

ldr r0, =0x6014000
mov r1, #0 
sub r1, #1 
ldr r3, =0x8089804 @ LoadHelpBoxGfx 
mov lr, r3 
.short 0xF800 


mov r1, r8 
strb r1, [r4] 
ldr r0, =0x8099738 
ldr r0, [r0] 
ldrb r1, [r0] 
mov r2, #1 
mov r0, r2 
and r0, r1 
pop {r3} 
bx r3 
.ltorg 
