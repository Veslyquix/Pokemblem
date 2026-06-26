.thumb 
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
