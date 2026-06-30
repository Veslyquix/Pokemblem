	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 1	@ Tag_ABI_enum_size
	.eabi_attribute 30, 4	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"GaidenMagic.c"
@ GNU C23 (devkitARM release 66) version 15.1.0 (arm-none-eabi)
@	compiled by GNU C version 13.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -Os
	.text
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.type	IncorporateNewRange, %function
IncorporateNewRange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
@ RangeDisplay.c:62: 	long long existingMin = existing >> 40;
	asrs	r7, r1, #31	@ existingMin_14, existing,
@ RangeDisplay.c:63: 	long long newMin = new >> 40;
	asrs	r5, r3, #8	@ newMin_15, new,
	asrs	r6, r3, #31	@ newMin_15, new,
@ RangeDisplay.c:66: 	return existingMask|newMask|(( newMin < existingMin ? newMin : existingMin ) << 40)|(( newMax > existingMax ? newMax : existingMax ) << 32);
	asrs	r4, r1, #8	@ _5, existing,
	cmp	r7, r6	@ existingMin_14, newMin_15
	bgt	.L3		@,
	bne	.L2		@,
	cmp	r4, r5	@ _5, newMin_15
	bls	.L2		@,
.L3:
	movs	r4, r5	@ _5, newMin_15
.L2:
@ RangeDisplay.c:66: 	return existingMask|newMask|(( newMin < existingMin ? newMin : existingMin ) << 40)|(( newMax > existingMax ? newMax : existingMax ) << 32);
	orrs	r0, r2	@ _3, new
@ RangeDisplay.c:64: 	long long existingMax = (existing >> 32) & 0xFF;
	movs	r2, #255	@ tmp145,
@ RangeDisplay.c:66: 	return existingMask|newMask|(( newMin < existingMin ? newMin : existingMin ) << 40)|(( newMax > existingMax ? newMax : existingMax ) << 32);
	lsls	r4, r4, #8	@ _6, _5,
@ RangeDisplay.c:65: 	long long newMax = (new >> 32) & 0xFF;
	ands	r3, r2	@ newMax_17, tmp145
@ RangeDisplay.c:66: 	return existingMask|newMask|(( newMin < existingMin ? newMin : existingMin ) << 40)|(( newMax > existingMax ? newMax : existingMax ) << 32);
	ands	r1, r2	@ _8, tmp145
	cmp	r3, r1	@ newMax_17, _8
	bls	.L4		@,
	movs	r1, r3	@ _8, newMax_17
.L4:
@ RangeDisplay.c:67: }
	@ sp needed	@
@ RangeDisplay.c:66: 	return existingMask|newMask|(( newMin < existingMin ? newMin : existingMin ) << 40)|(( newMax > existingMax ? newMax : existingMax ) << 32);
	orrs	r1, r4	@ _18, _6
