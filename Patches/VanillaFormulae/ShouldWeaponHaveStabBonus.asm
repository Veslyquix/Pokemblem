@ callhack with r3 at 2AAD0 (in BattleLoadAttack / BC_Power)

@ also see \EngineHacks\SkillSystem\GaidenSpellScrolls\UsabilityByType.s 

.thumb
.align 4

.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm


.type ShouldWeaponHaveStabBonus, %function 
.global ShouldWeaponHaveStabBonus 

ShouldWeaponHaveStabBonus:
@ given r0 = wep id and r1 = class id, determine if they should have stab bonus or not 
push {r4-r7, lr} 

mov r4, r0 
mov r5, r1 
@ 80177b0 GetItemData
blh 0x8017548 @GetItemWType
@ Given r0 as weapon type, return class type bitfield 
blh EffectivenessToTypeBitfield 
mov r6, r0 
mov r0, r5 
blh 0x8019444 @GetClassData

mov r7, r0 
mov r1, #0x50 @ typing 
ldrh r1, [r7, r1] @ type bitfield 
mov r0, r6 @ wep's type bitfield 

and r0, r1 
cmp r0, #0 
beq False_WeaponStabBonus 
b True_WeaponShouldHaveStabBonus 


False_WeaponStabBonus:
mov r0, #0 
b Exit_WeaponHaveStabBonus 

True_WeaponShouldHaveStabBonus:
mov r0, #1 

Exit_WeaponHaveStabBonus:

pop {r4-r7} 
pop {r1} 
bx r1 




