.thumb
.align 4
@originally at 9a554, write 47f0d8f9

.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm


@also need to change 1948a to d219
mov r7, #0x1e @item slot (r7 had the number of items total)
Loop:
ldr r0,[r5,r7]

@ item to add to convoy in r0
mov r2, #0xC0 @ 0x40|0x80 forged / equipped? (forgable items is disabled anyway)
lsl r2, #8 

@ Check if itemID stored at the address in r4 has the "IsAccsesory" weapon ability, and if it does, unequip it before trading
push {r1-r3}
ldr r3, =ItemTable
ldrb r2,[r5,#0x1E] @ itemID
mov r1, #0x24 @ width of item table
mul r2, r1 @ multiply itemID by width of table
add r2, #0xA @ offset to the column for Weapon Ability 3, which can contain IsAccessory (0x40)
ldrb r2, [r3,r2] @ Get value in weapon ability 3
mov r3, #0x40 @ Setup to compare WA3 with IsAccessory
and r3, r2
mov r1, #0x0
cmp r3, r1
beq NotAccessory1 @ if NOT = 0, go to NotAccessory1
pop {r1-r3}
bic r0, r2 @ remove top 2 bits of durability, i think 
b CheckAcc1End
NotAccessory1:
pop {r1-r3}
CheckAcc1End:

bl Give_func
mov r0,r5
mov r1,#0
@ldr r2, StoreFromInv
@mov lr,r2
@.short 0xF8
@ instead of editing StoreFromInv at 19484, just copy paste the code here 
@ it's just a few lines anyway 
lsl r1, #1 
mov r2, r0 
add r2, r7 
add r2, r1 
mov r1, #0 
strh r1, [r2] 
blh 0x8017984 

ReturnSkipped:
add r4,#1
cmp r4,#5 @(cmp 5 instead of r5, may be a couple extra loops but who cares)
bge EndLoop
add r0,r4,r6
cmp r0,#0xC7
ble Loop
EndLoop:
ldr r0,ReturnTo
bx r0

Give_func:
push {r4,lr}
mov r4, r0

mov r2, #0 @Counter 
PreventTradingLoop:
ldr r3, =PreventTradingList 
ldrb r1, [r3, r2] 
cmp r1, #0x0 
beq End
add r2, #1 
lsl r3, r0, #24 
lsr r3, #24 
cmp r3, r1 @
beq NoStore
b PreventTradingLoop



NoStore:
add r7, #2
pop {r4}
pop {r0}
b ReturnSkipped
End:
mov r0,r4
ldr r1,StoreFunc
mov lr,r1
.short 0xF800
pop {r4}
pop {r1}
bx r1
.align
AbilityGetter:
.long 0x0801756c
ReturnTo:
.long 0x0809a56e+1
StoreFunc:
.long 0x8031594
StoreFromInv:
.long 0x8019484
