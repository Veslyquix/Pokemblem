.thumb 
.macro blh to
    ldr r3, =\to
    mov lr, r3
    .short 0xF800
.endm
.global LoadNewStatScreenEquipmentPal 
.type LoadNewStatScreenEquipmentPal, %function 
LoadNewStatScreenEquipmentPal: 
push {lr} 
ldr r0, =SS_MenuPal 
mov r1, #0x60 @ pal id 3 
mov r2, #0x20 @ 1 row 
@mov r11, r11 
blh 0x8000db8 @T CopyToPaletteBuffer
@blh 0x804e078 @85b6bb4 85b65c0 8A01F24
@blh 0x804E0A8 @ LoadNewUIPal 
mov r0, #0x80 
lsl r0, #3 
blh 0x8001240 @ RegisterBlankTile 
pop {r3} 
bx r3 
.ltorg 