@ RangeDisplay.c:67: }
	pop	{r4, r5, r6, r7}
	pop	{r2}
	bx	r2
	.size	IncorporateNewRange, .-IncorporateNewRange
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenMagicUMEffectExt, %function
GaidenMagicUMEffectExt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}	@
@ UnitMenu.c:105:                            MenuCommandProc *commandProc) {
	movs	r4, r0	@ spellsList, spellsList
	subs	r0, r1, #0	@ proc, proc,
@ UnitMenu.c:106:   if (proc && commandProc->availability == 2) {
	beq	.L7		@,
@ UnitMenu.c:106:   if (proc && commandProc->availability == 2) {
	adds	r2, r2, #61	@ tmp127,
@ UnitMenu.c:106:   if (proc && commandProc->availability == 2) {
	ldrb	r3, [r2]	@ tmp128,
	cmp	r3, #2	@ tmp128,
	bne	.L7		@,
@ UnitMenu.c:108:     MenuCallHelpBox(proc, gGaidenMagicUMErrorText);
	ldr	r3, .L12	@ tmp129,
	ldrh	r1, [r3]	@ gGaidenMagicUMErrorText, gGaidenMagicUMErrorText
	ldr	r3, .L12+4	@ tmp131,
	bl	.L14		@
@ UnitMenu.c:109:     return 0x08;
	movs	r0, #8	@ <retval>,
.L6:
@ UnitMenu.c:122: }
	@ sp needed	@
	pop	{r1, r2, r4, r5, r6}
	pop	{r1}
	bx	r1
.L7:
@ UnitMenu.c:111:     _ResetIconGraphics();
	ldr	r3, .L12+8	@ tmp132,
	bl	.L14		@
@ UnitMenu.c:112:     SelectedSpell = spellsList[0];
	ldrb	r2, [r4]	@ _3, *spellsList_14(D)
@ UnitMenu.c:112:     SelectedSpell = spellsList[0];
	ldr	r3, .L12+12	@ tmp133,
@ UnitMenu.c:113:     LoadIconPalettes(4);
	movs	r0, #4	@,
@ UnitMenu.c:112:     SelectedSpell = spellsList[0];
	strb	r2, [r3]	@ _3, SelectedSpell
@ UnitMenu.c:113:     LoadIconPalettes(4);
	ldr	r3, .L12+16	@ tmp135,
	bl	.L14		@
@ UnitMenu.c:114:     MenuProc *menu = StartMenu(&SpellSelectMenuDefs);
	ldr	r3, .L12+20	@ tmp137,
	ldr	r0, .L12+24	@ tmp136,
	bl	.L14		@
@ UnitMenu.c:117:     StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
	ldr	r4, .L12+28	@ tmp138,
@ UnitMenu.c:114:     MenuProc *menu = StartMenu(&SpellSelectMenuDefs);
	movs	r5, r0	@ menu,
@ UnitMenu.c:117:     StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
	ldr	r3, .L12+32	@ tmp139,
	ldr	r0, [r4]	@, gActiveUnit
	bl	.L14		@
@ UnitMenu.c:117:     StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
	movs	r3, #2	@ tmp140,
@ UnitMenu.c:117:     StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
	movs	r1, r0	@ _5,
@ UnitMenu.c:117:     StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);
	movs	r2, #176	@,
	str	r3, [sp]	@ tmp140,
	movs	r0, #0	@,
	adds	r3, r3, #10	@,
	ldr	r6, .L12+36	@ tmp141,
	bl	.L15		@
@ UnitMenu.c:118:     SetFaceBlinkControlById(0, 5);
	movs	r1, #5	@,
	movs	r0, #0	@,
	ldr	r3, .L12+40	@ tmp142,
	bl	.L14		@
@ UnitMenu.c:119:     ForceMenuItemPanel(menu, gActiveUnit, 15, 11);
	movs	r0, r5	@, menu
	ldr	r1, [r4]	@, gActiveUnit
	movs	r3, #11	@,
	movs	r2, #15	@,
	ldr	r4, .L12+44	@ tmp144,
	bl	.L16		@
@ UnitMenu.c:120:     return 0x17;
	movs	r0, #23	@ <retval>,
	b	.L6		@
.L13:
	.align	2
.L12:
	.word	gGaidenMagicUMErrorText
	.word	MenuCallHelpBox
	.word	_ResetIconGraphics
	.word	SelectedSpell
	.word	LoadIconPalettes
	.word	StartMenu
	.word	SpellSelectMenuDefs
	.word	gActiveUnit
	.word	GetUnitPortraitId
	.word	StartFace
	.word	SetFaceBlinkControlById
	.word	ForceMenuItemPanel
	.size	GaidenMagicUMEffectExt, .-GaidenMagicUMEffectExt
	.align	1
	.global	GaidenMagicUMUnhover
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenMagicUMUnhover, %function
GaidenMagicUMUnhover:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ UnitMenu.c:163:   if (!SelectedSpell) {
	ldr	r3, .L19	@ tmp117,
@ UnitMenu.c:163:   if (!SelectedSpell) {
	ldrb	r3, [r3]	@ SelectedSpell, SelectedSpell
	cmp	r3, #0	@ SelectedSpell,
	bne	.L18		@,
@ UnitMenu.c:164:     UsingSpellMenu = 0;
	ldr	r2, .L19+4	@ tmp119,
	strb	r3, [r2]	@ SelectedSpell, UsingSpellMenu
.L18:
@ UnitMenu.c:168: }
	@ sp needed	@
@ UnitMenu.c:166:   HideMoveRangeGraphics();
	ldr	r3, .L19+8	@ tmp122,
	bl	.L14		@
@ UnitMenu.c:168: }
	movs	r0, #0	@,
	pop	{r4}
	pop	{r1}
	bx	r1
.L20:
	.align	2
.L19:
	.word	SelectedSpell
	.word	UsingSpellMenu
	.word	HideMoveRangeGraphics
	.size	GaidenMagicUMUnhover, .-GaidenMagicUMUnhover
	.align	1
	.global	SpellsGetterForLevel
	.syntax unified
	.code	16
	.thumb_func
	.type	SpellsGetterForLevel, %function
SpellsGetterForLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ SpellSystem.c:12: 	u8* currBuffer = SpellsBuffer;
	ldr	r3, .L28	@ currBuffer,
	movs	r1, r0	@ ivtmp.212, unit
	movs	r2, r0	@ unit, unit
	movs	r0, r3	@ <retval>, currBuffer
@ SpellSystem.c:8: {
	push	{r4, lr}	@
	adds	r1, r1, #40	@ ivtmp.212,
	adds	r2, r2, #45	@ unit,
.L23:
@ SpellSystem.c:18: 		if (unit->ranks[i] != 0) {
	ldrb	r4, [r1]	@ _1, MEM[(unsigned char *)_21]
@ SpellSystem.c:18: 		if (unit->ranks[i] != 0) {
	cmp	r4, #0	@ _1,
	beq	.L22		@,
@ SpellSystem.c:20: 			*currBuffer = unit->ranks[i];
	strb	r4, [r3]	@ _1, *currBuffer_16
@ SpellSystem.c:21: 			currBuffer++;
	adds	r3, r3, #1	@ currBuffer,
.L22:
@ SpellSystem.c:16: 	for ( int i = 0 ; i < 5 ; i++ )	
	adds	r1, r1, #1	@ ivtmp.212,
	cmp	r1, r2	@ ivtmp.212, _23
	bne	.L23		@,
@ SpellSystem.c:47: }
	@ sp needed	@
@ SpellSystem.c:45: 	*currBuffer = 0;
	movs	r2, #0	@ tmp125,
	strb	r2, [r3]	@ tmp125, *currBuffer_2
@ SpellSystem.c:47: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L29:
	.align	2
.L28:
	.word	SpellsBuffer
	.size	SpellsGetterForLevel, .-SpellsGetterForLevel
	.align	1
	.global	SpellsGetter
	.syntax unified
	.code	16
	.thumb_func
	.type	SpellsGetter, %function
SpellsGetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, r1	@ type, type
@ SpellSystem.c:4: 	return SpellsGetterForLevel(unit,-1,type);
	movs	r1, #1	@,
@ SpellSystem.c:3: {
	push	{r4, lr}	@
@ SpellSystem.c:4: 	return SpellsGetterForLevel(unit,-1,type);
	rsbs	r1, r1, #0	@,
	bl	SpellsGetterForLevel		@
@ SpellSystem.c:5: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
	.size	SpellsGetter, .-SpellsGetter
	.align	1
	.global	CaptureGaidenBlackMagicUMEffect
	.syntax unified
	.code	16
	.thumb_func
	.type	CaptureGaidenBlackMagicUMEffect, %function
CaptureGaidenBlackMagicUMEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ UnitMenu.c:49:   Unit *unit = gActiveUnit;
	ldr	r3, .L32	@ tmp121,
@ UnitMenu.c:47:                                     MenuCommandProc *commandProc) {
	push	{r4, r5, r6, lr}	@
@ UnitMenu.c:47:                                     MenuCommandProc *commandProc) {
	movs	r4, r0	@ proc, proc
@ UnitMenu.c:56: }
	@ sp needed	@
@ UnitMenu.c:49:   Unit *unit = gActiveUnit;
	ldr	r0, [r3]	@ unit, gActiveUnit
@ UnitMenu.c:50:   unit->state = unit->state | (1 << 30); // Capturing bit
	movs	r3, #128	@ tmp124,
@ UnitMenu.c:47:                                     MenuCommandProc *commandProc) {
	movs	r5, r1	@ commandProc, commandProc
@ UnitMenu.c:53:   UsingSpellMenu = BLACK_MAGIC;
	movs	r1, #1	@ tmp126,
@ UnitMenu.c:50:   unit->state = unit->state | (1 << 30); // Capturing bit
	ldr	r2, [r0, #12]	@ unit_5->state, unit_5->state
	lsls	r3, r3, #23	@ tmp124, tmp124,
	orrs	r3, r2	@ _2, unit_5->state
@ UnitMenu.c:50:   unit->state = unit->state | (1 << 30); // Capturing bit
	str	r3, [r0, #12]	@ _2, unit_5->state
@ UnitMenu.c:53:   UsingSpellMenu = BLACK_MAGIC;
	ldr	r3, .L32+4	@ tmp125,
	strb	r1, [r3]	@ tmp126, UsingSpellMenu
@ UnitMenu.c:54:   return GaidenMagicUMEffectExt(SpellsGetter(gActiveUnit, BLACK_MAGIC), proc,
	bl	SpellsGetter		@
@ UnitMenu.c:54:   return GaidenMagicUMEffectExt(SpellsGetter(gActiveUnit, BLACK_MAGIC), proc,
	movs	r2, r5	@, commandProc
	movs	r1, r4	@, proc
	bl	GaidenMagicUMEffectExt		@
@ UnitMenu.c:56: }
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L33:
	.align	2
.L32:
	.word	gActiveUnit
	.word	UsingSpellMenu
	.size	CaptureGaidenBlackMagicUMEffect, .-CaptureGaidenBlackMagicUMEffect
	.align	1
	.global	GaidenBlackMagicUMEffect
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenBlackMagicUMEffect, %function
GaidenBlackMagicUMEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ UnitMenu.c:92: int GaidenBlackMagicUMEffect(MenuProc *proc, MenuCommandProc *commandProc) {
	movs	r5, r1	@ commandProc, commandProc
@ UnitMenu.c:96: }
	@ sp needed	@
@ UnitMenu.c:93:   UsingSpellMenu = BLACK_MAGIC;
	movs	r1, #1	@ tmp120,
@ UnitMenu.c:92: int GaidenBlackMagicUMEffect(MenuProc *proc, MenuCommandProc *commandProc) {
	movs	r4, r0	@ proc, proc
@ UnitMenu.c:93:   UsingSpellMenu = BLACK_MAGIC;
	ldr	r3, .L35	@ tmp119,
	strb	r1, [r3]	@ tmp120, UsingSpellMenu
@ UnitMenu.c:94:   return GaidenMagicUMEffectExt(SpellsGetter(gActiveUnit, BLACK_MAGIC), proc,
	ldr	r3, .L35+4	@ tmp122,
	ldr	r0, [r3]	@, gActiveUnit
	bl	SpellsGetter		@
@ UnitMenu.c:94:   return GaidenMagicUMEffectExt(SpellsGetter(gActiveUnit, BLACK_MAGIC), proc,
	movs	r2, r5	@, commandProc
	movs	r1, r4	@, proc
	bl	GaidenMagicUMEffectExt		@
@ UnitMenu.c:96: }
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L36:
	.align	2
.L35:
	.word	UsingSpellMenu
	.word	gActiveUnit
	.size	GaidenBlackMagicUMEffect, .-GaidenBlackMagicUMEffect
	.align	1
	.global	GaidenWhiteMagicUMEffect
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenWhiteMagicUMEffect, %function
GaidenWhiteMagicUMEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ UnitMenu.c:98: int GaidenWhiteMagicUMEffect(MenuProc *proc, MenuCommandProc *commandProc) {
	movs	r5, r1	@ commandProc, commandProc
@ UnitMenu.c:102: }
	@ sp needed	@
@ UnitMenu.c:99:   UsingSpellMenu = WHITE_MAGIC;
	movs	r1, #2	@ tmp120,
@ UnitMenu.c:98: int GaidenWhiteMagicUMEffect(MenuProc *proc, MenuCommandProc *commandProc) {
	movs	r4, r0	@ proc, proc
@ UnitMenu.c:99:   UsingSpellMenu = WHITE_MAGIC;
	ldr	r3, .L38	@ tmp119,
	strb	r1, [r3]	@ tmp120, UsingSpellMenu
@ UnitMenu.c:100:   return GaidenMagicUMEffectExt(SpellsGetter(gActiveUnit, WHITE_MAGIC), proc,
	ldr	r3, .L38+4	@ tmp122,
	ldr	r0, [r3]	@, gActiveUnit
	bl	SpellsGetter		@
@ UnitMenu.c:100:   return GaidenMagicUMEffectExt(SpellsGetter(gActiveUnit, WHITE_MAGIC), proc,
	movs	r2, r5	@, commandProc
	movs	r1, r4	@, proc
	bl	GaidenMagicUMEffectExt		@
@ UnitMenu.c:102: }
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L39:
	.align	2
.L38:
	.word	UsingSpellMenu
	.word	gActiveUnit
	.size	GaidenWhiteMagicUMEffect, .-GaidenWhiteMagicUMEffect
	.align	1
	.global	NewGetUnitUseFlags
	.syntax unified
	.code	16
	.thumb_func
	.type	NewGetUnitUseFlags, %function
NewGetUnitUseFlags:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0	@ _77, unit
	push	{r0, r1, r2, r4, r5, r6, r7, lr}	@
	movs	r5, r0	@ ivtmp.239, unit
@ SpellSystem.c:366: {
	movs	r6, r0	@ unit, unit
@ SpellSystem.c:367: 	u32 ret = 0;
	movs	r4, #0	@ <retval>,
@ SpellSystem.c:371: 		if ( attributes & IA_WEAPON )
	movs	r7, #1	@ tmp181,
	adds	r3, r3, #40	@ _77,
	str	r3, [sp, #4]	@ _77, %sfp
	adds	r5, r5, #30	@ ivtmp.239,
.L41:
@ SpellSystem.c:368: 	for ( int i = 0 ; i < 5 && unit->items[i] ; i++ )
	ldrh	r0, [r5]	@ _10, MEM[(short unsigned int *)_73]
@ SpellSystem.c:368: 	for ( int i = 0 ; i < 5 && unit->items[i] ; i++ )
	cmp	r0, #0	@ _10,
	beq	.L46		@,
@ SpellSystem.c:370: 		u32 attributes = GetItemAttributes(unit->items[i]);
	ldr	r3, .L66	@ tmp145,
	bl	.L14		@
@ SpellSystem.c:371: 		if ( attributes & IA_WEAPON )
	tst	r0, r7	@ attributes, tmp181
	beq	.L42		@,
@ SpellSystem.c:373: 			if ( CanUnitUseWeaponNow(unit,unit->items[i]) ) { ret |= 1; }
	movs	r0, r6	@, unit
	ldrh	r1, [r5]	@ _4, MEM[(short unsigned int *)_73]
	ldr	r3, .L66+4	@ tmp149,
	bl	.L14		@
@ SpellSystem.c:373: 			if ( CanUnitUseWeaponNow(unit,unit->items[i]) ) { ret |= 1; }
	cmp	r0, #0	@ _5,
	beq	.L44		@,
@ SpellSystem.c:373: 			if ( CanUnitUseWeaponNow(unit,unit->items[i]) ) { ret |= 1; }
	orrs	r4, r7	@ <retval>, tmp181
.L44:
@ SpellSystem.c:368: 	for ( int i = 0 ; i < 5 && unit->items[i] ; i++ )
	ldr	r3, [sp, #4]	@ _77, %sfp
	adds	r5, r5, #2	@ ivtmp.239,
	cmp	r5, r3	@ ivtmp.239, _77
	bne	.L41		@,
.L46:
@ SpellSystem.c:381: 	u8* spells = SpellsGetter(unit,-1);
	movs	r1, #1	@,
	movs	r0, r6	@, unit
	rsbs	r1, r1, #0	@,
	bl	SpellsGetter		@
@ SpellSystem.c:385: 		if ( attributes & IA_WEAPON )
	movs	r7, #1	@ tmp179,
@ SpellSystem.c:381: 	u8* spells = SpellsGetter(unit,-1);
	movs	r5, r0	@ ivtmp.233, ivtmp.233
.L48:
@ SpellSystem.c:382: 	for ( int i = 0 ; spells[i] ; i++ )
	ldrb	r0, [r5]	@ _24, MEM[(u8 *)_66]
@ SpellSystem.c:382: 	for ( int i = 0 ; spells[i] ; i++ )
	cmp	r0, #0	@ _24,
	bne	.L53		@,
@ SpellSystem.c:395: }
	@ sp needed	@
	movs	r0, r4	@, <retval>
	pop	{r1, r2, r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L42:
@ SpellSystem.c:375: 		else if ( attributes & IA_STAFF )
	movs	r3, #4	@ tmp197,
	tst	r0, r3	@ attributes, tmp197
	beq	.L44		@,
@ SpellSystem.c:377: 			if ( CanUnitUseStaffNow(unit,unit->items[i]) ) { ret |= 2; }
	movs	r0, r6	@, unit
	ldrh	r1, [r5]	@ _8, MEM[(short unsigned int *)_73]
	ldr	r3, .L66+8	@ tmp156,
	bl	.L14		@
@ SpellSystem.c:377: 			if ( CanUnitUseStaffNow(unit,unit->items[i]) ) { ret |= 2; }
	cmp	r0, #0	@ _9,
	beq	.L44		@,
@ SpellSystem.c:377: 			if ( CanUnitUseStaffNow(unit,unit->items[i]) ) { ret |= 2; }
	movs	r3, #2	@ tmp159,
	orrs	r4, r3	@ <retval>, tmp159
	b	.L44		@
.L53:
@ SpellSystem.c:384: 		u32 attributes = GetItemAttributes(spells[i]);
	ldr	r3, .L66	@ tmp161,
	bl	.L14		@
@ SpellSystem.c:385: 		if ( attributes & IA_WEAPON )
	tst	r0, r7	@ attributes, tmp179
	beq	.L49		@,
@ SpellSystem.c:387: 			if ( CanUnitUseWeaponNow(unit,spells[i]) ) { ret |= 1; }
	movs	r0, r6	@, unit
	ldrb	r1, [r5]	@ _14, MEM[(u8 *)_66]
	ldr	r3, .L66+4	@ tmp165,
	bl	.L14		@
@ SpellSystem.c:387: 			if ( CanUnitUseWeaponNow(unit,spells[i]) ) { ret |= 1; }
	cmp	r0, #0	@ _15,
	beq	.L51		@,
@ SpellSystem.c:387: 			if ( CanUnitUseWeaponNow(unit,spells[i]) ) { ret |= 1; }
	orrs	r4, r7	@ <retval>, tmp179
.L51:
	adds	r5, r5, #1	@ ivtmp.233,
	b	.L48		@
.L49:
@ SpellSystem.c:389: 		else if ( attributes & IA_STAFF )
	movs	r3, #4	@ tmp199,
	tst	r0, r3	@ attributes, tmp199
	beq	.L51		@,
@ SpellSystem.c:391: 			if ( CanUnitUseStaffNow(unit,spells[i]) ) { ret |= 2; }
	movs	r0, r6	@, unit
	ldrb	r1, [r5]	@ _20, MEM[(u8 *)_66]
	ldr	r3, .L66+8	@ tmp172,
	bl	.L14		@
@ SpellSystem.c:391: 			if ( CanUnitUseStaffNow(unit,spells[i]) ) { ret |= 2; }
	cmp	r0, #0	@ _21,
	beq	.L51		@,
@ SpellSystem.c:391: 			if ( CanUnitUseStaffNow(unit,spells[i]) ) { ret |= 2; }
	movs	r3, #2	@ tmp175,
	orrs	r4, r3	@ <retval>, tmp175
	b	.L51		@
.L67:
	.align	2
.L66:
	.word	GetItemAttributes
	.word	CanUnitUseWeaponNow
	.word	CanUnitUseStaffNow
	.size	NewGetUnitUseFlags, .-NewGetUnitUseFlags
	.align	1
	.global	InitGaidenSpellLearnPopup
	.syntax unified
	.code	16
	.thumb_func
	.type	InitGaidenSpellLearnPopup, %function
InitGaidenSpellLearnPopup:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ SpellSystem.c:431: 	if ( gBattleActor.levelPrevious != gBattleActor.unit.level ) { subject = &gBattleActor; }
	ldr	r2, .L78	@ tmp135,
	ldrb	r0, [r2]	@ _2,
@ SpellSystem.c:431: 	if ( gBattleActor.levelPrevious != gBattleActor.unit.level ) { subject = &gBattleActor; }
	movs	r2, #8	@ _4,
@ SpellSystem.c:431: 	if ( gBattleActor.levelPrevious != gBattleActor.unit.level ) { subject = &gBattleActor; }
	ldr	r3, .L78+4	@ tmp132,
@ SpellSystem.c:431: 	if ( gBattleActor.levelPrevious != gBattleActor.unit.level ) { subject = &gBattleActor; }
	ldrsb	r2, [r3, r2]	@ _4,* _4
@ SpellSystem.c:430: 	BattleUnit* subject = NULL;
	subs	r0, r0, r2	@ tmp156, _2, _4
	subs	r2, r0, #1	@ tmp157, tmp156
	sbcs	r0, r0, r2	@ tmp155, tmp156, tmp157
@ SpellSystem.c:432: 	if ( gBattleTarget.levelPrevious != gBattleTarget.unit.level ) { subject = &gBattleTarget; }
	ldr	r2, .L78+8	@ tmp142,
	ldrb	r1, [r2]	@ _6,
@ SpellSystem.c:432: 	if ( gBattleTarget.levelPrevious != gBattleTarget.unit.level ) { subject = &gBattleTarget; }
	movs	r2, #8	@ _8,
@ SpellSystem.c:430: 	BattleUnit* subject = NULL;
	rsbs	r0, r0, #0	@ tmp158, tmp155
	ands	r0, r3	@ subject, tmp132
@ SpellSystem.c:432: 	if ( gBattleTarget.levelPrevious != gBattleTarget.unit.level ) { subject = &gBattleTarget; }
	ldr	r3, .L78+12	@ tmp139,
@ SpellSystem.c:432: 	if ( gBattleTarget.levelPrevious != gBattleTarget.unit.level ) { subject = &gBattleTarget; }
	ldrsb	r2, [r3, r2]	@ _8,* _8
@ SpellSystem.c:432: 	if ( gBattleTarget.levelPrevious != gBattleTarget.unit.level ) { subject = &gBattleTarget; }
	cmp	r1, r2	@ _6, _8
	bne	.L74		@,
@ SpellSystem.c:433: 	if ( !subject ) { return 0; } // If this isn't filled, we shouldn't show a popup.
	cmp	r0, #0	@ subject,
	bne	.L70		@,
.L72:
@ SpellSystem.c:433: 	if ( !subject ) { return 0; } // If this isn't filled, we shouldn't show a popup.
	movs	r0, #0	@ <retval>,
.L68:
@ SpellSystem.c:442: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L74:
@ SpellSystem.c:432: 	if ( gBattleTarget.levelPrevious != gBattleTarget.unit.level ) { subject = &gBattleTarget; }
	movs	r0, r3	@ subject, tmp139
.L70:
@ SpellSystem.c:435: 	u8* spells = SpellsGetterForLevel(&subject->unit,subject->unit.level,-1);
	movs	r1, #8	@ _11,
	movs	r2, #1	@,
	ldrsb	r1, [r0, r1]	@ _11,* _11
	rsbs	r2, r2, #0	@,
	bl	SpellsGetterForLevel		@
@ SpellSystem.c:437: 	if ( *spells )
	ldrb	r1, [r0]	@ _12, *spells_22
@ SpellSystem.c:437: 	if ( *spells )
	cmp	r1, #0	@ _12,
	beq	.L72		@,
@ SpellSystem.c:439: 		gPopupItem = *spells|0xFF00;
	ldr	r2, .L78+16	@ tmp151,
@ SpellSystem.c:439: 		gPopupItem = *spells|0xFF00;
	ldr	r3, .L78+20	@ tmp148,
@ SpellSystem.c:439: 		gPopupItem = *spells|0xFF00;
	orrs	r2, r1	@ tmp150, _12
@ SpellSystem.c:440: 		return 1;
	movs	r0, #1	@ <retval>,
@ SpellSystem.c:439: 		gPopupItem = *spells|0xFF00;
	strh	r2, [r3]	@ tmp150, gPopupItem
@ SpellSystem.c:440: 		return 1;
	b	.L68		@
.L79:
	.align	2
.L78:
	.word	gBattleActor+112
	.word	gBattleActor
	.word	gBattleTarget+112
	.word	gBattleTarget
	.word	-256
	.word	gPopupItem
	.size	InitGaidenSpellLearnPopup, .-InitGaidenSpellLearnPopup
	.align	1
	.global	CanCastSpellNow
	.syntax unified
	.code	16
	.thumb_func
	.type	CanCastSpellNow, %function
CanCastSpellNow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ SpellSystem.c:459: 		if ( !CanUnitUseWeaponNow(gActiveUnit,spell) ) { return 0; }
	ldr	r4, .L85	@ tmp121,
	ldr	r3, .L85+4	@ tmp122,
	ldr	r0, [r4]	@, gActiveUnit
@ SpellSystem.c:454: {
	movs	r5, r1	@ spell, spell
@ SpellSystem.c:459: 		if ( !CanUnitUseWeaponNow(gActiveUnit,spell) ) { return 0; }
	bl	.L14		@
@ SpellSystem.c:459: 		if ( !CanUnitUseWeaponNow(gActiveUnit,spell) ) { return 0; }
	cmp	r0, #0	@ <retval>,
	beq	.L80		@,
@ SpellSystem.c:461: 		MakeTargetListForWeapon(gActiveUnit,spell);
	movs	r1, r5	@, spell
	ldr	r0, [r4]	@, gActiveUnit
	ldr	r3, .L85+8	@ tmp124,
	bl	.L14		@
@ SpellSystem.c:462: 		return GetTargetListSize() != 0;
	ldr	r3, .L85+12	@ tmp125,
	bl	.L14		@
@ SpellSystem.c:462: 		return GetTargetListSize() != 0;
	subs	r3, r0, #1	@ tmp128, _12
	sbcs	r0, r0, r3	@ <retval>, _12, tmp128
.L80:
@ SpellSystem.c:468: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L86:
	.align	2
.L85:
	.word	gActiveUnit
	.word	CanUnitUseWeaponNow
	.word	MakeTargetListForWeapon
	.word	GetTargetListSize
	.size	CanCastSpellNow, .-CanCastSpellNow
	.align	1
	.global	CanCastSpell
	.syntax unified
	.code	16
	.thumb_func
	.type	CanCastSpell, %function
CanCastSpell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ SpellSystem.c:471: {
	movs	r4, r1	@ spell, spell
@ SpellSystem.c:472: 	int type = GetItemType(spell);
	movs	r0, r1	@, spell
	ldr	r3, .L92	@ tmp121,
	bl	.L14		@
@ SpellSystem.c:475: 		if ( !CanUnitUseWeapon(gActiveUnit,spell) ) { return 0; }
	ldr	r5, .L92+4	@ tmp122,
	movs	r1, r4	@, spell
	ldr	r0, [r5]	@, gActiveUnit
	ldr	r3, .L92+8	@ tmp123,
	bl	.L14		@
@ SpellSystem.c:475: 		if ( !CanUnitUseWeapon(gActiveUnit,spell) ) { return 0; }
	cmp	r0, #0	@ <retval>,
	beq	.L87		@,
@ SpellSystem.c:461: 		MakeTargetListForWeapon(gActiveUnit,spell);
	movs	r1, r4	@, spell
	ldr	r0, [r5]	@, gActiveUnit
	ldr	r3, .L92+12	@ tmp125,
	bl	.L14		@
@ SpellSystem.c:462: 		return GetTargetListSize() != 0;
	ldr	r3, .L92+16	@ tmp126,
	bl	.L14		@
@ SpellSystem.c:462: 		return GetTargetListSize() != 0;
	subs	r3, r0, #1	@ tmp129, _13
	sbcs	r0, r0, r3	@ <retval>, _13, tmp129
.L87:
@ SpellSystem.c:484: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L93:
	.align	2
.L92:
	.word	GetItemType
	.word	gActiveUnit
	.word	CanUnitUseWeapon
	.word	MakeTargetListForWeapon
	.word	GetTargetListSize
	.size	CanCastSpell, .-CanCastSpell
	.align	1
	.global	RangeUsabilityCheckStaff
	.syntax unified
	.code	16
	.thumb_func
	.type	RangeUsabilityCheckStaff, %function
RangeUsabilityCheckStaff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ RangeDisplay.c:72: 	return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit,item);
	ldr	r3, .L97	@ tmp118,
@ RangeDisplay.c:70: {
	movs	r5, r0	@ unit, unit
@ RangeDisplay.c:72: 	return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit,item);
	movs	r0, r1	@, item
@ RangeDisplay.c:70: {
	movs	r4, r1	@ item, item
@ RangeDisplay.c:72: 	return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit,item);
	bl	.L14		@
	movs	r3, r0	@ _1,
@ RangeDisplay.c:72: 	return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit,item);
	movs	r0, #0	@ <retval>,
@ RangeDisplay.c:72: 	return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit,item);
	cmp	r3, #4	@ _1,
	bne	.L94		@,
@ RangeDisplay.c:72: 	return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit,item);
	movs	r1, r4	@, item
	movs	r0, r5	@, unit
	bl	CanCastSpell		@
.L94:
@ RangeDisplay.c:73: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L98:
	.align	2
.L97:
	.word	GetItemType
	.size	RangeUsabilityCheckStaff, .-RangeUsabilityCheckStaff
	.align	1
	.global	RangeUsabilityCheckNotStaff
	.syntax unified
	.code	16
	.thumb_func
	.type	RangeUsabilityCheckNotStaff, %function
RangeUsabilityCheckNotStaff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ RangeDisplay.c:77: 	return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit,item);
	ldr	r3, .L103	@ tmp118,
@ RangeDisplay.c:76: {
	movs	r5, r0	@ unit, unit
@ RangeDisplay.c:77: 	return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit,item);
	movs	r0, r1	@, item
@ RangeDisplay.c:76: {
	movs	r4, r1	@ item, item
@ RangeDisplay.c:77: 	return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit,item);
	bl	.L14		@
	movs	r3, r0	@ _1,
@ RangeDisplay.c:77: 	return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit,item);
	movs	r0, #0	@ <retval>,
@ RangeDisplay.c:77: 	return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit,item);
	cmp	r3, #4	@ _1,
	beq	.L99		@,
@ RangeDisplay.c:77: 	return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit,item);
	movs	r1, r4	@, item
	movs	r0, r5	@, unit
	bl	CanCastSpell		@
.L99:
@ RangeDisplay.c:78: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L104:
	.align	2
.L103:
	.word	GetItemType
	.size	RangeUsabilityCheckNotStaff, .-RangeUsabilityCheckNotStaff
	.align	1
	.global	CanUseAttackSpellsNow
	.syntax unified
	.code	16
	.thumb_func
	.type	CanUseAttackSpellsNow, %function
CanUseAttackSpellsNow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ SpellSystem.c:487: {
	movs	r5, r0	@ unit, unit
@ SpellSystem.c:488: 	u8* spells = SpellsGetter(unit,type);
	bl	SpellsGetter		@
	movs	r4, r0	@ ivtmp.261, ivtmp.261
.L106:
@ SpellSystem.c:489: 	for ( int i = 0 ; spells[i] ; i++ )
	ldrb	r0, [r4]	@ _8, MEM[(u8 *)_24]
@ SpellSystem.c:489: 	for ( int i = 0 ; spells[i] ; i++ )
	cmp	r0, #0	@ _8,
	beq	.L105		@,
@ SpellSystem.c:491: 		if ( GetItemType(spells[i]) != ITYPE_STAFF && CanCastSpellNow(unit,spells[i]) )
	ldr	r3, .L111	@ tmp125,
	bl	.L14		@
@ SpellSystem.c:491: 		if ( GetItemType(spells[i]) != ITYPE_STAFF && CanCastSpellNow(unit,spells[i]) )
	cmp	r0, #4	@ _2,
	bne	.L107		@,
.L109:
	adds	r4, r4, #1	@ ivtmp.261,
	b	.L106		@
.L107:
@ SpellSystem.c:491: 		if ( GetItemType(spells[i]) != ITYPE_STAFF && CanCastSpellNow(unit,spells[i]) )
	movs	r0, r5	@, unit
	ldrb	r1, [r4]	@ _4, MEM[(u8 *)_24]
	bl	CanCastSpellNow		@
@ SpellSystem.c:491: 		if ( GetItemType(spells[i]) != ITYPE_STAFF && CanCastSpellNow(unit,spells[i]) )
	cmp	r0, #0	@ <retval>,
	beq	.L109		@,
.L105:
@ SpellSystem.c:497: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L112:
	.align	2
.L111:
	.word	GetItemType
	.size	CanUseAttackSpellsNow, .-CanUseAttackSpellsNow
	.align	1
	.global	GetNthUsableSpell
	.syntax unified
	.code	16
	.thumb_func
	.type	GetNthUsableSpell, %function
GetNthUsableSpell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}	@
@ SpellSystem.c:502: {
	movs	r7, r1	@ n, n
@ SpellSystem.c:503: 	u8* spells = SpellsGetter(unit,type);
	movs	r1, r2	@, type
@ SpellSystem.c:502: {
	movs	r6, r0	@ unit, unit
@ SpellSystem.c:503: 	u8* spells = SpellsGetter(unit,type);
	bl	SpellsGetter		@
@ SpellSystem.c:504: 	int k = -1;
	movs	r5, #1	@ k,
@ SpellSystem.c:505: 	for ( int i = 0 ; spells[i] ; i++ )
	movs	r4, #0	@ <retval>,
@ SpellSystem.c:503: 	u8* spells = SpellsGetter(unit,type);
	str	r0, [sp, #4]	@, %sfp
@ SpellSystem.c:504: 	int k = -1;
	rsbs	r5, r5, #0	@ k, k
.L114:
@ SpellSystem.c:505: 	for ( int i = 0 ; spells[i] ; i++ )
	ldr	r3, [sp, #4]	@ spells, %sfp
	ldrb	r1, [r3, r4]	@ _5, MEM[(u8 *)spells_16 + _22 * 1]
@ SpellSystem.c:505: 	for ( int i = 0 ; spells[i] ; i++ )
	cmp	r1, #0	@ _5,
	bne	.L117		@,
@ SpellSystem.c:513: 	return -1;
	movs	r4, #1	@ <retval>,
	rsbs	r4, r4, #0	@ <retval>, <retval>
.L113:
@ SpellSystem.c:514: }
	movs	r0, r4	@, <retval>
	@ sp needed	@
	pop	{r1, r2, r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L117:
@ SpellSystem.c:507: 		if ( CanCastSpellNow(unit,spells[i]) )
	movs	r0, r6	@, unit
	bl	CanCastSpellNow		@
@ SpellSystem.c:507: 		if ( CanCastSpellNow(unit,spells[i]) )
	cmp	r0, #0	@ _2,
	beq	.L115		@,
@ SpellSystem.c:509: 			k++;
	adds	r5, r5, #1	@ k,
@ SpellSystem.c:510: 			if ( k == n ) { return i; }
	cmp	r5, r7	@ k, n
	beq	.L113		@,
.L115:
@ SpellSystem.c:505: 	for ( int i = 0 ; spells[i] ; i++ )
	adds	r4, r4, #1	@ <retval>,
	b	.L114		@
	.size	GetNthUsableSpell, .-GetNthUsableSpell
	.align	1
	.global	DoesUnitKnowSpell
	.syntax unified
	.code	16
	.thumb_func
	.type	DoesUnitKnowSpell, %function
DoesUnitKnowSpell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ SpellSystem.c:527: {
	movs	r4, r1	@ spell, spell
@ SpellSystem.c:529: 	u8* spells = SpellsGetter(unit,-1);
	movs	r1, #1	@,
	rsbs	r1, r1, #0	@,
	bl	SpellsGetter		@
.L122:
@ SpellSystem.c:530: 	for ( int i = 0 ; spells[i] ; i++ )
	ldrb	r3, [r0]	@ _3, MEM[(u8 *)_15]
@ SpellSystem.c:530: 	for ( int i = 0 ; spells[i] ; i++ )
	cmp	r3, #0	@ _3,
	bne	.L124		@,
@ SpellSystem.c:534: 	return 0;
	movs	r0, r3	@ <retval>, _3
.L121:
@ SpellSystem.c:535: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L124:
@ SpellSystem.c:532: 		if ( spell == spells[i] ) { return 1; }
	adds	r0, r0, #1	@ ivtmp.275,
	cmp	r3, r4	@ _3, spell
	bne	.L122		@,
@ SpellSystem.c:532: 		if ( spell == spells[i] ) { return 1; }
	movs	r0, #1	@ <retval>,
	b	.L121		@
	.size	DoesUnitKnowSpell, .-DoesUnitKnowSpell
	.align	1
	.global	GetSpellType
	.syntax unified
	.code	16
	.thumb_func
	.type	GetSpellType, %function
GetSpellType:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ SpellSystem.c:539: 	int wType = GetItemType(spell);
	ldr	r3, .L132	@ tmp117,
	bl	.L14		@
	subs	r0, r0, #4	@ tmp118,
	cmp	r0, #3	@ tmp118,
	bhi	.L127		@,
	bl	__gnu_thumb1_case_uqi
.L129:
	.byte	(.L131-.L129)/2
	.byte	(.L128-.L129)/2
	.byte	(.L131-.L129)/2
	.byte	(.L128-.L129)/2
	.p2align 1
.L128:
@ SpellSystem.c:540: 	if ( wType == ITYPE_ANIMA || wType == ITYPE_DARK ) { return BLACK_MAGIC; }
	movs	r0, #1	@ <retval>,
.L126:
@ SpellSystem.c:543: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L127:
@ SpellSystem.c:542: 	else { return -1; }
	movs	r0, #1	@ <retval>,
	rsbs	r0, r0, #0	@ <retval>, <retval>
	b	.L126		@
.L131:
@ SpellSystem.c:539: 	int wType = GetItemType(spell);
	movs	r0, #2	@ <retval>,
	b	.L126		@
.L133:
	.align	2
.L132:
	.word	GetItemType
	.size	GetSpellType, .-GetSpellType
	.align	1
	.global	GetSpellCost
	.syntax unified
	.code	16
	.thumb_func
	.type	GetSpellCost, %function
GetSpellCost:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ SpellSystem.c:547: 	return GaidenSpellCostTable[GetItemIndex(spell)];
	ldr	r3, .L135	@ tmp119,
@ SpellSystem.c:548: }
	@ sp needed	@
@ SpellSystem.c:547: 	return GaidenSpellCostTable[GetItemIndex(spell)];
	bl	.L14		@
@ SpellSystem.c:547: 	return GaidenSpellCostTable[GetItemIndex(spell)];
	ldr	r3, .L135+4	@ tmp123,
	ldrb	r0, [r3, r0]	@ _7, GaidenSpellCostTable
@ SpellSystem.c:548: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L136:
	.align	2
.L135:
	.word	GetItemIndex
	.word	GaidenSpellCostTable
	.size	GetSpellCost, .-GetSpellCost
	.align	1
	.global	HasSufficientHP
	.syntax unified
	.code	16
	.thumb_func
	.type	HasSufficientHP, %function
HasSufficientHP:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ SpellSystem.c:448: 	return (unit->curHP > GetSpellCost(spell));
	movs	r4, #19	@ _2,
	ldrsb	r4, [r0, r4]	@ _2,* _2
@ SpellSystem.c:448: 	return (unit->curHP > GetSpellCost(spell));
	movs	r0, r1	@, spell
	bl	GetSpellCost		@
@ SpellSystem.c:448: 	return (unit->curHP > GetSpellCost(spell));
	movs	r3, #1	@ _4,
	cmp	r4, r0	@ _2, _3
	bgt	.L138		@,
	movs	r3, #0	@ _4,
.L138:
@ SpellSystem.c:449: }
	@ sp needed	@
	movs	r0, r3	@, _4
	pop	{r4}
	pop	{r1}
	bx	r1
	.size	HasSufficientHP, .-HasSufficientHP
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenMagicUMUsabilityExt, %function
GaidenMagicUMUsabilityExt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ UnitMenu.c:63:   if (gActiveUnit->state & US_CANTOING) {
	ldr	r7, .L154	@ tmp135,
	ldr	r3, [r7]	@ gActiveUnit, gActiveUnit
@ UnitMenu.c:63:   if (gActiveUnit->state & US_CANTOING) {
	ldr	r3, [r3, #12]	@ gActiveUnit.1_1->state, gActiveUnit.1_1->state
@ UnitMenu.c:63:   if (gActiveUnit->state & US_CANTOING) {
	lsls	r3, r3, #25	@ tmp156, gActiveUnit.1_1->state,
	bpl	.L140		@,
.L145:
@ UnitMenu.c:64:     return 3;
	movs	r0, #3	@ <retval>,
.L139:
@ UnitMenu.c:90: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L140:
@ UnitMenu.c:66:   u8 *validList = gGenericBuffer; // Let's build a list of valid spells.
	ldr	r6, .L154+4	@ validList,
	movs	r5, r0	@ ivtmp.297, spellList
	movs	r4, r6	@ validList, validList
.L142:
@ UnitMenu.c:67:   for (int i = 0; spellList[i]; i++) {
	ldrb	r1, [r5]	@ _12, MEM[(u8 *)_49]
@ UnitMenu.c:67:   for (int i = 0; spellList[i]; i++) {
	cmp	r1, #0	@ _12,
	bne	.L144		@,
@ UnitMenu.c:74:   *validList = 0;
	strb	r1, [r6]	@ _12, *validList_21
@ UnitMenu.c:78:   if (!*validList) {
	ldrb	r3, [r4]	@ MEM[(u8 *)&gGenericBuffer], MEM[(u8 *)&gGenericBuffer]
	cmp	r3, r1	@ MEM[(u8 *)&gGenericBuffer],
	beq	.L145		@,
.L146:
@ UnitMenu.c:81:   for (int i = 0; validList[i]; i++) {
	ldrb	r1, [r4]	@ _19, MEM[(u8 *)_45]
@ UnitMenu.c:81:   for (int i = 0; validList[i]; i++) {
	cmp	r1, #0	@ _19,
	bne	.L147		@,
@ UnitMenu.c:88:   return 2; // There were valid spells, but we don't have enough HP to cast any
	movs	r0, #2	@ <retval>,
	b	.L139		@
.L144:
@ UnitMenu.c:68:     if (!CanCastSpellNow(gActiveUnit, spellList[i] | 0xFF00)) {
	movs	r3, #255	@ tmp158,
	lsls	r3, r3, #8	@ tmp158, tmp158,
	ldr	r0, [r7]	@, gActiveUnit
	orrs	r1, r3	@ _7, tmp158
	bl	CanCastSpellNow		@
@ UnitMenu.c:68:     if (!CanCastSpellNow(gActiveUnit, spellList[i] | 0xFF00)) {
	cmp	r0, #0	@ _8,
	beq	.L143		@,
@ UnitMenu.c:71:     *validList = spellList[i];
	ldrb	r3, [r5]	@ _9, MEM[(u8 *)_49]
@ UnitMenu.c:71:     *validList = spellList[i];
	strb	r3, [r6]	@ _9, *validList_21
@ UnitMenu.c:72:     validList++;
	adds	r6, r6, #1	@ validList,
.L143:
	adds	r5, r5, #1	@ ivtmp.297,
	b	.L142		@
.L147:
@ UnitMenu.c:84:     if (HasSufficientHP(gActiveUnit, validList[i])) {
	ldr	r0, [r7]	@, gActiveUnit
	bl	HasSufficientHP		@
@ UnitMenu.c:84:     if (HasSufficientHP(gActiveUnit, validList[i])) {
	adds	r4, r4, #1	@ ivtmp.293,
	cmp	r0, #0	@ <retval>,
	beq	.L146		@,
	b	.L139		@
.L155:
	.align	2
.L154:
	.word	gActiveUnit
	.word	gGenericBuffer
	.size	GaidenMagicUMUsabilityExt, .-GaidenMagicUMUsabilityExt
	.align	1
	.global	GaidenBlackMagicUMUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenBlackMagicUMUsability, %function
GaidenBlackMagicUMUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ UnitMenu.c:13:   if (*DisableMenuOptionsRam & 1)
	movs	r1, #1	@ tmp123,
@ UnitMenu.c:11: {
	push	{r4, lr}	@
@ UnitMenu.c:13:   if (*DisableMenuOptionsRam & 1)
	ldr	r3, .L159	@ tmp119,
@ UnitMenu.c:13:   if (*DisableMenuOptionsRam & 1)
	ldrb	r3, [r3]	@, MEM[(u8 *)50337716B]
@ UnitMenu.c:14:     return 3; // For tutorials
	movs	r0, #3	@ <retval>,
@ UnitMenu.c:13:   if (*DisableMenuOptionsRam & 1)
	tst	r1, r3	@ tmp123, MEM[(u8 *)50337716B]
	bne	.L156		@,
@ UnitMenu.c:15:   return GaidenMagicUMUsabilityExt(SpellsGetter(
	ldr	r3, .L159+4	@ tmp127,
	ldr	r0, [r3]	@, gActiveUnit
	bl	SpellsGetter		@
@ UnitMenu.c:15:   return GaidenMagicUMUsabilityExt(SpellsGetter(
	bl	GaidenMagicUMUsabilityExt		@
.L156:
@ UnitMenu.c:18: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L160:
	.align	2
.L159:
	.word	50337716
	.word	gActiveUnit
	.size	GaidenBlackMagicUMUsability, .-GaidenBlackMagicUMUsability
	.align	1
	.global	CaptureGaidenBlackMagicUMUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	CaptureGaidenBlackMagicUMUsability, %function
CaptureGaidenBlackMagicUMUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ UnitMenu.c:31:   if (*DisableMenuOptionsRam & 2)
	movs	r4, #2	@ tmp125,
@ UnitMenu.c:31:   if (*DisableMenuOptionsRam & 2)
	ldr	r3, .L169	@ tmp121,
@ UnitMenu.c:31:   if (*DisableMenuOptionsRam & 2)
	ldrb	r3, [r3]	@, MEM[(u8 *)50337716B]
	tst	r4, r3	@ tmp125, MEM[(u8 *)50337716B]
	beq	.L162		@,
.L164:
@ UnitMenu.c:32:     return 3;
	movs	r0, #3	@ <retval>,
.L161:
@ UnitMenu.c:44: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L162:
@ UnitMenu.c:34:   if (!(Capture_Usability())) {
	ldr	r3, .L169+4	@ tmp129,
	bl	.L14		@
@ UnitMenu.c:34:   if (!(Capture_Usability())) {
	cmp	r0, #0	@ _3,
	beq	.L164		@,
@ UnitMenu.c:37:   if (AreBoxesFull()) {
	ldr	r3, .L169+8	@ tmp130,
	bl	.L14		@
	movs	r3, r0	@ _4,
@ UnitMenu.c:38:     return 2;
	movs	r0, r4	@ <retval>, tmp125
@ UnitMenu.c:37:   if (AreBoxesFull()) {
	cmp	r3, #0	@ _4,
	bne	.L161		@,
@ UnitMenu.c:41:   return GaidenMagicUMUsabilityExt(SpellsGetter(
	ldr	r3, .L169+12	@ tmp131,
	movs	r1, #1	@,
	ldr	r0, [r3]	@, gActiveUnit
	bl	SpellsGetter		@
@ UnitMenu.c:41:   return GaidenMagicUMUsabilityExt(SpellsGetter(
	bl	GaidenMagicUMUsabilityExt		@
@ UnitMenu.c:41:   return GaidenMagicUMUsabilityExt(SpellsGetter(
	b	.L161		@
.L170:
	.align	2
.L169:
	.word	50337716
	.word	Capture_Usability
	.word	AreBoxesFull
	.word	gActiveUnit
	.size	CaptureGaidenBlackMagicUMUsability, .-CaptureGaidenBlackMagicUMUsability
	.align	1
	.global	GaidenWhiteMagicUMUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenWhiteMagicUMUsability, %function
GaidenWhiteMagicUMUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ UnitMenu.c:59:   return GaidenMagicUMUsabilityExt(SpellsGetter(gActiveUnit, WHITE_MAGIC));
	ldr	r3, .L172	@ tmp117,
@ UnitMenu.c:60: }
	@ sp needed	@
@ UnitMenu.c:59:   return GaidenMagicUMUsabilityExt(SpellsGetter(gActiveUnit, WHITE_MAGIC));
	movs	r1, #2	@,
	ldr	r0, [r3]	@, gActiveUnit
	bl	SpellsGetter		@
@ UnitMenu.c:59:   return GaidenMagicUMUsabilityExt(SpellsGetter(gActiveUnit, WHITE_MAGIC));
	bl	GaidenMagicUMUsabilityExt		@
@ UnitMenu.c:60: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L173:
	.align	2
.L172:
	.word	gActiveUnit
	.size	GaidenWhiteMagicUMUsability, .-GaidenWhiteMagicUMUsability
	.align	1
	.global	SetRoundForSpell
	.syntax unified
	.code	16
	.thumb_func
	.type	SetRoundForSpell, %function
SetRoundForSpell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ SpellSystem.c:411: 	if ( HasSufficientHP(&unit->unit,unit->weapon) )
	movs	r5, r0	@ tmp134, unit
	adds	r5, r5, #72	@ tmp134,
@ SpellSystem.c:410: {
	movs	r4, r1	@ buffer, buffer
@ SpellSystem.c:411: 	if ( HasSufficientHP(&unit->unit,unit->weapon) )
	ldrh	r1, [r5]	@ _3,
	bl	HasSufficientHP		@
@ SpellSystem.c:411: 	if ( HasSufficientHP(&unit->unit,unit->weapon) )
	cmp	r0, #0	@ _4,
	beq	.L175		@,
@ SpellSystem.c:413: 		int cost = GetSpellCost(unit->weapon);
	ldrh	r0, [r5]	@ _16, MEM[(short unsigned int *)unit_7(D) + 72B]
	bl	GetSpellCost		@
@ SpellSystem.c:415: 		buffer->attributes |= BATTLE_HIT_ATTR_HPSTEAL; // "HP drain" bit.
	movs	r3, #128	@ tmp142,
	ldr	r2, [r4]	@ tmp141,* buffer
	lsls	r3, r3, #1	@ tmp142, tmp142,
	orrs	r3, r2	@ tmp140, tmp141
	str	r3, [r4]	@ tmp140,* buffer
@ SpellSystem.c:417: 		buffer->damage -= cost;
	ldrb	r3, [r4, #5]	@,
	subs	r3, r3, r0	@ tmp146, tmp143, cost
	strb	r3, [r4, #5]	@ tmp146, buffer_10(D)->damage
.L174:
@ SpellSystem.c:424: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L175:
@ SpellSystem.c:422: 		buffer->attributes |= BATTLE_HIT_ATTR_5; // This bit is checked in an external hack I've made.
	movs	r3, #32	@ tmp150,
	ldr	r2, [r4]	@ tmp149,* buffer
	orrs	r3, r2	@ tmp148, tmp149
	str	r3, [r4]	@ tmp148,* buffer
@ SpellSystem.c:424: }
	b	.L174		@
	.size	SetRoundForSpell, .-SetRoundForSpell
	.align	1
	.global	Proc_GaidenMagicHPCost
	.syntax unified
	.code	16
	.thumb_func
	.type	Proc_GaidenMagicHPCost, %function
Proc_GaidenMagicHPCost:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ SpellSystem.c:403: 	if ( GetUnitEquippedWeaponSlot(&attacker->unit) == 9 ) // Instead of checking against UsingSpellMenu, we do this to cover the case of defense.
	ldr	r3, .L179	@ tmp120,
@ SpellSystem.c:401: {
	movs	r4, r0	@ attacker, attacker
	movs	r5, r2	@ buffer, buffer
@ SpellSystem.c:403: 	if ( GetUnitEquippedWeaponSlot(&attacker->unit) == 9 ) // Instead of checking against UsingSpellMenu, we do this to cover the case of defense.
	bl	.L14		@
@ SpellSystem.c:403: 	if ( GetUnitEquippedWeaponSlot(&attacker->unit) == 9 ) // Instead of checking against UsingSpellMenu, we do this to cover the case of defense.
	cmp	r0, #9	@ _2,
	bne	.L177		@,
@ SpellSystem.c:405: 		SetRoundForSpell(attacker,buffer);
	movs	r1, r5	@, buffer
	movs	r0, r4	@, attacker
	bl	SetRoundForSpell		@
.L177:
@ SpellSystem.c:407: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L180:
	.align	2
.L179:
	.word	GetUnitEquippedWeaponSlot
	.size	Proc_GaidenMagicHPCost, .-Proc_GaidenMagicHPCost
	.align	1
	.global	GetFirstAttackSpell
	.syntax unified
	.code	16
	.thumb_func
	.type	GetFirstAttackSpell, %function
GetFirstAttackSpell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ SpellSystem.c:552: 	u8* spells = SpellsGetter(unit,-1);
	movs	r1, #1	@,
@ SpellSystem.c:551: {
	push	{r4, r5, r6, lr}	@
@ SpellSystem.c:552: 	u8* spells = SpellsGetter(unit,-1);
	rsbs	r1, r1, #0	@,
	bl	SpellsGetter		@
	movs	r4, r0	@ ivtmp.321, ivtmp.321
.L182:
@ SpellSystem.c:554: 	for ( int i = 0 ; spells[i] ; i++ )
	ldrb	r0, [r4]	@ _6, MEM[(u8 *)_5]
	movs	r5, r4	@ _5, ivtmp.321
@ SpellSystem.c:554: 	for ( int i = 0 ; spells[i] ; i++ )
	cmp	r0, #0	@ _6,
	beq	.L181		@,
@ SpellSystem.c:556: 		if ( GetItemType(spells[i]) != ITYPE_STAFF ) { spell = spells[i]; break; } // Ensure that the spell we could counter with would be an attack spell.
	ldr	r3, .L187	@ tmp124,
	bl	.L14		@
@ SpellSystem.c:556: 		if ( GetItemType(spells[i]) != ITYPE_STAFF ) { spell = spells[i]; break; } // Ensure that the spell we could counter with would be an attack spell.
	adds	r4, r4, #1	@ ivtmp.321,
	cmp	r0, #4	@ _2,
	beq	.L182		@,
@ SpellSystem.c:556: 		if ( GetItemType(spells[i]) != ITYPE_STAFF ) { spell = spells[i]; break; } // Ensure that the spell we could counter with would be an attack spell.
	ldrb	r0, [r5]	@ <retval>, *_5
.L181:
@ SpellSystem.c:559: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L188:
	.align	2
.L187:
	.word	GetItemType
	.size	GetFirstAttackSpell, .-GetFirstAttackSpell
	.align	1
	.global	NewGetUnitEquippedWeapon
	.syntax unified
	.code	16
	.thumb_func
	.type	NewGetUnitEquippedWeapon, %function
NewGetUnitEquippedWeapon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ SpellSystem.c:134: {
	movs	r5, r0	@ unit, unit
@ SpellSystem.c:518: 	for ( int i = 0 ; i < 5 ; i++ )
	movs	r4, #0	@ i,
.L192:
@ SpellSystem.c:520: 		if ( CanUnitUseWeapon(unit,unit->items[i]) ) { return unit->items[i]; }
	movs	r3, r5	@ _10, unit
@ SpellSystem.c:520: 		if ( CanUnitUseWeapon(unit,unit->items[i]) ) { return unit->items[i]; }
	lsls	r2, r4, #1	@ _9, i,
@ SpellSystem.c:520: 		if ( CanUnitUseWeapon(unit,unit->items[i]) ) { return unit->items[i]; }
	adds	r3, r3, #30	@ _10,
	ldrh	r1, [r3, r2]	@ _35, MEM[(short unsigned int *)_10 + _9 * 1]
	movs	r0, r5	@, unit
	ldr	r3, .L221	@ tmp140,
	bl	.L14		@
	subs	r6, r0, #0	@ _17, _17,
@ SpellSystem.c:520: 		if ( CanUnitUseWeapon(unit,unit->items[i]) ) { return unit->items[i]; }
	beq	.L190		@,
@ SpellSystem.c:520: 		if ( CanUnitUseWeapon(unit,unit->items[i]) ) { return unit->items[i]; }
	adds	r4, r4, #12	@ tmp141,
	lsls	r4, r4, #1	@ tmp142, tmp141,
	adds	r4, r5, r4	@ tmp143, unit, tmp142
	ldrh	r6, [r4, #6]	@ _17, *unit_23(D)
.L191:
@ SpellSystem.c:139: 	if (!UNIT_IS_VALID(unit)) return vanillaEquipped; 
	ldr	r3, [r5]	@ unit_23(D)->pCharacterData, unit_23(D)->pCharacterData
	cmp	r3, #0	@ unit_23(D)->pCharacterData,
	beq	.L199		@,
@ SpellSystem.c:143: 	int spell = GetFirstAttackSpell(unit);
	movs	r0, r5	@, unit
	bl	GetFirstAttackSpell		@
@ SpellSystem.c:146: 	if ( gChapterData.currentPhase == ( unit->index & 0xC0 ) )
	movs	r1, #11	@ _4,
@ SpellSystem.c:146: 	if ( gChapterData.currentPhase == ( unit->index & 0xC0 ) )
	movs	r3, #192	@ tmp146,
@ SpellSystem.c:146: 	if ( gChapterData.currentPhase == ( unit->index & 0xC0 ) )
	ldr	r4, .L221+4	@ tmp148,
@ SpellSystem.c:146: 	if ( gChapterData.currentPhase == ( unit->index & 0xC0 ) )
	ldrsb	r1, [r5, r1]	@ _4,* _4
@ SpellSystem.c:150: 		if ( !UsingSpellMenu && ( unit->index & 0xC0 ) ) { return vanillaEquipped; } // enemies wielding their vanilla wep 		
	ldr	r2, .L221+8	@ tmp147,
@ SpellSystem.c:146: 	if ( gChapterData.currentPhase == ( unit->index & 0xC0 ) )
	ldrb	r4, [r4, #15]	@ _3,
@ SpellSystem.c:150: 		if ( !UsingSpellMenu && ( unit->index & 0xC0 ) ) { return vanillaEquipped; } // enemies wielding their vanilla wep 		
	ldrb	r2, [r2]	@ pretmp_45, UsingSpellMenu
@ SpellSystem.c:146: 	if ( gChapterData.currentPhase == ( unit->index & 0xC0 ) )
	ands	r3, r1	@ _6, _4
@ SpellSystem.c:146: 	if ( gChapterData.currentPhase == ( unit->index & 0xC0 ) )
	cmp	r4, r3	@ _3, _6
	bne	.L194		@,
@ SpellSystem.c:150: 		if ( !UsingSpellMenu && ( unit->index & 0xC0 ) ) { return vanillaEquipped; } // enemies wielding their vanilla wep 		
	cmp	r2, #0	@ pretmp_45,
	bne	.L195		@,
@ SpellSystem.c:150: 		if ( !UsingSpellMenu && ( unit->index & 0xC0 ) ) { return vanillaEquipped; } // enemies wielding their vanilla wep 		
	cmp	r4, r2	@ _3,
	beq	.L201		@,
.L199:
@ SpellSystem.c:139: 	if (!UNIT_IS_VALID(unit)) return vanillaEquipped; 
	movs	r0, r6	@ <retval>, _17
.L189:
@ SpellSystem.c:211: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L190:
@ SpellSystem.c:518: 	for ( int i = 0 ; i < 5 ; i++ )
	adds	r4, r4, #1	@ i,
@ SpellSystem.c:518: 	for ( int i = 0 ; i < 5 ; i++ )
	cmp	r4, #5	@ i,
	bne	.L192		@,
	b	.L191		@
.L195:
@ SpellSystem.c:156: 			if ( unit->index == gBattleTarget.unit.index && GetItemType(SelectedSpell) == ITYPE_STAFF )
	ldr	r3, .L221+12	@ tmp153,
@ SpellSystem.c:156: 			if ( unit->index == gBattleTarget.unit.index && GetItemType(SelectedSpell) == ITYPE_STAFF )
	ldrb	r3, [r3, #11]	@ tmp154,
	lsls	r3, r3, #24	@ tmp154, tmp154,
	ldr	r4, .L221+16	@ tmp168,
	asrs	r3, r3, #24	@ tmp154, tmp154,
	cmp	r3, r1	@ tmp154, _4
	beq	.L198		@,
.L200:
@ SpellSystem.c:187: 				return SelectedSpell|0xFF00; 
	movs	r0, #255	@ tmp157,
	ldrb	r3, [r4]	@ _13, SelectedSpell
	lsls	r0, r0, #8	@ tmp157, tmp157,
.L219:
@ SpellSystem.c:208: 		return ( spell ? spell|0xFF00 : 0 );
	orrs	r0, r3	@ <retval>, tmp166
	b	.L189		@
.L198:
@ SpellSystem.c:156: 			if ( unit->index == gBattleTarget.unit.index && GetItemType(SelectedSpell) == ITYPE_STAFF )
	ldrb	r0, [r4]	@ _24, SelectedSpell
	ldr	r3, .L221+20	@ tmp160,
	bl	.L14		@
@ SpellSystem.c:156: 			if ( unit->index == gBattleTarget.unit.index && GetItemType(SelectedSpell) == ITYPE_STAFF )
	cmp	r0, #4	@ _11,
	bne	.L200		@,
	b	.L199		@
.L194:
@ SpellSystem.c:205: 		if ( !UsingSpellMenu && ( unit->index & 0xC0 ) ) { return vanillaEquipped; } // mmb - enemies wielding their vanilla wep 		
	cmp	r2, #0	@ pretmp_45,
	bne	.L201		@,
@ SpellSystem.c:205: 		if ( !UsingSpellMenu && ( unit->index & 0xC0 ) ) { return vanillaEquipped; } // mmb - enemies wielding their vanilla wep 		
	cmp	r3, r2	@ _6,
	bne	.L199		@,
@ SpellSystem.c:206: 		if ( !UsingSpellMenu && !( unit->index & 0xC0 ) ) { return ( spell ? spell|0xFF00 : 0 ); } // for mmb - show first spell 
	cmp	r0, r2	@ <retval>,
	beq	.L189		@,
.L218:
@ SpellSystem.c:208: 		return ( spell ? spell|0xFF00 : 0 );
	movs	r3, #255	@ tmp166,
	lsls	r3, r3, #8	@ tmp166, tmp166,
	b	.L219		@
.L201:
@ SpellSystem.c:208: 		return ( spell ? spell|0xFF00 : 0 );
	cmp	r0, #0	@ <retval>,
	beq	.L189		@,
	b	.L218		@
.L222:
	.align	2
.L221:
	.word	CanUnitUseWeapon
	.word	gChapterData
	.word	UsingSpellMenu
	.word	gBattleTarget
	.word	SelectedSpell
	.word	GetItemType
	.size	NewGetUnitEquippedWeapon, .-NewGetUnitEquippedWeapon
	.align	1
	.global	NewGetUnitEquippedWeaponSlot
	.syntax unified
	.code	16
	.thumb_func
	.type	NewGetUnitEquippedWeaponSlot, %function
NewGetUnitEquippedWeaponSlot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}	@
@ SpellSystem.c:218: {
	movs	r5, r0	@ unit, unit
@ SpellSystem.c:229: 	int spell = GetFirstAttackSpell(unit);
	bl	GetFirstAttackSpell		@
@ SpellSystem.c:232: 	if ( !(UsingSpellMenu) && unit->index != gBattleTarget.unit.index && (gBattleStats.config & (BATTLE_CONFIG_REAL|BATTLE_CONFIG_SIMULATE)) ) { 
	ldr	r3, .L259	@ tmp151,
@ SpellSystem.c:232: 	if ( !(UsingSpellMenu) && unit->index != gBattleTarget.unit.index && (gBattleStats.config & (BATTLE_CONFIG_REAL|BATTLE_CONFIG_SIMULATE)) ) { 
	ldrb	r4, [r3]	@ UsingSpellMenu, UsingSpellMenu
@ SpellSystem.c:229: 	int spell = GetFirstAttackSpell(unit);
	movs	r7, r0	@ spell,
	ldr	r6, .L259+4	@ tmp188,
@ SpellSystem.c:232: 	if ( !(UsingSpellMenu) && unit->index != gBattleTarget.unit.index && (gBattleStats.config & (BATTLE_CONFIG_REAL|BATTLE_CONFIG_SIMULATE)) ) { 
	cmp	r4, #0	@ UsingSpellMenu,
	bne	.L224		@,
@ SpellSystem.c:232: 	if ( !(UsingSpellMenu) && unit->index != gBattleTarget.unit.index && (gBattleStats.config & (BATTLE_CONFIG_REAL|BATTLE_CONFIG_SIMULATE)) ) { 
	movs	r2, #11	@ tmp154,
@ SpellSystem.c:232: 	if ( !(UsingSpellMenu) && unit->index != gBattleTarget.unit.index && (gBattleStats.config & (BATTLE_CONFIG_REAL|BATTLE_CONFIG_SIMULATE)) ) { 
	ldr	r3, .L259+8	@ tmp153,
@ SpellSystem.c:232: 	if ( !(UsingSpellMenu) && unit->index != gBattleTarget.unit.index && (gBattleStats.config & (BATTLE_CONFIG_REAL|BATTLE_CONFIG_SIMULATE)) ) { 
	ldrb	r3, [r3, #11]	@ tmp155,
	ldrsb	r2, [r5, r2]	@ tmp154,
	lsls	r3, r3, #24	@ tmp155, tmp155,
	asrs	r3, r3, #24	@ tmp155, tmp155,
	cmp	r2, r3	@ tmp154, tmp155
	beq	.L225		@,
@ SpellSystem.c:232: 	if ( !(UsingSpellMenu) && unit->index != gBattleTarget.unit.index && (gBattleStats.config & (BATTLE_CONFIG_REAL|BATTLE_CONFIG_SIMULATE)) ) { 
	ldr	r3, .L259+12	@ tmp156,
	str	r3, [sp, #4]	@ tmp156, %sfp
@ SpellSystem.c:232: 	if ( !(UsingSpellMenu) && unit->index != gBattleTarget.unit.index && (gBattleStats.config & (BATTLE_CONFIG_REAL|BATTLE_CONFIG_SIMULATE)) ) { 
	ldrh	r3, [r3]	@, gBattleStats
	lsls	r3, r3, #30	@ tmp199, gBattleStats,
	beq	.L225		@,
	movs	r7, r5	@ ivtmp.344, unit
	adds	r7, r7, #30	@ ivtmp.344,
.L229:
@ SpellSystem.c:236: 			if ( CanUnitUseWeapon(unit,unit->items[i]) )
	movs	r0, r5	@, unit
	ldrh	r1, [r7]	@ _6, MEM[(short unsigned int *)_72]
	bl	.L15		@
@ SpellSystem.c:236: 			if ( CanUnitUseWeapon(unit,unit->items[i]) )
	cmp	r0, #0	@ _7,
	beq	.L227		@,
@ SpellSystem.c:239: 				if ( gCan_Attack_Target(unit->items[i],gBattleStats.range,unit) ) { return i; }
	ldr	r3, [sp, #4]	@ tmp156, %sfp
	ldrb	r1, [r3, #2]	@ _12,
	ldr	r3, .L259+16	@ tmp169,
	movs	r2, r5	@, unit
	ldrh	r0, [r7]	@ _10, MEM[(short unsigned int *)_72]
	ldr	r3, [r3]	@ gCan_Attack_Target, gCan_Attack_Target
	bl	.L14		@
@ SpellSystem.c:239: 				if ( gCan_Attack_Target(unit->items[i],gBattleStats.range,unit) ) { return i; }
	cmp	r0, #0	@ _13,
	bne	.L223		@,
@ SpellSystem.c:233: 		for ( int i = 0 ; i < 5 ; i++ )
	adds	r4, r4, #1	@ <retval>,
@ SpellSystem.c:233: 		for ( int i = 0 ; i < 5 ; i++ )
	adds	r7, r7, #2	@ ivtmp.344,
	cmp	r4, #5	@ <retval>,
	bne	.L229		@,
.L227:
@ SpellSystem.c:243: 		return -1; 
	movs	r4, #1	@ <retval>,
	rsbs	r4, r4, #0	@ <retval>, <retval>
	b	.L223		@
.L224:
@ SpellSystem.c:249: 	if ( UsingSpellMenu && CanUnitUseWeapon(unit,SelectedSpell) && !(unit->index & 0xC0) ) { 
	ldr	r3, .L259+20	@ tmp171,
	movs	r0, r5	@, unit
	ldrb	r1, [r3]	@ _15, SelectedSpell
	bl	.L15		@
@ SpellSystem.c:249: 	if ( UsingSpellMenu && CanUnitUseWeapon(unit,SelectedSpell) && !(unit->index & 0xC0) ) { 
	cmp	r0, #0	@ _16,
	beq	.L225		@,
@ SpellSystem.c:249: 	if ( UsingSpellMenu && CanUnitUseWeapon(unit,SelectedSpell) && !(unit->index & 0xC0) ) { 
	movs	r2, #11	@ _61,
@ SpellSystem.c:249: 	if ( UsingSpellMenu && CanUnitUseWeapon(unit,SelectedSpell) && !(unit->index & 0xC0) ) { 
	movs	r3, #192	@ tmp176,
@ SpellSystem.c:249: 	if ( UsingSpellMenu && CanUnitUseWeapon(unit,SelectedSpell) && !(unit->index & 0xC0) ) { 
	ldrsb	r2, [r5, r2]	@ _61,* _61
@ SpellSystem.c:249: 	if ( UsingSpellMenu && CanUnitUseWeapon(unit,SelectedSpell) && !(unit->index & 0xC0) ) { 
	tst	r2, r3	@ _61, tmp176
	bne	.L231		@,
.L236:
@ SpellSystem.c:251: 		return 9;
	movs	r4, #9	@ <retval>,
.L223:
@ SpellSystem.c:360: }
	@ sp needed	@
	movs	r0, r4	@, <retval>
	pop	{r1, r2, r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L225:
@ SpellSystem.c:259: 	if ( unit->index & 0xC0 ) {
	movs	r2, #11	@ _21,
	ldrsb	r2, [r5, r2]	@ _21,* _21
@ SpellSystem.c:259: 	if ( unit->index & 0xC0 ) {
	movs	r3, #192	@ tmp178,
	movs	r4, r2	@ <retval>, _21
	ands	r4, r3	@ <retval>, tmp178
@ SpellSystem.c:259: 	if ( unit->index & 0xC0 ) {
	tst	r2, r3	@ _21, tmp178
	beq	.L256		@,
.L231:
@ SpellSystem.c:260: 		for ( int i = 0 ; i < 5 ; i++ )
	movs	r4, #0	@ <retval>,
.L232:
@ SpellSystem.c:262: 				if ( CanUnitUseWeapon(unit,unit->items[i]) ) { return i; }
	movs	r3, r5	@ _76, unit
@ SpellSystem.c:262: 				if ( CanUnitUseWeapon(unit,unit->items[i]) ) { return i; }
	lsls	r2, r4, #1	@ _75, <retval>,
@ SpellSystem.c:262: 				if ( CanUnitUseWeapon(unit,unit->items[i]) ) { return i; }
	adds	r3, r3, #30	@ _76,
	movs	r0, r5	@, unit
	ldrh	r1, [r3, r2]	@ _24, MEM[(short unsigned int *)_76 + _75 * 1]
	bl	.L15		@
@ SpellSystem.c:262: 				if ( CanUnitUseWeapon(unit,unit->items[i]) ) { return i; }
	cmp	r0, #0	@ _25,
	bne	.L223		@,
@ SpellSystem.c:260: 		for ( int i = 0 ; i < 5 ; i++ )
	adds	r4, r4, #1	@ <retval>,
@ SpellSystem.c:260: 		for ( int i = 0 ; i < 5 ; i++ )
	cmp	r4, #5	@ <retval>,
	bne	.L232		@,
	b	.L227		@
.L256:
@ SpellSystem.c:271: 	if ( gChapterData.currentPhase != ( unit->index & 0xC0 ) && ( CanUnitUseWeapon( unit, spell ) ) ) { return ( spell ? 9 : 0 ); } // Enemy phase - Always counter attack with first spell.
	ldr	r3, .L259+24	@ tmp183,
@ SpellSystem.c:271: 	if ( gChapterData.currentPhase != ( unit->index & 0xC0 ) && ( CanUnitUseWeapon( unit, spell ) ) ) { return ( spell ? 9 : 0 ); } // Enemy phase - Always counter attack with first spell.
	ldrb	r3, [r3, #15]	@ tmp184,
	cmp	r3, #0	@ tmp184,
	beq	.L234		@,
@ SpellSystem.c:271: 	if ( gChapterData.currentPhase != ( unit->index & 0xC0 ) && ( CanUnitUseWeapon( unit, spell ) ) ) { return ( spell ? 9 : 0 ); } // Enemy phase - Always counter attack with first spell.
	movs	r1, r7	@, spell
	movs	r0, r5	@, unit
	bl	.L15		@
@ SpellSystem.c:271: 	if ( gChapterData.currentPhase != ( unit->index & 0xC0 ) && ( CanUnitUseWeapon( unit, spell ) ) ) { return ( spell ? 9 : 0 ); } // Enemy phase - Always counter attack with first spell.
	cmp	r0, #0	@ _28,
	beq	.L234		@,
.L258:
@ SpellSystem.c:278: 	if ( CanUnitUseWeapon( unit, spell ) ) { return ( spell ? 9 : 0 ); } // Used in stat screen by players. 
	cmp	r7, #0	@ spell,
	bne	.L236		@,
	b	.L223		@
.L234:
@ SpellSystem.c:278: 	if ( CanUnitUseWeapon( unit, spell ) ) { return ( spell ? 9 : 0 ); } // Used in stat screen by players. 
	movs	r1, r7	@, spell
	movs	r0, r5	@, unit
	bl	.L15		@
@ SpellSystem.c:278: 	if ( CanUnitUseWeapon( unit, spell ) ) { return ( spell ? 9 : 0 ); } // Used in stat screen by players. 
	cmp	r0, #0	@ _29,
	bne	.L258		@,
	b	.L227		@
.L260:
	.align	2
.L259:
	.word	UsingSpellMenu
	.word	CanUnitUseWeapon
	.word	gBattleTarget
	.word	gBattleStats
	.word	gCan_Attack_Target
	.word	SelectedSpell
	.word	gChapterData
	.size	NewGetUnitEquippedWeaponSlot, .-NewGetUnitEquippedWeaponSlot
	.align	1
	.global	Target_Routine_For_Fortify
	.syntax unified
	.code	16
	.thumb_func
	.type	Target_Routine_For_Fortify, %function
Target_Routine_For_Fortify:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ SpellSystem.c:566: 	if ( UsingSpellMenu )
	ldr	r3, .L264	@ tmp124,
@ SpellSystem.c:566: 	if ( UsingSpellMenu )
	ldrb	r3, [r3]	@ UsingSpellMenu, UsingSpellMenu
	cmp	r3, #0	@ UsingSpellMenu,
	beq	.L262		@,
@ SpellSystem.c:568: 		item = SelectedSpell|0xFF00;
	ldr	r3, .L264+4	@ tmp126,
	ldrb	r2, [r3]	@ SelectedSpell, SelectedSpell
@ SpellSystem.c:568: 		item = SelectedSpell|0xFF00;
	movs	r3, #255	@ tmp129,
	lsls	r3, r3, #8	@ tmp129, tmp129,
	orrs	r2, r3	@ item, tmp129
.L263:
@ SpellSystem.c:574: 	gHealStaff_RangeSetup(unit,0,item);
	ldr	r3, .L264+8	@ tmp138,
@ SpellSystem.c:575: }
	@ sp needed	@
@ SpellSystem.c:574: 	gHealStaff_RangeSetup(unit,0,item);
	movs	r1, #0	@,
	ldr	r3, [r3]	@ gHealStaff_RangeSetup, gHealStaff_RangeSetup
	bl	.L14		@
@ SpellSystem.c:575: }
	pop	{r4}
	pop	{r0}
	bx	r0
.L262:
@ SpellSystem.c:572: 		item = unit->unit.items[gActionData.itemSlotIndex];
	ldr	r3, .L264+12	@ tmp132,
	ldrb	r3, [r3, #18]	@ _6,
@ SpellSystem.c:572: 		item = unit->unit.items[gActionData.itemSlotIndex];
	adds	r3, r3, #12	@ tmp134,
	lsls	r3, r3, #1	@ tmp135, tmp134,
	adds	r3, r0, r3	@ tmp136, unit, tmp135
	ldrh	r2, [r3, #6]	@ item, *unit_11(D)
	b	.L263		@
.L265:
	.align	2
.L264:
	.word	UsingSpellMenu
	.word	SelectedSpell
	.word	gHealStaff_RangeSetup
	.word	gActionData
	.size	Target_Routine_For_Fortify, .-Target_Routine_For_Fortify
	.align	1
	.global	GaidenZeroOutSpellVariables
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenZeroOutSpellVariables, %function
GaidenZeroOutSpellVariables:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ SpellSystem.c:579: 	UsingSpellMenu = 0;
	movs	r3, #0	@ tmp115,
@ SpellSystem.c:582: }
	@ sp needed	@
@ SpellSystem.c:579: 	UsingSpellMenu = 0;
	ldr	r2, .L267	@ tmp114,
	strb	r3, [r2]	@ tmp115, UsingSpellMenu
@ SpellSystem.c:580: 	SelectedSpell = 0;
	ldr	r2, .L267+4	@ tmp117,
	strb	r3, [r2]	@ tmp115, SelectedSpell
@ SpellSystem.c:581: 	DidSelectSpell = 0;
	ldr	r2, .L267+8	@ tmp120,
	strb	r3, [r2]	@ tmp115, DidSelectSpell
@ SpellSystem.c:582: }
	bx	lr
.L268:
	.align	2
.L267:
	.word	UsingSpellMenu
	.word	SelectedSpell
	.word	DidSelectSpell
	.size	GaidenZeroOutSpellVariables, .-GaidenZeroOutSpellVariables
	.align	1
	.global	GetUnitRangeMaskForSpells
	.syntax unified
	.code	16
	.thumb_func
	.type	GetUnitRangeMaskForSpells, %function
GetUnitRangeMaskForSpells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}	@
@ RangeDisplay.c:42: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	ldr	r3, .L284	@ tmp131,
@ RangeDisplay.c:40: {
	str	r1, [sp, #4]	@ usability, %sfp
@ RangeDisplay.c:42: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	ldrb	r1, [r3]	@ UsingSpellMenu.63_1, UsingSpellMenu
@ RangeDisplay.c:40: {
	movs	r7, r0	@ unit, unit
@ RangeDisplay.c:42: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	cmp	r1, #0	@ UsingSpellMenu.63_1,
	bne	.L270		@,
@ RangeDisplay.c:42: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	subs	r1, r1, #1	@ iftmp.62_16,
.L270:
@ RangeDisplay.c:41: 	long long current = 0;
	movs	r5, #0	@ <retval>,
@ RangeDisplay.c:42: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	movs	r0, r7	@, unit
	bl	SpellsGetter		@
@ RangeDisplay.c:41: 	long long current = 0;
	movs	r4, r5	@ <retval>, <retval>
@ RangeDisplay.c:42: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	str	r0, [sp]	@ ivtmp.364, %sfp
.L271:
@ RangeDisplay.c:43: 	for ( int i = 0 ; spells[i] ; i++ )
	ldr	r3, [sp]	@ ivtmp.364, %sfp
	ldrb	r6, [r3]	@ _12, MEM[(u8 *)_38]
@ RangeDisplay.c:43: 	for ( int i = 0 ; spells[i] ; i++ )
	cmp	r6, #0	@ _12,
	bne	.L276		@,
@ RangeDisplay.c:56: }
	movs	r0, r5	@, <retval>
	movs	r1, r4	@, <retval>
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r2}
	bx	r2
.L276:
@ RangeDisplay.c:45: 		int spell = spells[i]|0xFF00;
	movs	r3, #255	@ tmp157,
	lsls	r3, r3, #8	@ tmp157, tmp157,
	orrs	r6, r3	@ spell, tmp157
@ RangeDisplay.c:46: 		if ( usability == NULL )
	ldr	r3, [sp, #4]	@ usability, %sfp
@ RangeDisplay.c:48: 			if ( CanCastSpell(unit,spell) ) { current = IncorporateNewRange(current,gGet_Item_Range(unit,spell)); }
	movs	r1, r6	@, spell
	movs	r0, r7	@, unit
@ RangeDisplay.c:46: 		if ( usability == NULL )
	cmp	r3, #0	@ usability,
	bne	.L272		@,
@ RangeDisplay.c:48: 			if ( CanCastSpell(unit,spell) ) { current = IncorporateNewRange(current,gGet_Item_Range(unit,spell)); }
	bl	CanCastSpell		@
.L283:
@ RangeDisplay.c:52: 			if ( usability(unit,spell) ) { current = IncorporateNewRange(current,gGet_Item_Range(unit,spell)); }
	cmp	r0, #0	@ _7,
	beq	.L274		@,
@ RangeDisplay.c:52: 			if ( usability(unit,spell) ) { current = IncorporateNewRange(current,gGet_Item_Range(unit,spell)); }
	ldr	r3, .L284+4	@ tmp135,
	movs	r1, r6	@, spell
	ldr	r3, [r3]	@ gGet_Item_Range, gGet_Item_Range
	movs	r0, r7	@, unit
	bl	.L14		@
	movs	r2, r0	@ _9,
	movs	r3, r1	@ _9,
@ RangeDisplay.c:52: 			if ( usability(unit,spell) ) { current = IncorporateNewRange(current,gGet_Item_Range(unit,spell)); }
	movs	r0, r5	@, <retval>
	movs	r1, r4	@, <retval>
	bl	IncorporateNewRange		@
	movs	r5, r0	@ <retval>, <retval>
	movs	r4, r1	@ <retval>, <retval>
.L274:
	ldr	r3, [sp]	@ ivtmp.364, %sfp
	adds	r3, r3, #1	@ ivtmp.364,
	str	r3, [sp]	@ ivtmp.364, %sfp
	b	.L271		@
.L272:
@ RangeDisplay.c:52: 			if ( usability(unit,spell) ) { current = IncorporateNewRange(current,gGet_Item_Range(unit,spell)); }
	ldr	r3, [sp, #4]	@ usability, %sfp
	bl	.L14		@
	b	.L283		@
.L285:
	.align	2
.L284:
	.word	UsingSpellMenu
	.word	gGet_Item_Range
	.size	GetUnitRangeMaskForSpells, .-GetUnitRangeMaskForSpells
	.align	1
	.global	Return_Range_Bitfield
	.syntax unified
	.code	16
	.thumb_func
	.type	Return_Range_Bitfield, %function
Return_Range_Bitfield:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	sub	sp, sp, #20	@,,
@ RangeDisplay.c:9: {
	movs	r6, r0	@ unit, unit
	str	r1, [sp, #4]	@ slot, %sfp
	str	r2, [sp, #8]	@ usability, %sfp
@ RangeDisplay.c:11: 	if ( slot == -1 || slot == -2 )
	adds	r3, r1, #3	@ tmp165, slot,
	bls	.L287		@,
@ RangeDisplay.c:10: 	long long current = 0;
	movs	r5, #0	@ <retval>,
	movs	r3, r0	@ _49, unit
	movs	r7, r0	@ ivtmp.374, unit
	movs	r4, r5	@ <retval>, <retval>
	adds	r3, r3, #40	@ _49,
	str	r3, [sp, #12]	@ _49, %sfp
	adds	r7, r7, #30	@ ivtmp.374,
.L288:
@ RangeDisplay.c:14: 		for ( int i = 0 ; i < 5 && unit->items[i] ; i++ )
	ldrh	r1, [r7]	@ _8, MEM[(short unsigned int *)_46]
@ RangeDisplay.c:14: 		for ( int i = 0 ; i < 5 && unit->items[i] ; i++ )
	cmp	r1, #0	@ _8,
	beq	.L290		@,
@ RangeDisplay.c:16: 			if ( usability(unit,unit->items[i]) )
	movs	r0, r6	@, unit
	ldr	r3, [sp, #8]	@ usability, %sfp
	bl	.L14		@
@ RangeDisplay.c:16: 			if ( usability(unit,unit->items[i]) )
	cmp	r0, #0	@ _3,
	beq	.L289		@,
@ RangeDisplay.c:18: 				current = IncorporateNewRange(current,gGet_Item_Range(unit,unit->items[i]));
	ldr	r3, .L299	@ tmp135,
	movs	r0, r6	@, unit
	ldr	r3, [r3]	@ gGet_Item_Range, gGet_Item_Range
	ldrh	r1, [r7]	@ _6, MEM[(short unsigned int *)_46]
	bl	.L14		@
	movs	r2, r0	@ _7,
	movs	r3, r1	@ _7,
@ RangeDisplay.c:18: 				current = IncorporateNewRange(current,gGet_Item_Range(unit,unit->items[i]));
	movs	r0, r5	@, <retval>
	movs	r1, r4	@, <retval>
	bl	IncorporateNewRange		@
	movs	r5, r0	@ <retval>, <retval>
	movs	r4, r1	@ <retval>, <retval>
.L289:
@ RangeDisplay.c:14: 		for ( int i = 0 ; i < 5 && unit->items[i] ; i++ )
	ldr	r3, [sp, #12]	@ _49, %sfp
	adds	r7, r7, #2	@ ivtmp.374,
	cmp	r7, r3	@ ivtmp.374, _49
	bne	.L288		@,
.L290:
@ RangeDisplay.c:21: 		return ( slot == -1 ? IncorporateNewRange(current,GetUnitRangeMaskForSpells(unit,usability)) : current );
	ldr	r3, [sp, #4]	@ slot, %sfp
	adds	r3, r3, #1	@ tmp166, slot,
	bne	.L286		@,
@ RangeDisplay.c:21: 		return ( slot == -1 ? IncorporateNewRange(current,GetUnitRangeMaskForSpells(unit,usability)) : current );
	movs	r0, r6	@, unit
	ldr	r1, [sp, #8]	@, %sfp
	bl	GetUnitRangeMaskForSpells		@
	movs	r2, r0	@ _9,
	movs	r3, r1	@ _9,
@ RangeDisplay.c:21: 		return ( slot == -1 ? IncorporateNewRange(current,GetUnitRangeMaskForSpells(unit,usability)) : current );
	movs	r0, r5	@, <retval>
	movs	r1, r4	@, <retval>
	bl	IncorporateNewRange		@
.L298:
@ RangeDisplay.c:33: 			return GetUnitRangeMaskForSpells(unit,usability);
	movs	r5, r0	@ <retval>, <retval>
	movs	r4, r1	@ <retval>, <retval>
.L286:
@ RangeDisplay.c:36: }
	movs	r0, r5	@, <retval>
	movs	r1, r4	@, <retval>
	add	sp, sp, #20	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r2}
	bx	r2
.L287:
@ RangeDisplay.c:26: 		if ( slot != 9 )
	ldr	r3, [sp, #4]	@ slot, %sfp
	cmp	r3, #9	@ slot,
	beq	.L293		@,
@ RangeDisplay.c:28: 			return gGet_Item_Range(unit,unit->items[slot]);
	adds	r3, r3, #12	@ slot,
	lsls	r3, r3, #1	@ tmp138, tmp137,
	adds	r3, r0, r3	@ tmp139, unit, tmp138
@ RangeDisplay.c:28: 			return gGet_Item_Range(unit,unit->items[slot]);
	ldrh	r1, [r3, #6]	@ _12, *unit_24(D)
	ldr	r3, .L299	@ tmp142,
	ldr	r3, [r3]	@ gGet_Item_Range, gGet_Item_Range
	bl	.L14		@
	b	.L298		@
.L293:
@ RangeDisplay.c:33: 			return GetUnitRangeMaskForSpells(unit,usability);
	ldr	r1, [sp, #8]	@, %sfp
	bl	GetUnitRangeMaskForSpells		@
	b	.L298		@
.L300:
	.align	2
.L299:
	.word	gGet_Item_Range
	.size	Return_Range_Bitfield, .-Return_Range_Bitfield
	.align	1
	.global	All_Spells_One_Square
	.syntax unified
	.code	16
	.thumb_func
	.type	All_Spells_One_Square, %function
All_Spells_One_Square:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ RangeDisplay.c:81: {
	movs	r4, r0	@ unit, unit
@ RangeDisplay.c:82: 	asm("push { r7 }");
	.syntax divided
@ 82 "RangeDisplay.c" 1
	push { r7 }
@ 0 "" 2
@ RangeDisplay.c:33: 			return GetUnitRangeMaskForSpells(unit,usability);
	.thumb
	.syntax unified
	bl	GetUnitRangeMaskForSpells		@
	movs	r2, r0	@ _13,
	movs	r3, r1	@ _13,
@ RangeDisplay.c:84: 	asm("mov r7, #0x00\nmov r12, r7"); // Write_Range takes this parameter through r12?
	.syntax divided
@ 84 "RangeDisplay.c" 1
	mov r7, #0x00
mov r12, r7
@ 0 "" 2
@ RangeDisplay.c:85: 	gWrite_Range(unit->xPos,unit->yPos,mask);
	.thumb
	.syntax unified
	movs	r1, #17	@ _5,
	movs	r0, #16	@ _3,
	ldrsb	r1, [r4, r1]	@ _5,* _5
	ldrsb	r0, [r4, r0]	@ _3,* _3
	ldr	r4, .L302	@ tmp124,
	ldr	r4, [r4]	@ gWrite_Range, gWrite_Range
	bl	.L16		@
@ RangeDisplay.c:86: 	asm("pop { r7 }");
	.syntax divided
@ 86 "RangeDisplay.c" 1
	pop { r7 }
@ 0 "" 2
@ RangeDisplay.c:87: }
	.thumb
	.syntax unified
	@ sp needed	@
	pop	{r4}
	pop	{r0}
	bx	r0
.L303:
	.align	2
.L302:
	.word	gWrite_Range
	.size	All_Spells_One_Square, .-All_Spells_One_Square
	.align	1
	.global	GaidenBlackMagicUMHover
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenBlackMagicUMHover, %function
GaidenBlackMagicUMHover:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ UnitMenu.c:125:   UsingSpellMenu = BLACK_MAGIC;
	movs	r5, #1	@ tmp122,
	ldr	r3, .L308	@ tmp121,
	strb	r5, [r3]	@ tmp122, UsingSpellMenu
@ UnitMenu.c:126:   BmMapFill(gMapMovement, -1);
	ldr	r3, .L308+4	@ tmp124,
	ldr	r4, .L308+8	@ tmp125,
	ldr	r0, [r3]	@, gMapMovement
	movs	r1, #255	@,
	bl	.L16		@
@ UnitMenu.c:127:   BmMapFill(gMapRange, 0);
	ldr	r3, .L308+12	@ tmp126,
	movs	r1, #0	@,
	ldr	r0, [r3]	@, gMapRange
	bl	.L16		@
@ UnitMenu.c:128:   if (CanUseAttackSpellsNow(gActiveUnit,
	ldr	r4, .L308+16	@ tmp128,
	movs	r1, r5	@, tmp122
	ldr	r0, [r4]	@, gActiveUnit
	bl	CanUseAttackSpellsNow		@
	subs	r3, r0, #0	@ _4,,
@ UnitMenu.c:132:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckNotStaff);
	ldr	r0, [r4]	@ pretmp_17, gActiveUnit
	ldr	r4, .L308+20	@ tmp135,
@ UnitMenu.c:128:   if (CanUseAttackSpellsNow(gActiveUnit,
	beq	.L305		@,
@ UnitMenu.c:132:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckNotStaff);
	ldr	r1, .L308+24	@ tmp130,
	bl	All_Spells_One_Square		@
@ UnitMenu.c:133:     DisplayMoveRangeGraphics(3);
	movs	r0, #3	@,
.L307:
@ UnitMenu.c:143: }
	@ sp needed	@
@ UnitMenu.c:136:     DisplayMoveRangeGraphics(5);
	bl	.L16		@
@ UnitMenu.c:143: }
	movs	r0, #0	@,
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L305:
@ UnitMenu.c:135:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckStaff);
	ldr	r1, .L308+28	@ tmp132,
	bl	All_Spells_One_Square		@
@ UnitMenu.c:136:     DisplayMoveRangeGraphics(5);
	movs	r0, #5	@,
	b	.L307		@
.L309:
	.align	2
.L308:
	.word	UsingSpellMenu
	.word	gMapMovement
	.word	BmMapFill
	.word	gMapRange
	.word	gActiveUnit
	.word	DisplayMoveRangeGraphics
	.word	RangeUsabilityCheckNotStaff
	.word	RangeUsabilityCheckStaff
	.size	GaidenBlackMagicUMHover, .-GaidenBlackMagicUMHover
	.align	1
	.global	GaidenWhiteMagicUMHover
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenWhiteMagicUMHover, %function
GaidenWhiteMagicUMHover:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ UnitMenu.c:146:   UsingSpellMenu = WHITE_MAGIC;
	movs	r5, #2	@ tmp122,
	ldr	r3, .L314	@ tmp121,
	strb	r5, [r3]	@ tmp122, UsingSpellMenu
@ UnitMenu.c:147:   BmMapFill(gMapMovement, -1);
	ldr	r3, .L314+4	@ tmp124,
	ldr	r4, .L314+8	@ tmp125,
	ldr	r0, [r3]	@, gMapMovement
	movs	r1, #255	@,
	bl	.L16		@
@ UnitMenu.c:148:   BmMapFill(gMapRange, 0);
	ldr	r3, .L314+12	@ tmp126,
	movs	r1, #0	@,
	ldr	r0, [r3]	@, gMapRange
	bl	.L16		@
@ UnitMenu.c:149:   if (CanUseAttackSpellsNow(gActiveUnit,
	ldr	r4, .L314+16	@ tmp128,
	movs	r1, r5	@, tmp122
	ldr	r0, [r4]	@, gActiveUnit
	bl	CanUseAttackSpellsNow		@
	subs	r3, r0, #0	@ _4,,
@ UnitMenu.c:153:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckNotStaff);
	ldr	r0, [r4]	@ pretmp_17, gActiveUnit
	ldr	r4, .L314+20	@ tmp135,
@ UnitMenu.c:149:   if (CanUseAttackSpellsNow(gActiveUnit,
	beq	.L311		@,
@ UnitMenu.c:153:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckNotStaff);
	ldr	r1, .L314+24	@ tmp130,
	bl	All_Spells_One_Square		@
@ UnitMenu.c:154:     DisplayMoveRangeGraphics(3);
	movs	r0, #3	@,
.L313:
@ UnitMenu.c:160: }
	@ sp needed	@
@ UnitMenu.c:157:     DisplayMoveRangeGraphics(5);
	bl	.L16		@
@ UnitMenu.c:160: }
	movs	r0, #0	@,
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L311:
@ UnitMenu.c:156:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckStaff);
	ldr	r1, .L314+28	@ tmp132,
	bl	All_Spells_One_Square		@
@ UnitMenu.c:157:     DisplayMoveRangeGraphics(5);
	movs	r0, #5	@,
	b	.L313		@
.L315:
	.align	2
.L314:
	.word	UsingSpellMenu
	.word	gMapMovement
	.word	BmMapFill
	.word	gMapRange
	.word	gActiveUnit
	.word	DisplayMoveRangeGraphics
	.word	RangeUsabilityCheckNotStaff
	.word	RangeUsabilityCheckStaff
	.size	GaidenWhiteMagicUMHover, .-GaidenWhiteMagicUMHover
	.align	1
	.global	GM_doesUnitHaveSpecialRange
	.syntax unified
	.code	16
	.thumb_func
	.type	GM_doesUnitHaveSpecialRange, %function
GM_doesUnitHaveSpecialRange:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ RangeDisplay.c:91: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	ldr	r3, .L322	@ tmp129,
	ldrb	r1, [r3]	@ UsingSpellMenu.73_1, UsingSpellMenu
@ RangeDisplay.c:89: int GM_doesUnitHaveSpecialRange(struct Unit* unit) { // based on GetUnitRangeMaskForSpells - Vesly 
	movs	r6, r0	@ unit, unit
@ RangeDisplay.c:91: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	cmp	r1, #0	@ UsingSpellMenu.73_1,
	bne	.L317		@,
@ RangeDisplay.c:91: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	subs	r1, r1, #1	@ iftmp.72_10,
.L317:
@ RangeDisplay.c:91: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	movs	r0, r6	@, unit
	bl	SpellsGetter		@
@ RangeDisplay.c:94: 		spell = spells[i]|0xFF00;
	movs	r7, #255	@ tmp145,
@ RangeDisplay.c:91: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	movs	r4, r0	@ ivtmp.392, ivtmp.392
@ RangeDisplay.c:90: 	int i, spell, result = 0;
	movs	r5, #0	@ result,
@ RangeDisplay.c:94: 		spell = spells[i]|0xFF00;
	lsls	r7, r7, #8	@ tmp145, tmp145,
.L318:
@ RangeDisplay.c:92: 	for ( i = 0 ; spells[i] ; i++ )
	adds	r4, r4, #1	@ ivtmp.392,
@ RangeDisplay.c:92: 	for ( i = 0 ; spells[i] ; i++ )
	subs	r3, r4, #1	@ tmp134, ivtmp.392,
	ldrb	r1, [r3]	@ _7, MEM[(u8 *)_29 + 4294967295B]
@ RangeDisplay.c:92: 	for ( i = 0 ; spells[i] ; i++ )
	cmp	r1, #0	@ _7,
	bne	.L319		@,
@ RangeDisplay.c:105: 	if (result > 0x10) { 
	movs	r0, #1	@ _23,
	cmp	r5, #16	@ result,
	bgt	.L320		@,
	movs	r0, r1	@ _23, _7
.L320:
@ RangeDisplay.c:109: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L319:
@ RangeDisplay.c:95: 		result |= gGet_Item_Range(unit,spell);
	ldr	r3, .L322+4	@ tmp132,
	movs	r0, r6	@, unit
	ldr	r3, [r3]	@ gGet_Item_Range, gGet_Item_Range
@ RangeDisplay.c:94: 		spell = spells[i]|0xFF00;
	orrs	r1, r7	@ spell_18, tmp145
@ RangeDisplay.c:95: 		result |= gGet_Item_Range(unit,spell);
	bl	.L14		@
@ RangeDisplay.c:95: 		result |= gGet_Item_Range(unit,spell);
	orrs	r5, r0	@ result, _20
	b	.L318		@
.L323:
	.align	2
.L322:
	.word	UsingSpellMenu
	.word	gGet_Item_Range
	.size	GM_doesUnitHaveSpecialRange, .-GM_doesUnitHaveSpecialRange
	.align	1
	.global	GM_GetUnitRangeBySpellIndex
	.syntax unified
	.code	16
	.thumb_func
	.type	GM_GetUnitRangeBySpellIndex, %function
GM_GetUnitRangeBySpellIndex:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ RangeDisplay.c:113: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	ldr	r3, .L331	@ tmp127,
@ RangeDisplay.c:110: int GM_GetUnitRangeBySpellIndex(struct Unit* unit, int index) { 
	movs	r5, r1	@ index, index
@ RangeDisplay.c:113: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	ldrb	r1, [r3]	@ UsingSpellMenu.79_1, UsingSpellMenu
@ RangeDisplay.c:110: int GM_GetUnitRangeBySpellIndex(struct Unit* unit, int index) { 
	movs	r4, r0	@ unit, unit
@ RangeDisplay.c:113: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	cmp	r1, #0	@ UsingSpellMenu.79_1,
	bne	.L325		@,
@ RangeDisplay.c:113: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	subs	r1, r1, #1	@ iftmp.78_9,
.L325:
@ RangeDisplay.c:113: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	movs	r0, r4	@, unit
	bl	SpellsGetter		@
@ RangeDisplay.c:114: 	spell = spells[index]|0xFF00;
	ldrb	r3, [r0, r5]	@ _5, *_3
@ RangeDisplay.c:114: 	spell = spells[index]|0xFF00;
	movs	r5, #255	@ tmp129,
	lsls	r5, r5, #8	@ tmp129, tmp129,
	orrs	r5, r3	@ spell, _5
@ RangeDisplay.c:115: 	if ( CanCastSpell(unit,spell)) return gGet_Item_Range(unit,spell); 
	movs	r1, r5	@, spell
	movs	r0, r4	@, unit
	bl	CanCastSpell		@
@ RangeDisplay.c:115: 	if ( CanCastSpell(unit,spell)) return gGet_Item_Range(unit,spell); 
	cmp	r0, #0	@ <retval>,
	beq	.L324		@,
@ RangeDisplay.c:115: 	if ( CanCastSpell(unit,spell)) return gGet_Item_Range(unit,spell); 
	ldr	r3, .L331+4	@ tmp130,
	movs	r1, r5	@, spell
	movs	r0, r4	@, unit
	ldr	r3, [r3]	@ gGet_Item_Range, gGet_Item_Range
	bl	.L14		@
.L324:
@ RangeDisplay.c:117: } 
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L332:
	.align	2
.L331:
	.word	UsingSpellMenu
	.word	gGet_Item_Range
	.size	GM_GetUnitRangeBySpellIndex, .-GM_GetUnitRangeBySpellIndex
	.align	1
	.global	GM_GetNthSpell
	.syntax unified
	.code	16
	.thumb_func
	.type	GM_GetNthSpell, %function
GM_GetNthSpell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ RangeDisplay.c:121: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	ldr	r3, .L340	@ tmp123,
@ RangeDisplay.c:119: int GM_GetNthSpell(struct Unit* unit, int index) { 
	movs	r4, r1	@ index, index
@ RangeDisplay.c:121: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	ldrb	r1, [r3]	@ UsingSpellMenu.84_1, UsingSpellMenu
@ RangeDisplay.c:121: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	cmp	r1, #0	@ UsingSpellMenu.84_1,
	bne	.L334		@,
@ RangeDisplay.c:121: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	subs	r1, r1, #1	@ iftmp.83_6,
.L334:
@ RangeDisplay.c:121: 	u8* spells = SpellsGetter(unit,(UsingSpellMenu ? UsingSpellMenu : -1)); // If UsingSpellMenu is nonzero, only get Gaiden spells of that type.
	bl	SpellsGetter		@
@ RangeDisplay.c:122: 	spell = spells[index];
	ldrb	r0, [r0, r4]	@ <retval>, *_3
@ RangeDisplay.c:123: 	if (spell) { spell |= 0xFF00; } 
	cmp	r0, #0	@ <retval>,
	beq	.L333		@,
@ RangeDisplay.c:123: 	if (spell) { spell |= 0xFF00; } 
	movs	r3, #255	@ tmp126,
	lsls	r3, r3, #8	@ tmp126, tmp126,
	orrs	r0, r3	@ <retval>, tmp126
.L333:
@ RangeDisplay.c:128: } 
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L341:
	.align	2
.L340:
	.word	UsingSpellMenu
	.size	GM_GetNthSpell, .-GM_GetNthSpell
	.align	1
	.global	SpellUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	SpellUsability, %function
SpellUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ SpellMenu.c:5: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,index,UsingSpellMenu)];
	ldr	r5, .L349	@ tmp134,
	ldr	r4, .L349+4	@ tmp136,
@ SpellMenu.c:4: {
	movs	r7, r1	@ index, index
@ SpellMenu.c:5: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,index,UsingSpellMenu)];
	ldr	r0, [r4]	@, gActiveUnit
	ldrb	r1, [r5]	@ _3, UsingSpellMenu
	bl	SpellsGetter		@
@ SpellMenu.c:5: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,index,UsingSpellMenu)];
	ldrb	r2, [r5]	@ _7, UsingSpellMenu
@ SpellMenu.c:5: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,index,UsingSpellMenu)];
	movs	r6, r0	@ _4,
@ SpellMenu.c:5: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,index,UsingSpellMenu)];
	movs	r1, r7	@, index
	ldr	r0, [r4]	@, gActiveUnit
	bl	GetNthUsableSpell		@
@ SpellMenu.c:5: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,index,UsingSpellMenu)];
	ldrb	r5, [r6, r0]	@ spell, *_10
@ SpellMenu.c:6: 	if ( !spell ) { return 3; }
	cmp	r5, #0	@ spell,
	bne	.L343		@,
.L345:
@ SpellMenu.c:6: 	if ( !spell ) { return 3; }
	movs	r0, #3	@ <retval>,
.L342:
@ SpellMenu.c:14: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L343:
@ SpellMenu.c:8: 	if ( !CanCastSpellNow(gActiveUnit,spell) ) { return 3; }
	movs	r1, r5	@, spell
	ldr	r0, [r4]	@, gActiveUnit
	bl	CanCastSpellNow		@
@ SpellMenu.c:8: 	if ( !CanCastSpellNow(gActiveUnit,spell) ) { return 3; }
	cmp	r0, #0	@ _13,
	beq	.L345		@,
@ SpellMenu.c:10: 	u8 HasEnoughHp = HasSufficientHP(gActiveUnit,spell);
	movs	r1, r5	@, spell
	ldr	r0, [r4]	@, gActiveUnit
	bl	HasSufficientHP		@
@ SpellMenu.c:11: 	if (HasEnoughHp) { return 1; }
	movs	r3, #2	@ tmp142,
	subs	r0, r3, r0	@ <retval>, tmp142, _15
	b	.L342		@
.L350:
	.align	2
.L349:
	.word	UsingSpellMenu
	.word	gActiveUnit
	.size	SpellUsability, .-SpellUsability
	.align	1
	.global	SpellDrawingRoutine
	.syntax unified
	.code	16
	.thumb_func
	.type	SpellDrawingRoutine, %function
SpellDrawingRoutine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ SpellMenu.c:17: {
	movs	r4, r1	@ menuCommand, menuCommand
@ SpellMenu.c:25: }
	@ sp needed	@
@ SpellMenu.c:19: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,menuCommand->commandDefinitionIndex,UsingSpellMenu)];
	ldr	r6, .L352	@ tmp146,
	ldr	r5, .L352+4	@ tmp144,
	ldr	r0, [r6]	@, gActiveUnit
	ldrb	r1, [r5]	@ _3, UsingSpellMenu
	bl	SpellsGetter		@
@ SpellMenu.c:19: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,menuCommand->commandDefinitionIndex,UsingSpellMenu)];
	movs	r3, r4	@ tmp151, menuCommand
	adds	r3, r3, #60	@ tmp151,
@ SpellMenu.c:19: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,menuCommand->commandDefinitionIndex,UsingSpellMenu)];
	movs	r7, r0	@ _4,
@ SpellMenu.c:19: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,menuCommand->commandDefinitionIndex,UsingSpellMenu)];
	ldrb	r2, [r5]	@ _9, UsingSpellMenu
	ldrb	r1, [r3]	@ _7,
	ldr	r0, [r6]	@, gActiveUnit
	bl	GetNthUsableSpell		@
@ SpellMenu.c:19: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,menuCommand->commandDefinitionIndex,UsingSpellMenu)];
	ldrb	r5, [r7, r0]	@ _13, *_12
@ SpellMenu.c:21: 	int canUse = HasSufficientHP(gActiveUnit,spell);
	ldr	r0, [r6]	@, gActiveUnit
	movs	r1, r5	@, _13
	bl	HasSufficientHP		@
	movs	r2, r0	@ canUse,
@ SpellMenu.c:22: 	DrawItemMenuCommand(&menuCommand->text,spell,canUse,&gBg0MapBuffer[menuCommand->yDrawTile * 32 + menuCommand->xDrawTile]);
	movs	r0, r4	@ menuCommand, menuCommand
@ SpellMenu.c:22: 	DrawItemMenuCommand(&menuCommand->text,spell,canUse,&gBg0MapBuffer[menuCommand->yDrawTile * 32 + menuCommand->xDrawTile]);
	ldrh	r3, [r4, #44]	@ _18,
@ SpellMenu.c:22: 	DrawItemMenuCommand(&menuCommand->text,spell,canUse,&gBg0MapBuffer[menuCommand->yDrawTile * 32 + menuCommand->xDrawTile]);
	ldrh	r1, [r4, #42]	@ _21,
@ SpellMenu.c:22: 	DrawItemMenuCommand(&menuCommand->text,spell,canUse,&gBg0MapBuffer[menuCommand->yDrawTile * 32 + menuCommand->xDrawTile]);
	lsls	r3, r3, #5	@ _19, _18,
@ SpellMenu.c:22: 	DrawItemMenuCommand(&menuCommand->text,spell,canUse,&gBg0MapBuffer[menuCommand->yDrawTile * 32 + menuCommand->xDrawTile]);
	adds	r3, r3, r1	@ _22, _19, _21
@ SpellMenu.c:22: 	DrawItemMenuCommand(&menuCommand->text,spell,canUse,&gBg0MapBuffer[menuCommand->yDrawTile * 32 + menuCommand->xDrawTile]);
	ldr	r1, .L352+8	@ tmp161,
	lsls	r3, r3, #1	@ _34, _22,
	adds	r3, r3, r1	@ _23, _34, tmp161
	ldr	r4, .L352+12	@ tmp163,
	movs	r1, r5	@, _13
@ SpellMenu.c:22: 	DrawItemMenuCommand(&menuCommand->text,spell,canUse,&gBg0MapBuffer[menuCommand->yDrawTile * 32 + menuCommand->xDrawTile]);
	adds	r0, r0, #52	@ menuCommand,
@ SpellMenu.c:22: 	DrawItemMenuCommand(&menuCommand->text,spell,canUse,&gBg0MapBuffer[menuCommand->yDrawTile * 32 + menuCommand->xDrawTile]);
	bl	.L16		@
@ SpellMenu.c:23: 	EnableBgSyncByMask(1);
	movs	r0, #1	@,
	ldr	r3, .L352+16	@ tmp164,
	bl	.L14		@
@ SpellMenu.c:25: }
	movs	r0, #0	@,
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L353:
	.align	2
.L352:
	.word	gActiveUnit
	.word	UsingSpellMenu
	.word	gBg0MapBuffer
	.word	DrawItemMenuCommand
	.word	EnableBgSyncByMask
	.size	SpellDrawingRoutine, .-SpellDrawingRoutine
	.align	1
	.global	MagicMenuBPress
	.syntax unified
	.code	16
	.thumb_func
	.type	MagicMenuBPress, %function
MagicMenuBPress:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ SpellMenu.c:33: 	Unit* unit = gActiveUnit;
	ldr	r3, .L355	@ tmp127,
	ldr	r2, [r3]	@ unit, gActiveUnit
@ SpellMenu.c:34: 	unit->state &= ~(1UL << 30); // Always clear capturing bit if leaving menu 
	ldr	r1, .L355+4	@ tmp130,
	ldr	r3, [r2, #12]	@ unit_13->state, unit_13->state
	ands	r3, r1	@ _2, tmp130
@ SpellMenu.c:30: {
	push	{r4, lr}	@
@ SpellMenu.c:37: 	FillBgMap(gBg2MapBuffer,0);
	movs	r1, #0	@,
@ SpellMenu.c:46: }
	@ sp needed	@
@ SpellMenu.c:34: 	unit->state &= ~(1UL << 30); // Always clear capturing bit if leaving menu 
	str	r3, [r2, #12]	@ _2, unit_13->state
@ SpellMenu.c:37: 	FillBgMap(gBg2MapBuffer,0);
	ldr	r0, .L355+8	@ tmp131,
	ldr	r3, .L355+12	@ tmp132,
	bl	.L14		@
@ SpellMenu.c:38: 	EnableBgSyncByMask(4);
	movs	r0, #4	@,
	ldr	r3, .L355+16	@ tmp133,
	bl	.L14		@
@ SpellMenu.c:39: 	Text_ResetTileAllocation();
	ldr	r3, .L355+20	@ tmp134,
	bl	.L14		@
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldr	r0, .L355+24	@ tmp139,
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldr	r3, .L355+28	@ tmp135,
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldrh	r1, [r0, #28]	@ _4,
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldr	r2, .L355+32	@ tmp137,
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldrh	r0, [r0, #12]	@ _6,
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldrb	r2, [r2]	@ _9, UnitMenuLeft
	subs	r1, r1, r0	@ _7, _4, _6
	ldrb	r3, [r3]	@ _11, UnitMenuRight
	ldr	r4, .L355+36	@ tmp145,
	ldr	r0, .L355+40	@ tmp144,
	bl	.L16		@
@ SpellMenu.c:42: 	HideMoveRangeGraphics();
	ldr	r3, .L355+44	@ tmp146,
	bl	.L14		@
@ SpellMenu.c:43: 	SelectedSpell = 0;
	movs	r2, #0	@ tmp148,
	ldr	r3, .L355+48	@ tmp147,
	strb	r2, [r3]	@ tmp148, SelectedSpell
@ SpellMenu.c:44: 	UsingSpellMenu = 0;
	ldr	r3, .L355+52	@ tmp150,
@ SpellMenu.c:46: }
	movs	r0, #59	@,
@ SpellMenu.c:44: 	UsingSpellMenu = 0;
	strb	r2, [r3]	@ tmp148, UsingSpellMenu
@ SpellMenu.c:46: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L356:
	.align	2
.L355:
	.word	gActiveUnit
	.word	-1073741825
	.word	gBg2MapBuffer
	.word	FillBgMap
	.word	EnableBgSyncByMask
	.word	Text_ResetTileAllocation
	.word	gGameState
	.word	UnitMenuRight
	.word	UnitMenuLeft
	.word	StartMenu_AndDoSomethingCommands
	.word	gMenu_UnitMenu
	.word	HideMoveRangeGraphics
	.word	SelectedSpell
	.word	UsingSpellMenu
	.size	MagicMenuBPress, .-MagicMenuBPress
	.align	1
	.global	SpellEffectRoutine
	.syntax unified
	.code	16
	.thumb_func
	.type	SpellEffectRoutine, %function
SpellEffectRoutine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ SpellMenu.c:50: 	if ( commandProc->availability == 2)
	adds	r1, r1, #61	@ tmp136,
@ SpellMenu.c:50: 	if ( commandProc->availability == 2)
	ldrb	r3, [r1]	@ tmp137,
	cmp	r3, #2	@ tmp137,
	bne	.L358		@,
@ SpellMenu.c:53: 		MenuCallHelpBox(proc,gGaidenMagicSpellMenuErrorText);
	ldr	r3, .L369	@ tmp138,
	ldrh	r1, [r3]	@ gGaidenMagicSpellMenuErrorText, gGaidenMagicSpellMenuErrorText
	ldr	r3, .L369+4	@ tmp140,
	bl	.L14		@
@ SpellMenu.c:54: 		return 0x08;
	movs	r0, #8	@ <retval>,
.L357:
@ SpellMenu.c:107: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L358:
@ SpellMenu.c:58: 		Unit* unit = gActiveUnit;
	ldr	r5, .L369+8	@ tmp141,
	ldr	r3, [r5]	@ unit, gActiveUnit
@ SpellMenu.c:59: 		if ( unit->ranks[0] != SelectedSpell) 
	movs	r6, r3	@ tmp144, unit
@ SpellMenu.c:59: 		if ( unit->ranks[0] != SelectedSpell) 
	ldr	r4, .L369+12	@ tmp145,
@ SpellMenu.c:59: 		if ( unit->ranks[0] != SelectedSpell) 
	adds	r6, r6, #40	@ tmp144,
	ldrb	r0, [r6]	@ _3,
@ SpellMenu.c:59: 		if ( unit->ranks[0] != SelectedSpell) 
	ldrb	r1, [r4]	@ SelectedSpell.101_4, SelectedSpell
@ SpellMenu.c:59: 		if ( unit->ranks[0] != SelectedSpell) 
	cmp	r0, r1	@ _3, SelectedSpell.101_4
	bne	.L360		@,
.L365:
@ SpellMenu.c:88: 		gActionData.itemSlotIndex = 0;
	movs	r2, #0	@ tmp147,
	ldr	r3, .L369+16	@ tmp146,
	strb	r2, [r3, #18]	@ tmp147, gActionData.itemSlotIndex
@ SpellMenu.c:89: 		DidSelectSpell = 1;
	ldr	r3, .L369+20	@ tmp149,
	adds	r2, r2, #1	@ tmp150,
	strb	r2, [r3]	@ tmp150, DidSelectSpell
@ SpellMenu.c:90: 		ClearBG0BG1();
	ldr	r3, .L369+24	@ tmp152,
	bl	.L14		@
@ SpellMenu.c:91: 		int type = GetItemType(SelectedSpell);
	ldr	r3, .L369+28	@ tmp155,
	ldrb	r0, [r4]	@ _7, SelectedSpell
	bl	.L14		@
@ SpellMenu.c:98: 			MakeTargetListForWeapon(gActiveUnit,SelectedSpell|0xFF00);
	movs	r1, #255	@ tmp159,
	ldrb	r2, [r4]	@ _16, SelectedSpell
	lsls	r1, r1, #8	@ tmp159, tmp159,
@ SpellMenu.c:91: 		int type = GetItemType(SelectedSpell);
	movs	r3, r0	@ type,
@ SpellMenu.c:98: 			MakeTargetListForWeapon(gActiveUnit,SelectedSpell|0xFF00);
	orrs	r1, r2	@ _21, _16
	ldr	r0, [r5]	@ pretmp_39, gActiveUnit
@ SpellMenu.c:92: 		if ( type != ITYPE_STAFF )
	cmp	r3, #4	@ type,
	bne	.L361		@,
@ SpellMenu.c:103: 			ItemEffect_Call(gActiveUnit,SelectedSpell|0xFF00);
	ldr	r3, .L369+32	@ tmp169,
	bl	.L14		@
	b	.L366		@
.L360:
	movs	r2, r3	@ ivtmp.419, unit
	adds	r3, r3, #45	@ _45,
	adds	r2, r2, #41	@ ivtmp.419,
.L364:
@ SpellMenu.c:64: 			if (unit->ranks[i] == SelectedSpell) 
	ldrb	r7, [r2]	@ MEM[(unsigned char *)_11], MEM[(unsigned char *)_11]
	cmp	r7, r1	@ MEM[(unsigned char *)_11], SelectedSpell.101_4
	bne	.L363		@,
@ SpellMenu.c:66: 			unit->ranks[i] = PreviousSelection;
	strb	r0, [r2]	@ _3, MEM[(unsigned char *)_11]
@ SpellMenu.c:67: 			unit->ranks[0] = SelectedSpell;
	strb	r1, [r6]	@ SelectedSpell.101_4, unit_25->ranks[0]
.L363:
@ SpellMenu.c:62: 		for ( int i = 1 ; i < 5 ; i++ ) 
	adds	r2, r2, #1	@ ivtmp.419,
	cmp	r2, r3	@ ivtmp.419, _45
	bne	.L364		@,
	b	.L365		@
.L361:
@ SpellMenu.c:98: 			MakeTargetListForWeapon(gActiveUnit,SelectedSpell|0xFF00);
	ldr	r3, .L369+36	@ tmp166,
	bl	.L14		@
@ SpellMenu.c:99: 			StartTargetSelection(&SpellTargetSelection);
	ldr	r0, .L369+40	@ tmp167,
	ldr	r3, .L369+44	@ tmp168,
	bl	.L14		@
.L366:
@ SpellMenu.c:105: 		return 0x27;
	movs	r0, #39	@ <retval>,
	b	.L357		@
.L370:
	.align	2
.L369:
	.word	gGaidenMagicSpellMenuErrorText
	.word	MenuCallHelpBox
	.word	gActiveUnit
	.word	SelectedSpell
	.word	gActionData
	.word	DidSelectSpell
	.word	ClearBG0BG1
	.word	GetItemType
	.word	ItemEffect_Call
	.word	MakeTargetListForWeapon
	.word	SpellTargetSelection
	.word	StartTargetSelection
	.size	SpellEffectRoutine, .-SpellEffectRoutine
	.align	1
	.global	SpellOnHover
	.syntax unified
	.code	16
	.thumb_func
	.type	SpellOnHover, %function
SpellOnHover:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
@ SpellMenu.c:111: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,proc->commandIndex,UsingSpellMenu)];
	ldr	r7, .L390	@ tmp198,
	ldr	r6, .L390+4	@ tmp200,
@ SpellMenu.c:110: {
	sub	sp, sp, #36	@,,
@ SpellMenu.c:111: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,proc->commandIndex,UsingSpellMenu)];
	ldrb	r1, [r7]	@ _3, UsingSpellMenu
@ SpellMenu.c:110: {
	movs	r4, r0	@ proc, proc
@ SpellMenu.c:111: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,proc->commandIndex,UsingSpellMenu)];
	ldr	r0, [r6]	@, gActiveUnit
	bl	SpellsGetter		@
@ SpellMenu.c:111: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,proc->commandIndex,UsingSpellMenu)];
	adds	r4, r4, #97	@ tmp205,
@ SpellMenu.c:111: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,proc->commandIndex,UsingSpellMenu)];
	ldrb	r1, [r4]	@ _7,
@ SpellMenu.c:111: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,proc->commandIndex,UsingSpellMenu)];
	movs	r5, r0	@ _4,
@ SpellMenu.c:111: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,proc->commandIndex,UsingSpellMenu)];
	ldrb	r2, [r7]	@ _9, UsingSpellMenu
	ldr	r0, [r6]	@, gActiveUnit
	bl	GetNthUsableSpell		@
@ SpellMenu.c:111: 	int spell = SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,proc->commandIndex,UsingSpellMenu)];
	ldrb	r3, [r5, r0]	@ spell, *_12
	str	r3, [sp, #8]	@ spell, %sfp
@ SpellMenu.c:112: 	SelectedSpell = spell;
	ldr	r2, [sp, #8]	@ spell, %sfp
	ldr	r3, .L390+8	@ tmp208,
@ SpellMenu.c:130: 	MenuItemPanelProc* menuItemPanel = (MenuItemPanelProc*)ProcFind(&gProc_MenuItemPanel);
	ldr	r0, .L390+12	@ tmp210,
@ SpellMenu.c:112: 	SelectedSpell = spell;
	strb	r2, [r3]	@ spell, SelectedSpell
@ SpellMenu.c:130: 	MenuItemPanelProc* menuItemPanel = (MenuItemPanelProc*)ProcFind(&gProc_MenuItemPanel);
	ldr	r3, .L390+16	@ tmp211,
	bl	.L14		@
@ SpellMenu.c:131: 	int x = menuItemPanel->x;
	movs	r3, r0	@ tmp214, menuItemPanel
	adds	r3, r3, #48	@ tmp214,
	ldrb	r3, [r3]	@ _14,
	str	r3, [sp, #24]	@ _14, %sfp
@ SpellMenu.c:132: 	int y = menuItemPanel->y;
	movs	r3, r0	@ tmp217, menuItemPanel
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	movs	r4, r0	@ _159, menuItemPanel
@ SpellMenu.c:130: 	MenuItemPanelProc* menuItemPanel = (MenuItemPanelProc*)ProcFind(&gProc_MenuItemPanel);
	movs	r7, r0	@ menuItemPanel,
@ SpellMenu.c:132: 	int y = menuItemPanel->y;
	adds	r3, r3, #49	@ tmp217,
	ldrb	r3, [r3]	@ _15,
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	adds	r4, r4, #52	@ _159,
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	ldr	r5, .L390+20	@ tmp218,
	movs	r0, r4	@, _159
@ SpellMenu.c:132: 	int y = menuItemPanel->y;
	str	r3, [sp, #28]	@ _15, %sfp
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	bl	.L392		@
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	movs	r3, r7	@ _149, menuItemPanel
	adds	r3, r3, #60	@ _149,
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	movs	r0, r3	@, _149
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	str	r3, [sp, #16]	@ _149, %sfp
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	bl	.L392		@
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	movs	r3, r7	@ _16, menuItemPanel
	adds	r3, r3, #68	@ _16,
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	movs	r0, r3	@, _16
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	str	r3, [sp, #12]	@ _16, %sfp
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	bl	.L392		@
@ SpellMenu.c:137: 	MakeUIWindowTileMap_BG0BG1(x,y,14,8,0);
	movs	r3, #0	@ tmp396,
	movs	r2, #14	@,
	str	r3, [sp]	@ tmp396,
	ldr	r1, [sp, #28]	@, %sfp
	ldr	r0, [sp, #24]	@, %sfp
	adds	r3, r3, #8	@,
	ldr	r5, .L390+24	@ tmp222,
	bl	.L392		@
@ SpellMenu.c:139: 	int spellType = GetItemType(spell);
	ldr	r0, [sp, #8]	@, %sfp
	ldr	r3, .L390+28	@ tmp223,
	bl	.L14		@
	str	r0, [sp, #20]	@, %sfp
@ SpellMenu.c:140: 	if ( spellType != ITYPE_STAFF )
	cmp	r0, #4	@,
	bne	.LCB2365	@
	b	.L372	@long jump	@
.LCB2365:
@ SpellMenu.c:142: 		BattleGenerateUiStats(gActiveUnit,9); // 9 is using a Gaiden spell.
	movs	r1, #9	@,
	ldr	r0, [r6]	@, gActiveUnit
	ldr	r3, .L390+32	@ tmp225,
	bl	.L14		@
@ SpellMenu.c:144: 		Text_InsertString(&menuItemPanel->textHandles[0],0x02,0,GetStringFromIndex(0x0039)); // "Stats"
	ldr	r3, .L390+36	@ tmp226,
	movs	r0, #57	@,
	movs	r5, r3	@ tmp226, tmp226
	bl	.L14		@
@ SpellMenu.c:144: 		Text_InsertString(&menuItemPanel->textHandles[0],0x02,0,GetStringFromIndex(0x0039)); // "Stats"
	movs	r2, #0	@,
@ SpellMenu.c:144: 		Text_InsertString(&menuItemPanel->textHandles[0],0x02,0,GetStringFromIndex(0x0039)); // "Stats"
	movs	r3, r0	@ _19,
@ SpellMenu.c:144: 		Text_InsertString(&menuItemPanel->textHandles[0],0x02,0,GetStringFromIndex(0x0039)); // "Stats"
	movs	r1, #2	@,
	movs	r0, r4	@, _159
	ldr	r6, .L390+40	@ tmp227,
	bl	.L15		@
@ SpellMenu.c:146: 		if (GetSpellCost(spell)>0) { 
	ldr	r0, [sp, #8]	@, %sfp
	bl	GetSpellCost		@
@ SpellMenu.c:146: 		if (GetSpellCost(spell)>0) { 
	cmp	r0, #0	@ _20,
	beq	.L373		@,
@ SpellMenu.c:147: 			Text_InsertString(&menuItemPanel->textHandles[0],0x32,0,GetStringFromIndex(gGaidenMagicHPCostText)); // HP Cost.
	ldr	r3, .L390+44	@ tmp228,
	ldrh	r0, [r3]	@ _22, gGaidenMagicHPCostText
	bl	.L392		@
@ SpellMenu.c:147: 			Text_InsertString(&menuItemPanel->textHandles[0],0x32,0,GetStringFromIndex(gGaidenMagicHPCostText)); // HP Cost.
	movs	r2, #0	@,
@ SpellMenu.c:147: 			Text_InsertString(&menuItemPanel->textHandles[0],0x32,0,GetStringFromIndex(gGaidenMagicHPCostText)); // HP Cost.
	movs	r3, r0	@ _23,
@ SpellMenu.c:147: 			Text_InsertString(&menuItemPanel->textHandles[0],0x32,0,GetStringFromIndex(gGaidenMagicHPCostText)); // HP Cost.
	movs	r1, #50	@,
	movs	r0, r4	@, _159
	bl	.L15		@
.L373:
@ SpellMenu.c:149: 		Text_InsertString(&menuItemPanel->textHandles[1],0x02,0,GetStringFromIndex(0x4F3)); // Atk.
	ldr	r6, .L390+36	@ tmp233,
	ldr	r0, .L390+48	@,
	bl	.L15		@
@ SpellMenu.c:149: 		Text_InsertString(&menuItemPanel->textHandles[1],0x02,0,GetStringFromIndex(0x4F3)); // Atk.
	ldr	r5, .L390+40	@ tmp234,
@ SpellMenu.c:149: 		Text_InsertString(&menuItemPanel->textHandles[1],0x02,0,GetStringFromIndex(0x4F3)); // Atk.
	movs	r3, r0	@ _25,
@ SpellMenu.c:149: 		Text_InsertString(&menuItemPanel->textHandles[1],0x02,0,GetStringFromIndex(0x4F3)); // Atk.
	movs	r2, #0	@,
	movs	r1, #2	@,
	ldr	r0, [sp, #16]	@, %sfp
	bl	.L392		@
@ SpellMenu.c:150: 		Text_InsertString(&menuItemPanel->textHandles[2],0x02,0,GetStringFromIndex(0x4F4)); // Hit.
	ldr	r0, .L390+52	@,
	bl	.L15		@
@ SpellMenu.c:150: 		Text_InsertString(&menuItemPanel->textHandles[2],0x02,0,GetStringFromIndex(0x4F4)); // Hit.
	movs	r2, #0	@,
@ SpellMenu.c:150: 		Text_InsertString(&menuItemPanel->textHandles[2],0x02,0,GetStringFromIndex(0x4F4)); // Hit.
	movs	r3, r0	@ _27,
@ SpellMenu.c:150: 		Text_InsertString(&menuItemPanel->textHandles[2],0x02,0,GetStringFromIndex(0x4F4)); // Hit.
	movs	r1, #2	@,
	ldr	r0, [sp, #12]	@, %sfp
	bl	.L392		@
@ SpellMenu.c:151: 		Text_InsertString(&menuItemPanel->textHandles[1],0x32,0,GetStringFromIndex(0x501)); // Crit.
	ldr	r0, .L390+56	@,
	bl	.L15		@
@ SpellMenu.c:151: 		Text_InsertString(&menuItemPanel->textHandles[1],0x32,0,GetStringFromIndex(0x501)); // Crit.
	movs	r2, #0	@,
@ SpellMenu.c:151: 		Text_InsertString(&menuItemPanel->textHandles[1],0x32,0,GetStringFromIndex(0x501)); // Crit.
	movs	r3, r0	@ _28,
@ SpellMenu.c:151: 		Text_InsertString(&menuItemPanel->textHandles[1],0x32,0,GetStringFromIndex(0x501)); // Crit.
	movs	r1, #50	@,
	ldr	r0, [sp, #16]	@, %sfp
	bl	.L392		@
@ SpellMenu.c:152: 		Text_InsertString(&menuItemPanel->textHandles[2],0x32,0,GetStringFromIndex(0x4F5)); // Avoid.
	ldr	r0, .L390+60	@,
	bl	.L15		@
@ SpellMenu.c:152: 		Text_InsertString(&menuItemPanel->textHandles[2],0x32,0,GetStringFromIndex(0x4F5)); // Avoid.
	movs	r2, #0	@,
@ SpellMenu.c:152: 		Text_InsertString(&menuItemPanel->textHandles[2],0x32,0,GetStringFromIndex(0x4F5)); // Avoid.
	movs	r3, r0	@ _29,
@ SpellMenu.c:152: 		Text_InsertString(&menuItemPanel->textHandles[2],0x32,0,GetStringFromIndex(0x4F5)); // Avoid.
	movs	r1, #50	@,
	ldr	r0, [sp, #12]	@, %sfp
	bl	.L392		@
@ SpellMenu.c:155: 		if ( !HasSufficientHP(gActiveUnit,spell) ) { CostColor = 1; }
	ldr	r3, .L390+4	@ tmp244,
	ldr	r1, [sp, #8]	@, %sfp
	ldr	r0, [r3]	@, gActiveUnit
	bl	HasSufficientHP		@
	movs	r5, r0	@ _31,
@ SpellMenu.c:156: 		if (GetSpellCost(spell)>0) { Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[0],0x54,CostColor,GetSpellCost(spell)); } 
	ldr	r0, [sp, #8]	@, %sfp
	bl	GetSpellCost		@
@ SpellMenu.c:156: 		if (GetSpellCost(spell)>0) { Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[0],0x54,CostColor,GetSpellCost(spell)); } 
	cmp	r0, #0	@ _32,
	beq	.L374		@,
@ SpellMenu.c:156: 		if (GetSpellCost(spell)>0) { Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[0],0x54,CostColor,GetSpellCost(spell)); } 
	ldr	r0, [sp, #8]	@, %sfp
	bl	GetSpellCost		@
@ SpellMenu.c:156: 		if (GetSpellCost(spell)>0) { Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[0],0x54,CostColor,GetSpellCost(spell)); } 
	lsls	r3, r0, #24	@ tmp245, _34,
	movs	r1, #84	@,
	movs	r0, r4	@, _159
	lsrs	r3, r3, #24	@ tmp245, tmp245,
	ldr	r4, .L390+64	@ tmp248,
@ SpellMenu.c:155: 		if ( !HasSufficientHP(gActiveUnit,spell) ) { CostColor = 1; }
	adds	r2, r5, #1	@ _135, _31,
@ SpellMenu.c:156: 		if (GetSpellCost(spell)>0) { Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[0],0x54,CostColor,GetSpellCost(spell)); } 
	bl	.L16		@
.L374:
@ SpellMenu.c:157: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x24,2,gBattleActor.battleAttack);
	ldr	r3, .L390+68	@ tmp252,
@ SpellMenu.c:157: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x24,2,gBattleActor.battleAttack);
	ldrb	r3, [r3]	@,
@ SpellMenu.c:157: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x24,2,gBattleActor.battleAttack);
	ldr	r4, .L390+72	@ tmp249,
@ SpellMenu.c:157: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x24,2,gBattleActor.battleAttack);
	lsls	r3, r3, #24	@ tmp256, _37,
	ldr	r5, .L390+64	@ tmp258,
	movs	r2, #2	@,
	movs	r1, #36	@,
	ldr	r0, [sp, #16]	@, %sfp
	lsrs	r3, r3, #24	@ tmp256, tmp256,
	bl	.L392		@
@ SpellMenu.c:158: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[2],0x24,2,gBattleActor.battleHitRate);
	movs	r3, r4	@ tmp262, tmp249
	adds	r3, r3, #96	@ tmp262,
@ SpellMenu.c:158: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[2],0x24,2,gBattleActor.battleHitRate);
	ldrb	r3, [r3]	@,
	lsls	r3, r3, #24	@ tmp266, _39,
	movs	r2, #2	@,
	movs	r1, #36	@,
	ldr	r0, [sp, #12]	@, %sfp
	lsrs	r3, r3, #24	@ tmp266, tmp266,
	bl	.L392		@
@ SpellMenu.c:159: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x54,2,gBattleActor.battleCritRate);
	movs	r3, r4	@ tmp272, tmp249
	adds	r3, r3, #102	@ tmp272,
@ SpellMenu.c:159: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x54,2,gBattleActor.battleCritRate);
	ldrb	r3, [r3]	@,
	lsls	r3, r3, #24	@ tmp276, _41,
	movs	r2, #2	@,
	movs	r1, #84	@,
	ldr	r0, [sp, #16]	@, %sfp
	lsrs	r3, r3, #24	@ tmp276, tmp276,
@ SpellMenu.c:160: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[2],0x54,2,gBattleActor.battleAvoidRate);
	adds	r4, r4, #98	@ tmp282,
@ SpellMenu.c:159: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x54,2,gBattleActor.battleCritRate);
	bl	.L392		@
@ SpellMenu.c:160: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[2],0x54,2,gBattleActor.battleAvoidRate);
	ldrb	r3, [r4]	@,
	lsls	r3, r3, #24	@ tmp286, _43,
	movs	r2, #2	@,
	movs	r1, #84	@,
	ldr	r0, [sp, #12]	@, %sfp
	lsrs	r3, r3, #24	@ tmp286, tmp286,
	bl	.L392		@
.L375:
	movs	r5, r7	@ ivtmp.431, menuItemPanel
	movs	r6, r7	@ menuItemPanel, menuItemPanel
	ldr	r3, [sp, #28]	@ _15, %sfp
	lsls	r4, r3, #5	@ _164, _15,
	ldr	r3, [sp, #24]	@ _14, %sfp
	adds	r4, r4, r3	@ _176, _164, _14
	ldr	r3, .L390+76	@ _179,
	lsls	r4, r4, #1	@ _177, _176,
	adds	r5, r5, #52	@ ivtmp.431,
	adds	r4, r4, r3	@ ivtmp.433, _177, _179
	adds	r6, r6, #76	@ menuItemPanel,
.L377:
@ SpellMenu.c:180: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Display(&menuItemPanel->textHandles[i],&gBG0MapBuffer[y+1+2*i][x+1]); }
	movs	r1, r4	@, ivtmp.433
	movs	r0, r5	@, ivtmp.431
	ldr	r3, .L390+80	@ tmp317,
@ SpellMenu.c:180: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Display(&menuItemPanel->textHandles[i],&gBG0MapBuffer[y+1+2*i][x+1]); }
	adds	r5, r5, #8	@ ivtmp.431,
@ SpellMenu.c:180: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Display(&menuItemPanel->textHandles[i],&gBG0MapBuffer[y+1+2*i][x+1]); }
	bl	.L14		@
@ SpellMenu.c:180: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Display(&menuItemPanel->textHandles[i],&gBG0MapBuffer[y+1+2*i][x+1]); }
	adds	r4, r4, #128	@ ivtmp.433,
	cmp	r5, r6	@ ivtmp.431, _181
	bne	.L377		@,
@ SpellMenu.c:192: 	gWrite_Range(gActiveUnit->xPos,gActiveUnit->yPos,gGet_Item_Range(gActiveUnit,spell));
	movs	r5, #16	@ _62,
	movs	r6, #17	@ _64,
@ SpellMenu.c:188: 	BmMapFill(gMapMovement,-1);
	ldr	r3, .L390+84	@ tmp323,
	ldr	r4, .L390+88	@ tmp324,
	ldr	r0, [r3]	@, gMapMovement
	movs	r1, #255	@,
	bl	.L16		@
@ SpellMenu.c:189: 	BmMapFill(gMapRange,0);
	ldr	r3, .L390+92	@ tmp325,
	movs	r1, #0	@,
	ldr	r0, [r3]	@, gMapRange
	bl	.L16		@
@ SpellMenu.c:192: 	gWrite_Range(gActiveUnit->xPos,gActiveUnit->yPos,gGet_Item_Range(gActiveUnit,spell));
	ldr	r3, .L390+96	@ tmp327,
	ldr	r4, [r3]	@ gWrite_Range.118_59, gWrite_Range
@ SpellMenu.c:192: 	gWrite_Range(gActiveUnit->xPos,gActiveUnit->yPos,gGet_Item_Range(gActiveUnit,spell));
	ldr	r3, .L390+4	@ tmp328,
	ldr	r0, [r3]	@ gActiveUnit.119_60, gActiveUnit
@ SpellMenu.c:192: 	gWrite_Range(gActiveUnit->xPos,gActiveUnit->yPos,gGet_Item_Range(gActiveUnit,spell));
	ldr	r3, .L390+100	@ tmp329,
	ldr	r1, [sp, #8]	@, %sfp
	ldr	r3, [r3]	@ gGet_Item_Range, gGet_Item_Range
	ldrsb	r5, [r0, r5]	@ _62,* _62
	ldrsb	r6, [r0, r6]	@ _64,* _64
	bl	.L14		@
	movs	r3, r1	@ _66,
	movs	r2, r0	@ _66,
@ SpellMenu.c:192: 	gWrite_Range(gActiveUnit->xPos,gActiveUnit->yPos,gGet_Item_Range(gActiveUnit,spell));
	movs	r1, r6	@, _64
	movs	r0, r5	@, _62
	bl	.L16		@
@ SpellMenu.c:193: 	DisplayMoveRangeGraphics(( spellType == ITYPE_STAFF ? 4 : 2 )); // See note in UnitMenu.c.
	ldr	r3, [sp, #20]	@ spellType, %sfp
@ SpellMenu.c:193: 	DisplayMoveRangeGraphics(( spellType == ITYPE_STAFF ? 4 : 2 )); // See note in UnitMenu.c.
	movs	r0, #2	@ iftmp.123_72,
@ SpellMenu.c:193: 	DisplayMoveRangeGraphics(( spellType == ITYPE_STAFF ? 4 : 2 )); // See note in UnitMenu.c.
	cmp	r3, #4	@ spellType,
	bne	.L379		@,
@ SpellMenu.c:193: 	DisplayMoveRangeGraphics(( spellType == ITYPE_STAFF ? 4 : 2 )); // See note in UnitMenu.c.
	ldr	r0, [sp, #20]	@ iftmp.123_72, %sfp
.L379:
@ SpellMenu.c:193: 	DisplayMoveRangeGraphics(( spellType == ITYPE_STAFF ? 4 : 2 )); // See note in UnitMenu.c.
	ldr	r3, .L390+104	@ tmp331,
	bl	.L14		@
@ SpellMenu.c:195: }
	movs	r0, #0	@,
	add	sp, sp, #36	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L372:
@ SpellMenu.c:165: 		const char* desc = GetStringFromIndex(GetItemUseDescId(spell));
	ldr	r3, .L390+108	@ tmp289,
	ldr	r0, [sp, #8]	@, %sfp
	bl	.L14		@
@ SpellMenu.c:165: 		const char* desc = GetStringFromIndex(GetItemUseDescId(spell));
	ldr	r3, .L390+36	@ tmp290,
	bl	.L14		@
@ SpellMenu.c:167: 		desc--;
	subs	r0, r0, #1	@ desc,
.L376:
@ SpellMenu.c:171: 			Text_InsertString(&menuItemPanel->textHandles[j],0,0,desc);
	movs	r2, #0	@,
@ SpellMenu.c:170: 			desc++;
	adds	r5, r0, #1	@ desc, desc,
@ SpellMenu.c:171: 			Text_InsertString(&menuItemPanel->textHandles[j],0,0,desc);
	movs	r3, r5	@, desc
	movs	r0, r4	@, ivtmp.437
	movs	r1, r2	@,
	ldr	r6, .L390+40	@ tmp291,
	bl	.L15		@
@ SpellMenu.c:172: 			desc = Text_GetStringNextLine(desc);
	ldr	r3, .L390+112	@ tmp292,
	movs	r0, r5	@, desc
	bl	.L14		@
@ SpellMenu.c:174: 		} while ( *desc );
	ldrb	r3, [r0]	@ *desc_98, *desc_98
	adds	r4, r4, #8	@ ivtmp.437,
	cmp	r3, #0	@ *desc_98,
	bne	.L376		@,
@ SpellMenu.c:175: 		gBattleActor.battleAttack = gBattleTarget.battleAttack; // ??? this is something vanilla does???
	ldr	r0, .L390+116	@ tmp298,
	ldr	r2, .L390+120	@ tmp295,
@ SpellMenu.c:175: 		gBattleActor.battleAttack = gBattleTarget.battleAttack; // ??? this is something vanilla does???
	ldrh	r0, [r0]	@ tmp302,
	ldr	r1, .L390+68	@ tmp301,
	ldr	r3, .L390+72	@ tmp294,
	strh	r0, [r1]	@ tmp302, gBattleActor.battleAttack
@ SpellMenu.c:177: 		gBattleActor.battleCritRate = gBattleTarget.battleCritRate;
	movs	r0, r2	@ tmp308, tmp295
@ SpellMenu.c:177: 		gBattleActor.battleCritRate = gBattleTarget.battleCritRate;
	movs	r1, r3	@ tmp311, tmp294
@ SpellMenu.c:177: 		gBattleActor.battleCritRate = gBattleTarget.battleCritRate;
	adds	r0, r0, #102	@ tmp308,
@ SpellMenu.c:177: 		gBattleActor.battleCritRate = gBattleTarget.battleCritRate;
	ldrh	r0, [r0]	@ tmp312,
@ SpellMenu.c:176: 		gBattleActor.battleHitRate = gBattleTarget.battleHitRate; // ??? this fixes the green/red arrows from showing on staves???
	ldr	r2, [r2, #96]	@ MEM <unsigned int> [(short int *)&gBattleTarget + 96B], MEM <unsigned int> [(short int *)&gBattleTarget + 96B]
@ SpellMenu.c:177: 		gBattleActor.battleCritRate = gBattleTarget.battleCritRate;
	adds	r1, r1, #102	@ tmp311,
	strh	r0, [r1]	@ tmp312, gBattleActor.battleCritRate
@ SpellMenu.c:176: 		gBattleActor.battleHitRate = gBattleTarget.battleHitRate; // ??? this fixes the green/red arrows from showing on staves???
	str	r2, [r3, #96]	@ MEM <unsigned int> [(short int *)&gBattleTarget + 96B], MEM <unsigned int> [(short int *)&gBattleActor + 96B]
	b	.L375		@
.L391:
	.align	2
.L390:
	.word	UsingSpellMenu
	.word	gActiveUnit
	.word	SelectedSpell
	.word	gProc_MenuItemPanel
	.word	ProcFind
	.word	Text_Clear
	.word	MakeUIWindowTileMap_BG0BG1
	.word	GetItemType
	.word	BattleGenerateUiStats
	.word	GetStringFromIndex
	.word	Text_InsertString
	.word	gGaidenMagicHPCostText
	.word	1267
	.word	1268
	.word	1281
	.word	1269
	.word	Text_InsertNumberOr2Dashes
	.word	gBattleActor+90
	.word	gBattleActor
	.word	gBG0MapBuffer+66
	.word	Text_Display
	.word	gMapMovement
	.word	BmMapFill
	.word	gMapRange
	.word	gWrite_Range
	.word	gGet_Item_Range
	.word	DisplayMoveRangeGraphics
	.word	GetItemUseDescId
	.word	Text_GetStringNextLine
	.word	gBattleTarget+90
	.word	gBattleTarget
	.size	SpellOnHover, .-SpellOnHover
	.align	1
	.global	SpellOnUnhover
	.syntax unified
	.code	16
	.thumb_func
	.type	SpellOnUnhover, %function
SpellOnUnhover:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ SpellMenu.c:199: 	if ( !DidSelectSpell ) // Don't hide the squares if we're going to the target selection menu.
	ldr	r4, .L395	@ tmp117,
@ SpellMenu.c:199: 	if ( !DidSelectSpell ) // Don't hide the squares if we're going to the target selection menu.
	ldrb	r3, [r4]	@ DidSelectSpell, DidSelectSpell
	cmp	r3, #0	@ DidSelectSpell,
	bne	.L394		@,
@ SpellMenu.c:201: 		HideMoveRangeGraphics();
	ldr	r3, .L395+4	@ tmp119,
	bl	.L14		@
.L394:
@ SpellMenu.c:205: }
	@ sp needed	@
@ SpellMenu.c:203: 	DidSelectSpell = 0; // Unset this variable.
	movs	r0, #0	@ tmp121,
	strb	r0, [r4]	@ tmp121, DidSelectSpell
@ SpellMenu.c:205: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L396:
	.align	2
.L395:
	.word	DidSelectSpell
	.word	HideMoveRangeGraphics
	.size	SpellOnUnhover, .-SpellOnUnhover
	.align	1
	.global	NewMenuRText
	.syntax unified
	.code	16
	.thumb_func
	.type	NewMenuRText, %function
NewMenuRText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r1	@ commandProc, commandProc
	push	{r4, r5, r6, r7, lr}	@
@ SpellMenu.c:211: 	if ( UsingSpellMenu )
	ldr	r2, .L402	@ tmp145,
@ SpellMenu.c:209: 	int xTile = commandProc->xDrawTile * 8;
	ldrh	r4, [r1, #42]	@ _2,
@ SpellMenu.c:210: 	int yTile = commandProc->yDrawTile * 8;
	ldrh	r5, [r1, #44]	@ _4,
@ SpellMenu.c:211: 	if ( UsingSpellMenu )
	ldrb	r1, [r2]	@ UsingSpellMenu.125_5, UsingSpellMenu
@ SpellMenu.c:208: {
	sub	sp, sp, #20	@,,
	adds	r3, r3, #60	@ commandProc,
@ SpellMenu.c:211: 	if ( UsingSpellMenu )
	str	r2, [sp, #4]	@ tmp145, %sfp
	str	r3, [sp, #8]	@ commandProc, %sfp
	ldr	r7, .L402+4	@ tmp173,
@ SpellMenu.c:209: 	int xTile = commandProc->xDrawTile * 8;
	lsls	r4, r4, #3	@ xTile, _2,
@ SpellMenu.c:210: 	int yTile = commandProc->yDrawTile * 8;
	lsls	r5, r5, #3	@ yTile, _4,
@ SpellMenu.c:211: 	if ( UsingSpellMenu )
	cmp	r1, #0	@ UsingSpellMenu.125_5,
	beq	.L398		@,
@ SpellMenu.c:214: 		DrawItemRText(xTile,yTile,SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,commandProc->commandDefinitionIndex,UsingSpellMenu)]);
	ldr	r6, .L402+8	@ tmp146,
	ldr	r0, [r6]	@, gActiveUnit
	bl	SpellsGetter		@
@ SpellMenu.c:214: 		DrawItemRText(xTile,yTile,SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,commandProc->commandDefinitionIndex,UsingSpellMenu)]);
	ldr	r3, [sp, #4]	@ tmp145, %sfp
@ SpellMenu.c:214: 		DrawItemRText(xTile,yTile,SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,commandProc->commandDefinitionIndex,UsingSpellMenu)]);
	str	r0, [sp, #12]	@, %sfp
@ SpellMenu.c:214: 		DrawItemRText(xTile,yTile,SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,commandProc->commandDefinitionIndex,UsingSpellMenu)]);
	ldrb	r2, [r3]	@ _13, UsingSpellMenu
	ldr	r3, [sp, #8]	@ tmp172, %sfp
	ldr	r0, [r6]	@, gActiveUnit
	ldrb	r1, [r3]	@ _11,
	bl	GetNthUsableSpell		@
@ SpellMenu.c:214: 		DrawItemRText(xTile,yTile,SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,commandProc->commandDefinitionIndex,UsingSpellMenu)]);
	ldr	r3, [sp, #12]	@ _8, %sfp
	ldrb	r2, [r3, r0]	@ _18, *_16
.L401:
@ SpellMenu.c:225: 			DrawItemRText(xTile,yTile,*((u16*)&gGameState+0x16)); // Probably related to special cases like ballistae?
	movs	r1, r5	@, yTile
	movs	r0, r4	@, xTile
	bl	.L404		@
@ SpellMenu.c:228: }
	add	sp, sp, #20	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L398:
@ SpellMenu.c:219: 		if ( commandProc->commandDefinitionIndex <= 4 )
	ldr	r3, [sp, #8]	@ tmp172, %sfp
	ldrb	r3, [r3]	@ _19,
@ SpellMenu.c:219: 		if ( commandProc->commandDefinitionIndex <= 4 )
	cmp	r3, #4	@ _19,
	bhi	.L400		@,
@ SpellMenu.c:221: 			DrawItemRText(xTile,yTile,gActiveUnit->items[commandProc->commandDefinitionIndex]);
	ldr	r2, .L402+8	@ tmp162,
	adds	r3, r3, #12	@ tmp163,
	ldr	r2, [r2]	@ gActiveUnit, gActiveUnit
	lsls	r3, r3, #1	@ tmp164, tmp163,
	adds	r3, r2, r3	@ tmp165, gActiveUnit, tmp164
@ SpellMenu.c:221: 			DrawItemRText(xTile,yTile,gActiveUnit->items[commandProc->commandDefinitionIndex]);
	ldrh	r2, [r3, #6]	@ _23, *gActiveUnit.130_20
	b	.L401		@
.L400:
@ SpellMenu.c:225: 			DrawItemRText(xTile,yTile,*((u16*)&gGameState+0x16)); // Probably related to special cases like ballistae?
	ldr	r3, .L402+12	@ tmp169,
@ SpellMenu.c:225: 			DrawItemRText(xTile,yTile,*((u16*)&gGameState+0x16)); // Probably related to special cases like ballistae?
	ldrh	r2, [r3, #44]	@ _25, MEM[(u16 *)&gGameState + 44B]
	b	.L401		@
.L403:
	.align	2
.L402:
	.word	UsingSpellMenu
	.word	DrawItemRText
	.word	gActiveUnit
	.word	gGameState
	.size	NewMenuRText, .-NewMenuRText
	.align	1
	.global	NewExitBattleForecast
	.syntax unified
	.code	16
	.thumb_func
	.type	NewExitBattleForecast, %function
NewExitBattleForecast:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ SpellMenu.c:236: 	if ( UsingSpellMenu == BLACK_MAGIC ) { GaidenBlackMagicUMEffect(NULL,NULL); }
	movs	r1, #0	@,
@ SpellMenu.c:231: {
	push	{r4, lr}	@
@ SpellMenu.c:236: 	if ( UsingSpellMenu == BLACK_MAGIC ) { GaidenBlackMagicUMEffect(NULL,NULL); }
	ldr	r3, .L409	@ tmp116,
	ldrb	r3, [r3]	@ UsingSpellMenu.131_1, UsingSpellMenu
@ SpellMenu.c:236: 	if ( UsingSpellMenu == BLACK_MAGIC ) { GaidenBlackMagicUMEffect(NULL,NULL); }
	movs	r0, r1	@,
@ SpellMenu.c:236: 	if ( UsingSpellMenu == BLACK_MAGIC ) { GaidenBlackMagicUMEffect(NULL,NULL); }
	cmp	r3, #1	@ UsingSpellMenu.131_1,
	bne	.L406		@,
@ SpellMenu.c:236: 	if ( UsingSpellMenu == BLACK_MAGIC ) { GaidenBlackMagicUMEffect(NULL,NULL); }
	bl	GaidenBlackMagicUMEffect		@
.L407:
@ SpellMenu.c:244: }
	@ sp needed	@
@ SpellMenu.c:243: 	SelectedSpell = 0; // Regardless of use case, ensure that this is 0.
	movs	r2, #0	@ tmp119,
	ldr	r3, .L409+4	@ tmp118,
	strb	r2, [r3]	@ tmp119, SelectedSpell
@ SpellMenu.c:244: }
	pop	{r4}
	pop	{r0}
	bx	r0
.L406:
@ SpellMenu.c:237: 	else if ( UsingSpellMenu == WHITE_MAGIC ) { GaidenWhiteMagicUMEffect(NULL,NULL); }
	cmp	r3, #2	@ UsingSpellMenu.131_1,
	bne	.L408		@,
@ SpellMenu.c:237: 	else if ( UsingSpellMenu == WHITE_MAGIC ) { GaidenWhiteMagicUMEffect(NULL,NULL); }
	bl	GaidenWhiteMagicUMEffect		@
	b	.L407		@
.L408:
@ SpellMenu.c:241: 		AttackUMEffect(NULL,NULL);
	ldr	r3, .L409+8	@ tmp117,
	bl	.L14		@
	b	.L407		@
.L410:
	.align	2
.L409:
	.word	UsingSpellMenu
	.word	SelectedSpell
	.word	AttackUMEffect
	.size	NewExitBattleForecast, .-NewExitBattleForecast
	.align	1
	.global	GaidenStatScreen
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenStatScreen, %function
GaidenStatScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}	@
	lsls	r5, r1, #5	@ _63, y,
@ StatScreen.c:4: 	u8* spells = SpellsGetter(gpStatScreenUnit,-1);
	movs	r1, #1	@,
@ StatScreen.c:3: {
	movs	r4, r2	@ currHandle, currHandle
@ StatScreen.c:4: 	u8* spells = SpellsGetter(gpStatScreenUnit,-1);
	ldr	r3, .L414	@ tmp143,
@ StatScreen.c:3: {
	movs	r6, r0	@ x, x
@ StatScreen.c:4: 	u8* spells = SpellsGetter(gpStatScreenUnit,-1);
	rsbs	r1, r1, #0	@,
	ldr	r0, [r3]	@, gpStatScreenUnit
	bl	SpellsGetter		@
@ StatScreen.c:5: 	int tile = (currHandle-1)->tileIndexOffset;
	movs	r3, r4	@ tmp144, currHandle
	movs	r7, r0	@ ivtmp.471, spells
	subs	r3, r3, #8	@ tmp144,
@ StatScreen.c:5: 	int tile = (currHandle-1)->tileIndexOffset;
	ldrh	r3, [r3]	@ tile, MEM[(struct TextHandle *)currHandle_23(D) + 4294967288B]
	adds	r5, r5, r6	@ _65, _63, x
	str	r3, [sp]	@ tile, %sfp
	ldr	r3, .L414+4	@ tmp148,
	lsls	r5, r5, #1	@ _66, _65,
	adds	r5, r5, r3	@ ivtmp.474, _66, tmp148
.L412:
@ StatScreen.c:8: 	for ( int i = 0 ; spells[i] ; i++ )
	adds	r7, r7, #1	@ ivtmp.471,
@ StatScreen.c:8: 	for ( int i = 0 ; spells[i] ; i++ )
	subs	r3, r7, #1	@ tmp173, ivtmp.471,
	ldrb	r0, [r3]	@ _14, MEM[(u8 *)_68 + 4294967295B]
@ StatScreen.c:8: 	for ( int i = 0 ; spells[i] ; i++ )
	cmp	r0, #0	@ _14,
	bne	.L413		@,
@ StatScreen.c:33: }
	@ sp needed	@
	movs	r0, r4	@, currHandle
	pop	{r1, r2, r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L413:
@ StatScreen.c:10: 		const ItemData* item = GetItemData(spells[i]);
	ldr	r3, .L414+8	@ tmp149,
	bl	.L14		@
@ StatScreen.c:11: 		DrawIcon(&StatScreenBufferMap[iconY][iconX],item->iconId,0x4000);
	movs	r2, #128	@,
@ StatScreen.c:10: 		const ItemData* item = GetItemData(spells[i]);
	str	r0, [sp, #4]	@, %sfp
@ StatScreen.c:11: 		DrawIcon(&StatScreenBufferMap[iconY][iconX],item->iconId,0x4000);
	lsls	r2, r2, #7	@,,
	ldrb	r1, [r0, #29]	@ _5,
	ldr	r3, .L414+12	@ tmp152,
	movs	r0, r5	@, ivtmp.474
	bl	.L14		@
@ StatScreen.c:13: 		tile += 8;
	ldr	r3, [sp]	@ tile, %sfp
	adds	r3, r3, #8	@ tile,
@ StatScreen.c:15: 		currHandle->xCursor = 0;
	movs	r6, #0	@ tmp154,
@ StatScreen.c:14: 		currHandle->tileIndexOffset = tile;
	strh	r3, [r4]	@ tile, MEM[(short unsigned int *)currHandle_15]
@ StatScreen.c:13: 		tile += 8;
	str	r3, [sp]	@ tile, %sfp
@ StatScreen.c:17: 		currHandle->tileWidth = 8;
	movs	r3, #8	@ tmp193,
@ StatScreen.c:22: 		Text_Clear(currHandle);
	movs	r0, r4	@, currHandle
@ StatScreen.c:15: 		currHandle->xCursor = 0;
	strb	r6, [r4, #2]	@ tmp154, MEM[(unsigned char *)currHandle_15 + 2B]
@ StatScreen.c:16: 		currHandle->colorId = TEXT_COLOR_NORMAL;
	strb	r6, [r4, #3]	@ tmp154, MEM[(unsigned char *)currHandle_15 + 3B]
@ StatScreen.c:17: 		currHandle->tileWidth = 8;
	strb	r3, [r4, #4]	@ tmp192, MEM[(unsigned char *)currHandle_15 + 4B]
@ StatScreen.c:18: 		currHandle->useDoubleBuffer = 0;
	strb	r6, [r4, #5]	@ tmp154, MEM[(unsigned char *)currHandle_15 + 5B]
@ StatScreen.c:19: 		currHandle->currentBufferId = 0;
	strb	r6, [r4, #6]	@ tmp154, MEM[(unsigned char *)currHandle_15 + 6B]
@ StatScreen.c:20: 		currHandle->unk07 = 0;
	strb	r6, [r4, #7]	@ tmp154, MEM[(unsigned char *)currHandle_15 + 7B]
@ StatScreen.c:22: 		Text_Clear(currHandle);
	ldr	r3, .L414+16	@ tmp166,
	bl	.L14		@
@ StatScreen.c:23: 		Text_SetColorId(currHandle,TEXT_COLOR_NORMAL);
	movs	r1, r6	@, tmp154
	movs	r0, r4	@, currHandle
	ldr	r3, .L414+20	@ tmp167,
	bl	.L14		@
@ StatScreen.c:24: 		Text_InsertString(currHandle,0,TEXT_COLOR_NORMAL,GetStringFromIndex(item->nameTextId));
	ldr	r3, [sp, #4]	@ item, %sfp
	ldrh	r0, [r3]	@ _8, *item_28
	ldr	r3, .L414+24	@ tmp169,
	bl	.L14		@
@ StatScreen.c:24: 		Text_InsertString(currHandle,0,TEXT_COLOR_NORMAL,GetStringFromIndex(item->nameTextId));
	movs	r2, r6	@, tmp154
@ StatScreen.c:24: 		Text_InsertString(currHandle,0,TEXT_COLOR_NORMAL,GetStringFromIndex(item->nameTextId));
	movs	r3, r0	@ _9,
@ StatScreen.c:24: 		Text_InsertString(currHandle,0,TEXT_COLOR_NORMAL,GetStringFromIndex(item->nameTextId));
	movs	r1, r6	@, tmp154
	movs	r0, r4	@, currHandle
	ldr	r6, .L414+28	@ tmp170,
	bl	.L15		@
@ StatScreen.c:25: 		Text_Display(currHandle,&StatScreenBufferMap[iconY][iconX+2]);
	movs	r0, r4	@, currHandle
	adds	r1, r5, #4	@ _70, ivtmp.474,
	ldr	r3, .L414+32	@ tmp172,
	bl	.L14		@
@ StatScreen.c:27: 		currHandle++;
	adds	r4, r4, #8	@ currHandle,
	adds	r5, r5, #128	@ ivtmp.474,
	b	.L412		@
.L415:
	.align	2
.L414:
	.word	gpStatScreenUnit
	.word	StatScreenBufferMap
	.word	GetItemData
	.word	DrawIcon
	.word	Text_Clear
	.word	Text_SetColorId
	.word	GetStringFromIndex
	.word	Text_InsertString
	.word	Text_Display
	.size	GaidenStatScreen, .-GaidenStatScreen
	.align	1
	.global	GaidenRTextGetter
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenRTextGetter, %function
GaidenRTextGetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ StatScreen.c:38: 	proc->type = SpellsGetter(gpStatScreenUnit,-1)[index]; // I think if this is positive, it treats this as an item bubble.
	movs	r1, #1	@,
@ StatScreen.c:36: {
	push	{r4, r5, r6, lr}	@
@ StatScreen.c:36: {
	movs	r4, r0	@ proc, proc
@ StatScreen.c:40: }
	@ sp needed	@
@ StatScreen.c:37: 	int index = *(proc->rTextData+0x12);
	ldr	r3, [r0, #44]	@ proc_12(D)->rTextData, proc_12(D)->rTextData
	ldrb	r5, [r3, #18]	@ _2, MEM[(char *)_1 + 18B]
@ StatScreen.c:38: 	proc->type = SpellsGetter(gpStatScreenUnit,-1)[index]; // I think if this is positive, it treats this as an item bubble.
	ldr	r3, .L417	@ tmp127,
	rsbs	r1, r1, #0	@,
	ldr	r0, [r3]	@, gpStatScreenUnit
	bl	SpellsGetter		@
@ StatScreen.c:38: 	proc->type = SpellsGetter(gpStatScreenUnit,-1)[index]; // I think if this is positive, it treats this as an item bubble.
	movs	r3, r4	@ tmp130, proc
@ StatScreen.c:38: 	proc->type = SpellsGetter(gpStatScreenUnit,-1)[index]; // I think if this is positive, it treats this as an item bubble.
	ldrb	r0, [r0, r5]	@ _7, *_6
@ StatScreen.c:38: 	proc->type = SpellsGetter(gpStatScreenUnit,-1)[index]; // I think if this is positive, it treats this as an item bubble.
	adds	r3, r3, #78	@ tmp130,
	strh	r0, [r3]	@ _7, proc_12(D)->type
@ StatScreen.c:39: 	proc->textID = GetItemData(proc->type)->descTextId;
	ldr	r3, .L417+4	@ tmp132,
	bl	.L14		@
@ StatScreen.c:39: 	proc->textID = GetItemData(proc->type)->descTextId;
	ldrh	r3, [r0, #2]	@ tmp136,
	adds	r4, r4, #76	@ tmp135,
	strh	r3, [r4]	@ tmp136, proc_12(D)->textID
@ StatScreen.c:40: }
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L418:
	.align	2
.L417:
	.word	gpStatScreenUnit
	.word	GetItemData
	.size	GaidenRTextGetter, .-GaidenRTextGetter
	.align	1
	.global	GaidenRTextLooper
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenRTextLooper, %function
GaidenRTextLooper:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ StatScreen.c:45: 	if ( proc->direction == DIRECTION_UP )
	movs	r6, r0	@ tmp135, proc
@ StatScreen.c:44: 	int index = *(proc->rTextData+0x12);
	ldr	r3, [r0, #44]	@ proc_23(D)->rTextData, proc_23(D)->rTextData
@ StatScreen.c:45: 	if ( proc->direction == DIRECTION_UP )
	adds	r6, r6, #80	@ tmp135,
@ StatScreen.c:44: 	int index = *(proc->rTextData+0x12);
	ldrb	r4, [r3, #18]	@ _2, MEM[(char *)_1 + 18B]
@ StatScreen.c:45: 	if ( proc->direction == DIRECTION_UP )
	ldrh	r3, [r6]	@ tmp136,
@ StatScreen.c:43: {
	movs	r5, r0	@ proc, proc
@ StatScreen.c:45: 	if ( proc->direction == DIRECTION_UP )
	cmp	r3, #0	@ tmp136,
	bne	.L421		@,
.L422:
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	movs	r1, #1	@,
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	ldr	r3, .L428	@ tmp138,
	ldr	r7, [r3]	@ gpStatScreenUnit.138_4, gpStatScreenUnit
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	rsbs	r1, r1, #0	@,
	movs	r0, r7	@, gpStatScreenUnit.138_4
	bl	SpellsGetter		@
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	ldrb	r1, [r0, r4]	@ *_7, *_7
	movs	r0, r7	@, gpStatScreenUnit.138_4
	bl	DoesUnitKnowSpell		@
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	cmp	r0, #0	@ _9,
	bne	.L421		@,
@ StatScreen.c:50: 			RTextUp(proc);
	movs	r0, r5	@, proc
	ldr	r3, .L428+4	@ tmp137,
	bl	.L14		@
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	subs	r4, r4, #1	@ ivtmp.495, ivtmp.495
	bcs	.L422		@,
.L421:
@ StatScreen.c:54: 	if ( proc->direction == DIRECTION_DOWN )
	ldrh	r3, [r6]	@ tmp144,
	cmp	r3, #128	@ tmp144,
	bne	.L419		@,
@ StatScreen.c:57: 		if ( !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	movs	r1, #1	@,
@ StatScreen.c:57: 		if ( !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	ldr	r3, .L428	@ tmp145,
	ldr	r6, [r3]	@ gpStatScreenUnit.141_11, gpStatScreenUnit
@ StatScreen.c:57: 		if ( !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	rsbs	r1, r1, #0	@,
	movs	r0, r6	@, gpStatScreenUnit.141_11
	bl	SpellsGetter		@
@ StatScreen.c:57: 		if ( !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	ldrb	r1, [r0, r4]	@ *_14, *_14
	movs	r0, r6	@, gpStatScreenUnit.141_11
	bl	DoesUnitKnowSpell		@
@ StatScreen.c:57: 		if ( !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	cmp	r0, #0	@ _16,
	bne	.L419		@,
@ StatScreen.c:59: 			RTextDown(proc);
	movs	r0, r5	@, proc
	ldr	r3, .L428+8	@ tmp148,
	bl	.L14		@
.L419:
@ StatScreen.c:64: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L429:
	.align	2
.L428:
	.word	gpStatScreenUnit
	.word	RTextUp
	.word	RTextDown
	.size	GaidenRTextLooper, .-GaidenRTextLooper
	.ident	"GCC: (devkitARM release 66) 15.1.0"
	.code 16
	.align	1
.L14:
	bx	r3
.L16:
	bx	r4
.L392:
	bx	r5
.L15:
	bx	r6
.L404:
	bx	r7
