.align 4
.thumb
.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm

	.equ CheckEventId,0x8083da8
	.equ MemorySlot,0x30004B8
	.equ CurrentUnit, 0x3004E50
	.equ EventEngine, 0x800D07C
	
	
	
	
	
	.global AutolevelSpells
	.type   AutolevelSpells, function

AutolevelSpells:
push	{r4-r7,lr}
	
	@ with r0 as unit struct, set their first 5 wexp values to the moves they've "learned" 
	mov r4, r0 @ Unit 
	ldrb r7, [r4, #0x0B] @ Allegiance 
	lsr r7, #6 @ only need top two bits 
	@
	cmp r7, #0 
	beq RandomizerDoesntMatter
	ldr r0, =RandomizeClassesFlag
	lsl r0, #24 
	lsr r0, #24 
	blh CheckEventId 
	cmp r0, #0 
	beq RandomizerDoesntMatter 
	@mov r11, r11 
	ldr r0, [r4] @ unit 
	ldrb r0, [r0, #4] @ unit ID 
	cmp r0, #0xE0 
	blt ClearInvOnRandomizer
	cmp r0, #0xEE
	beq ClearInvOnRandomizer 
	cmp r0, #0xEF 
	bgt ClearInvOnRandomizer 
	b RandomizerDoesntMatter
@ don't overwrite trainer's items 
	ClearInvOnRandomizer: 
	
@ only clear their Inventory if they were actually randomized into a different unit 
ldr r0, [r4, #4] @ class 
ldrb r0, [r0, #4] @ class id 
ldr r3, =ClassRandomizerBalanceTable 
add r3, r0 @ entry 
ldrb r0, [r3] 
cmp r0, #0 
beq RandomizerDoesntMatter
	
	mov r0, #0 
	str r0, [r4, #0x28] @ clear learned moves, even if they had some in their inventory when doing the randomizer  
	mov r1, #0x30 
    strb r0, [r4, r1] 
	
	RandomizerDoesntMatter: 
    mov r1, #0x28 
	ldrb r0, [r4, r1] @ Do not give moves if they had something in wexp slot 1 
	cmp r0, #0 
    bne End @ They're already learned moves 
	Start:
	ldr r1, [r4, #4] @ Class pointer 
	ldrb r2, [r1, #4] @ Class ID 
	lsl r2, #2 @ *4 as each pointer is WORD length 
	
	ldr r5, =MoveListTable
	ldr r5, [r5, r2] @ Individual table per that class 
	@ r2 is offset to end at since we want most recent moves at the top  
	mov r1, #0 @ Start of the new table 
	Find_terminator_offset_loop:
	ldrb r0, [r5, r1] 
	add r1, #2 
	cmp r0, #0 
	bne Find_terminator_offset_loop
	
	ldrb r6, [r4, #8] @ Unit's level 
	mov r3, #0x0 @ Wexp / inv offset 
		@ r1, r2, r3, r4, r5, and r6 are used 
		@ r0 is scratch 
	mov r2, #0 @ Start of table 
	sub r1, #2 @ r1 is final/first real entry, not terminator 
	LearnSpellLoop: 
	sub r1, #2 @ Next entry 
	cmp r1, r2  
	blt End
	
	ldrb r0, [r5, r1] 
	cmp r0, r6 
	bgt LearnSpellLoop @ We are too low level 
	
	add r0, r1, #1 @ Add ?  
	
	ldrb r0, [r5, r0] @ Spell to learn 
	cmp r3, #5 @ We've already learned 5 moves, so end 
	bge End 
	add r3, #0x28 
	strb r0, [r4, r3] @ this is overwritten by some CopyOver function I think 
	sub r3, #0x27 @ add 1 
	b LearnSpellLoop

	
	End: 

	
pop {r4-r7}
pop {r1}
bx r1 
