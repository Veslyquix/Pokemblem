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
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -Os -fno-jump-tables
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
@ RangeDisplay.c:62:   long long existingMin = existing >> 40;
	asrs	r7, r1, #31	@ existingMin_14, existing,
@ RangeDisplay.c:63:   long long newMin = new >> 40;
	asrs	r5, r3, #8	@ newMin_15, new,
	asrs	r6, r3, #31	@ newMin_15, new,
@ RangeDisplay.c:67:          ((newMin < existingMin ? newMin : existingMin) << 40) |
	asrs	r4, r1, #8	@ _5, existing,
	cmp	r7, r6	@ existingMin_14, newMin_15
	bgt	.L3		@,
	bne	.L2		@,
	cmp	r4, r5	@ _5, newMin_15
	bls	.L2		@,
.L3:
	movs	r4, r5	@ _5, newMin_15
.L2:
@ RangeDisplay.c:66:   return existingMask | newMask |
	orrs	r0, r2	@ _3, new
@ RangeDisplay.c:64:   long long existingMax = (existing >> 32) & 0xFF;
	movs	r2, #255	@ tmp145,
@ RangeDisplay.c:67:          ((newMin < existingMin ? newMin : existingMin) << 40) |
	lsls	r4, r4, #8	@ _6, _5,
@ RangeDisplay.c:65:   long long newMax = (new >> 32) & 0xFF;
	ands	r3, r2	@ newMax_17, tmp145
@ RangeDisplay.c:68:          ((newMax > existingMax ? newMax : existingMax) << 32);
	ands	r1, r2	@ _8, tmp145
	cmp	r3, r1	@ newMax_17, _8
	bls	.L4		@,
	movs	r1, r3	@ _8, newMax_17
.L4:
@ RangeDisplay.c:69: }
	@ sp needed	@
@ RangeDisplay.c:67:          ((newMin < existingMin ? newMin : existingMin) << 40) |
	orrs	r1, r4	@ _18, _6
@ RangeDisplay.c:69: }
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	movs	r4, r0	@ spellsList, spellsList
	sub	sp, sp, #28	@,,
