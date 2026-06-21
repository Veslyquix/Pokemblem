	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 23, 1	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 1	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"soar_wram.arm.c"
@ GNU C23 (devkitARM release 66) version 15.1.0 (arm-none-eabi)
@	compiled by GNU C version 13.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -marm -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -Ofast -fomit-frame-pointer -ffast-math -fno-jump-tables -fno-toplevel-reorder
	.text
	.align	2
	.global	NewWMLoop
	.syntax unified
	.arm
	.type	NewWMLoop, %function
NewWMLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ arm/soar_wram.arm.c:59:   u8 animClock = *(u8 *)(0x3000014) & 0x3F;
	mov	r3, #50331648	@ tmp173,
@ arm/soar_wram.arm.c:9: void NewWMLoop(SoarProc *CurrentProc) {
	push	{r4, r5, r6, r7, lr}	@
@ arm/soar_wram.arm.c:59:   u8 animClock = *(u8 *)(0x3000014) & 0x3F;
	ldrb	r3, [r3, #20]	@ zero_extendqisi2	@ _11, MEM[(u8 *)50331668B]
@ arm/soar_wram.arm.c:61:   if (animClock < 0x10)
	tst	r3, #48	@ _11,
@ arm/soar_wram.arm.c:9: void NewWMLoop(SoarProc *CurrentProc) {
	mov	r4, r0	@ CurrentProc, CurrentProc
	sub	sp, sp, #12	@,,
@ arm/soar_wram.arm.c:61:   if (animClock < 0x10)
	beq	.L39		@,
@ arm/soar_wram.arm.c:64:   else if (animClock < 0x20)
	tst	r3, #32	@ _11,
@ arm/soar_wram.arm.c:65:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	ldreq	r3, .L45	@ tmp184,
@ arm/soar_wram.arm.c:64:   else if (animClock < 0x20)
	beq	.L37		@,
@ arm/soar_wram.arm.c:59:   u8 animClock = *(u8 *)(0x3000014) & 0x3F;
	and	r3, r3, #63	@ tmp186, _11,
@ arm/soar_wram.arm.c:67:   else if (animClock < 0x30)
	cmp	r3, #47	@ tmp186,
@ arm/soar_wram.arm.c:68:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	ldrls	r3, .L45+4	@ tmp191,
@ arm/soar_wram.arm.c:71:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	ldrhi	r3, .L45+8	@ tmp194,
.L37:
	str	r3, [sp]	@ tmp194,
	mov	r2, #88	@,
	ldr	r3, .L45+12	@,
	mov	r1, #104	@,
	mov	r0, #8	@,
	ldr	r5, .L45+16	@ tmp299,
	mov	lr, pc
	bx	r5		@ tmp299
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	tst	r3, #1	@ _15,
	bne	.L40		@,
.L6:
@ arm/soar_wram.arm.c:78:   if (CurrentProc->ShowFPS)
	tst	r3, #2	@ _15,
	bne	.L41		@,
.L7:
@ arm/soar_wram.arm.c:84:     if (CurrentProc->disableFlare == 0) { // draw lens flare test
	tst	r3, #16	@ _15,
	bne	.L8		@,
@ arm/soar_wram.arm.c:89:       switch (CurrentProc->sPlayerYaw) {
	ldr	r2, [r4, #60]	@ _33, CurrentProc_6(D)->sPlayerYaw
@ arm/soar_wram.arm.c:88:           80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	ldr	r3, .L45+20	@ tmp220,
@ arm/soar_wram.arm.c:89:       switch (CurrentProc->sPlayerYaw) {
	cmp	r2, #11	@ _33,
@ arm/soar_wram.arm.c:88:           80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	ldr	r3, [r3, #208]	@ _28, MEM[(volatile vu32 *)50344144B]
@ arm/soar_wram.arm.c:89:       switch (CurrentProc->sPlayerYaw) {
	beq	.L18		@,
	bgt	.L10		@,
	cmp	r2, #9	@ _33,
	beq	.L19		@,
	cmp	r2, #10	@ _33,
	moveq	r1, #96	@ prephitmp_139,
	bne	.L8		@,
.L11:
@ arm/soar_wram.arm.c:88:           80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	sub	r3, r3, #40448	@ _29, _28,
	sub	r3, r3, #64	@ _29, _29,
@ arm/soar_wram.arm.c:88:           80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	ldr	r0, [r4, #56]	@ CurrentProc_6(D)->sPlayerStepZ, CurrentProc_6(D)->sPlayerStepZ
@ arm/soar_wram.arm.c:88:           80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	lsr	r2, r3, #10	@ _30, _29,
@ arm/soar_wram.arm.c:88:           80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	rsb	r2, r2, #80	@ _97, _30,
@ arm/soar_wram.arm.c:99:         ObjInsertSafe(9, flarex, flarey, (void *)&gObj_aff32x32,
	ldr	r3, .L45+24	@ tmp231,
@ arm/soar_wram.arm.c:88:           80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	sub	r2, r2, r0, lsl #2	@ _32, _97, CurrentProc_6(D)->sPlayerStepZ,
@ arm/soar_wram.arm.c:99:         ObjInsertSafe(9, flarex, flarey, (void *)&gObj_aff32x32,
	lsl	r2, r2, #16	@, _32,
	str	r3, [sp]	@ tmp231,
	mov	r0, #9	@,
	ldr	r3, .L45+28	@,
	lsr	r2, r2, #16	@,,
	mov	lr, pc
	bx	r5		@ tmp299
.L8:
@ arm/soar_wram.arm.c:133:   int posY = CurrentProc->sFocusPtY;
	ldr	r6, [r4, #76]	@ posY, CurrentProc_6(D)->sFocusPtY
@ arm/soar_wram.arm.c:137:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	ldr	r3, .L45+32	@ tmp234,
@ arm/soar_wram.arm.c:137:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	sub	r2, r6, #1	@ _44, posY,
@ arm/soar_wram.arm.c:137:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	cmp	r2, r3	@ _44, tmp234
	bhi	.L15		@,
@ arm/soar_wram.arm.c:132:   int posX = CurrentProc->sFocusPtX;
	ldr	r2, [r4, #72]	@ posX, CurrentProc_6(D)->sFocusPtX
	mov	r7, r2	@ posX, posX
@ arm/soar_wram.arm.c:137:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	sub	r2, r2, #1	@ _46, posX,
	cmp	r2, r3	@ _46, tmp234
	bls	.L42		@,
.L15:
@ arm/soar_wram.arm.c:148:   CurrentProc->location = translatedLocations[loc];
	ldr	r3, .L45+36	@ tmp235,
	ldrb	r3, [r3]	@ zero_extendqisi2	@ translatedLocations[0], translatedLocations[0]
	str	r3, [r4, #80]	@ translatedLocations[0], CurrentProc_6(D)->location
.L14:
@ arm/soar_wram.arm.c:12:   if (thumb_loop(CurrentProc)) {
	mov	r0, r4	@, CurrentProc
	ldr	r3, .L45+40	@ tmp293,
	mov	lr, pc
	bx	r3		@ tmp293
@ arm/soar_wram.arm.c:12:   if (thumb_loop(CurrentProc)) {
	cmp	r0, #0	@ _1,
	bne	.L43		@,
@ arm/soar_wram.arm.c:17: };
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, lr}	@
	bx	lr	@
.L42:
@ arm/soar_wram.arm.c:139:     if (CurrentProc->ShowMap)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ *CurrentProc_6(D), *CurrentProc_6(D)
@ arm/soar_wram.arm.c:139:     if (CurrentProc->ShowMap)
	tst	r3, #1	@ *CurrentProc_6(D),
	bne	.L44		@,
.L16:
@ arm/soar_wram.arm.c:146:     loc = WorldMapNodes[posY][posX];
	ldr	r3, .L45+44	@ tmp263,
@ arm/soar_wram.arm.c:145:     posY = (posY - MAP_YOFS) >> 6;
	asr	r6, r6, #6	@ posY_59, posY,
@ arm/soar_wram.arm.c:146:     loc = WorldMapNodes[posY][posX];
	add	r3, r3, r6, lsl #4	@ tmp267, tmp263, posY_59,
	ldrb	r3, [r3, r7, asr #6]	@ zero_extendqisi2	@ loc, WorldMapNodes[posY_59][posX_58]
@ arm/soar_wram.arm.c:148:   CurrentProc->location = translatedLocations[loc];
	ldr	r2, .L45+36	@ tmp269,
	ldrb	r2, [r2, r3]	@ zero_extendqisi2	@ translatedLocations[_62], translatedLocations[_62]
@ arm/soar_wram.arm.c:149:   if (loc > 0) {
	cmp	r3, #0	@ loc,
@ arm/soar_wram.arm.c:148:   CurrentProc->location = translatedLocations[loc];
	str	r2, [r4, #80]	@ translatedLocations[_62], CurrentProc_6(D)->location
@ arm/soar_wram.arm.c:149:   if (loc > 0) {
	beq	.L14		@,
@ arm/soar_wram.arm.c:150:     ObjInsertSafe(8, 0x10, 0x10, (void *)&gObj_32x8,
	mov	r2, #16	@,
@ arm/soar_wram.arm.c:151:                   (OAM_ATTR2(LocationBaseTID + ((loc - 1) << 3), 2,
	sub	r3, r3, #1	@ tmp271, loc,
	lsl	r3, r3, #19	@ tmp274, tmp271,
	lsr	r6, r3, r2	@ _67, tmp274,
	add	r3, r6, #576	@ tmp276, _67,
@ arm/soar_wram.arm.c:150:     ObjInsertSafe(8, 0x10, 0x10, (void *)&gObj_32x8,
	orr	r3, r3, #59392	@ tmp280, tmp276,
	lsl	r3, r3, r2	@ tmp282, tmp280,
	lsr	r3, r3, r2	@ tmp281, tmp282,
	mov	r1, r2	@,
	str	r3, [sp]	@ tmp281,
	mov	r0, #8	@,
	ldr	r3, .L45+48	@,
	mov	lr, pc
	bx	r5		@ tmp299
@ arm/soar_wram.arm.c:153:     ObjInsertSafe(8, 0x30, 0x10, (void *)&gObj_32x8,
	mov	r2, #16	@,
@ arm/soar_wram.arm.c:154:                   (OAM_ATTR2(LocationBaseTID + ((loc - 1) << 3) + 4, 2,
	add	ip, r6, #580	@ tmp285, _67,
@ arm/soar_wram.arm.c:153:     ObjInsertSafe(8, 0x30, 0x10, (void *)&gObj_32x8,
	orr	ip, ip, #59392	@ tmp289, tmp285,
	lsl	ip, ip, r2	@ tmp291, tmp289,
	lsr	ip, ip, r2	@ tmp290, tmp291,
	mov	r1, #48	@,
	mov	r0, #8	@,
	ldr	r3, .L45+48	@,
	str	ip, [sp]	@ tmp290,
	mov	lr, pc
	bx	r5		@ tmp299
	b	.L14		@
.L43:
@ arm/soar_wram.arm.c:13:     iwram_Render_arm(CurrentProc);
	mov	r0, r4	@, CurrentProc
	ldr	r3, .L45+52	@ tmp294,
	mov	lr, pc
	bx	r3		@ tmp294
@ arm/soar_wram.arm.c:15:     FPS_COUNTER += 1;
	ldr	r2, .L45+56	@ tmp295,
	ldr	r3, [r2, #4088]	@ MEM[(int *)33816568B], MEM[(int *)33816568B]
	add	r3, r3, #1	@ _3, MEM[(int *)33816568B],
	str	r3, [r2, #4088]	@ _3, MEM[(int *)33816568B]
@ arm/soar_wram.arm.c:17: };
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, lr}	@
	bx	lr	@
.L39:
@ arm/soar_wram.arm.c:62:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	mov	ip, #51712	@ tmp178,
	ldr	r3, .L45+12	@,
	mov	r2, #88	@,
	mov	r1, #104	@,
	mov	r0, #8	@,
	ldr	r5, .L45+16	@ tmp299,
	str	ip, [sp]	@ tmp178,
	mov	lr, pc
	bx	r5		@ tmp299
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	tst	r3, #1	@ _15,
	beq	.L6		@,
.L40:
@ arm/soar_wram.arm.c:75:     ObjInsertSafe(8, 176, 0, (void *)&gObj_64x64,
	ldr	r3, .L45+60	@ tmp200,
	mov	r2, #0	@,
	str	r3, [sp]	@ tmp200,
	mov	r1, #176	@,
	ldr	r3, .L45+64	@,
	mov	r0, #8	@,
	mov	lr, pc
	bx	r5		@ tmp299
@ arm/soar_wram.arm.c:78:   if (CurrentProc->ShowFPS)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
@ arm/soar_wram.arm.c:78:   if (CurrentProc->ShowFPS)
	tst	r3, #2	@ _15,
	beq	.L7		@,
.L41:
@ arm/soar_wram.arm.c:79:     ObjInsertSafe(8, 0, 0, (void *)&gObj_8x8,
	mov	r2, #0	@,
@ arm/soar_wram.arm.c:80:                   (OAM_ATTR2(FPSBaseTID + FPS_CURRENT, 2, 0xC))); // fps counter
	ldr	r1, .L45+56	@ tmp206,
	ldr	r1, [r1, #4092]	@ MEM[(int *)33816572B], MEM[(int *)33816572B]
	add	r1, r1, #784	@ tmp209, MEM[(int *)33816572B],
@ arm/soar_wram.arm.c:79:     ObjInsertSafe(8, 0, 0, (void *)&gObj_8x8,
	orr	r1, r1, #51200	@ tmp213, tmp209,
	lsl	r1, r1, #16	@ tmp214, tmp213,
	lsr	r1, r1, #16	@ tmp214, tmp214,
	ldr	r3, .L45+68	@,
	str	r1, [sp]	@ tmp214,
	mov	r0, #8	@,
	mov	r1, r2	@,
	mov	lr, pc
	bx	r5		@ tmp299
@ arm/soar_wram.arm.c:84:     if (CurrentProc->disableFlare == 0) { // draw lens flare test
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
	b	.L7		@
.L18:
@ arm/soar_wram.arm.c:89:       switch (CurrentProc->sPlayerYaw) {
	mov	r1, #128	@ prephitmp_139,
	b	.L11		@
.L19:
	mov	r1, #64	@ prephitmp_139,
	b	.L11		@
.L44:
@ arm/soar_wram.arm.c:142:                     OAM_ATTR2(CursorBaseTID + CurrentProc->sPlayerYaw, 2,
	ldr	r3, [r4, #60]	@ CurrentProc_6(D)->sPlayerYaw, CurrentProc_6(D)->sPlayerYaw
	add	r3, r3, #704	@ tmp255, CurrentProc_6(D)->sPlayerYaw,
@ arm/soar_wram.arm.c:140:       ObjInsertSafe(8, (176 + (posX >> 4)), (posY - MAP_YOFS) >> 4,
	asr	r1, r7, #4	@ _49, posX,
@ arm/soar_wram.arm.c:140:       ObjInsertSafe(8, (176 + (posX >> 4)), (posY - MAP_YOFS) >> 4,
	orr	r3, r3, #55296	@ tmp259, tmp255,
@ arm/soar_wram.arm.c:140:       ObjInsertSafe(8, (176 + (posX >> 4)), (posY - MAP_YOFS) >> 4,
	asr	r2, r6, #4	@ _52, posY,
@ arm/soar_wram.arm.c:140:       ObjInsertSafe(8, (176 + (posX >> 4)), (posY - MAP_YOFS) >> 4,
	lsl	r3, r3, #16	@ tmp260, tmp259,
	add	r1, r1, #176	@ tmp250, _49,
	lsr	r3, r3, #16	@ tmp260, tmp260,
	lsl	r2, r2, #16	@, _52,
	lsl	r1, r1, #16	@, tmp250,
	str	r3, [sp]	@ tmp260,
	mov	r0, #8	@,
	ldr	r3, .L45+68	@,
	lsr	r2, r2, #16	@,,
	lsr	r1, r1, #16	@,,
	mov	lr, pc
	bx	r5		@ tmp299
	b	.L16		@
.L10:
@ arm/soar_wram.arm.c:89:       switch (CurrentProc->sPlayerYaw) {
	cmp	r2, #12	@ _33,
	moveq	r1, #160	@ prephitmp_139,
	beq	.L11		@,
	b	.L8		@
.L46:
	.align	2
.L45:
	.word	51728
	.word	51744
	.word	51760
	.word	gObj_32x32
	.word	ObjInsertSafe
	.word	50343936
	.word	15151
	.word	gObj_aff32x32
	.word	1022
	.word	translatedLocations
	.word	thumb_loop
	.word	WorldMapNodes
	.word	gObj_32x8
	.word	iwram_Render_arm
	.word	33812480
	.word	10959
	.word	gObj_64x64
	.word	gObj_8x8
	.size	NewWMLoop, .-NewWMLoop
	.ident	"GCC: (devkitARM release 66) 15.1.0"