@ UnitMenu.c:111:                            MenuCommandProc *commandProc) {
	subs	r0, r1, #0	@ proc, proc,
@ UnitMenu.c:112:   if (proc && commandProc->availability == 2) {
	beq	.L7		@,
@ UnitMenu.c:112:   if (proc && commandProc->availability == 2) {
	adds	r2, r2, #61	@ tmp132,
@ UnitMenu.c:112:   if (proc && commandProc->availability == 2) {
	ldrb	r3, [r2]	@ tmp133,
	cmp	r3, #2	@ tmp133,
	bne	.L7		@,
@ UnitMenu.c:114:     MenuCallHelpBox(proc, gGaidenMagicUMErrorText);
	ldr	r3, .L12	@ tmp134,
	ldrh	r1, [r3]	@ gGaidenMagicUMErrorText, gGaidenMagicUMErrorText
	ldr	r3, .L12+4	@ tmp136,
	bl	.L14		@
@ UnitMenu.c:115:     return 0x08;
	movs	r0, #8	@ <retval>,
.L6:
@ UnitMenu.c:129: }
	add	sp, sp, #28	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L7:
@ UnitMenu.c:117:     _ResetIconGraphics();
	ldr	r3, .L12+8	@ tmp137,
	bl	.L14		@
@ UnitMenu.c:118:     SelectedSpell = spellsList[0];
	ldrb	r2, [r4]	@ _3, *spellsList_19(D)
@ UnitMenu.c:118:     SelectedSpell = spellsList[0];
	ldr	r3, .L12+12	@ tmp138,
@ UnitMenu.c:119:     LoadIconPalettes(4);
	movs	r0, #4	@,
@ UnitMenu.c:118:     SelectedSpell = spellsList[0];
	strb	r2, [r3]	@ _3, SelectedSpell
@ UnitMenu.c:119:     LoadIconPalettes(4);
	ldr	r3, .L12+16	@ tmp140,
	bl	.L14		@
@ UnitMenu.c:120:     MenuProc *menu = StartMenu(&SpellSelectMenuDefs);
	ldr	r3, .L12+20	@ tmp142,
	ldr	r0, .L12+24	@ tmp141,
	bl	.L14		@
@ UnitMenu.c:123:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	movs	r3, r0	@ tmp144, menu
	adds	r3, r3, #96	@ tmp144,
@ UnitMenu.c:120:     MenuProc *menu = StartMenu(&SpellSelectMenuDefs);
	movs	r4, r0	@ menu,
@ UnitMenu.c:123:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	ldrb	r0, [r3]	@ _5,
	ldr	r3, .L12+28	@ tmp146,
	bl	.L14		@
@ UnitMenu.c:123:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	ldr	r5, .L12+32	@ tmp147,
@ UnitMenu.c:123:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	str	r0, [sp, #20]	@, %sfp
@ UnitMenu.c:123:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	ldr	r3, .L12+36	@ tmp148,
	ldr	r0, [r5]	@, gActiveUnit
	bl	.L14		@
@ UnitMenu.c:123:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	ldr	r3, .L12+40	@ tmp149,
@ UnitMenu.c:123:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	movs	r7, r0	@ _8,
@ UnitMenu.c:123:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	ldr	r6, [r3]	@ ItemMenuFaceChr.129_9, ItemMenuFaceChr
	movs	r0, #0	@,
	ldr	r3, .L12+44	@ tmp150,
	bl	.L14		@
@ UnitMenu.c:123:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	movs	r3, #0	@ tmp151,
	movs	r2, r7	@, _8
	str	r4, [sp, #8]	@ menu,
	str	r3, [sp, #4]	@ tmp151,
	str	r0, [sp]	@ _10,
	movs	r3, r6	@, ItemMenuFaceChr.129_9
	movs	r0, #48	@,
	ldr	r1, [sp, #20]	@, %sfp
	ldr	r6, .L12+48	@ tmp152,
	bl	.L15		@
@ UnitMenu.c:126:     ForceMenuItemPanel(menu, gActiveUnit, 15, 11);
	movs	r0, r4	@, menu
	movs	r3, #11	@,
	movs	r2, #15	@,
	ldr	r1, [r5]	@, gActiveUnit
	ldr	r4, .L12+52	@ tmp154,
	bl	.L16		@
@ UnitMenu.c:127:     return 0x17;
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
	.word	GetActiveUnitMenuBottomY
	.word	gActiveUnit
	.word	GetUnitPortraitId
	.word	ItemMenuFaceChr
	.word	GetFaceSlotPalID
	.word	StartFaceChibiSpr
	.word	ForceMenuItemPanel
	.size	GaidenMagicUMEffectExt, .-GaidenMagicUMEffectExt
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
	ldr	r3, .L18	@ tmp127,
	ldr	r2, [r3]	@ unit, gActiveUnit
@ SpellMenu.c:34: 	unit->state &= ~(1UL << 30); // Always clear capturing bit if leaving menu 
	ldr	r1, .L18+4	@ tmp130,
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
	ldr	r0, .L18+8	@ tmp131,
	ldr	r3, .L18+12	@ tmp132,
	bl	.L14		@
@ SpellMenu.c:38: 	EnableBgSyncByMask(4);
	movs	r0, #4	@,
	ldr	r3, .L18+16	@ tmp133,
	bl	.L14		@
@ SpellMenu.c:39: 	Text_ResetTileAllocation();
	ldr	r3, .L18+20	@ tmp134,
	bl	.L14		@
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldr	r0, .L18+24	@ tmp139,
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldr	r3, .L18+28	@ tmp135,
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldrh	r1, [r0, #28]	@ _4,
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldr	r2, .L18+32	@ tmp137,
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldrh	r0, [r0, #12]	@ _6,
@ SpellMenu.c:41: 	StartMenu_AndDoSomethingCommands(&gMenu_UnitMenu,gGameState._unk1C.x - gGameState.cameraRealPos.x, UnitMenuLeft, UnitMenuRight);
	ldrb	r2, [r2]	@ _9, UnitMenuLeft
	subs	r1, r1, r0	@ _7, _4, _6
	ldrb	r3, [r3]	@ _11, UnitMenuRight
	ldr	r4, .L18+36	@ tmp145,
	ldr	r0, .L18+40	@ tmp144,
	bl	.L16		@
@ SpellMenu.c:42: 	HideMoveRangeGraphics();
	ldr	r3, .L18+44	@ tmp146,
	bl	.L14		@
@ SpellMenu.c:43: 	SelectedSpell = 0;
	movs	r2, #0	@ tmp148,
	ldr	r3, .L18+48	@ tmp147,
	strb	r2, [r3]	@ tmp148, SelectedSpell
@ SpellMenu.c:44: 	UsingSpellMenu = 0;
	ldr	r3, .L18+52	@ tmp150,
@ SpellMenu.c:46: }
	movs	r0, #59	@,
@ SpellMenu.c:44: 	UsingSpellMenu = 0;
	strb	r2, [r3]	@ tmp148, UsingSpellMenu
@ SpellMenu.c:46: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L19:
	.align	2
.L18:
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
	bne	.L21		@,
@ SpellMenu.c:53: 		MenuCallHelpBox(proc,gGaidenMagicSpellMenuErrorText);
	ldr	r3, .L32	@ tmp138,
	ldrh	r1, [r3]	@ gGaidenMagicSpellMenuErrorText, gGaidenMagicSpellMenuErrorText
	ldr	r3, .L32+4	@ tmp140,
	bl	.L14		@
@ SpellMenu.c:54: 		return 0x08;
	movs	r0, #8	@ <retval>,
.L20:
@ SpellMenu.c:107: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L21:
@ SpellMenu.c:58: 		Unit* unit = gActiveUnit;
	ldr	r5, .L32+8	@ tmp141,
	ldr	r3, [r5]	@ unit, gActiveUnit
@ SpellMenu.c:59: 		if ( unit->ranks[0] != SelectedSpell) 
	movs	r6, r3	@ tmp144, unit
@ SpellMenu.c:59: 		if ( unit->ranks[0] != SelectedSpell) 
	ldr	r4, .L32+12	@ tmp145,
@ SpellMenu.c:59: 		if ( unit->ranks[0] != SelectedSpell) 
	adds	r6, r6, #40	@ tmp144,
	ldrb	r0, [r6]	@ _3,
@ SpellMenu.c:59: 		if ( unit->ranks[0] != SelectedSpell) 
	ldrb	r1, [r4]	@ SelectedSpell.42_4, SelectedSpell
@ SpellMenu.c:59: 		if ( unit->ranks[0] != SelectedSpell) 
	cmp	r0, r1	@ _3, SelectedSpell.42_4
	bne	.L23		@,
.L28:
@ SpellMenu.c:88: 		gActionData.itemSlotIndex = 0;
	movs	r2, #0	@ tmp147,
	ldr	r3, .L32+16	@ tmp146,
	strb	r2, [r3, #18]	@ tmp147, gActionData.itemSlotIndex
@ SpellMenu.c:89: 		DidSelectSpell = 1;
	ldr	r3, .L32+20	@ tmp149,
	adds	r2, r2, #1	@ tmp150,
	strb	r2, [r3]	@ tmp150, DidSelectSpell
@ SpellMenu.c:90: 		ClearBG0BG1();
	ldr	r3, .L32+24	@ tmp152,
	bl	.L14		@
@ SpellMenu.c:91: 		int type = GetItemType(SelectedSpell);
	ldr	r3, .L32+28	@ tmp155,
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
	bne	.L24		@,
@ SpellMenu.c:103: 			ItemEffect_Call(gActiveUnit,SelectedSpell|0xFF00);
	ldr	r3, .L32+32	@ tmp169,
	bl	.L14		@
	b	.L29		@
.L23:
	movs	r2, r3	@ ivtmp.217, unit
	adds	r3, r3, #45	@ _45,
	adds	r2, r2, #41	@ ivtmp.217,
.L27:
@ SpellMenu.c:64: 			if (unit->ranks[i] == SelectedSpell) 
	ldrb	r7, [r2]	@ MEM[(unsigned char *)_11], MEM[(unsigned char *)_11]
	cmp	r7, r1	@ MEM[(unsigned char *)_11], SelectedSpell.42_4
	bne	.L26		@,
@ SpellMenu.c:66: 			unit->ranks[i] = PreviousSelection;
	strb	r0, [r2]	@ _3, MEM[(unsigned char *)_11]
@ SpellMenu.c:67: 			unit->ranks[0] = SelectedSpell;
	strb	r1, [r6]	@ SelectedSpell.42_4, unit_25->ranks[0]
.L26:
@ SpellMenu.c:62: 		for ( int i = 1 ; i < 5 ; i++ ) 
	adds	r2, r2, #1	@ ivtmp.217,
	cmp	r2, r3	@ ivtmp.217, _45
	bne	.L27		@,
	b	.L28		@
.L24:
@ SpellMenu.c:98: 			MakeTargetListForWeapon(gActiveUnit,SelectedSpell|0xFF00);
	ldr	r3, .L32+36	@ tmp166,
	bl	.L14		@
@ SpellMenu.c:99: 			StartTargetSelection(&SpellTargetSelection);
	ldr	r0, .L32+40	@ tmp167,
	ldr	r3, .L32+44	@ tmp168,
	bl	.L14		@
.L29:
@ SpellMenu.c:105: 		return 0x27;
	movs	r0, #39	@ <retval>,
	b	.L20		@
.L33:
	.align	2
.L32:
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
	ldr	r4, .L36	@ tmp117,
@ SpellMenu.c:199: 	if ( !DidSelectSpell ) // Don't hide the squares if we're going to the target selection menu.
	ldrb	r3, [r4]	@ DidSelectSpell, DidSelectSpell
	cmp	r3, #0	@ DidSelectSpell,
	bne	.L35		@,
@ SpellMenu.c:201: 		HideMoveRangeGraphics();
	ldr	r3, .L36+4	@ tmp119,
	bl	.L14		@
.L35:
@ SpellMenu.c:205: }
	@ sp needed	@
@ SpellMenu.c:203: 	DidSelectSpell = 0; // Unset this variable.
	movs	r0, #0	@ tmp121,
	strb	r0, [r4]	@ tmp121, DidSelectSpell
@ SpellMenu.c:205: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L37:
	.align	2
.L36:
	.word	DidSelectSpell
	.word	HideMoveRangeGraphics
	.size	SpellOnUnhover, .-SpellOnUnhover
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
@ SpellSystem.c:18:   u8 *currBuffer = SpellsBuffer;
	ldr	r3, .L45	@ currBuffer,
	movs	r1, r0	@ ivtmp.232, unit
	movs	r2, r0	@ unit, unit
	movs	r0, r3	@ <retval>, currBuffer
@ SpellSystem.c:13: {
	push	{r4, lr}	@
	adds	r1, r1, #40	@ ivtmp.232,
	adds	r2, r2, #45	@ unit,
.L40:
@ SpellSystem.c:23:     if (unit->ranks[i] != 0) {
	ldrb	r4, [r1]	@ _1, MEM[(unsigned char *)_21]
@ SpellSystem.c:23:     if (unit->ranks[i] != 0) {
	cmp	r4, #0	@ _1,
	beq	.L39		@,
@ SpellSystem.c:25:       *currBuffer = unit->ranks[i];
	strb	r4, [r3]	@ _1, *currBuffer_16
@ SpellSystem.c:26:       currBuffer++;
	adds	r3, r3, #1	@ currBuffer,
.L39:
@ SpellSystem.c:22:   for (int i = 0; i < 5; i++) {
	adds	r1, r1, #1	@ ivtmp.232,
	cmp	r1, r2	@ ivtmp.232, _23
	bne	.L40		@,
@ SpellSystem.c:55: }
	@ sp needed	@
@ SpellSystem.c:53:   *currBuffer = 0;
	movs	r2, #0	@ tmp125,
	strb	r2, [r3]	@ tmp125, *currBuffer_2
@ SpellSystem.c:55: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L46:
	.align	2
.L45:
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
@ SpellSystem.c:7:   return SpellsGetterForLevel(unit, -1, type);
	movs	r1, #1	@,
@ SpellSystem.c:6: {
	push	{r4, lr}	@
@ SpellSystem.c:7:   return SpellsGetterForLevel(unit, -1, type);
	rsbs	r1, r1, #0	@,
	bl	SpellsGetterForLevel		@
@ SpellSystem.c:8: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
	.size	SpellsGetter, .-SpellsGetter
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
@ RangeDisplay.c:94:       unit, (UsingSpellMenu ? UsingSpellMenu
	ldr	r3, .L54	@ tmp129,
	ldrb	r1, [r3]	@ UsingSpellMenu.14_1, UsingSpellMenu
@ RangeDisplay.c:91:     struct Unit *unit) { // based on GetUnitRangeMaskForSpells - Vesly
	movs	r6, r0	@ unit, unit
@ RangeDisplay.c:93:   u8 *spells = SpellsGetter(
	cmp	r1, #0	@ UsingSpellMenu.14_1,
	bne	.L49		@,
@ RangeDisplay.c:93:   u8 *spells = SpellsGetter(
	subs	r1, r1, #1	@ iftmp.13_10,
.L49:
@ RangeDisplay.c:93:   u8 *spells = SpellsGetter(
	movs	r0, r6	@, unit
	bl	SpellsGetter		@
@ RangeDisplay.c:98:     spell = spells[i] | 0xFF00;
	movs	r7, #255	@ tmp145,
@ RangeDisplay.c:93:   u8 *spells = SpellsGetter(
	movs	r4, r0	@ ivtmp.244, ivtmp.244
@ RangeDisplay.c:92:   int i, spell, result = 0;
	movs	r5, #0	@ result,
@ RangeDisplay.c:98:     spell = spells[i] | 0xFF00;
	lsls	r7, r7, #8	@ tmp145, tmp145,
.L50:
@ RangeDisplay.c:97:   for (i = 0; spells[i]; i++) {
	adds	r4, r4, #1	@ ivtmp.244,
@ RangeDisplay.c:97:   for (i = 0; spells[i]; i++) {
	subs	r3, r4, #1	@ tmp134, ivtmp.244,
	ldrb	r1, [r3]	@ _7, MEM[(u8 *)_29 + 4294967295B]
@ RangeDisplay.c:97:   for (i = 0; spells[i]; i++) {
	cmp	r1, #0	@ _7,
	bne	.L51		@,
@ RangeDisplay.c:111:   if (result > 0x10) {
	movs	r0, #1	@ _23,
	cmp	r5, #16	@ result,
	bgt	.L52		@,
	movs	r0, r1	@ _23, _7
.L52:
@ RangeDisplay.c:115: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L51:
@ RangeDisplay.c:99:     result |= gGet_Item_Range(unit, spell);
	ldr	r3, .L54+4	@ tmp132,
	movs	r0, r6	@, unit
	ldr	r3, [r3]	@ gGet_Item_Range, gGet_Item_Range
@ RangeDisplay.c:98:     spell = spells[i] | 0xFF00;
	orrs	r1, r7	@ spell_18, tmp145
@ RangeDisplay.c:99:     result |= gGet_Item_Range(unit, spell);
	bl	.L14		@
@ RangeDisplay.c:99:     result |= gGet_Item_Range(unit, spell);
	orrs	r5, r0	@ result, _20
	b	.L50		@
.L55:
	.align	2
.L54:
	.word	UsingSpellMenu
	.word	gGet_Item_Range
	.size	GM_doesUnitHaveSpecialRange, .-GM_doesUnitHaveSpecialRange
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
@ RangeDisplay.c:132:       unit, (UsingSpellMenu ? UsingSpellMenu
	ldr	r3, .L63	@ tmp123,
@ RangeDisplay.c:129: int GM_GetNthSpell(struct Unit *unit, int index) {
	movs	r4, r1	@ index, index
@ RangeDisplay.c:132:       unit, (UsingSpellMenu ? UsingSpellMenu
	ldrb	r1, [r3]	@ UsingSpellMenu.25_1, UsingSpellMenu
@ RangeDisplay.c:131:   u8 *spells = SpellsGetter(
	cmp	r1, #0	@ UsingSpellMenu.25_1,
	bne	.L57		@,
@ RangeDisplay.c:131:   u8 *spells = SpellsGetter(
	subs	r1, r1, #1	@ iftmp.24_6,
.L57:
@ RangeDisplay.c:131:   u8 *spells = SpellsGetter(
	bl	SpellsGetter		@
@ RangeDisplay.c:135:   spell = spells[index];
	ldrb	r0, [r0, r4]	@ <retval>, *_3
@ RangeDisplay.c:136:   if (spell) {
	cmp	r0, #0	@ <retval>,
	beq	.L56		@,
@ RangeDisplay.c:137:     spell |= 0xFF00;
	movs	r3, #255	@ tmp126,
	lsls	r3, r3, #8	@ tmp126, tmp126,
	orrs	r0, r3	@ <retval>, tmp126
.L56:
@ RangeDisplay.c:142: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L64:
	.align	2
.L63:
	.word	UsingSpellMenu
	.size	GM_GetNthSpell, .-GM_GetNthSpell
	.align	1
	.global	NewGetUnitUseFlags
	.syntax unified
	.code	16
	.thumb_func
	.type	NewGetUnitUseFlags, %function
NewGetUnitUseFlags:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ SpellSystem.c:396:   for (int i = 0; i < 5 && GetEnemyWepBySlot(unit, i); i++) {
	movs	r6, #0	@ i,
@ SpellSystem.c:394: {
	movs	r5, r0	@ unit, unit
@ SpellSystem.c:395:   u32 ret = 0;
	movs	r4, r6	@ <retval>, i
.L66:
@ SpellSystem.c:396:   for (int i = 0; i < 5 && GetEnemyWepBySlot(unit, i); i++) {
	movs	r1, r6	@, i
	movs	r0, r5	@, unit
	ldr	r7, .L95	@ tmp156,
	bl	.L97		@
@ SpellSystem.c:396:   for (int i = 0; i < 5 && GetEnemyWepBySlot(unit, i); i++) {
	cmp	r0, #0	@ _8,
	beq	.L71		@,
@ SpellSystem.c:397:     u32 attributes = GetItemAttributes(GetEnemyWepBySlot(unit, i));
	movs	r1, r6	@, i
	movs	r0, r5	@, unit
	bl	.L97		@
@ SpellSystem.c:397:     u32 attributes = GetItemAttributes(GetEnemyWepBySlot(unit, i));
	ldr	r3, .L95+4	@ tmp141,
	bl	.L14		@
@ SpellSystem.c:398:     if (attributes & IA_WEAPON) {
	movs	r3, #1	@ tmp196,
	tst	r0, r3	@ attributes, tmp196
	beq	.L67		@,
@ SpellSystem.c:399:       if (CanUnitUseWeaponNow(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r1, r6	@, i
	movs	r0, r5	@, unit
	bl	.L97		@
@ SpellSystem.c:399:       if (CanUnitUseWeaponNow(unit, GetEnemyWepBySlot(unit, i))) {
	ldr	r3, .L95+8	@ tmp145,
@ SpellSystem.c:399:       if (CanUnitUseWeaponNow(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r1, r0	@ _3,
@ SpellSystem.c:399:       if (CanUnitUseWeaponNow(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r0, r5	@, unit
	bl	.L14		@
@ SpellSystem.c:400:         ret |= 1;
	movs	r3, #1	@ tmp197,
@ SpellSystem.c:399:       if (CanUnitUseWeaponNow(unit, GetEnemyWepBySlot(unit, i))) {
	cmp	r0, #0	@ _4,
	bne	.L94		@,
.L69:
@ SpellSystem.c:396:   for (int i = 0; i < 5 && GetEnemyWepBySlot(unit, i); i++) {
	adds	r6, r6, #1	@ i,
@ SpellSystem.c:396:   for (int i = 0; i < 5 && GetEnemyWepBySlot(unit, i); i++) {
	cmp	r6, #5	@ i,
	bne	.L66		@,
.L71:
@ SpellSystem.c:409:   u8 *spells = SpellsGetter(unit, -1);
	movs	r1, #1	@,
	movs	r0, r5	@, unit
	rsbs	r1, r1, #0	@,
	bl	SpellsGetter		@
@ SpellSystem.c:412:     if (attributes & IA_WEAPON) {
	movs	r7, #1	@ tmp176,
@ SpellSystem.c:409:   u8 *spells = SpellsGetter(unit, -1);
	movs	r6, r0	@ ivtmp.255, ivtmp.255
.L73:
@ SpellSystem.c:410:   for (int i = 0; spells[i]; i++) {
	ldrb	r0, [r6]	@ _22, MEM[(u8 *)_68]
@ SpellSystem.c:410:   for (int i = 0; spells[i]; i++) {
	cmp	r0, #0	@ _22,
	bne	.L78		@,
@ SpellSystem.c:423: }
	@ sp needed	@
	movs	r0, r4	@, <retval>
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L67:
@ SpellSystem.c:402:     } else if (attributes & IA_STAFF) {
	movs	r3, #4	@ tmp198,
	tst	r0, r3	@ attributes, tmp198
	beq	.L69		@,
@ SpellSystem.c:403:       if (CanUnitUseStaffNow(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r1, r6	@, i
	movs	r0, r5	@, unit
	bl	.L97		@
@ SpellSystem.c:403:       if (CanUnitUseStaffNow(unit, GetEnemyWepBySlot(unit, i))) {
	ldr	r3, .L95+12	@ tmp152,
@ SpellSystem.c:403:       if (CanUnitUseStaffNow(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r1, r0	@ _6,
@ SpellSystem.c:403:       if (CanUnitUseStaffNow(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r0, r5	@, unit
	bl	.L14		@
@ SpellSystem.c:403:       if (CanUnitUseStaffNow(unit, GetEnemyWepBySlot(unit, i))) {
	cmp	r0, #0	@ _7,
	beq	.L69		@,
@ SpellSystem.c:404:         ret |= 2;
	movs	r3, #2	@ tmp155,
.L94:
	orrs	r4, r3	@ <retval>, tmp155
	b	.L69		@
.L78:
@ SpellSystem.c:411:     u32 attributes = GetItemAttributes(spells[i]);
	ldr	r3, .L95+4	@ tmp158,
	bl	.L14		@
@ SpellSystem.c:412:     if (attributes & IA_WEAPON) {
	tst	r0, r7	@ attributes, tmp176
	beq	.L74		@,
@ SpellSystem.c:413:       if (CanUnitUseWeaponNow(unit, spells[i])) {
	movs	r0, r5	@, unit
	ldrb	r1, [r6]	@ _12, MEM[(u8 *)_68]
	ldr	r3, .L95+8	@ tmp162,
	bl	.L14		@
@ SpellSystem.c:413:       if (CanUnitUseWeaponNow(unit, spells[i])) {
	cmp	r0, #0	@ _13,
	beq	.L76		@,
@ SpellSystem.c:414:         ret |= 1;
	orrs	r4, r7	@ <retval>, tmp176
.L76:
	adds	r6, r6, #1	@ ivtmp.255,
	b	.L73		@
.L74:
@ SpellSystem.c:416:     } else if (attributes & IA_STAFF) {
	movs	r3, #4	@ tmp199,
	tst	r0, r3	@ attributes, tmp199
	beq	.L76		@,
@ SpellSystem.c:417:       if (CanUnitUseStaffNow(unit, spells[i])) {
	movs	r0, r5	@, unit
	ldrb	r1, [r6]	@ _18, MEM[(u8 *)_68]
	ldr	r3, .L95+12	@ tmp169,
	bl	.L14		@
@ SpellSystem.c:417:       if (CanUnitUseStaffNow(unit, spells[i])) {
	cmp	r0, #0	@ _19,
	beq	.L76		@,
@ SpellSystem.c:418:         ret |= 2;
	movs	r3, #2	@ tmp172,
	orrs	r4, r3	@ <retval>, tmp172
	b	.L76		@
.L96:
	.align	2
.L95:
	.word	GetEnemyWepBySlot
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
@ SpellSystem.c:463:   if (gBattleActor.levelPrevious != gBattleActor.unit.level) {
	ldr	r2, .L108	@ tmp135,
	ldrb	r0, [r2]	@ _2,
@ SpellSystem.c:463:   if (gBattleActor.levelPrevious != gBattleActor.unit.level) {
	movs	r2, #8	@ _4,
@ SpellSystem.c:463:   if (gBattleActor.levelPrevious != gBattleActor.unit.level) {
	ldr	r3, .L108+4	@ tmp132,
@ SpellSystem.c:463:   if (gBattleActor.levelPrevious != gBattleActor.unit.level) {
	ldrsb	r2, [r3, r2]	@ _4,* _4
@ SpellSystem.c:462:   BattleUnit *subject = NULL;
	subs	r0, r0, r2	@ tmp156, _2, _4
	subs	r2, r0, #1	@ tmp157, tmp156
	sbcs	r0, r0, r2	@ tmp155, tmp156, tmp157
@ SpellSystem.c:466:   if (gBattleTarget.levelPrevious != gBattleTarget.unit.level) {
	ldr	r2, .L108+8	@ tmp142,
	ldrb	r1, [r2]	@ _6,
@ SpellSystem.c:466:   if (gBattleTarget.levelPrevious != gBattleTarget.unit.level) {
	movs	r2, #8	@ _8,
@ SpellSystem.c:462:   BattleUnit *subject = NULL;
	rsbs	r0, r0, #0	@ tmp158, tmp155
	ands	r0, r3	@ subject, tmp132
@ SpellSystem.c:466:   if (gBattleTarget.levelPrevious != gBattleTarget.unit.level) {
	ldr	r3, .L108+12	@ tmp139,
@ SpellSystem.c:466:   if (gBattleTarget.levelPrevious != gBattleTarget.unit.level) {
	ldrsb	r2, [r3, r2]	@ _8,* _8
@ SpellSystem.c:466:   if (gBattleTarget.levelPrevious != gBattleTarget.unit.level) {
	cmp	r1, r2	@ _6, _8
	bne	.L104		@,
@ SpellSystem.c:469:   if (!subject) {
	cmp	r0, #0	@ subject,
	bne	.L100		@,
.L102:
@ SpellSystem.c:470:     return 0;
	movs	r0, #0	@ <retval>,
.L98:
@ SpellSystem.c:482: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L104:
@ SpellSystem.c:467:     subject = &gBattleTarget;
	movs	r0, r3	@ subject, tmp139
.L100:
@ SpellSystem.c:474:   u8 *spells = SpellsGetterForLevel(&subject->unit, subject->unit.level, -1);
	movs	r1, #8	@ _11,
	movs	r2, #1	@,
	ldrsb	r1, [r0, r1]	@ _11,* _11
	rsbs	r2, r2, #0	@,
	bl	SpellsGetterForLevel		@
@ SpellSystem.c:476:   if (*spells) {
	ldrb	r1, [r0]	@ _12, *spells_22
@ SpellSystem.c:476:   if (*spells) {
	cmp	r1, #0	@ _12,
	beq	.L102		@,
@ SpellSystem.c:477:     gPopupItem = *spells | 0xFF00;
	ldr	r2, .L108+16	@ tmp151,
@ SpellSystem.c:477:     gPopupItem = *spells | 0xFF00;
	ldr	r3, .L108+20	@ tmp148,
@ SpellSystem.c:477:     gPopupItem = *spells | 0xFF00;
	orrs	r2, r1	@ tmp150, _12
@ SpellSystem.c:478:     return 1;
	movs	r0, #1	@ <retval>,
@ SpellSystem.c:477:     gPopupItem = *spells | 0xFF00;
	strh	r2, [r3]	@ tmp150, gPopupItem
@ SpellSystem.c:478:     return 1;
	b	.L98		@
.L109:
	.align	2
.L108:
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
@ SpellSystem.c:498:   if (!CanUnitUseWeaponNow(gActiveUnit, spell)) {
	ldr	r4, .L115	@ tmp121,
	ldr	r3, .L115+4	@ tmp122,
	ldr	r0, [r4]	@, gActiveUnit
@ SpellSystem.c:493: int CanCastSpellNow(Unit *unit, int spell) {
	movs	r5, r1	@ spell, spell
@ SpellSystem.c:498:   if (!CanUnitUseWeaponNow(gActiveUnit, spell)) {
	bl	.L14		@
@ SpellSystem.c:498:   if (!CanUnitUseWeaponNow(gActiveUnit, spell)) {
	cmp	r0, #0	@ <retval>,
	beq	.L110		@,
@ SpellSystem.c:503:   MakeTargetListForWeapon(gActiveUnit, spell);
	movs	r1, r5	@, spell
	ldr	r0, [r4]	@, gActiveUnit
	ldr	r3, .L115+8	@ tmp124,
	bl	.L14		@
@ SpellSystem.c:504:   return GetTargetListSize() != 0;
	ldr	r3, .L115+12	@ tmp125,
	bl	.L14		@
@ SpellSystem.c:504:   return GetTargetListSize() != 0;
	subs	r3, r0, #1	@ tmp128, _12
	sbcs	r0, r0, r3	@ <retval>, _12, tmp128
.L110:
@ SpellSystem.c:510: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L116:
	.align	2
.L115:
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
@ SpellSystem.c:514: {
	movs	r4, r1	@ spell, spell
@ SpellSystem.c:515:   int type = GetItemType(spell);
	movs	r0, r1	@, spell
	ldr	r3, .L122	@ tmp121,
	bl	.L14		@
@ SpellSystem.c:518:   if (!CanUnitUseWeapon(gActiveUnit, spell)) {
	ldr	r5, .L122+4	@ tmp122,
	movs	r1, r4	@, spell
	ldr	r0, [r5]	@, gActiveUnit
	ldr	r3, .L122+8	@ tmp123,
	bl	.L14		@
@ SpellSystem.c:518:   if (!CanUnitUseWeapon(gActiveUnit, spell)) {
	cmp	r0, #0	@ <retval>,
	beq	.L117		@,
@ SpellSystem.c:503:   MakeTargetListForWeapon(gActiveUnit, spell);
	movs	r1, r4	@, spell
	ldr	r0, [r5]	@, gActiveUnit
	ldr	r3, .L122+12	@ tmp125,
	bl	.L14		@
@ SpellSystem.c:504:   return GetTargetListSize() != 0;
	ldr	r3, .L122+16	@ tmp126,
	bl	.L14		@
@ SpellSystem.c:504:   return GetTargetListSize() != 0;
	subs	r3, r0, #1	@ tmp129, _13
	sbcs	r0, r0, r3	@ <retval>, _13, tmp129
.L117:
@ SpellSystem.c:530: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L123:
	.align	2
.L122:
	.word	GetItemType
	.word	gActiveUnit
	.word	CanUnitUseWeapon
	.word	MakeTargetListForWeapon
	.word	GetTargetListSize
	.size	CanCastSpell, .-CanCastSpell
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
@ RangeDisplay.c:41:       unit, (UsingSpellMenu ? UsingSpellMenu
	ldr	r3, .L139	@ tmp131,
@ RangeDisplay.c:38:                                     int (*usability)(Unit *unit, int item)) {
	str	r1, [sp, #4]	@ usability, %sfp
@ RangeDisplay.c:41:       unit, (UsingSpellMenu ? UsingSpellMenu
	ldrb	r1, [r3]	@ UsingSpellMenu.4_1, UsingSpellMenu
@ RangeDisplay.c:38:                                     int (*usability)(Unit *unit, int item)) {
	movs	r7, r0	@ unit, unit
@ RangeDisplay.c:40:   u8 *spells = SpellsGetter(
	cmp	r1, #0	@ UsingSpellMenu.4_1,
	bne	.L125		@,
@ RangeDisplay.c:40:   u8 *spells = SpellsGetter(
	subs	r1, r1, #1	@ iftmp.3_16,
.L125:
@ RangeDisplay.c:39:   long long current = 0;
	movs	r5, #0	@ <retval>,
@ RangeDisplay.c:40:   u8 *spells = SpellsGetter(
	movs	r0, r7	@, unit
	bl	SpellsGetter		@
@ RangeDisplay.c:39:   long long current = 0;
	movs	r4, r5	@ <retval>, <retval>
@ RangeDisplay.c:40:   u8 *spells = SpellsGetter(
	str	r0, [sp]	@ ivtmp.275, %sfp
.L126:
@ RangeDisplay.c:44:   for (int i = 0; spells[i]; i++) {
	ldr	r3, [sp]	@ ivtmp.275, %sfp
	ldrb	r6, [r3]	@ _12, MEM[(u8 *)_38]
@ RangeDisplay.c:44:   for (int i = 0; spells[i]; i++) {
	cmp	r6, #0	@ _12,
	bne	.L131		@,
@ RangeDisplay.c:57: }
	movs	r0, r5	@, <retval>
	movs	r1, r4	@, <retval>
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r2}
	bx	r2
.L131:
@ RangeDisplay.c:45:     int spell = spells[i] | 0xFF00;
	movs	r3, #255	@ tmp157,
	lsls	r3, r3, #8	@ tmp157, tmp157,
	orrs	r6, r3	@ spell, tmp157
@ RangeDisplay.c:46:     if (usability == NULL) {
	ldr	r3, [sp, #4]	@ usability, %sfp
@ RangeDisplay.c:47:       if (CanCastSpell(unit, spell)) {
	movs	r1, r6	@, spell
	movs	r0, r7	@, unit
@ RangeDisplay.c:46:     if (usability == NULL) {
	cmp	r3, #0	@ usability,
	bne	.L127		@,
@ RangeDisplay.c:47:       if (CanCastSpell(unit, spell)) {
	bl	CanCastSpell		@
.L138:
@ RangeDisplay.c:51:       if (usability(unit, spell)) {
	cmp	r0, #0	@ _7,
	beq	.L129		@,
@ RangeDisplay.c:52:         current = IncorporateNewRange(current, gGet_Item_Range(unit, spell));
	ldr	r3, .L139+4	@ tmp135,
	movs	r1, r6	@, spell
	ldr	r3, [r3]	@ gGet_Item_Range, gGet_Item_Range
	movs	r0, r7	@, unit
	bl	.L14		@
	movs	r2, r0	@ _9,
	movs	r3, r1	@ _9,
@ RangeDisplay.c:52:         current = IncorporateNewRange(current, gGet_Item_Range(unit, spell));
	movs	r0, r5	@, <retval>
	movs	r1, r4	@, <retval>
	bl	IncorporateNewRange		@
	movs	r5, r0	@ <retval>, <retval>
	movs	r4, r1	@ <retval>, <retval>
.L129:
	ldr	r3, [sp]	@ ivtmp.275, %sfp
	adds	r3, r3, #1	@ ivtmp.275,
	str	r3, [sp]	@ ivtmp.275, %sfp
	b	.L126		@
.L127:
@ RangeDisplay.c:51:       if (usability(unit, spell)) {
	ldr	r3, [sp, #4]	@ usability, %sfp
	bl	.L14		@
	b	.L138		@
.L140:
	.align	2
.L139:
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
@ RangeDisplay.c:12:                                 int (*usability)(Unit *unit, int item)) {
	movs	r6, r0	@ unit, unit
	str	r1, [sp]	@ slot, %sfp
	str	r2, [sp, #8]	@ usability, %sfp
@ RangeDisplay.c:14:   if (slot == -1 || slot == -2) {
	adds	r3, r1, #3	@ tmp160, slot,
	bls	.L156		@,
@ RangeDisplay.c:16:     for (int i = 0; i < 5 && GetEnemyWepBySlot(unit, i); i++) {
	movs	r7, #0	@ i,
@ RangeDisplay.c:13:   long long current = 0;
	movs	r5, r7	@ <retval>, i
	movs	r4, r7	@ <retval>, <retval>
.L142:
@ RangeDisplay.c:16:     for (int i = 0; i < 5 && GetEnemyWepBySlot(unit, i); i++) {
	ldr	r3, .L159	@ tmp132,
	movs	r1, r7	@, i
	movs	r0, r6	@, unit
	str	r3, [sp, #4]	@ tmp132, %sfp
	bl	.L14		@
@ RangeDisplay.c:16:     for (int i = 0; i < 5 && GetEnemyWepBySlot(unit, i); i++) {
	cmp	r0, #0	@ _7,
	beq	.L145		@,
@ RangeDisplay.c:17:       if (usability(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r1, r7	@, i
	ldr	r3, [sp, #4]	@ tmp132, %sfp
	movs	r0, r6	@, unit
	bl	.L14		@
@ RangeDisplay.c:17:       if (usability(unit, GetEnemyWepBySlot(unit, i))) {
	ldr	r3, [sp, #8]	@ usability, %sfp
@ RangeDisplay.c:17:       if (usability(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r1, r0	@ _2,
@ RangeDisplay.c:17:       if (usability(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r0, r6	@, unit
	bl	.L14		@
@ RangeDisplay.c:17:       if (usability(unit, GetEnemyWepBySlot(unit, i))) {
	cmp	r0, #0	@ _3,
	beq	.L144		@,
@ RangeDisplay.c:18:         current = IncorporateNewRange(
	ldr	r3, .L159+4	@ tmp130,
	ldr	r3, [r3]	@ gGet_Item_Range.1_4, gGet_Item_Range
	movs	r1, r7	@, i
	str	r3, [sp, #12]	@ gGet_Item_Range.1_4, %sfp
	movs	r0, r6	@, unit
	ldr	r3, [sp, #4]	@ tmp132, %sfp
	bl	.L14		@
@ RangeDisplay.c:18:         current = IncorporateNewRange(
	ldr	r3, [sp, #12]	@ gGet_Item_Range.1_4, %sfp
@ RangeDisplay.c:18:         current = IncorporateNewRange(
	movs	r1, r0	@ _5,
@ RangeDisplay.c:18:         current = IncorporateNewRange(
	movs	r0, r6	@, unit
	bl	.L14		@
	movs	r2, r0	@ _6,
	movs	r3, r1	@ _6,
@ RangeDisplay.c:18:         current = IncorporateNewRange(
	movs	r0, r5	@, <retval>
	movs	r1, r4	@, <retval>
	bl	IncorporateNewRange		@
	movs	r5, r0	@ <retval>, <retval>
	movs	r4, r1	@ <retval>, <retval>
.L144:
@ RangeDisplay.c:16:     for (int i = 0; i < 5 && GetEnemyWepBySlot(unit, i); i++) {
	adds	r7, r7, #1	@ i,
@ RangeDisplay.c:16:     for (int i = 0; i < 5 && GetEnemyWepBySlot(unit, i); i++) {
	cmp	r7, #5	@ i,
	bne	.L142		@,
.L145:
@ RangeDisplay.c:24:                        : current);
	ldr	r3, [sp]	@ slot, %sfp
	adds	r7, r3, #1	@ tmp161, slot,
	bne	.L141		@,
@ RangeDisplay.c:22:     return (slot == -1 ? IncorporateNewRange(current, GetUnitRangeMaskForSpells(
	movs	r0, r6	@, unit
	ldr	r1, [sp, #8]	@, %sfp
	bl	GetUnitRangeMaskForSpells		@
	movs	r2, r0	@ _8,
	movs	r3, r1	@ _8,
@ RangeDisplay.c:22:     return (slot == -1 ? IncorporateNewRange(current, GetUnitRangeMaskForSpells(
	movs	r0, r5	@, <retval>
	movs	r1, r4	@, <retval>
	bl	IncorporateNewRange		@
.L158:
@ RangeDisplay.c:31:       return GetUnitRangeMaskForSpells(unit, usability);
	movs	r5, r0	@ <retval>, <retval>
	movs	r4, r1	@ <retval>, <retval>
.L141:
@ RangeDisplay.c:34: }
	movs	r0, r5	@, <retval>
	movs	r1, r4	@, <retval>
	add	sp, sp, #20	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r2}
	bx	r2
.L156:
@ RangeDisplay.c:27:     if (slot != 9) {
	ldr	r3, [sp]	@ slot, %sfp
	cmp	r3, #9	@ slot,
	beq	.L148		@,
@ RangeDisplay.c:28:       return gGet_Item_Range(unit, GetEnemyWepBySlot(unit, slot));
	ldr	r3, .L159+4	@ tmp133,
	ldr	r1, [sp]	@, %sfp
	ldr	r4, [r3]	@ gGet_Item_Range.2_9, gGet_Item_Range
	ldr	r3, .L159	@ tmp134,
	bl	.L14		@
	movs	r1, r0	@ _10,
@ RangeDisplay.c:28:       return gGet_Item_Range(unit, GetEnemyWepBySlot(unit, slot));
	movs	r0, r6	@, unit
	bl	.L16		@
	b	.L158		@
.L148:
@ RangeDisplay.c:31:       return GetUnitRangeMaskForSpells(unit, usability);
	ldr	r1, [sp, #8]	@, %sfp
	bl	GetUnitRangeMaskForSpells		@
	b	.L158		@
.L160:
	.align	2
.L159:
	.word	GetEnemyWepBySlot
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
@ RangeDisplay.c:81: void All_Spells_One_Square(Unit *unit, int (*usability)(Unit *unit, int item)) {
	movs	r4, r0	@ unit, unit
@ RangeDisplay.c:82:   asm("push { r7 }");
	.syntax divided
@ 82 "RangeDisplay.c" 1
	push { r7 }
@ 0 "" 2
@ RangeDisplay.c:31:       return GetUnitRangeMaskForSpells(unit, usability);
	.thumb
	.syntax unified
	bl	GetUnitRangeMaskForSpells		@
	movs	r2, r0	@ _13,
	movs	r3, r1	@ _13,
@ RangeDisplay.c:84:   asm("mov r7, #0x00\nmov r12, r7"); // Write_Range takes this parameter through
	.syntax divided
@ 84 "RangeDisplay.c" 1
	mov r7, #0x00
mov r12, r7
@ 0 "" 2
@ RangeDisplay.c:86:   gWrite_Range(unit->xPos, unit->yPos, mask);
	.thumb
	.syntax unified
	movs	r1, #17	@ _5,
	movs	r0, #16	@ _3,
	ldrsb	r1, [r4, r1]	@ _5,* _5
	ldrsb	r0, [r4, r0]	@ _3,* _3
	ldr	r4, .L162	@ tmp124,
	ldr	r4, [r4]	@ gWrite_Range, gWrite_Range
	bl	.L16		@
@ RangeDisplay.c:87:   asm("pop { r7 }");
	.syntax divided
@ 87 "RangeDisplay.c" 1
	pop { r7 }
@ 0 "" 2
@ RangeDisplay.c:88: }
	.thumb
	.syntax unified
	@ sp needed	@
	pop	{r4}
	pop	{r0}
	bx	r0
.L163:
	.align	2
.L162:
	.word	gWrite_Range
	.size	All_Spells_One_Square, .-All_Spells_One_Square
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
@ RangeDisplay.c:74:   return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit, item);
	ldr	r3, .L167	@ tmp118,
@ RangeDisplay.c:71: int RangeUsabilityCheckStaff(Unit *unit, int item) {
	movs	r5, r0	@ unit, unit
@ RangeDisplay.c:74:   return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit, item);
	movs	r0, r1	@, item
@ RangeDisplay.c:71: int RangeUsabilityCheckStaff(Unit *unit, int item) {
	movs	r4, r1	@ item, item
@ RangeDisplay.c:74:   return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit, item);
	bl	.L14		@
	movs	r3, r0	@ _1,
@ RangeDisplay.c:74:   return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit, item);
	movs	r0, #0	@ <retval>,
@ RangeDisplay.c:74:   return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit, item);
	cmp	r3, #4	@ _1,
	bne	.L164		@,
@ RangeDisplay.c:74:   return GetItemType(item) == ITYPE_STAFF && CanCastSpell(unit, item);
	movs	r1, r4	@, item
	movs	r0, r5	@, unit
	bl	CanCastSpell		@
.L164:
@ RangeDisplay.c:75: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L168:
	.align	2
.L167:
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
@ RangeDisplay.c:78:   return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit, item);
	ldr	r3, .L173	@ tmp118,
@ RangeDisplay.c:77: int RangeUsabilityCheckNotStaff(Unit *unit, int item) {
	movs	r5, r0	@ unit, unit
@ RangeDisplay.c:78:   return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit, item);
	movs	r0, r1	@, item
@ RangeDisplay.c:77: int RangeUsabilityCheckNotStaff(Unit *unit, int item) {
	movs	r4, r1	@ item, item
@ RangeDisplay.c:78:   return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit, item);
	bl	.L14		@
	movs	r3, r0	@ _1,
@ RangeDisplay.c:78:   return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit, item);
	movs	r0, #0	@ <retval>,
@ RangeDisplay.c:78:   return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit, item);
	cmp	r3, #4	@ _1,
	beq	.L169		@,
@ RangeDisplay.c:78:   return GetItemType(item) != ITYPE_STAFF && CanCastSpell(unit, item);
	movs	r1, r4	@, item
	movs	r0, r5	@, unit
	bl	CanCastSpell		@
.L169:
@ RangeDisplay.c:79: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L174:
	.align	2
.L173:
	.word	GetItemType
	.size	RangeUsabilityCheckNotStaff, .-RangeUsabilityCheckNotStaff
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
@ RangeDisplay.c:120:       unit, (UsingSpellMenu ? UsingSpellMenu
	ldr	r3, .L182	@ tmp127,
@ RangeDisplay.c:116: int GM_GetUnitRangeBySpellIndex(struct Unit *unit, int index) {
	movs	r5, r1	@ index, index
@ RangeDisplay.c:120:       unit, (UsingSpellMenu ? UsingSpellMenu
	ldrb	r1, [r3]	@ UsingSpellMenu.20_1, UsingSpellMenu
@ RangeDisplay.c:116: int GM_GetUnitRangeBySpellIndex(struct Unit *unit, int index) {
	movs	r4, r0	@ unit, unit
@ RangeDisplay.c:119:   u8 *spells = SpellsGetter(
	cmp	r1, #0	@ UsingSpellMenu.20_1,
	bne	.L176		@,
@ RangeDisplay.c:119:   u8 *spells = SpellsGetter(
	subs	r1, r1, #1	@ iftmp.19_9,
.L176:
@ RangeDisplay.c:119:   u8 *spells = SpellsGetter(
	movs	r0, r4	@, unit
	bl	SpellsGetter		@
@ RangeDisplay.c:123:   spell = spells[index] | 0xFF00;
	ldrb	r3, [r0, r5]	@ _5, *_3
@ RangeDisplay.c:123:   spell = spells[index] | 0xFF00;
	movs	r5, #255	@ tmp129,
	lsls	r5, r5, #8	@ tmp129, tmp129,
	orrs	r5, r3	@ spell, _5
@ RangeDisplay.c:124:   if (CanCastSpell(unit, spell))
	movs	r1, r5	@, spell
	movs	r0, r4	@, unit
	bl	CanCastSpell		@
@ RangeDisplay.c:124:   if (CanCastSpell(unit, spell))
	cmp	r0, #0	@ <retval>,
	beq	.L175		@,
@ RangeDisplay.c:125:     return gGet_Item_Range(unit, spell);
	ldr	r3, .L182+4	@ tmp130,
	movs	r1, r5	@, spell
	movs	r0, r4	@, unit
	ldr	r3, [r3]	@ gGet_Item_Range, gGet_Item_Range
	bl	.L14		@
.L175:
@ RangeDisplay.c:127: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L183:
	.align	2
.L182:
	.word	UsingSpellMenu
	.word	gGet_Item_Range
	.size	GM_GetUnitRangeBySpellIndex, .-GM_GetUnitRangeBySpellIndex
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
@ SpellSystem.c:535: {
	movs	r5, r0	@ unit, unit
@ SpellSystem.c:536:   u8 *spells = SpellsGetter(unit, type);
	bl	SpellsGetter		@
	movs	r4, r0	@ ivtmp.302, ivtmp.302
.L185:
@ SpellSystem.c:537:   for (int i = 0; spells[i]; i++) {
	ldrb	r0, [r4]	@ _8, MEM[(u8 *)_24]
@ SpellSystem.c:537:   for (int i = 0; spells[i]; i++) {
	cmp	r0, #0	@ _8,
	beq	.L184		@,
@ SpellSystem.c:538:     if (GetItemType(spells[i]) != ITYPE_STAFF &&
	ldr	r3, .L190	@ tmp125,
	bl	.L14		@
@ SpellSystem.c:538:     if (GetItemType(spells[i]) != ITYPE_STAFF &&
	cmp	r0, #4	@ _2,
	bne	.L186		@,
.L188:
	adds	r4, r4, #1	@ ivtmp.302,
	b	.L185		@
.L186:
@ SpellSystem.c:539:         CanCastSpellNow(unit, spells[i])) {
	movs	r0, r5	@, unit
	ldrb	r1, [r4]	@ _4, MEM[(u8 *)_24]
	bl	CanCastSpellNow		@
@ SpellSystem.c:538:     if (GetItemType(spells[i]) != ITYPE_STAFF &&
	cmp	r0, #0	@ <retval>,
	beq	.L188		@,
.L184:
@ SpellSystem.c:544: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L191:
	.align	2
.L190:
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
@ SpellSystem.c:549: int GetNthUsableSpell(Unit *unit, int n, int type) {
	movs	r7, r1	@ n, n
@ SpellSystem.c:550:   u8 *spells = SpellsGetter(unit, type);
	movs	r1, r2	@, type
@ SpellSystem.c:549: int GetNthUsableSpell(Unit *unit, int n, int type) {
	movs	r6, r0	@ unit, unit
@ SpellSystem.c:550:   u8 *spells = SpellsGetter(unit, type);
	bl	SpellsGetter		@
@ SpellSystem.c:551:   int k = -1;
	movs	r5, #1	@ k,
@ SpellSystem.c:552:   for (int i = 0; spells[i]; i++) {
	movs	r4, #0	@ <retval>,
@ SpellSystem.c:550:   u8 *spells = SpellsGetter(unit, type);
	str	r0, [sp, #4]	@, %sfp
@ SpellSystem.c:551:   int k = -1;
	rsbs	r5, r5, #0	@ k, k
.L193:
@ SpellSystem.c:552:   for (int i = 0; spells[i]; i++) {
	ldr	r3, [sp, #4]	@ spells, %sfp
	ldrb	r1, [r3, r4]	@ _5, MEM[(u8 *)spells_16 + _22 * 1]
@ SpellSystem.c:552:   for (int i = 0; spells[i]; i++) {
	cmp	r1, #0	@ _5,
	bne	.L196		@,
@ SpellSystem.c:560:   return -1;
	movs	r4, #1	@ <retval>,
	rsbs	r4, r4, #0	@ <retval>, <retval>
.L192:
@ SpellSystem.c:561: }
	movs	r0, r4	@, <retval>
	@ sp needed	@
	pop	{r1, r2, r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L196:
@ SpellSystem.c:553:     if (CanCastSpellNow(unit, spells[i])) {
	movs	r0, r6	@, unit
	bl	CanCastSpellNow		@
@ SpellSystem.c:553:     if (CanCastSpellNow(unit, spells[i])) {
	cmp	r0, #0	@ _2,
	beq	.L194		@,
@ SpellSystem.c:554:       k++;
	adds	r5, r5, #1	@ k,
@ SpellSystem.c:555:       if (k == n) {
	cmp	r5, r7	@ k, n
	beq	.L192		@,
.L194:
@ SpellSystem.c:552:   for (int i = 0; spells[i]; i++) {
	adds	r4, r4, #1	@ <retval>,
	b	.L193		@
	.size	GetNthUsableSpell, .-GetNthUsableSpell
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
	ldr	r2, .L205	@ tmp145,
@ SpellMenu.c:209: 	int xTile = commandProc->xDrawTile * 8;
	ldrh	r4, [r1, #42]	@ _2,
@ SpellMenu.c:210: 	int yTile = commandProc->yDrawTile * 8;
	ldrh	r5, [r1, #44]	@ _4,
@ SpellMenu.c:211: 	if ( UsingSpellMenu )
	ldrb	r1, [r2]	@ UsingSpellMenu.66_5, UsingSpellMenu
@ SpellMenu.c:208: {
	sub	sp, sp, #20	@,,
	adds	r3, r3, #60	@ commandProc,
@ SpellMenu.c:211: 	if ( UsingSpellMenu )
	str	r2, [sp, #4]	@ tmp145, %sfp
	str	r3, [sp, #8]	@ commandProc, %sfp
	ldr	r7, .L205+4	@ tmp173,
@ SpellMenu.c:209: 	int xTile = commandProc->xDrawTile * 8;
	lsls	r4, r4, #3	@ xTile, _2,
@ SpellMenu.c:210: 	int yTile = commandProc->yDrawTile * 8;
	lsls	r5, r5, #3	@ yTile, _4,
@ SpellMenu.c:211: 	if ( UsingSpellMenu )
	cmp	r1, #0	@ UsingSpellMenu.66_5,
	beq	.L201		@,
@ SpellMenu.c:214: 		DrawItemRText(xTile,yTile,SpellsGetter(gActiveUnit,UsingSpellMenu)[GetNthUsableSpell(gActiveUnit,commandProc->commandDefinitionIndex,UsingSpellMenu)]);
	ldr	r6, .L205+8	@ tmp146,
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
.L204:
@ SpellMenu.c:225: 			DrawItemRText(xTile,yTile,*((u16*)&gGameState+0x16)); // Probably related to special cases like ballistae?
	movs	r1, r5	@, yTile
	movs	r0, r4	@, xTile
	bl	.L97		@
@ SpellMenu.c:228: }
	add	sp, sp, #20	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L201:
@ SpellMenu.c:219: 		if ( commandProc->commandDefinitionIndex <= 4 )
	ldr	r3, [sp, #8]	@ tmp172, %sfp
	ldrb	r3, [r3]	@ _19,
@ SpellMenu.c:219: 		if ( commandProc->commandDefinitionIndex <= 4 )
	cmp	r3, #4	@ _19,
	bhi	.L203		@,
@ SpellMenu.c:221: 			DrawItemRText(xTile,yTile,gActiveUnit->items[commandProc->commandDefinitionIndex]);
	ldr	r2, .L205+8	@ tmp162,
	adds	r3, r3, #12	@ tmp163,
	ldr	r2, [r2]	@ gActiveUnit, gActiveUnit
	lsls	r3, r3, #1	@ tmp164, tmp163,
	adds	r3, r2, r3	@ tmp165, gActiveUnit, tmp164
@ SpellMenu.c:221: 			DrawItemRText(xTile,yTile,gActiveUnit->items[commandProc->commandDefinitionIndex]);
	ldrh	r2, [r3, #6]	@ _23, *gActiveUnit.71_20
	b	.L204		@
.L203:
@ SpellMenu.c:225: 			DrawItemRText(xTile,yTile,*((u16*)&gGameState+0x16)); // Probably related to special cases like ballistae?
	ldr	r3, .L205+12	@ tmp169,
@ SpellMenu.c:225: 			DrawItemRText(xTile,yTile,*((u16*)&gGameState+0x16)); // Probably related to special cases like ballistae?
	ldrh	r2, [r3, #44]	@ _25, MEM[(u16 *)&gGameState + 44B]
	b	.L204		@
.L206:
	.align	2
.L205:
	.word	UsingSpellMenu
	.word	DrawItemRText
	.word	gActiveUnit
	.word	gGameState
	.size	NewMenuRText, .-NewMenuRText
	.align	1
	.global	GetVanillaEquipped
	.syntax unified
	.code	16
	.thumb_func
	.type	GetVanillaEquipped, %function
GetVanillaEquipped:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ SpellSystem.c:563: int GetVanillaEquipped(Unit *unit) {
	movs	r6, r0	@ unit, unit
@ SpellSystem.c:565:   for (int i = 0; i < 5; i++) {
	movs	r5, #0	@ i,
.L209:
@ SpellSystem.c:566:     item = GetEnemyWepBySlot(unit, i);
	movs	r1, r5	@, i
	ldr	r3, .L211	@ tmp118,
	movs	r0, r6	@, unit
	bl	.L14		@
@ SpellSystem.c:567:     if (CanUnitUseWeapon(unit, item)) {
	ldr	r3, .L211+4	@ tmp119,
@ SpellSystem.c:566:     item = GetEnemyWepBySlot(unit, i);
	movs	r4, r0	@ <retval>, <retval>
@ SpellSystem.c:567:     if (CanUnitUseWeapon(unit, item)) {
	movs	r1, r0	@, <retval>
	movs	r0, r6	@, unit
	bl	.L14		@
@ SpellSystem.c:567:     if (CanUnitUseWeapon(unit, item)) {
	cmp	r0, #0	@ _1,
	bne	.L207		@,
@ SpellSystem.c:565:   for (int i = 0; i < 5; i++) {
	adds	r5, r5, #1	@ i,
@ SpellSystem.c:565:   for (int i = 0; i < 5; i++) {
	cmp	r5, #5	@ i,
	bne	.L209		@,
@ SpellSystem.c:571:   return 0;
	movs	r4, r0	@ <retval>, _1
.L207:
@ SpellSystem.c:572: }
	@ sp needed	@
	movs	r0, r4	@, <retval>
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L212:
	.align	2
.L211:
	.word	GetEnemyWepBySlot
	.word	CanUnitUseWeapon
	.size	GetVanillaEquipped, .-GetVanillaEquipped
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
@ SpellSystem.c:574: int DoesUnitKnowSpell(Unit *unit, u8 spell) {
	movs	r4, r1	@ spell, spell
@ SpellSystem.c:576:   u8 *spells = SpellsGetter(unit, -1);
	movs	r1, #1	@,
	rsbs	r1, r1, #0	@,
	bl	SpellsGetter		@
.L214:
@ SpellSystem.c:577:   for (int i = 0; spells[i]; i++) {
	ldrb	r3, [r0]	@ _3, MEM[(u8 *)_15]
@ SpellSystem.c:577:   for (int i = 0; spells[i]; i++) {
	cmp	r3, #0	@ _3,
	bne	.L216		@,
@ SpellSystem.c:582:   return 0;
	movs	r0, r3	@ <retval>, _3
.L213:
@ SpellSystem.c:583: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L216:
@ SpellSystem.c:578:     if (spell == spells[i]) {
	adds	r0, r0, #1	@ ivtmp.328,
	cmp	r3, r4	@ _3, spell
	bne	.L214		@,
@ SpellSystem.c:579:       return 1;
	movs	r0, #1	@ <retval>,
	b	.L213		@
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
@ SpellSystem.c:586:   int wType = GetItemType(spell);
	ldr	r3, .L222	@ tmp118,
@ SpellSystem.c:585: int GetSpellType(int spell) {
	push	{r4, lr}	@
@ SpellSystem.c:586:   int wType = GetItemType(spell);
	bl	.L14		@
@ SpellSystem.c:587:   if (wType == ITYPE_ANIMA) {
	movs	r2, #2	@ tmp119,
	movs	r3, r0	@ wType, wType
@ SpellSystem.c:588:     return BLACK_MAGIC;
	movs	r0, #1	@ <retval>,
@ SpellSystem.c:587:   if (wType == ITYPE_ANIMA) {
	bics	r3, r2	@ wType, tmp119
	cmp	r3, #5	@ _6,
	beq	.L218		@,
@ SpellSystem.c:594:     return WHITE_MAGIC;
	movs	r0, r2	@ <retval>, tmp119
@ SpellSystem.c:593:   if (wType == ITYPE_STAFF) {
	cmp	r3, #4	@ _6,
	beq	.L218		@,
@ SpellSystem.c:599:   return -1;
	subs	r0, r0, #3	@ <retval>,
.L218:
@ SpellSystem.c:600: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L223:
	.align	2
.L222:
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
@ SpellSystem.c:603:   return GaidenSpellCostTable[GetItemIndex(spell)];
	ldr	r3, .L225	@ tmp119,
@ SpellSystem.c:604: }
	@ sp needed	@
@ SpellSystem.c:603:   return GaidenSpellCostTable[GetItemIndex(spell)];
	bl	.L14		@
@ SpellSystem.c:603:   return GaidenSpellCostTable[GetItemIndex(spell)];
	ldr	r3, .L225+4	@ tmp123,
	ldrb	r0, [r3, r0]	@ _7, GaidenSpellCostTable
@ SpellSystem.c:604: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L226:
	.align	2
.L225:
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
@ SpellSystem.c:487:   return (unit->curHP > GetSpellCost(spell));
	movs	r4, #19	@ _2,
	ldrsb	r4, [r0, r4]	@ _2,* _2
@ SpellSystem.c:487:   return (unit->curHP > GetSpellCost(spell));
	movs	r0, r1	@, spell
	bl	GetSpellCost		@
@ SpellSystem.c:487:   return (unit->curHP > GetSpellCost(spell));
	movs	r3, #1	@ _4,
	cmp	r4, r0	@ _2, _3
	bgt	.L228		@,
	movs	r3, #0	@ _4,
.L228:
@ SpellSystem.c:488: }
	@ sp needed	@
	movs	r0, r3	@, _4
	pop	{r4}
	pop	{r1}
	bx	r1
	.size	HasSufficientHP, .-HasSufficientHP
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
	ldr	r5, .L236	@ tmp134,
	ldr	r4, .L236+4	@ tmp136,
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
	bne	.L230		@,
.L232:
@ SpellMenu.c:6: 	if ( !spell ) { return 3; }
	movs	r0, #3	@ <retval>,
.L229:
@ SpellMenu.c:14: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L230:
@ SpellMenu.c:8: 	if ( !CanCastSpellNow(gActiveUnit,spell) ) { return 3; }
	movs	r1, r5	@, spell
	ldr	r0, [r4]	@, gActiveUnit
	bl	CanCastSpellNow		@
@ SpellMenu.c:8: 	if ( !CanCastSpellNow(gActiveUnit,spell) ) { return 3; }
	cmp	r0, #0	@ _13,
	beq	.L232		@,
@ SpellMenu.c:10: 	u8 HasEnoughHp = HasSufficientHP(gActiveUnit,spell);
	movs	r1, r5	@, spell
	ldr	r0, [r4]	@, gActiveUnit
	bl	HasSufficientHP		@
@ SpellMenu.c:11: 	if (HasEnoughHp) { return 1; }
	movs	r3, #2	@ tmp142,
	subs	r0, r3, r0	@ <retval>, tmp142, _15
	b	.L229		@
.L237:
	.align	2
.L236:
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
	ldr	r6, .L239	@ tmp146,
	ldr	r5, .L239+4	@ tmp144,
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
	ldr	r1, .L239+8	@ tmp161,
	lsls	r3, r3, #1	@ _34, _22,
	adds	r3, r3, r1	@ _23, _34, tmp161
	ldr	r4, .L239+12	@ tmp163,
	movs	r1, r5	@, _13
@ SpellMenu.c:22: 	DrawItemMenuCommand(&menuCommand->text,spell,canUse,&gBg0MapBuffer[menuCommand->yDrawTile * 32 + menuCommand->xDrawTile]);
	adds	r0, r0, #52	@ menuCommand,
@ SpellMenu.c:22: 	DrawItemMenuCommand(&menuCommand->text,spell,canUse,&gBg0MapBuffer[menuCommand->yDrawTile * 32 + menuCommand->xDrawTile]);
	bl	.L16		@
@ SpellMenu.c:23: 	EnableBgSyncByMask(1);
	movs	r0, #1	@,
	ldr	r3, .L239+16	@ tmp164,
	bl	.L14		@
@ SpellMenu.c:25: }
	movs	r0, #0	@,
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L240:
	.align	2
.L239:
	.word	gActiveUnit
	.word	UsingSpellMenu
	.word	gBg0MapBuffer
	.word	DrawItemMenuCommand
	.word	EnableBgSyncByMask
	.size	SpellDrawingRoutine, .-SpellDrawingRoutine
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
@ UnitMenu.c:64:   if (gActiveUnit->state & US_CANTOING) {
	ldr	r7, .L256	@ tmp135,
	ldr	r3, [r7]	@ gActiveUnit, gActiveUnit
@ UnitMenu.c:64:   if (gActiveUnit->state & US_CANTOING) {
	ldr	r3, [r3, #12]	@ gActiveUnit.115_1->state, gActiveUnit.115_1->state
@ UnitMenu.c:64:   if (gActiveUnit->state & US_CANTOING) {
	lsls	r3, r3, #25	@ tmp156, gActiveUnit.115_1->state,
	bpl	.L242		@,
.L247:
@ UnitMenu.c:65:     return 3;
	movs	r0, #3	@ <retval>,
.L241:
@ UnitMenu.c:91: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L242:
@ UnitMenu.c:67:   u8 *validList = gGenericBuffer; // Let's build a list of valid spells.
	ldr	r6, .L256+4	@ validList,
	movs	r5, r0	@ ivtmp.356, spellList
	movs	r4, r6	@ validList, validList
.L244:
@ UnitMenu.c:68:   for (int i = 0; spellList[i]; i++) {
	ldrb	r1, [r5]	@ _12, MEM[(u8 *)_49]
@ UnitMenu.c:68:   for (int i = 0; spellList[i]; i++) {
	cmp	r1, #0	@ _12,
	bne	.L246		@,
@ UnitMenu.c:75:   *validList = 0;
	strb	r1, [r6]	@ _12, *validList_21
@ UnitMenu.c:79:   if (!*validList) {
	ldrb	r3, [r4]	@ MEM[(u8 *)&gGenericBuffer], MEM[(u8 *)&gGenericBuffer]
	cmp	r3, r1	@ MEM[(u8 *)&gGenericBuffer],
	beq	.L247		@,
.L248:
@ UnitMenu.c:82:   for (int i = 0; validList[i]; i++) {
	ldrb	r1, [r4]	@ _19, MEM[(u8 *)_45]
@ UnitMenu.c:82:   for (int i = 0; validList[i]; i++) {
	cmp	r1, #0	@ _19,
	bne	.L249		@,
@ UnitMenu.c:89:   return 2; // There were valid spells, but we don't have enough HP to cast any
	movs	r0, #2	@ <retval>,
	b	.L241		@
.L246:
@ UnitMenu.c:69:     if (!CanCastSpellNow(gActiveUnit, spellList[i] | 0xFF00)) {
	movs	r3, #255	@ tmp158,
	lsls	r3, r3, #8	@ tmp158, tmp158,
	ldr	r0, [r7]	@, gActiveUnit
	orrs	r1, r3	@ _7, tmp158
	bl	CanCastSpellNow		@
@ UnitMenu.c:69:     if (!CanCastSpellNow(gActiveUnit, spellList[i] | 0xFF00)) {
	cmp	r0, #0	@ _8,
	beq	.L245		@,
@ UnitMenu.c:72:     *validList = spellList[i];
	ldrb	r3, [r5]	@ _9, MEM[(u8 *)_49]
@ UnitMenu.c:72:     *validList = spellList[i];
	strb	r3, [r6]	@ _9, *validList_21
@ UnitMenu.c:73:     validList++;
	adds	r6, r6, #1	@ validList,
.L245:
	adds	r5, r5, #1	@ ivtmp.356,
	b	.L244		@
.L249:
@ UnitMenu.c:85:     if (HasSufficientHP(gActiveUnit, validList[i])) {
	ldr	r0, [r7]	@, gActiveUnit
	bl	HasSufficientHP		@
@ UnitMenu.c:85:     if (HasSufficientHP(gActiveUnit, validList[i])) {
	adds	r4, r4, #1	@ ivtmp.352,
	cmp	r0, #0	@ <retval>,
	beq	.L248		@,
	b	.L241		@
.L257:
	.align	2
.L256:
	.word	gActiveUnit
	.word	gGenericBuffer
	.size	GaidenMagicUMUsabilityExt, .-GaidenMagicUMUsabilityExt
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
	ldr	r7, .L277	@ tmp198,
	ldr	r6, .L277+4	@ tmp200,
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
	ldr	r3, .L277+8	@ tmp208,
@ SpellMenu.c:130: 	MenuItemPanelProc* menuItemPanel = (MenuItemPanelProc*)ProcFind(&gProc_MenuItemPanel);
	ldr	r0, .L277+12	@ tmp210,
@ SpellMenu.c:112: 	SelectedSpell = spell;
	strb	r2, [r3]	@ spell, SelectedSpell
@ SpellMenu.c:130: 	MenuItemPanelProc* menuItemPanel = (MenuItemPanelProc*)ProcFind(&gProc_MenuItemPanel);
	ldr	r3, .L277+16	@ tmp211,
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
	ldr	r5, .L277+20	@ tmp218,
	movs	r0, r4	@, _159
@ SpellMenu.c:132: 	int y = menuItemPanel->y;
	str	r3, [sp, #28]	@ _15, %sfp
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	bl	.L279		@
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	movs	r3, r7	@ _149, menuItemPanel
	adds	r3, r3, #60	@ _149,
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	movs	r0, r3	@, _149
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	str	r3, [sp, #16]	@ _149, %sfp
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	bl	.L279		@
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	movs	r3, r7	@ _16, menuItemPanel
	adds	r3, r3, #68	@ _16,
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	movs	r0, r3	@, _16
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	str	r3, [sp, #12]	@ _16, %sfp
@ SpellMenu.c:136: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Clear(&menuItemPanel->textHandles[i]); }
	bl	.L279		@
@ SpellMenu.c:137: 	MakeUIWindowTileMap_BG0BG1(x,y,14,8,0);
	movs	r3, #0	@ tmp396,
	movs	r2, #14	@,
	str	r3, [sp]	@ tmp396,
	ldr	r1, [sp, #28]	@, %sfp
	ldr	r0, [sp, #24]	@, %sfp
	adds	r3, r3, #8	@,
	ldr	r5, .L277+24	@ tmp222,
	bl	.L279		@
@ SpellMenu.c:139: 	int spellType = GetItemType(spell);
	ldr	r0, [sp, #8]	@, %sfp
	ldr	r3, .L277+28	@ tmp223,
	bl	.L14		@
	str	r0, [sp, #20]	@, %sfp
@ SpellMenu.c:140: 	if ( spellType != ITYPE_STAFF )
	cmp	r0, #4	@,
	bne	.LCB1726	@
	b	.L259	@long jump	@
.LCB1726:
@ SpellMenu.c:142: 		BattleGenerateUiStats(gActiveUnit,9); // 9 is using a Gaiden spell.
	movs	r1, #9	@,
	ldr	r0, [r6]	@, gActiveUnit
	ldr	r3, .L277+32	@ tmp225,
	bl	.L14		@
@ SpellMenu.c:144: 		Text_InsertString(&menuItemPanel->textHandles[0],0x02,0,GetStringFromIndex(0x0039)); // "Stats"
	ldr	r3, .L277+36	@ tmp226,
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
	ldr	r6, .L277+40	@ tmp227,
	bl	.L15		@
@ SpellMenu.c:146: 		if (GetSpellCost(spell)>0) { 
	ldr	r0, [sp, #8]	@, %sfp
	bl	GetSpellCost		@
@ SpellMenu.c:146: 		if (GetSpellCost(spell)>0) { 
	cmp	r0, #0	@ _20,
	beq	.L260		@,
@ SpellMenu.c:147: 			Text_InsertString(&menuItemPanel->textHandles[0],0x32,0,GetStringFromIndex(gGaidenMagicHPCostText)); // HP Cost.
	ldr	r3, .L277+44	@ tmp228,
	ldrh	r0, [r3]	@ _22, gGaidenMagicHPCostText
	bl	.L279		@
@ SpellMenu.c:147: 			Text_InsertString(&menuItemPanel->textHandles[0],0x32,0,GetStringFromIndex(gGaidenMagicHPCostText)); // HP Cost.
	movs	r2, #0	@,
@ SpellMenu.c:147: 			Text_InsertString(&menuItemPanel->textHandles[0],0x32,0,GetStringFromIndex(gGaidenMagicHPCostText)); // HP Cost.
	movs	r3, r0	@ _23,
@ SpellMenu.c:147: 			Text_InsertString(&menuItemPanel->textHandles[0],0x32,0,GetStringFromIndex(gGaidenMagicHPCostText)); // HP Cost.
	movs	r1, #50	@,
	movs	r0, r4	@, _159
	bl	.L15		@
.L260:
@ SpellMenu.c:149: 		Text_InsertString(&menuItemPanel->textHandles[1],0x02,0,GetStringFromIndex(0x4F3)); // Atk.
	ldr	r6, .L277+36	@ tmp233,
	ldr	r0, .L277+48	@,
	bl	.L15		@
@ SpellMenu.c:149: 		Text_InsertString(&menuItemPanel->textHandles[1],0x02,0,GetStringFromIndex(0x4F3)); // Atk.
	ldr	r5, .L277+40	@ tmp234,
@ SpellMenu.c:149: 		Text_InsertString(&menuItemPanel->textHandles[1],0x02,0,GetStringFromIndex(0x4F3)); // Atk.
	movs	r3, r0	@ _25,
@ SpellMenu.c:149: 		Text_InsertString(&menuItemPanel->textHandles[1],0x02,0,GetStringFromIndex(0x4F3)); // Atk.
	movs	r2, #0	@,
	movs	r1, #2	@,
	ldr	r0, [sp, #16]	@, %sfp
	bl	.L279		@
@ SpellMenu.c:150: 		Text_InsertString(&menuItemPanel->textHandles[2],0x02,0,GetStringFromIndex(0x4F4)); // Hit.
	ldr	r0, .L277+52	@,
	bl	.L15		@
@ SpellMenu.c:150: 		Text_InsertString(&menuItemPanel->textHandles[2],0x02,0,GetStringFromIndex(0x4F4)); // Hit.
	movs	r2, #0	@,
@ SpellMenu.c:150: 		Text_InsertString(&menuItemPanel->textHandles[2],0x02,0,GetStringFromIndex(0x4F4)); // Hit.
	movs	r3, r0	@ _27,
@ SpellMenu.c:150: 		Text_InsertString(&menuItemPanel->textHandles[2],0x02,0,GetStringFromIndex(0x4F4)); // Hit.
	movs	r1, #2	@,
	ldr	r0, [sp, #12]	@, %sfp
	bl	.L279		@
@ SpellMenu.c:151: 		Text_InsertString(&menuItemPanel->textHandles[1],0x32,0,GetStringFromIndex(0x501)); // Crit.
	ldr	r0, .L277+56	@,
	bl	.L15		@
@ SpellMenu.c:151: 		Text_InsertString(&menuItemPanel->textHandles[1],0x32,0,GetStringFromIndex(0x501)); // Crit.
	movs	r2, #0	@,
@ SpellMenu.c:151: 		Text_InsertString(&menuItemPanel->textHandles[1],0x32,0,GetStringFromIndex(0x501)); // Crit.
	movs	r3, r0	@ _28,
@ SpellMenu.c:151: 		Text_InsertString(&menuItemPanel->textHandles[1],0x32,0,GetStringFromIndex(0x501)); // Crit.
	movs	r1, #50	@,
	ldr	r0, [sp, #16]	@, %sfp
	bl	.L279		@
@ SpellMenu.c:152: 		Text_InsertString(&menuItemPanel->textHandles[2],0x32,0,GetStringFromIndex(0x4F5)); // Avoid.
	ldr	r0, .L277+60	@,
	bl	.L15		@
@ SpellMenu.c:152: 		Text_InsertString(&menuItemPanel->textHandles[2],0x32,0,GetStringFromIndex(0x4F5)); // Avoid.
	movs	r2, #0	@,
@ SpellMenu.c:152: 		Text_InsertString(&menuItemPanel->textHandles[2],0x32,0,GetStringFromIndex(0x4F5)); // Avoid.
	movs	r3, r0	@ _29,
@ SpellMenu.c:152: 		Text_InsertString(&menuItemPanel->textHandles[2],0x32,0,GetStringFromIndex(0x4F5)); // Avoid.
	movs	r1, #50	@,
	ldr	r0, [sp, #12]	@, %sfp
	bl	.L279		@
@ SpellMenu.c:155: 		if ( !HasSufficientHP(gActiveUnit,spell) ) { CostColor = 1; }
	ldr	r3, .L277+4	@ tmp244,
	ldr	r1, [sp, #8]	@, %sfp
	ldr	r0, [r3]	@, gActiveUnit
	bl	HasSufficientHP		@
	movs	r5, r0	@ _31,
@ SpellMenu.c:156: 		if (GetSpellCost(spell)>0) { Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[0],0x54,CostColor,GetSpellCost(spell)); } 
	ldr	r0, [sp, #8]	@, %sfp
	bl	GetSpellCost		@
@ SpellMenu.c:156: 		if (GetSpellCost(spell)>0) { Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[0],0x54,CostColor,GetSpellCost(spell)); } 
	cmp	r0, #0	@ _32,
	beq	.L261		@,
@ SpellMenu.c:156: 		if (GetSpellCost(spell)>0) { Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[0],0x54,CostColor,GetSpellCost(spell)); } 
	ldr	r0, [sp, #8]	@, %sfp
	bl	GetSpellCost		@
@ SpellMenu.c:156: 		if (GetSpellCost(spell)>0) { Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[0],0x54,CostColor,GetSpellCost(spell)); } 
	lsls	r3, r0, #24	@ tmp245, _34,
	movs	r1, #84	@,
	movs	r0, r4	@, _159
	lsrs	r3, r3, #24	@ tmp245, tmp245,
	ldr	r4, .L277+64	@ tmp248,
@ SpellMenu.c:155: 		if ( !HasSufficientHP(gActiveUnit,spell) ) { CostColor = 1; }
	adds	r2, r5, #1	@ _135, _31,
@ SpellMenu.c:156: 		if (GetSpellCost(spell)>0) { Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[0],0x54,CostColor,GetSpellCost(spell)); } 
	bl	.L16		@
.L261:
@ SpellMenu.c:157: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x24,2,gBattleActor.battleAttack);
	ldr	r3, .L277+68	@ tmp252,
@ SpellMenu.c:157: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x24,2,gBattleActor.battleAttack);
	ldrb	r3, [r3]	@,
@ SpellMenu.c:157: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x24,2,gBattleActor.battleAttack);
	ldr	r4, .L277+72	@ tmp249,
@ SpellMenu.c:157: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[1],0x24,2,gBattleActor.battleAttack);
	lsls	r3, r3, #24	@ tmp256, _37,
	ldr	r5, .L277+64	@ tmp258,
	movs	r2, #2	@,
	movs	r1, #36	@,
	ldr	r0, [sp, #16]	@, %sfp
	lsrs	r3, r3, #24	@ tmp256, tmp256,
	bl	.L279		@
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
	bl	.L279		@
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
	bl	.L279		@
@ SpellMenu.c:160: 		Text_InsertNumberOr2Dashes(&menuItemPanel->textHandles[2],0x54,2,gBattleActor.battleAvoidRate);
	ldrb	r3, [r4]	@,
	lsls	r3, r3, #24	@ tmp286, _43,
	movs	r2, #2	@,
	movs	r1, #84	@,
	ldr	r0, [sp, #12]	@, %sfp
	lsrs	r3, r3, #24	@ tmp286, tmp286,
	bl	.L279		@
.L262:
	movs	r5, r7	@ ivtmp.367, menuItemPanel
	movs	r6, r7	@ menuItemPanel, menuItemPanel
	ldr	r3, [sp, #28]	@ _15, %sfp
	lsls	r4, r3, #5	@ _164, _15,
	ldr	r3, [sp, #24]	@ _14, %sfp
	adds	r4, r4, r3	@ _176, _164, _14
	ldr	r3, .L277+76	@ _179,
	lsls	r4, r4, #1	@ _177, _176,
	adds	r5, r5, #52	@ ivtmp.367,
	adds	r4, r4, r3	@ ivtmp.369, _177, _179
	adds	r6, r6, #76	@ menuItemPanel,
.L264:
@ SpellMenu.c:180: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Display(&menuItemPanel->textHandles[i],&gBG0MapBuffer[y+1+2*i][x+1]); }
	movs	r1, r4	@, ivtmp.369
	movs	r0, r5	@, ivtmp.367
	ldr	r3, .L277+80	@ tmp317,
@ SpellMenu.c:180: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Display(&menuItemPanel->textHandles[i],&gBG0MapBuffer[y+1+2*i][x+1]); }
	adds	r5, r5, #8	@ ivtmp.367,
@ SpellMenu.c:180: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Display(&menuItemPanel->textHandles[i],&gBG0MapBuffer[y+1+2*i][x+1]); }
	bl	.L14		@
@ SpellMenu.c:180: 	for ( int i = 0 ; i < 3 ; i++ ) { Text_Display(&menuItemPanel->textHandles[i],&gBG0MapBuffer[y+1+2*i][x+1]); }
	adds	r4, r4, #128	@ ivtmp.369,
	cmp	r5, r6	@ ivtmp.367, _181
	bne	.L264		@,
@ SpellMenu.c:192: 	gWrite_Range(gActiveUnit->xPos,gActiveUnit->yPos,gGet_Item_Range(gActiveUnit,spell));
	movs	r5, #16	@ _62,
	movs	r6, #17	@ _64,
@ SpellMenu.c:188: 	BmMapFill(gMapMovement,-1);
	ldr	r3, .L277+84	@ tmp323,
	ldr	r4, .L277+88	@ tmp324,
	ldr	r0, [r3]	@, gMapMovement
	movs	r1, #255	@,
	bl	.L16		@
@ SpellMenu.c:189: 	BmMapFill(gMapRange,0);
	ldr	r3, .L277+92	@ tmp325,
	movs	r1, #0	@,
	ldr	r0, [r3]	@, gMapRange
	bl	.L16		@
@ SpellMenu.c:192: 	gWrite_Range(gActiveUnit->xPos,gActiveUnit->yPos,gGet_Item_Range(gActiveUnit,spell));
	ldr	r3, .L277+96	@ tmp327,
	ldr	r4, [r3]	@ gWrite_Range.59_59, gWrite_Range
@ SpellMenu.c:192: 	gWrite_Range(gActiveUnit->xPos,gActiveUnit->yPos,gGet_Item_Range(gActiveUnit,spell));
	ldr	r3, .L277+4	@ tmp328,
	ldr	r0, [r3]	@ gActiveUnit.60_60, gActiveUnit
@ SpellMenu.c:192: 	gWrite_Range(gActiveUnit->xPos,gActiveUnit->yPos,gGet_Item_Range(gActiveUnit,spell));
	ldr	r3, .L277+100	@ tmp329,
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
	movs	r0, #2	@ iftmp.64_72,
@ SpellMenu.c:193: 	DisplayMoveRangeGraphics(( spellType == ITYPE_STAFF ? 4 : 2 )); // See note in UnitMenu.c.
	cmp	r3, #4	@ spellType,
	bne	.L266		@,
@ SpellMenu.c:193: 	DisplayMoveRangeGraphics(( spellType == ITYPE_STAFF ? 4 : 2 )); // See note in UnitMenu.c.
	ldr	r0, [sp, #20]	@ iftmp.64_72, %sfp
.L266:
@ SpellMenu.c:193: 	DisplayMoveRangeGraphics(( spellType == ITYPE_STAFF ? 4 : 2 )); // See note in UnitMenu.c.
	ldr	r3, .L277+104	@ tmp331,
	bl	.L14		@
@ SpellMenu.c:195: }
	movs	r0, #0	@,
	add	sp, sp, #36	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L259:
@ SpellMenu.c:165: 		const char* desc = GetStringFromIndex(GetItemUseDescId(spell));
	ldr	r3, .L277+108	@ tmp289,
	ldr	r0, [sp, #8]	@, %sfp
	bl	.L14		@
@ SpellMenu.c:165: 		const char* desc = GetStringFromIndex(GetItemUseDescId(spell));
	ldr	r3, .L277+36	@ tmp290,
	bl	.L14		@
@ SpellMenu.c:167: 		desc--;
	subs	r0, r0, #1	@ desc,
.L263:
@ SpellMenu.c:171: 			Text_InsertString(&menuItemPanel->textHandles[j],0,0,desc);
	movs	r2, #0	@,
@ SpellMenu.c:170: 			desc++;
	adds	r5, r0, #1	@ desc, desc,
@ SpellMenu.c:171: 			Text_InsertString(&menuItemPanel->textHandles[j],0,0,desc);
	movs	r3, r5	@, desc
	movs	r0, r4	@, ivtmp.373
	movs	r1, r2	@,
	ldr	r6, .L277+40	@ tmp291,
	bl	.L15		@
@ SpellMenu.c:172: 			desc = Text_GetStringNextLine(desc);
	ldr	r3, .L277+112	@ tmp292,
	movs	r0, r5	@, desc
	bl	.L14		@
@ SpellMenu.c:174: 		} while ( *desc );
	ldrb	r3, [r0]	@ *desc_98, *desc_98
	adds	r4, r4, #8	@ ivtmp.373,
	cmp	r3, #0	@ *desc_98,
	bne	.L263		@,
@ SpellMenu.c:175: 		gBattleActor.battleAttack = gBattleTarget.battleAttack; // ??? this is something vanilla does???
	ldr	r0, .L277+116	@ tmp298,
	ldr	r2, .L277+120	@ tmp295,
@ SpellMenu.c:175: 		gBattleActor.battleAttack = gBattleTarget.battleAttack; // ??? this is something vanilla does???
	ldrh	r0, [r0]	@ tmp302,
	ldr	r1, .L277+68	@ tmp301,
	ldr	r3, .L277+72	@ tmp294,
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
	b	.L262		@
.L278:
	.align	2
.L277:
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
@ SpellSystem.c:440:   if (HasSufficientHP(&unit->unit, unit->weapon)) {
	movs	r5, r0	@ tmp134, unit
	adds	r5, r5, #72	@ tmp134,
@ SpellSystem.c:439: void SetRoundForSpell(BattleUnit *unit, NewBattleHit *buffer) {
	movs	r4, r1	@ buffer, buffer
@ SpellSystem.c:440:   if (HasSufficientHP(&unit->unit, unit->weapon)) {
	ldrh	r1, [r5]	@ _3,
	bl	HasSufficientHP		@
@ SpellSystem.c:440:   if (HasSufficientHP(&unit->unit, unit->weapon)) {
	cmp	r0, #0	@ _4,
	beq	.L281		@,
@ SpellSystem.c:441:     int cost = GetSpellCost(unit->weapon);
	ldrh	r0, [r5]	@ _16, MEM[(short unsigned int *)unit_7(D) + 72B]
	bl	GetSpellCost		@
@ SpellSystem.c:443:     buffer->attributes |= BATTLE_HIT_ATTR_HPSTEAL; // "HP drain" bit.
	movs	r3, #128	@ tmp142,
	ldr	r2, [r4]	@ tmp141,* buffer
	lsls	r3, r3, #1	@ tmp142, tmp142,
	orrs	r3, r2	@ tmp140, tmp141
	str	r3, [r4]	@ tmp140,* buffer
@ SpellSystem.c:446:     buffer->damage -= cost;
	ldrb	r3, [r4, #5]	@,
	subs	r3, r3, r0	@ tmp146, tmp143, cost
	strb	r3, [r4, #5]	@ tmp146, buffer_10(D)->damage
.L280:
@ SpellSystem.c:453: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L281:
@ SpellSystem.c:450:     buffer->attributes |=
	movs	r3, #32	@ tmp150,
	ldr	r2, [r4]	@ tmp149,* buffer
	orrs	r3, r2	@ tmp148, tmp149
	str	r3, [r4]	@ tmp148,* buffer
@ SpellSystem.c:453: }
	b	.L280		@
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
@ SpellSystem.c:431:   if (GetUnitEquippedWeaponSlot(&attacker->unit) ==
	ldr	r3, .L285	@ tmp120,
@ SpellSystem.c:428:                             NewBattleHit *buffer, BattleStats *battleData) {
	movs	r4, r0	@ attacker, attacker
	movs	r5, r2	@ buffer, buffer
@ SpellSystem.c:431:   if (GetUnitEquippedWeaponSlot(&attacker->unit) ==
	bl	.L14		@
@ SpellSystem.c:431:   if (GetUnitEquippedWeaponSlot(&attacker->unit) ==
	cmp	r0, #9	@ _2,
	bne	.L283		@,
@ SpellSystem.c:435:     SetRoundForSpell(attacker, buffer);
	movs	r1, r5	@, buffer
	movs	r0, r4	@, attacker
	bl	SetRoundForSpell		@
.L283:
@ SpellSystem.c:437: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L286:
	.align	2
.L285:
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
@ SpellSystem.c:607:   u8 *spells = SpellsGetter(unit, -1);
	movs	r1, #1	@,
@ SpellSystem.c:606: int GetFirstAttackSpell(Unit *unit) {
	push	{r4, lr}	@
@ SpellSystem.c:607:   u8 *spells = SpellsGetter(unit, -1);
	rsbs	r1, r1, #0	@,
	bl	SpellsGetter		@
@ SpellSystem.c:610: }
	@ sp needed	@
@ SpellSystem.c:609:   return spells[0];
	ldrb	r0, [r0]	@ _6, *spells_5
@ SpellSystem.c:610: }
	pop	{r4}
	pop	{r1}
	bx	r1
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
@ SpellSystem.c:151: {
	movs	r4, r0	@ unit, unit
@ SpellSystem.c:154:   int vanillaEquipped = GetVanillaEquipped(unit);
	bl	GetVanillaEquipped		@
	movs	r5, r0	@ vanillaEquipped,
@ SpellSystem.c:156:   if (!UNIT_IS_VALID(unit))
	cmp	r4, #0	@ unit,
	beq	.L289		@,
@ SpellSystem.c:156:   if (!UNIT_IS_VALID(unit))
	ldr	r3, [r4]	@ unit_23(D)->pCharacterData, unit_23(D)->pCharacterData
	cmp	r3, #0	@ unit_23(D)->pCharacterData,
	beq	.L289		@,
@ SpellSystem.c:161:   int spell = GetFirstAttackSpell(unit);
	movs	r0, r4	@, unit
	bl	GetFirstAttackSpell		@
@ SpellSystem.c:164:   if (gChapterData.currentPhase == (unit->index & 0xC0)) {
	movs	r1, #11	@ _4,
@ SpellSystem.c:164:   if (gChapterData.currentPhase == (unit->index & 0xC0)) {
	movs	r3, #192	@ tmp131,
@ SpellSystem.c:164:   if (gChapterData.currentPhase == (unit->index & 0xC0)) {
	ldrsb	r1, [r4, r1]	@ _4,* _4
@ SpellSystem.c:164:   if (gChapterData.currentPhase == (unit->index & 0xC0)) {
	ldr	r4, .L318	@ tmp133,
@ SpellSystem.c:168:     if (!UsingSpellMenu && (unit->index & 0xC0)) {
	ldr	r2, .L318+4	@ tmp132,
@ SpellSystem.c:164:   if (gChapterData.currentPhase == (unit->index & 0xC0)) {
	ldrb	r4, [r4, #15]	@ _3,
@ SpellSystem.c:168:     if (!UsingSpellMenu && (unit->index & 0xC0)) {
	ldrb	r2, [r2]	@ pretmp_35, UsingSpellMenu
@ SpellSystem.c:164:   if (gChapterData.currentPhase == (unit->index & 0xC0)) {
	ands	r3, r1	@ _6, _4
@ SpellSystem.c:164:   if (gChapterData.currentPhase == (unit->index & 0xC0)) {
	cmp	r4, r3	@ _3, _6
	bne	.L290		@,
@ SpellSystem.c:168:     if (!UsingSpellMenu && (unit->index & 0xC0)) {
	cmp	r2, #0	@ pretmp_35,
	bne	.L291		@,
@ SpellSystem.c:168:     if (!UsingSpellMenu && (unit->index & 0xC0)) {
	cmp	r4, r2	@ _3,
	beq	.L296		@,
.L289:
@ SpellSystem.c:157:     return vanillaEquipped;
	movs	r0, r5	@ <retval>, vanillaEquipped
.L288:
@ SpellSystem.c:234: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L291:
@ SpellSystem.c:177:       if (unit->index == gBattleTarget.unit.index &&
	ldr	r3, .L318+8	@ tmp138,
@ SpellSystem.c:177:       if (unit->index == gBattleTarget.unit.index &&
	ldrb	r3, [r3, #11]	@ tmp139,
	lsls	r3, r3, #24	@ tmp139, tmp139,
	ldr	r4, .L318+12	@ tmp153,
	asrs	r3, r3, #24	@ tmp139, tmp139,
	cmp	r3, r1	@ tmp139, _4
	beq	.L294		@,
.L295:
@ SpellSystem.c:205:         return SelectedSpell | 0xFF00;
	movs	r0, #255	@ tmp142,
	ldrb	r3, [r4]	@ _13, SelectedSpell
	lsls	r0, r0, #8	@ tmp142, tmp142,
.L316:
@ SpellSystem.c:231:     return (spell ? spell | 0xFF00 : 0);
	orrs	r0, r3	@ <retval>, tmp151
	b	.L288		@
.L294:
@ SpellSystem.c:178:           GetItemType(SelectedSpell) == ITYPE_STAFF) {
	ldrb	r0, [r4]	@ _34, SelectedSpell
	ldr	r3, .L318+16	@ tmp145,
	bl	.L14		@
@ SpellSystem.c:177:       if (unit->index == gBattleTarget.unit.index &&
	cmp	r0, #4	@ _11,
	bne	.L295		@,
	b	.L289		@
.L290:
@ SpellSystem.c:224:     if (!UsingSpellMenu && (unit->index & 0xC0)) {
	cmp	r2, #0	@ pretmp_35,
	bne	.L296		@,
@ SpellSystem.c:224:     if (!UsingSpellMenu && (unit->index & 0xC0)) {
	cmp	r3, r2	@ _6,
	bne	.L289		@,
@ SpellSystem.c:228:       return (spell ? spell | 0xFF00 : 0);
	cmp	r0, r2	@ <retval>,
	beq	.L288		@,
.L315:
@ SpellSystem.c:231:     return (spell ? spell | 0xFF00 : 0);
	movs	r3, #255	@ tmp151,
	lsls	r3, r3, #8	@ tmp151, tmp151,
	b	.L316		@
.L296:
@ SpellSystem.c:231:     return (spell ? spell | 0xFF00 : 0);
	cmp	r0, #0	@ <retval>,
	beq	.L288		@,
	b	.L315		@
.L319:
	.align	2
.L318:
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
@ SpellSystem.c:240: {
	movs	r5, r0	@ unit, unit
@ SpellSystem.c:241:   int spell = GetFirstAttackSpell(unit);
	bl	GetFirstAttackSpell		@
@ SpellSystem.c:243:   if (AI_UseWexpAsWeps) {
	ldr	r3, .L363	@ tmp144,
	ldr	r4, [r3]	@ <retval>, AI_UseWexpAsWeps
@ SpellSystem.c:241:   int spell = GetFirstAttackSpell(unit);
	movs	r7, r0	@ spell,
	ldr	r6, .L363+4	@ tmp180,
@ SpellSystem.c:243:   if (AI_UseWexpAsWeps) {
	cmp	r4, #0	@ <retval>,
	beq	.L321		@,
@ SpellSystem.c:244:     if (CanUnitUseWeapon(unit, spell)) {
	movs	r1, r0	@, spell
	movs	r0, r5	@, unit
	bl	.L15		@
@ SpellSystem.c:244:     if (CanUnitUseWeapon(unit, spell)) {
	cmp	r0, #0	@ _2,
	bne	.L335		@,
.L323:
@ SpellSystem.c:247:     return (-1);
	movs	r4, #1	@ <retval>,
	rsbs	r4, r4, #0	@ <retval>, <retval>
.L320:
@ SpellSystem.c:389: }
	movs	r0, r4	@, <retval>
	@ sp needed	@
	pop	{r1, r2, r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L321:
@ SpellSystem.c:263:   if (!(UsingSpellMenu) && unit->index != gBattleTarget.unit.index &&
	ldr	r3, .L363+8	@ tmp146,
@ SpellSystem.c:263:   if (!(UsingSpellMenu) && unit->index != gBattleTarget.unit.index &&
	ldrb	r3, [r3]	@ UsingSpellMenu, UsingSpellMenu
	cmp	r3, r4	@ UsingSpellMenu,
	bne	.L324		@,
@ SpellSystem.c:263:   if (!(UsingSpellMenu) && unit->index != gBattleTarget.unit.index &&
	movs	r2, #11	@ tmp149,
@ SpellSystem.c:263:   if (!(UsingSpellMenu) && unit->index != gBattleTarget.unit.index &&
	ldr	r3, .L363+12	@ tmp148,
@ SpellSystem.c:263:   if (!(UsingSpellMenu) && unit->index != gBattleTarget.unit.index &&
	ldrb	r3, [r3, #11]	@ tmp150,
	ldrsb	r2, [r5, r2]	@ tmp149,
	lsls	r3, r3, #24	@ tmp150, tmp150,
	asrs	r3, r3, #24	@ tmp150, tmp150,
	cmp	r2, r3	@ tmp149, tmp150
	beq	.L325		@,
@ SpellSystem.c:264:       (gBattleStats.config & (BATTLE_CONFIG_REAL | BATTLE_CONFIG_SIMULATE))) {
	ldr	r3, .L363+16	@ tmp151,
	str	r3, [sp]	@ tmp151, %sfp
@ SpellSystem.c:263:   if (!(UsingSpellMenu) && unit->index != gBattleTarget.unit.index &&
	ldrh	r3, [r3]	@, gBattleStats
	lsls	r3, r3, #30	@ tmp195, gBattleStats,
	beq	.L325		@,
.L328:
@ SpellSystem.c:268:       if (CanUnitUseWeapon(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r1, r4	@, <retval>
	movs	r0, r5	@, unit
	ldr	r7, .L363+20	@ tmp159,
	bl	.L97		@
	movs	r1, r0	@ _8,
@ SpellSystem.c:268:       if (CanUnitUseWeapon(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r0, r5	@, unit
	bl	.L15		@
@ SpellSystem.c:268:       if (CanUnitUseWeapon(unit, GetEnemyWepBySlot(unit, i))) {
	cmp	r0, #0	@ _9,
	beq	.L323		@,
@ SpellSystem.c:271:         if (gCan_Attack_Target(GetEnemyWepBySlot(unit, i), gBattleStats.range,
	ldr	r3, .L363+24	@ tmp161,
	ldr	r3, [r3]	@ gCan_Attack_Target.82_10, gCan_Attack_Target
	movs	r1, r4	@, <retval>
	movs	r0, r5	@, unit
	str	r3, [sp, #4]	@ gCan_Attack_Target.82_10, %sfp
	bl	.L97		@
@ SpellSystem.c:271:         if (gCan_Attack_Target(GetEnemyWepBySlot(unit, i), gBattleStats.range,
	ldr	r3, [sp]	@ tmp151, %sfp
	movs	r2, r5	@, unit
	ldrb	r1, [r3, #2]	@ _13,
	ldr	r3, [sp, #4]	@ gCan_Attack_Target.82_10, %sfp
	bl	.L14		@
@ SpellSystem.c:271:         if (gCan_Attack_Target(GetEnemyWepBySlot(unit, i), gBattleStats.range,
	cmp	r0, #0	@ _14,
	bne	.L320		@,
@ SpellSystem.c:265:     for (int i = 0; i < 5; i++)
	adds	r4, r4, #1	@ <retval>,
@ SpellSystem.c:265:     for (int i = 0; i < 5; i++)
	cmp	r4, #5	@ <retval>,
	bne	.L328		@,
	b	.L323		@
.L324:
@ SpellSystem.c:284:   if (UsingSpellMenu && CanUnitUseWeapon(unit, SelectedSpell) &&
	ldr	r3, .L363+28	@ tmp165,
	movs	r0, r5	@, unit
	ldrb	r1, [r3]	@ _16, SelectedSpell
	bl	.L15		@
@ SpellSystem.c:284:   if (UsingSpellMenu && CanUnitUseWeapon(unit, SelectedSpell) &&
	cmp	r0, #0	@ _17,
	beq	.L325		@,
@ SpellSystem.c:285:       !(unit->index & 0xC0)) {
	movs	r2, #11	@ _32,
@ SpellSystem.c:285:       !(unit->index & 0xC0)) {
	movs	r3, #192	@ tmp170,
@ SpellSystem.c:285:       !(unit->index & 0xC0)) {
	ldrsb	r2, [r5, r2]	@ _32,* _32
@ SpellSystem.c:284:   if (UsingSpellMenu && CanUnitUseWeapon(unit, SelectedSpell) &&
	tst	r2, r3	@ _32, tmp170
	bne	.L330		@,
.L335:
@ SpellSystem.c:245:       return 9;
	movs	r4, #9	@ <retval>,
	b	.L320		@
.L325:
@ SpellSystem.c:293:   if (unit->index & 0xC0) {
	movs	r2, #11	@ _22,
@ SpellSystem.c:293:   if (unit->index & 0xC0) {
	movs	r3, #192	@ tmp172,
@ SpellSystem.c:293:   if (unit->index & 0xC0) {
	ldrsb	r2, [r5, r2]	@ _22,* _22
@ SpellSystem.c:293:   if (unit->index & 0xC0) {
	tst	r2, r3	@ _22, tmp172
	beq	.L360		@,
.L330:
@ SpellSystem.c:295:       if (CanUnitUseWeapon(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r1, r4	@, <retval>
	movs	r0, r5	@, unit
	ldr	r3, .L363+20	@ tmp173,
	bl	.L14		@
	movs	r1, r0	@ _24,
@ SpellSystem.c:295:       if (CanUnitUseWeapon(unit, GetEnemyWepBySlot(unit, i))) {
	movs	r0, r5	@, unit
	bl	.L15		@
@ SpellSystem.c:295:       if (CanUnitUseWeapon(unit, GetEnemyWepBySlot(unit, i))) {
	cmp	r0, #0	@ _25,
	bne	.L335		@,
@ SpellSystem.c:294:     for (int i = 0; i < 5; i++) {
	adds	r4, r4, #1	@ <retval>,
@ SpellSystem.c:294:     for (int i = 0; i < 5; i++) {
	cmp	r4, #5	@ <retval>,
	bne	.L330		@,
	b	.L323		@
.L360:
@ SpellSystem.c:302:   if (gChapterData.currentPhase != (unit->index & 0xC0) &&
	ldr	r3, .L363+32	@ tmp175,
@ SpellSystem.c:302:   if (gChapterData.currentPhase != (unit->index & 0xC0) &&
	ldrb	r3, [r3, #15]	@ tmp176,
	cmp	r3, #0	@ tmp176,
	beq	.L334		@,
@ SpellSystem.c:303:       (CanUnitUseWeapon(unit, spell))) {
	movs	r1, r7	@, spell
	movs	r0, r5	@, unit
	bl	.L15		@
@ SpellSystem.c:302:   if (gChapterData.currentPhase != (unit->index & 0xC0) &&
	cmp	r0, #0	@ _28,
	beq	.L334		@,
.L362:
@ SpellSystem.c:312:     return (spell ? 9 : 0);
	cmp	r7, #0	@ spell,
	bne	.L335		@,
@ SpellSystem.c:304:     return (spell ? 9 : 0);
	movs	r4, #0	@ <retval>,
	b	.L320		@
.L334:
@ SpellSystem.c:311:   if (CanUnitUseWeapon(unit, spell)) {
	movs	r1, r7	@, spell
	movs	r0, r5	@, unit
	bl	.L15		@
@ SpellSystem.c:311:   if (CanUnitUseWeapon(unit, spell)) {
	cmp	r0, #0	@ _29,
	bne	.L362		@,
	b	.L323		@
.L364:
	.align	2
.L363:
	.word	AI_UseWexpAsWeps
	.word	CanUnitUseWeapon
	.word	UsingSpellMenu
	.word	gBattleTarget
	.word	gBattleStats
	.word	GetEnemyWepBySlot
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
@ SpellSystem.c:614:   if (UsingSpellMenu) {
	ldr	r3, .L368	@ tmp126,
@ SpellSystem.c:614:   if (UsingSpellMenu) {
	ldrb	r3, [r3]	@ UsingSpellMenu, UsingSpellMenu
@ SpellSystem.c:612: void Target_Routine_For_Fortify(BattleUnit *unit) {
	movs	r4, r0	@ unit, unit
@ SpellSystem.c:614:   if (UsingSpellMenu) {
	cmp	r3, #0	@ UsingSpellMenu,
	beq	.L366		@,
@ SpellSystem.c:615:     item = SelectedSpell | 0xFF00;
	ldr	r3, .L368+4	@ tmp128,
	ldrb	r2, [r3]	@ SelectedSpell, SelectedSpell
@ SpellSystem.c:615:     item = SelectedSpell | 0xFF00;
	movs	r3, #255	@ tmp131,
	lsls	r3, r3, #8	@ tmp131, tmp131,
	orrs	r2, r3	@ item, tmp131
.L367:
@ SpellSystem.c:619:   gHealStaff_RangeSetup(unit, 0, item);
	ldr	r3, .L368+8	@ tmp138,
@ SpellSystem.c:620: }
	@ sp needed	@
@ SpellSystem.c:619:   gHealStaff_RangeSetup(unit, 0, item);
	movs	r1, #0	@,
	movs	r0, r4	@, unit
	ldr	r3, [r3]	@ gHealStaff_RangeSetup, gHealStaff_RangeSetup
	bl	.L14		@
@ SpellSystem.c:620: }
	pop	{r4}
	pop	{r0}
	bx	r0
.L366:
@ SpellSystem.c:617:     item = GetEnemyWepBySlot(&unit->unit, gActionData.itemSlotIndex);
	ldr	r3, .L368+12	@ tmp134,
@ SpellSystem.c:617:     item = GetEnemyWepBySlot(&unit->unit, gActionData.itemSlotIndex);
	ldrb	r1, [r3, #18]	@ _7,
	ldr	r3, .L368+16	@ tmp136,
	bl	.L14		@
@ SpellSystem.c:617:     item = GetEnemyWepBySlot(&unit->unit, gActionData.itemSlotIndex);
	lsls	r2, r0, #16	@ item, _8,
	lsrs	r2, r2, #16	@ item, item,
	b	.L367		@
.L369:
	.align	2
.L368:
	.word	UsingSpellMenu
	.word	SelectedSpell
	.word	gHealStaff_RangeSetup
	.word	gActionData
	.word	GetEnemyWepBySlot
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
@ SpellSystem.c:623:   UsingSpellMenu = 0;
	movs	r3, #0	@ tmp115,
@ SpellSystem.c:626: }
	@ sp needed	@
@ SpellSystem.c:623:   UsingSpellMenu = 0;
	ldr	r2, .L371	@ tmp114,
	strb	r3, [r2]	@ tmp115, UsingSpellMenu
@ SpellSystem.c:624:   SelectedSpell = 0;
	ldr	r2, .L371+4	@ tmp117,
	strb	r3, [r2]	@ tmp115, SelectedSpell
@ SpellSystem.c:625:   DidSelectSpell = 0;
	ldr	r2, .L371+8	@ tmp120,
	strb	r3, [r2]	@ tmp115, DidSelectSpell
@ SpellSystem.c:626: }
	bx	lr
.L372:
	.align	2
.L371:
	.word	UsingSpellMenu
	.word	SelectedSpell
	.word	DidSelectSpell
	.size	GaidenZeroOutSpellVariables, .-GaidenZeroOutSpellVariables
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
	ldr	r3, .L376	@ tmp143,
@ StatScreen.c:3: {
	movs	r6, r0	@ x, x
@ StatScreen.c:4: 	u8* spells = SpellsGetter(gpStatScreenUnit,-1);
	rsbs	r1, r1, #0	@,
	ldr	r0, [r3]	@, gpStatScreenUnit
	bl	SpellsGetter		@
@ StatScreen.c:5: 	int tile = (currHandle-1)->tileIndexOffset;
	movs	r3, r4	@ tmp144, currHandle
	movs	r7, r0	@ ivtmp.432, spells
	subs	r3, r3, #8	@ tmp144,
@ StatScreen.c:5: 	int tile = (currHandle-1)->tileIndexOffset;
	ldrh	r3, [r3]	@ tile, MEM[(struct TextHandle *)currHandle_23(D) + 4294967288B]
	adds	r5, r5, r6	@ _65, _63, x
	str	r3, [sp]	@ tile, %sfp
	ldr	r3, .L376+4	@ tmp148,
	lsls	r5, r5, #1	@ _66, _65,
	adds	r5, r5, r3	@ ivtmp.435, _66, tmp148
.L374:
@ StatScreen.c:8: 	for ( int i = 0 ; spells[i] ; i++ )
	adds	r7, r7, #1	@ ivtmp.432,
@ StatScreen.c:8: 	for ( int i = 0 ; spells[i] ; i++ )
	subs	r3, r7, #1	@ tmp173, ivtmp.432,
	ldrb	r0, [r3]	@ _14, MEM[(u8 *)_68 + 4294967295B]
@ StatScreen.c:8: 	for ( int i = 0 ; spells[i] ; i++ )
	cmp	r0, #0	@ _14,
	bne	.L375		@,
@ StatScreen.c:33: }
	@ sp needed	@
	movs	r0, r4	@, currHandle
	pop	{r1, r2, r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L375:
@ StatScreen.c:10: 		const ItemData* item = GetItemData(spells[i]);
	ldr	r3, .L376+8	@ tmp149,
	bl	.L14		@
@ StatScreen.c:11: 		DrawIcon(&StatScreenBufferMap[iconY][iconX],item->iconId,0x4000);
	movs	r2, #128	@,
@ StatScreen.c:10: 		const ItemData* item = GetItemData(spells[i]);
	str	r0, [sp, #4]	@, %sfp
@ StatScreen.c:11: 		DrawIcon(&StatScreenBufferMap[iconY][iconX],item->iconId,0x4000);
	lsls	r2, r2, #7	@,,
	ldrb	r1, [r0, #29]	@ _5,
	ldr	r3, .L376+12	@ tmp152,
	movs	r0, r5	@, ivtmp.435
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
	ldr	r3, .L376+16	@ tmp166,
	bl	.L14		@
@ StatScreen.c:23: 		Text_SetColorId(currHandle,TEXT_COLOR_NORMAL);
	movs	r1, r6	@, tmp154
	movs	r0, r4	@, currHandle
	ldr	r3, .L376+20	@ tmp167,
	bl	.L14		@
@ StatScreen.c:24: 		Text_InsertString(currHandle,0,TEXT_COLOR_NORMAL,GetStringFromIndex(item->nameTextId));
	ldr	r3, [sp, #4]	@ item, %sfp
	ldrh	r0, [r3]	@ _8, *item_28
	ldr	r3, .L376+24	@ tmp169,
	bl	.L14		@
@ StatScreen.c:24: 		Text_InsertString(currHandle,0,TEXT_COLOR_NORMAL,GetStringFromIndex(item->nameTextId));
	movs	r2, r6	@, tmp154
@ StatScreen.c:24: 		Text_InsertString(currHandle,0,TEXT_COLOR_NORMAL,GetStringFromIndex(item->nameTextId));
	movs	r3, r0	@ _9,
@ StatScreen.c:24: 		Text_InsertString(currHandle,0,TEXT_COLOR_NORMAL,GetStringFromIndex(item->nameTextId));
	movs	r1, r6	@, tmp154
	movs	r0, r4	@, currHandle
	ldr	r6, .L376+28	@ tmp170,
	bl	.L15		@
@ StatScreen.c:25: 		Text_Display(currHandle,&StatScreenBufferMap[iconY][iconX+2]);
	movs	r0, r4	@, currHandle
	adds	r1, r5, #4	@ _70, ivtmp.435,
	ldr	r3, .L376+32	@ tmp172,
	bl	.L14		@
@ StatScreen.c:27: 		currHandle++;
	adds	r4, r4, #8	@ currHandle,
	adds	r5, r5, #128	@ ivtmp.435,
	b	.L374		@
.L377:
	.align	2
.L376:
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
	ldr	r3, .L379	@ tmp127,
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
	ldr	r3, .L379+4	@ tmp132,
	bl	.L14		@
@ StatScreen.c:39: 	proc->textID = GetItemData(proc->type)->descTextId;
	ldrh	r3, [r0, #2]	@ tmp136,
	adds	r4, r4, #76	@ tmp135,
	strh	r3, [r4]	@ tmp136, proc_12(D)->textID
@ StatScreen.c:40: }
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L380:
	.align	2
.L379:
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
	bne	.L383		@,
.L384:
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	movs	r1, #1	@,
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	ldr	r3, .L390	@ tmp138,
	ldr	r7, [r3]	@ gpStatScreenUnit.108_4, gpStatScreenUnit
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	rsbs	r1, r1, #0	@,
	movs	r0, r7	@, gpStatScreenUnit.108_4
	bl	SpellsGetter		@
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	ldrb	r1, [r0, r4]	@ *_7, *_7
	movs	r0, r7	@, gpStatScreenUnit.108_4
	bl	DoesUnitKnowSpell		@
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	cmp	r0, #0	@ _9,
	bne	.L383		@,
@ StatScreen.c:50: 			RTextUp(proc);
	movs	r0, r5	@, proc
	ldr	r3, .L390+4	@ tmp137,
	bl	.L14		@
@ StatScreen.c:48: 		while ( index >= 0 && !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	subs	r4, r4, #1	@ ivtmp.456, ivtmp.456
	bcs	.L384		@,
.L383:
@ StatScreen.c:54: 	if ( proc->direction == DIRECTION_DOWN )
	ldrh	r3, [r6]	@ tmp144,
	cmp	r3, #128	@ tmp144,
	bne	.L381		@,
@ StatScreen.c:57: 		if ( !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	movs	r1, #1	@,
@ StatScreen.c:57: 		if ( !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	ldr	r3, .L390	@ tmp145,
	ldr	r6, [r3]	@ gpStatScreenUnit.111_11, gpStatScreenUnit
@ StatScreen.c:57: 		if ( !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	rsbs	r1, r1, #0	@,
	movs	r0, r6	@, gpStatScreenUnit.111_11
	bl	SpellsGetter		@
@ StatScreen.c:57: 		if ( !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	ldrb	r1, [r0, r4]	@ *_14, *_14
	movs	r0, r6	@, gpStatScreenUnit.111_11
	bl	DoesUnitKnowSpell		@
@ StatScreen.c:57: 		if ( !DoesUnitKnowSpell(gpStatScreenUnit,SpellsGetter(gpStatScreenUnit,-1)[index]) )
	cmp	r0, #0	@ _16,
	bne	.L381		@,
@ StatScreen.c:59: 			RTextDown(proc);
	movs	r0, r5	@, proc
	ldr	r3, .L390+8	@ tmp148,
	bl	.L14		@
.L381:
@ StatScreen.c:64: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L391:
	.align	2
.L390:
	.word	gpStatScreenUnit
	.word	RTextUp
	.word	RTextDown
	.size	GaidenRTextLooper, .-GaidenRTextLooper
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
	ldr	r3, .L395	@ tmp119,
@ UnitMenu.c:13:   if (*DisableMenuOptionsRam & 1)
	ldrb	r3, [r3]	@, MEM[(u8 *)50337716B]
@ UnitMenu.c:14:     return 3; // For tutorials
	movs	r0, #3	@ <retval>,
@ UnitMenu.c:13:   if (*DisableMenuOptionsRam & 1)
	tst	r1, r3	@ tmp123, MEM[(u8 *)50337716B]
	bne	.L392		@,
@ UnitMenu.c:15:   return GaidenMagicUMUsabilityExt(SpellsGetter(
	ldr	r3, .L395+4	@ tmp127,
	ldr	r0, [r3]	@, gActiveUnit
	bl	SpellsGetter		@
@ UnitMenu.c:15:   return GaidenMagicUMUsabilityExt(SpellsGetter(
	bl	GaidenMagicUMUsabilityExt		@
.L392:
@ UnitMenu.c:18: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L396:
	.align	2
.L395:
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
@ UnitMenu.c:32:   if (*DisableMenuOptionsRam & 2)
	movs	r4, #2	@ tmp125,
@ UnitMenu.c:32:   if (*DisableMenuOptionsRam & 2)
	ldr	r3, .L405	@ tmp121,
@ UnitMenu.c:32:   if (*DisableMenuOptionsRam & 2)
	ldrb	r3, [r3]	@, MEM[(u8 *)50337716B]
	tst	r4, r3	@ tmp125, MEM[(u8 *)50337716B]
	beq	.L398		@,
.L400:
@ UnitMenu.c:33:     return 3;
	movs	r0, #3	@ <retval>,
.L397:
@ UnitMenu.c:45: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L398:
@ UnitMenu.c:35:   if (!(Capture_Usability())) {
	ldr	r3, .L405+4	@ tmp129,
	bl	.L14		@
@ UnitMenu.c:35:   if (!(Capture_Usability())) {
	cmp	r0, #0	@ _3,
	beq	.L400		@,
@ UnitMenu.c:38:   if (AreBoxesFull()) {
	ldr	r3, .L405+8	@ tmp130,
	bl	.L14		@
	movs	r3, r0	@ _4,
@ UnitMenu.c:39:     return 2;
	movs	r0, r4	@ <retval>, tmp125
@ UnitMenu.c:38:   if (AreBoxesFull()) {
	cmp	r3, #0	@ _4,
	bne	.L397		@,
@ UnitMenu.c:42:   return GaidenMagicUMUsabilityExt(SpellsGetter(
	ldr	r3, .L405+12	@ tmp131,
	movs	r1, #1	@,
	ldr	r0, [r3]	@, gActiveUnit
	bl	SpellsGetter		@
@ UnitMenu.c:42:   return GaidenMagicUMUsabilityExt(SpellsGetter(
	bl	GaidenMagicUMUsabilityExt		@
@ UnitMenu.c:42:   return GaidenMagicUMUsabilityExt(SpellsGetter(
	b	.L397		@
.L406:
	.align	2
.L405:
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
@ UnitMenu.c:60:   return GaidenMagicUMUsabilityExt(SpellsGetter(gActiveUnit, WHITE_MAGIC));
	ldr	r3, .L408	@ tmp117,
@ UnitMenu.c:61: }
	@ sp needed	@
@ UnitMenu.c:60:   return GaidenMagicUMUsabilityExt(SpellsGetter(gActiveUnit, WHITE_MAGIC));
	movs	r1, #2	@,
	ldr	r0, [r3]	@, gActiveUnit
	bl	SpellsGetter		@
@ UnitMenu.c:60:   return GaidenMagicUMUsabilityExt(SpellsGetter(gActiveUnit, WHITE_MAGIC));
	bl	GaidenMagicUMUsabilityExt		@
@ UnitMenu.c:61: }
	pop	{r4}
	pop	{r1}
	bx	r1
.L409:
	.align	2
.L408:
	.word	gActiveUnit
	.size	GaidenWhiteMagicUMUsability, .-GaidenWhiteMagicUMUsability
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
@ UnitMenu.c:93: int GaidenBlackMagicUMEffect(MenuProc *proc, MenuCommandProc *commandProc) {
	movs	r5, r1	@ commandProc, commandProc
@ UnitMenu.c:97: }
	@ sp needed	@
@ UnitMenu.c:94:   UsingSpellMenu = BLACK_MAGIC;
	movs	r1, #1	@ tmp120,
@ UnitMenu.c:93: int GaidenBlackMagicUMEffect(MenuProc *proc, MenuCommandProc *commandProc) {
	movs	r4, r0	@ proc, proc
@ UnitMenu.c:94:   UsingSpellMenu = BLACK_MAGIC;
	ldr	r3, .L411	@ tmp119,
	strb	r1, [r3]	@ tmp120, UsingSpellMenu
@ UnitMenu.c:95:   return GaidenMagicUMEffectExt(SpellsGetter(gActiveUnit, BLACK_MAGIC), proc,
	ldr	r3, .L411+4	@ tmp122,
	ldr	r0, [r3]	@, gActiveUnit
	bl	SpellsGetter		@
@ UnitMenu.c:95:   return GaidenMagicUMEffectExt(SpellsGetter(gActiveUnit, BLACK_MAGIC), proc,
	movs	r2, r5	@, commandProc
	movs	r1, r4	@, proc
	bl	GaidenMagicUMEffectExt		@
@ UnitMenu.c:97: }
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L412:
	.align	2
.L411:
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
@ UnitMenu.c:99: int GaidenWhiteMagicUMEffect(MenuProc *proc, MenuCommandProc *commandProc) {
	movs	r5, r1	@ commandProc, commandProc
@ UnitMenu.c:103: }
	@ sp needed	@
@ UnitMenu.c:100:   UsingSpellMenu = WHITE_MAGIC;
	movs	r1, #2	@ tmp120,
@ UnitMenu.c:99: int GaidenWhiteMagicUMEffect(MenuProc *proc, MenuCommandProc *commandProc) {
	movs	r4, r0	@ proc, proc
@ UnitMenu.c:100:   UsingSpellMenu = WHITE_MAGIC;
	ldr	r3, .L414	@ tmp119,
	strb	r1, [r3]	@ tmp120, UsingSpellMenu
@ UnitMenu.c:101:   return GaidenMagicUMEffectExt(SpellsGetter(gActiveUnit, WHITE_MAGIC), proc,
	ldr	r3, .L414+4	@ tmp122,
	ldr	r0, [r3]	@, gActiveUnit
	bl	SpellsGetter		@
@ UnitMenu.c:101:   return GaidenMagicUMEffectExt(SpellsGetter(gActiveUnit, WHITE_MAGIC), proc,
	movs	r2, r5	@, commandProc
	movs	r1, r4	@, proc
	bl	GaidenMagicUMEffectExt		@
@ UnitMenu.c:103: }
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L415:
	.align	2
.L414:
	.word	UsingSpellMenu
	.word	gActiveUnit
	.size	GaidenWhiteMagicUMEffect, .-GaidenWhiteMagicUMEffect
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
	ldr	r3, .L420	@ tmp116,
	ldrb	r3, [r3]	@ UsingSpellMenu.72_1, UsingSpellMenu
@ SpellMenu.c:236: 	if ( UsingSpellMenu == BLACK_MAGIC ) { GaidenBlackMagicUMEffect(NULL,NULL); }
	movs	r0, r1	@,
@ SpellMenu.c:236: 	if ( UsingSpellMenu == BLACK_MAGIC ) { GaidenBlackMagicUMEffect(NULL,NULL); }
	cmp	r3, #1	@ UsingSpellMenu.72_1,
	bne	.L417		@,
@ SpellMenu.c:236: 	if ( UsingSpellMenu == BLACK_MAGIC ) { GaidenBlackMagicUMEffect(NULL,NULL); }
	bl	GaidenBlackMagicUMEffect		@
.L418:
@ SpellMenu.c:244: }
	@ sp needed	@
@ SpellMenu.c:243: 	SelectedSpell = 0; // Regardless of use case, ensure that this is 0.
	movs	r2, #0	@ tmp119,
	ldr	r3, .L420+4	@ tmp118,
	strb	r2, [r3]	@ tmp119, SelectedSpell
@ SpellMenu.c:244: }
	pop	{r4}
	pop	{r0}
	bx	r0
.L417:
@ SpellMenu.c:237: 	else if ( UsingSpellMenu == WHITE_MAGIC ) { GaidenWhiteMagicUMEffect(NULL,NULL); }
	cmp	r3, #2	@ UsingSpellMenu.72_1,
	bne	.L419		@,
@ SpellMenu.c:237: 	else if ( UsingSpellMenu == WHITE_MAGIC ) { GaidenWhiteMagicUMEffect(NULL,NULL); }
	bl	GaidenWhiteMagicUMEffect		@
	b	.L418		@
.L419:
@ SpellMenu.c:241: 		AttackUMEffect(NULL,NULL);
	ldr	r3, .L420+8	@ tmp117,
	bl	.L14		@
	b	.L418		@
.L421:
	.align	2
.L420:
	.word	UsingSpellMenu
	.word	SelectedSpell
	.word	AttackUMEffect
	.size	NewExitBattleForecast, .-NewExitBattleForecast
	.align	1
	.global	GaidenMagicUMEffectExtCapture
	.syntax unified
	.code	16
	.thumb_func
	.type	GaidenMagicUMEffectExtCapture, %function
GaidenMagicUMEffectExtCapture:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	movs	r4, r0	@ spellsList, spellsList
	sub	sp, sp, #28	@,,
@ UnitMenu.c:131:                                   MenuCommandProc *commandProc) {
	subs	r0, r1, #0	@ proc, proc,
@ UnitMenu.c:132:   if (proc && commandProc->availability == 2) {
	beq	.L423		@,
@ UnitMenu.c:132:   if (proc && commandProc->availability == 2) {
	adds	r2, r2, #61	@ tmp132,
@ UnitMenu.c:132:   if (proc && commandProc->availability == 2) {
	ldrb	r3, [r2]	@ tmp133,
	cmp	r3, #2	@ tmp133,
	bne	.L423		@,
@ UnitMenu.c:134:     MenuCallHelpBox(proc, gCaptureUMErrorText);
	ldr	r3, .L428	@ tmp134,
	ldrh	r1, [r3]	@ gCaptureUMErrorText, gCaptureUMErrorText
	ldr	r3, .L428+4	@ tmp136,
	bl	.L14		@
@ UnitMenu.c:135:     return 0x08;
	movs	r0, #8	@ <retval>,
.L422:
@ UnitMenu.c:150: }
	add	sp, sp, #28	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L423:
@ UnitMenu.c:137:     _ResetIconGraphics();
	ldr	r3, .L428+8	@ tmp137,
	bl	.L14		@
@ UnitMenu.c:138:     SelectedSpell = spellsList[0];
	ldrb	r2, [r4]	@ _3, *spellsList_19(D)
@ UnitMenu.c:138:     SelectedSpell = spellsList[0];
	ldr	r3, .L428+12	@ tmp138,
@ UnitMenu.c:139:     LoadIconPalettes(4);
	movs	r0, #4	@,
@ UnitMenu.c:138:     SelectedSpell = spellsList[0];
	strb	r2, [r3]	@ _3, SelectedSpell
@ UnitMenu.c:139:     LoadIconPalettes(4);
	ldr	r3, .L428+16	@ tmp140,
	bl	.L14		@
@ UnitMenu.c:140:     MenuProc *menu = StartMenu(&SpellSelectMenuDefs);
	ldr	r3, .L428+20	@ tmp142,
	ldr	r0, .L428+24	@ tmp141,
	bl	.L14		@
@ UnitMenu.c:143:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	movs	r3, r0	@ tmp144, menu
	adds	r3, r3, #96	@ tmp144,
@ UnitMenu.c:140:     MenuProc *menu = StartMenu(&SpellSelectMenuDefs);
	movs	r4, r0	@ menu,
@ UnitMenu.c:143:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	ldrb	r0, [r3]	@ _5,
	ldr	r3, .L428+28	@ tmp146,
	bl	.L14		@
@ UnitMenu.c:143:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	ldr	r5, .L428+32	@ tmp147,
@ UnitMenu.c:143:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	str	r0, [sp, #20]	@, %sfp
@ UnitMenu.c:143:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	ldr	r3, .L428+36	@ tmp148,
	ldr	r0, [r5]	@, gActiveUnit
	bl	.L14		@
@ UnitMenu.c:143:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	ldr	r3, .L428+40	@ tmp149,
@ UnitMenu.c:143:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	movs	r7, r0	@ _8,
@ UnitMenu.c:143:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	ldr	r6, [r3]	@ ItemMenuFaceChr.134_9, ItemMenuFaceChr
	movs	r0, #0	@,
	ldr	r3, .L428+44	@ tmp150,
	bl	.L14		@
@ UnitMenu.c:143:     StartFaceChibiSpr(48, GetActiveUnitMenuBottomY(menu->commandCount),
	movs	r3, #0	@ tmp151,
	movs	r2, r7	@, _8
	str	r4, [sp, #8]	@ menu,
	str	r3, [sp, #4]	@ tmp151,
	str	r0, [sp]	@ _10,
	movs	r3, r6	@, ItemMenuFaceChr.134_9
	movs	r0, #48	@,
	ldr	r1, [sp, #20]	@, %sfp
	ldr	r6, .L428+48	@ tmp152,
	bl	.L15		@
@ UnitMenu.c:147:     ForceMenuItemPanel(menu, gActiveUnit, 15, 11);
	movs	r0, r4	@, menu
	movs	r3, #11	@,
	movs	r2, #15	@,
	ldr	r1, [r5]	@, gActiveUnit
	ldr	r4, .L428+52	@ tmp154,
	bl	.L16		@
@ UnitMenu.c:148:     return 0x17;
	movs	r0, #23	@ <retval>,
	b	.L422		@
.L429:
	.align	2
.L428:
	.word	gCaptureUMErrorText
	.word	MenuCallHelpBox
	.word	_ResetIconGraphics
	.word	SelectedSpell
	.word	LoadIconPalettes
	.word	StartMenu
	.word	SpellSelectMenuDefs
	.word	GetActiveUnitMenuBottomY
	.word	gActiveUnit
	.word	GetUnitPortraitId
	.word	ItemMenuFaceChr
	.word	GetFaceSlotPalID
	.word	StartFaceChibiSpr
	.word	ForceMenuItemPanel
	.size	GaidenMagicUMEffectExtCapture, .-GaidenMagicUMEffectExtCapture
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
@ UnitMenu.c:50:   Unit *unit = gActiveUnit;
	ldr	r3, .L431	@ tmp121,
@ UnitMenu.c:48:                                     MenuCommandProc *commandProc) {
	push	{r4, r5, r6, lr}	@
@ UnitMenu.c:48:                                     MenuCommandProc *commandProc) {
	movs	r4, r0	@ proc, proc
@ UnitMenu.c:57: }
	@ sp needed	@
@ UnitMenu.c:50:   Unit *unit = gActiveUnit;
	ldr	r0, [r3]	@ unit, gActiveUnit
@ UnitMenu.c:51:   unit->state = unit->state | (1 << 30); // Capturing bit
	movs	r3, #128	@ tmp124,
@ UnitMenu.c:48:                                     MenuCommandProc *commandProc) {
	movs	r5, r1	@ commandProc, commandProc
@ UnitMenu.c:54:   UsingSpellMenu = BLACK_MAGIC;
	movs	r1, #1	@ tmp126,
@ UnitMenu.c:51:   unit->state = unit->state | (1 << 30); // Capturing bit
	ldr	r2, [r0, #12]	@ unit_5->state, unit_5->state
	lsls	r3, r3, #23	@ tmp124, tmp124,
	orrs	r3, r2	@ _2, unit_5->state
@ UnitMenu.c:51:   unit->state = unit->state | (1 << 30); // Capturing bit
	str	r3, [r0, #12]	@ _2, unit_5->state
@ UnitMenu.c:54:   UsingSpellMenu = BLACK_MAGIC;
	ldr	r3, .L431+4	@ tmp125,
	strb	r1, [r3]	@ tmp126, UsingSpellMenu
@ UnitMenu.c:55:   return GaidenMagicUMEffectExtCapture(SpellsGetter(gActiveUnit, BLACK_MAGIC),
	bl	SpellsGetter		@
@ UnitMenu.c:55:   return GaidenMagicUMEffectExtCapture(SpellsGetter(gActiveUnit, BLACK_MAGIC),
	movs	r2, r5	@, commandProc
	movs	r1, r4	@, proc
	bl	GaidenMagicUMEffectExtCapture		@
@ UnitMenu.c:57: }
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L432:
	.align	2
.L431:
	.word	gActiveUnit
	.word	UsingSpellMenu
	.size	CaptureGaidenBlackMagicUMEffect, .-CaptureGaidenBlackMagicUMEffect
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
@ UnitMenu.c:153:   UsingSpellMenu = BLACK_MAGIC;
	movs	r5, #1	@ tmp122,
	ldr	r3, .L437	@ tmp121,
	strb	r5, [r3]	@ tmp122, UsingSpellMenu
@ UnitMenu.c:154:   BmMapFill(gMapMovement, -1);
	ldr	r3, .L437+4	@ tmp124,
	ldr	r4, .L437+8	@ tmp125,
	ldr	r0, [r3]	@, gMapMovement
	movs	r1, #255	@,
	bl	.L16		@
@ UnitMenu.c:155:   BmMapFill(gMapRange, 0);
	ldr	r3, .L437+12	@ tmp126,
	movs	r1, #0	@,
	ldr	r0, [r3]	@, gMapRange
	bl	.L16		@
@ UnitMenu.c:156:   if (CanUseAttackSpellsNow(gActiveUnit,
	ldr	r4, .L437+16	@ tmp128,
	movs	r1, r5	@, tmp122
	ldr	r0, [r4]	@, gActiveUnit
	bl	CanUseAttackSpellsNow		@
	subs	r3, r0, #0	@ _4,,
@ UnitMenu.c:160:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckNotStaff);
	ldr	r0, [r4]	@ pretmp_17, gActiveUnit
	ldr	r4, .L437+20	@ tmp135,
@ UnitMenu.c:156:   if (CanUseAttackSpellsNow(gActiveUnit,
	beq	.L434		@,
@ UnitMenu.c:160:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckNotStaff);
	ldr	r1, .L437+24	@ tmp130,
	bl	All_Spells_One_Square		@
@ UnitMenu.c:161:     DisplayMoveRangeGraphics(3);
	movs	r0, #3	@,
.L436:
@ UnitMenu.c:171: }
	@ sp needed	@
@ UnitMenu.c:164:     DisplayMoveRangeGraphics(5);
	bl	.L16		@
@ UnitMenu.c:171: }
	movs	r0, #0	@,
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L434:
@ UnitMenu.c:163:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckStaff);
	ldr	r1, .L437+28	@ tmp132,
	bl	All_Spells_One_Square		@
@ UnitMenu.c:164:     DisplayMoveRangeGraphics(5);
	movs	r0, #5	@,
	b	.L436		@
.L438:
	.align	2
.L437:
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
@ UnitMenu.c:174:   UsingSpellMenu = WHITE_MAGIC;
	movs	r5, #2	@ tmp122,
	ldr	r3, .L443	@ tmp121,
	strb	r5, [r3]	@ tmp122, UsingSpellMenu
@ UnitMenu.c:175:   BmMapFill(gMapMovement, -1);
	ldr	r3, .L443+4	@ tmp124,
	ldr	r4, .L443+8	@ tmp125,
	ldr	r0, [r3]	@, gMapMovement
	movs	r1, #255	@,
	bl	.L16		@
@ UnitMenu.c:176:   BmMapFill(gMapRange, 0);
	ldr	r3, .L443+12	@ tmp126,
	movs	r1, #0	@,
	ldr	r0, [r3]	@, gMapRange
	bl	.L16		@
@ UnitMenu.c:177:   if (CanUseAttackSpellsNow(gActiveUnit,
	ldr	r4, .L443+16	@ tmp128,
	movs	r1, r5	@, tmp122
	ldr	r0, [r4]	@, gActiveUnit
	bl	CanUseAttackSpellsNow		@
	subs	r3, r0, #0	@ _4,,
@ UnitMenu.c:181:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckNotStaff);
	ldr	r0, [r4]	@ pretmp_17, gActiveUnit
	ldr	r4, .L443+20	@ tmp135,
@ UnitMenu.c:177:   if (CanUseAttackSpellsNow(gActiveUnit,
	beq	.L440		@,
@ UnitMenu.c:181:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckNotStaff);
	ldr	r1, .L443+24	@ tmp130,
	bl	All_Spells_One_Square		@
@ UnitMenu.c:182:     DisplayMoveRangeGraphics(3);
	movs	r0, #3	@,
.L442:
@ UnitMenu.c:188: }
	@ sp needed	@
@ UnitMenu.c:185:     DisplayMoveRangeGraphics(5);
	bl	.L16		@
@ UnitMenu.c:188: }
	movs	r0, #0	@,
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L440:
@ UnitMenu.c:184:     All_Spells_One_Square(gActiveUnit, &RangeUsabilityCheckStaff);
	ldr	r1, .L443+28	@ tmp132,
	bl	All_Spells_One_Square		@
@ UnitMenu.c:185:     DisplayMoveRangeGraphics(5);
	movs	r0, #5	@,
	b	.L442		@
.L444:
	.align	2
.L443:
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
@ UnitMenu.c:191:   if (!SelectedSpell) {
	ldr	r3, .L447	@ tmp117,
@ UnitMenu.c:191:   if (!SelectedSpell) {
	ldrb	r3, [r3]	@ SelectedSpell, SelectedSpell
	cmp	r3, #0	@ SelectedSpell,
	bne	.L446		@,
@ UnitMenu.c:192:     UsingSpellMenu = 0;
	ldr	r2, .L447+4	@ tmp119,
	strb	r3, [r2]	@ SelectedSpell, UsingSpellMenu
.L446:
@ UnitMenu.c:196: }
	@ sp needed	@
@ UnitMenu.c:194:   HideMoveRangeGraphics();
	ldr	r3, .L447+8	@ tmp122,
	bl	.L14		@
@ UnitMenu.c:196: }
	movs	r0, #0	@,
	pop	{r4}
	pop	{r1}
	bx	r1
.L448:
	.align	2
.L447:
	.word	SelectedSpell
	.word	UsingSpellMenu
	.word	HideMoveRangeGraphics
	.size	GaidenMagicUMUnhover, .-GaidenMagicUMUnhover
	.ident	"GCC: (devkitARM release 66) 15.1.0"
	.code 16
	.align	1
.L14:
	bx	r3
.L16:
	bx	r4
.L279:
	bx	r5
.L15:
	bx	r6
.L97:
	bx	r7
