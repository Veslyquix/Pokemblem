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
	mov	r3, #50331648	@ tmp235,
@ arm/soar_wram.arm.c:9: void NewWMLoop(SoarProc *CurrentProc) {
	push	{r4, r5, r6, r7, r8, r9, r10, lr}	@
@ arm/soar_wram.arm.c:59:   u8 animClock = *(u8 *)(0x3000014) & 0x3F;
	ldrb	r6, [r3, #20]	@ zero_extendqisi2	@ _11, MEM[(u8 *)50331668B]
@ arm/soar_wram.arm.c:61:   if (animClock < 0x10)
	tst	r6, #48	@ _11,
@ arm/soar_wram.arm.c:9: void NewWMLoop(SoarProc *CurrentProc) {
	mov	r4, r0	@ CurrentProc, CurrentProc
	sub	sp, sp, #8	@,,
@ arm/soar_wram.arm.c:59:   u8 animClock = *(u8 *)(0x3000014) & 0x3F;
	and	r10, r6, #63	@ animClock, _11,
@ arm/soar_wram.arm.c:61:   if (animClock < 0x10)
	beq	.L47		@,
@ arm/soar_wram.arm.c:64:   else if (animClock < 0x20)
	tst	r6, #32	@ _11,
@ arm/soar_wram.arm.c:65:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	ldreq	r3, .L55	@ tmp247,
@ arm/soar_wram.arm.c:64:   else if (animClock < 0x20)
	beq	.L44		@,
@ arm/soar_wram.arm.c:67:   else if (animClock < 0x30)
	cmp	r10, #47	@ animClock,
@ arm/soar_wram.arm.c:68:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	ldrls	r3, .L55+4	@ tmp252,
@ arm/soar_wram.arm.c:71:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	ldrhi	r3, .L55+8	@ tmp255,
.L44:
	str	r3, [sp]	@ tmp255,
	mov	r2, #88	@,
	ldr	r3, .L55+12	@,
	mov	r1, #104	@,
	mov	r0, #8	@,
	ldr	r5, .L55+16	@ tmp436,
	mov	lr, pc
	bx	r5		@ tmp436
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	tst	r3, #1	@ _15,
	bne	.L48		@,
.L6:
@ arm/soar_wram.arm.c:78:   if (CurrentProc->ShowFPS)
	tst	r3, #2	@ _15,
	bne	.L49		@,
.L7:
@ arm/soar_wram.arm.c:82:   if (CurrentProc->disableFlare == 0) { // draw lens flare test
	tst	r3, #16	@ _15,
	bne	.L8		@,
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	ldr	r3, .L55+20	@ tmp281,
	ldr	r2, [r3, #208]	@ _28, MEM[(volatile vu32 *)50344144B]
@ arm/soar_wram.arm.c:87:     switch (CurrentProc->sPlayerYaw) {
	ldr	r3, [r4, #60]	@ _33, CurrentProc_6(D)->sPlayerYaw
@ arm/soar_wram.arm.c:87:     switch (CurrentProc->sPlayerYaw) {
	cmp	r3, #11	@ _33,
	beq	.L22		@,
	bgt	.L10		@,
	cmp	r3, #9	@ _33,
	beq	.L23		@,
	cmp	r3, #10	@ _33,
	moveq	r1, #96	@ prephitmp_233,
	bne	.L8		@,
.L11:
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	sub	r2, r2, #40448	@ _29, _28,
	sub	r2, r2, #64	@ _29, _29,
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	ldr	r3, [r4, #56]	@ CurrentProc_6(D)->sPlayerStepZ, CurrentProc_6(D)->sPlayerStepZ
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	lsr	r2, r2, #10	@ _30, _29,
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	rsb	r2, r2, #80	@ _166, _30,
	sub	r2, r2, r3, lsl #2	@ _32, _166, CurrentProc_6(D)->sPlayerStepZ,
@ arm/soar_wram.arm.c:97:       ObjInsertSafe(9, flarex, flarey, (void *)&gObj_aff32x32,
	ldr	r3, .L55+24	@ tmp292,
	lsl	r2, r2, #16	@, _32,
	str	r3, [sp]	@ tmp292,
	mov	r0, #9	@,
	ldr	r3, .L55+28	@,
	lsr	r2, r2, #16	@,,
	mov	lr, pc
	bx	r5		@ tmp436
.L8:
@ arm/soar_wram.arm.c:102:   if (CurrentProc->coinZ) {
	ldrsh	r3, [r4, #92]	@ CurrentProc_6(D)->coinZ, CurrentProc_6(D)->coinZ
	cmp	r3, #0	@ CurrentProc_6(D)->coinZ,
	beq	.L45		@,
@ arm/soar_wram.arm.c:103:     if (CurrentProc->ShowMap && ((animClock & 0x10) == 0))
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ *CurrentProc_6(D), *CurrentProc_6(D)
@ arm/soar_wram.arm.c:103:     if (CurrentProc->ShowMap && ((animClock & 0x10) == 0))
	tst	r3, #1	@ *CurrentProc_6(D),
	beq	.L15		@,
@ arm/soar_wram.arm.c:103:     if (CurrentProc->ShowMap && ((animClock & 0x10) == 0))
	tst	r6, #16	@ _11,
	beq	.L50		@,
.L15:
@ arm/soar_wram.arm.c:110:     int collectDy = CurrentProc->coinY - CurrentProc->sFocusPtY;
	ldrsh	r1, [r4, #90]	@ _58, CurrentProc_6(D)->coinY
@ arm/soar_wram.arm.c:110:     int collectDy = CurrentProc->coinY - CurrentProc->sFocusPtY;
	ldr	r6, [r4, #76]	@ _59, CurrentProc_6(D)->sFocusPtY
@ arm/soar_wram.arm.c:110:     int collectDy = CurrentProc->coinY - CurrentProc->sFocusPtY;
	sub	r2, r1, r6	@ collectDy, _58, _59
@ arm/soar_wram.arm.c:112:     if ((collectDx * collectDx + collectDy * collectDy) < (24 * 24)) {
	mul	r0, r2, r2	@ _62, collectDy, collectDy
	mov	r2, r0	@ _62, _62
@ arm/soar_wram.arm.c:109:     int collectDx = CurrentProc->coinX - CurrentProc->sFocusPtX;
	ldrsh	ip, [r4, #88]	@ _54, CurrentProc_6(D)->coinX
@ arm/soar_wram.arm.c:109:     int collectDx = CurrentProc->coinX - CurrentProc->sFocusPtX;
	ldr	r7, [r4, #72]	@ _55, CurrentProc_6(D)->sFocusPtX
@ arm/soar_wram.arm.c:109:     int collectDx = CurrentProc->coinX - CurrentProc->sFocusPtX;
	sub	r3, ip, r7	@ collectDx, _54, _55
@ arm/soar_wram.arm.c:112:     if ((collectDx * collectDx + collectDy * collectDy) < (24 * 24)) {
	mla	r0, r3, r3, r2	@ _63, collectDx, collectDx, _62
@ arm/soar_wram.arm.c:112:     if ((collectDx * collectDx + collectDy * collectDy) < (24 * 24)) {
	cmp	r0, #576	@ _63,
	blt	.L51		@,
@ arm/soar_wram.arm.c:118:           ((dx * cam_dx_Angles[(CurrentProc->sPlayerYaw + 4) & 0xF]) +
	ldr	r0, [r4, #60]	@ _68, CurrentProc_6(D)->sPlayerYaw
@ arm/soar_wram.arm.c:116:       int dy = CurrentProc->coinY - CurrentProc->sPlayerPosY;
	ldr	r3, [r4, #48]	@ CurrentProc_6(D)->sPlayerPosY, CurrentProc_6(D)->sPlayerPosY
@ arm/soar_wram.arm.c:123:            (dy * cam_dy_Angles[CurrentProc->sPlayerYaw])) >>
	ldr	lr, .L55+32	@ tmp327,
@ arm/soar_wram.arm.c:122:           ((dx * cam_dx_Angles[CurrentProc->sPlayerYaw]) +
	lsl	r2, r0, #1	@ tmp323, _68,
@ arm/soar_wram.arm.c:116:       int dy = CurrentProc->coinY - CurrentProc->sPlayerPosY;
	sub	r1, r1, r3	@ dy, _58, CurrentProc_6(D)->sPlayerPosY
@ arm/soar_wram.arm.c:123:            (dy * cam_dy_Angles[CurrentProc->sPlayerYaw])) >>
	ldrsh	r3, [lr, r2]	@ _83, cam_dy_Angles[_68]
@ arm/soar_wram.arm.c:123:            (dy * cam_dy_Angles[CurrentProc->sPlayerYaw])) >>
	mul	r3, r1, r3	@ _84, dy, _84
@ arm/soar_wram.arm.c:122:           ((dx * cam_dx_Angles[CurrentProc->sPlayerYaw]) +
	ldr	r9, .L55+36	@ tmp448,
	ldrsh	r8, [r9, r2]	@ _80, cam_dx_Angles[_68]
@ arm/soar_wram.arm.c:115:       int dx = CurrentProc->coinX - CurrentProc->sPlayerPosX;
	ldr	r2, [r4, #44]	@ CurrentProc_6(D)->sPlayerPosX, CurrentProc_6(D)->sPlayerPosX
	sub	r2, ip, r2	@ dx, _54, CurrentProc_6(D)->sPlayerPosX
@ arm/soar_wram.arm.c:122:           ((dx * cam_dx_Angles[CurrentProc->sPlayerYaw]) +
	mla	r3, r2, r8, r3	@ _85, dx, _85, _84
@ arm/soar_wram.arm.c:121:       int forward =
	asr	ip, r3, #2	@ forward_86, _85,
@ arm/soar_wram.arm.c:126:       if ((forward > -32) && (forward < 192) && (right > -112) &&
	add	ip, ip, #31	@ _88, forward_86,
@ arm/soar_wram.arm.c:126:       if ((forward > -32) && (forward < 192) && (right > -112) &&
	cmp	ip, #222	@ _88,
	bhi	.L14		@,
@ arm/soar_wram.arm.c:118:           ((dx * cam_dx_Angles[(CurrentProc->sPlayerYaw + 4) & 0xF]) +
	add	r0, r0, #4	@ _69, _68,
@ arm/soar_wram.arm.c:118:           ((dx * cam_dx_Angles[(CurrentProc->sPlayerYaw + 4) & 0xF]) +
	and	r0, r0, #15	@ _70, _69,
@ arm/soar_wram.arm.c:118:           ((dx * cam_dx_Angles[(CurrentProc->sPlayerYaw + 4) & 0xF]) +
	lsl	r0, r0, #1	@ tmp336, _70,
@ arm/soar_wram.arm.c:119:            (dy * cam_dy_Angles[(CurrentProc->sPlayerYaw + 4) & 0xF])) >>
	ldrsh	lr, [lr, r0]	@ _75, cam_dy_Angles[_70]
@ arm/soar_wram.arm.c:119:            (dy * cam_dy_Angles[(CurrentProc->sPlayerYaw + 4) & 0xF])) >>
	mul	r1, lr, r1	@ _76, _75, _76
@ arm/soar_wram.arm.c:118:           ((dx * cam_dx_Angles[(CurrentProc->sPlayerYaw + 4) & 0xF]) +
	ldrsh	r0, [r9, r0]	@ _72, cam_dx_Angles[_70]
@ arm/soar_wram.arm.c:118:           ((dx * cam_dx_Angles[(CurrentProc->sPlayerYaw + 4) & 0xF]) +
	mla	r1, r2, r0, r1	@ _77, dx, _72, _77
@ arm/soar_wram.arm.c:117:       int right =
	asr	r2, r1, #2	@ right_78, _77,
@ arm/soar_wram.arm.c:126:       if ((forward > -32) && (forward < 192) && (right > -112) &&
	add	r2, r2, #111	@ _90, right_78,
	cmp	r2, #222	@ _90,
	bhi	.L14		@,
@ arm/soar_wram.arm.c:129:         int screenY = 82 - (forward >> 2) - (CurrentProc->sPlayerStepZ << 1);
	asr	r2, r3, #4	@ _93, _85,
@ arm/soar_wram.arm.c:132:                       OAM_ATTR2(CoinBaseTID + ((animClock >> 3) << 4), 2,
	lsr	r3, r10, #3	@ tmp361, animClock,
	lsl	r3, r3, #4	@ tmp362, tmp361,
	add	r3, r3, #832	@ tmp364, tmp362,
@ arm/soar_wram.arm.c:131:         ObjInsertSafe(9, screenX, screenY, (void *)&gObj_32x32,
	orr	r3, r3, #18432	@ tmp367, tmp364,
	str	r3, [sp]	@ tmp367,
@ arm/soar_wram.arm.c:129:         int screenY = 82 - (forward >> 2) - (CurrentProc->sPlayerStepZ << 1);
	ldr	r0, [r4, #56]	@ CurrentProc_6(D)->sPlayerStepZ, CurrentProc_6(D)->sPlayerStepZ
@ arm/soar_wram.arm.c:129:         int screenY = 82 - (forward >> 2) - (CurrentProc->sPlayerStepZ << 1);
	rsb	r2, r2, #82	@ _94, _93,
@ arm/soar_wram.arm.c:128:         int screenX = 104 + (right >> 1);
	asr	r1, r1, #3	@ _91, _77,
@ arm/soar_wram.arm.c:129:         int screenY = 82 - (forward >> 2) - (CurrentProc->sPlayerStepZ << 1);
	sub	r2, r2, r0, lsl #1	@ screenY_97, _94, CurrentProc_6(D)->sPlayerStepZ,
@ arm/soar_wram.arm.c:128:         int screenX = 104 + (right >> 1);
	add	r1, r1, #104	@ screenX_92, _91,
@ arm/soar_wram.arm.c:131:         ObjInsertSafe(9, screenX, screenY, (void *)&gObj_32x32,
	lsl	r1, r1, #16	@, screenX_92,
	lsl	r2, r2, #16	@, screenY_97,
	mov	r0, #9	@,
	ldr	r3, .L55+12	@,
	lsr	r1, r1, #16	@,,
	lsr	r2, r2, #16	@,,
	mov	lr, pc
	bx	r5		@ tmp436
.L45:
@ arm/soar_wram.arm.c:139:   int posX = CurrentProc->sFocusPtX;
	ldr	r7, [r4, #72]	@ _55, CurrentProc_6(D)->sFocusPtX
@ arm/soar_wram.arm.c:140:   int posY = CurrentProc->sFocusPtY;
	ldr	r6, [r4, #76]	@ _59, CurrentProc_6(D)->sFocusPtY
.L14:
@ arm/soar_wram.arm.c:144:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	ldr	r3, .L55+40	@ tmp371,
@ arm/soar_wram.arm.c:144:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	sub	r2, r6, #1	@ _108, _59,
@ arm/soar_wram.arm.c:144:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	cmp	r2, r3	@ _108, tmp371
	bhi	.L19		@,
@ arm/soar_wram.arm.c:144:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	sub	r2, r7, #1	@ _110, _55,
	cmp	r2, r3	@ _110, tmp371
	bls	.L52		@,
.L19:
@ arm/soar_wram.arm.c:155:   CurrentProc->location = translatedLocations[loc];
	ldr	r3, .L55+44	@ tmp372,
	ldrb	r3, [r3]	@ zero_extendqisi2	@ translatedLocations[0], translatedLocations[0]
	str	r3, [r4, #80]	@ translatedLocations[0], CurrentProc_6(D)->location
.L18:
@ arm/soar_wram.arm.c:12:   if (thumb_loop(CurrentProc)) {
	mov	r0, r4	@, CurrentProc
	ldr	r3, .L55+48	@ tmp430,
	mov	lr, pc
	bx	r3		@ tmp430
@ arm/soar_wram.arm.c:12:   if (thumb_loop(CurrentProc)) {
	cmp	r0, #0	@ _1,
	bne	.L53		@,
@ arm/soar_wram.arm.c:17: };
	add	sp, sp, #8	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}	@
	bx	lr	@
.L52:
@ arm/soar_wram.arm.c:146:     if (CurrentProc->ShowMap)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ *CurrentProc_6(D), *CurrentProc_6(D)
@ arm/soar_wram.arm.c:146:     if (CurrentProc->ShowMap)
	tst	r3, #1	@ *CurrentProc_6(D),
	bne	.L54		@,
.L20:
@ arm/soar_wram.arm.c:153:     loc = WorldMapNodes[posY][posX];
	ldr	r3, .L55+52	@ tmp400,
@ arm/soar_wram.arm.c:152:     posY = (posY - MAP_YOFS) >> 6;
	asr	r6, r6, #6	@ posY_123, _59,
@ arm/soar_wram.arm.c:153:     loc = WorldMapNodes[posY][posX];
	add	r3, r3, r6, lsl #4	@ tmp404, tmp400, posY_123,
	ldrb	r3, [r3, r7, asr #6]	@ zero_extendqisi2	@ loc, WorldMapNodes[posY_123][posX_122]
@ arm/soar_wram.arm.c:155:   CurrentProc->location = translatedLocations[loc];
	ldr	r2, .L55+44	@ tmp406,
	ldrb	r2, [r2, r3]	@ zero_extendqisi2	@ translatedLocations[_126], translatedLocations[_126]
@ arm/soar_wram.arm.c:156:   if (loc > 0) {
	cmp	r3, #0	@ loc,
@ arm/soar_wram.arm.c:155:   CurrentProc->location = translatedLocations[loc];
	str	r2, [r4, #80]	@ translatedLocations[_126], CurrentProc_6(D)->location
@ arm/soar_wram.arm.c:156:   if (loc > 0) {
	beq	.L18		@,
@ arm/soar_wram.arm.c:157:     ObjInsertSafe(8, 0x10, 0x10, (void *)&gObj_32x8,
	mov	r2, #16	@,
@ arm/soar_wram.arm.c:158:                   (OAM_ATTR2(LocationBaseTID + ((loc - 1) << 3), 2,
	sub	r3, r3, #1	@ tmp408, loc,
	lsl	r3, r3, #19	@ tmp411, tmp408,
	lsr	r6, r3, r2	@ _131, tmp411,
	add	r3, r6, #576	@ tmp413, _131,
@ arm/soar_wram.arm.c:157:     ObjInsertSafe(8, 0x10, 0x10, (void *)&gObj_32x8,
	orr	r3, r3, #59392	@ tmp417, tmp413,
	lsl	r3, r3, r2	@ tmp419, tmp417,
	lsr	r3, r3, r2	@ tmp418, tmp419,
	mov	r1, r2	@,
	str	r3, [sp]	@ tmp418,
	mov	r0, #8	@,
	ldr	r3, .L55+56	@,
	mov	lr, pc
	bx	r5		@ tmp436
@ arm/soar_wram.arm.c:160:     ObjInsertSafe(8, 0x30, 0x10, (void *)&gObj_32x8,
	mov	r2, #16	@,
@ arm/soar_wram.arm.c:161:                   (OAM_ATTR2(LocationBaseTID + ((loc - 1) << 3) + 4, 2,
	add	ip, r6, #580	@ tmp422, _131,
@ arm/soar_wram.arm.c:160:     ObjInsertSafe(8, 0x30, 0x10, (void *)&gObj_32x8,
	orr	ip, ip, #59392	@ tmp426, tmp422,
	lsl	ip, ip, r2	@ tmp428, tmp426,
	lsr	ip, ip, r2	@ tmp427, tmp428,
	mov	r1, #48	@,
	mov	r0, #8	@,
	ldr	r3, .L55+56	@,
	str	ip, [sp]	@ tmp427,
	mov	lr, pc
	bx	r5		@ tmp436
	b	.L18		@
.L47:
@ arm/soar_wram.arm.c:62:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	mov	ip, #51712	@ tmp241,
	ldr	r3, .L55+12	@,
	mov	r2, #88	@,
	mov	r1, #104	@,
	mov	r0, #8	@,
	ldr	r5, .L55+16	@ tmp436,
	str	ip, [sp]	@ tmp241,
	mov	lr, pc
	bx	r5		@ tmp436
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	tst	r3, #1	@ _15,
	beq	.L6		@,
.L48:
@ arm/soar_wram.arm.c:75:     ObjInsertSafe(8, 176, 0, (void *)&gObj_64x64,
	ldr	r3, .L55+60	@ tmp261,
	mov	r2, #0	@,
	str	r3, [sp]	@ tmp261,
	mov	r1, #176	@,
	ldr	r3, .L55+64	@,
	mov	r0, #8	@,
	mov	lr, pc
	bx	r5		@ tmp436
@ arm/soar_wram.arm.c:78:   if (CurrentProc->ShowFPS)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
@ arm/soar_wram.arm.c:78:   if (CurrentProc->ShowFPS)
	tst	r3, #2	@ _15,
	beq	.L7		@,
.L49:
@ arm/soar_wram.arm.c:79:     ObjInsertSafe(8, 0, 0, (void *)&gObj_8x8,
	mov	r2, #0	@,
@ arm/soar_wram.arm.c:80:                   (OAM_ATTR2(FPSBaseTID + FPS_CURRENT, 2, 0xC))); // fps counter
	ldr	r3, .L55+68	@ tmp267,
	ldr	r3, [r3, #4092]	@ MEM[(int *)33816572B], MEM[(int *)33816572B]
	add	r3, r3, #784	@ tmp270, MEM[(int *)33816572B],
@ arm/soar_wram.arm.c:79:     ObjInsertSafe(8, 0, 0, (void *)&gObj_8x8,
	orr	r3, r3, #51200	@ tmp274, tmp270,
	lsl	r3, r3, #16	@ tmp275, tmp274,
	lsr	r3, r3, #16	@ tmp275, tmp275,
	str	r3, [sp]	@ tmp275,
	mov	r0, #8	@,
	ldr	r3, .L55+72	@,
	mov	r1, r2	@,
	mov	lr, pc
	bx	r5		@ tmp436
@ arm/soar_wram.arm.c:82:   if (CurrentProc->disableFlare == 0) { // draw lens flare test
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
	b	.L7		@
.L53:
@ arm/soar_wram.arm.c:13:     iwram_Render_arm(CurrentProc);
	mov	r0, r4	@, CurrentProc
	ldr	r3, .L55+76	@ tmp431,
	mov	lr, pc
	bx	r3		@ tmp431
@ arm/soar_wram.arm.c:15:     FPS_COUNTER += 1;
	ldr	r2, .L55+68	@ tmp432,
	ldr	r3, [r2, #4088]	@ MEM[(int *)33816568B], MEM[(int *)33816568B]
	add	r3, r3, #1	@ _3, MEM[(int *)33816568B],
	str	r3, [r2, #4088]	@ _3, MEM[(int *)33816568B]
@ arm/soar_wram.arm.c:17: };
	add	sp, sp, #8	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}	@
	bx	lr	@
.L51:
@ arm/soar_wram.arm.c:113:       SoarCollectCoin(CurrentProc);
	mov	r0, r4	@, CurrentProc
	ldr	r3, .L55+80	@ tmp319,
	mov	lr, pc
	bx	r3		@ tmp319
@ arm/soar_wram.arm.c:139:   int posX = CurrentProc->sFocusPtX;
	ldr	r7, [r4, #72]	@ _55, CurrentProc_6(D)->sFocusPtX
@ arm/soar_wram.arm.c:140:   int posY = CurrentProc->sFocusPtY;
	ldr	r6, [r4, #76]	@ _59, CurrentProc_6(D)->sFocusPtY
	b	.L14		@
.L23:
@ arm/soar_wram.arm.c:87:     switch (CurrentProc->sPlayerYaw) {
	mov	r1, #64	@ prephitmp_233,
	b	.L11		@
.L22:
	mov	r1, #128	@ prephitmp_233,
	b	.L11		@
.L50:
@ arm/soar_wram.arm.c:104:       ObjInsertSafe(8, 176 + (CurrentProc->coinX >> 4),
	ldrsh	r1, [r4, #88]	@ CurrentProc_6(D)->coinX, CurrentProc_6(D)->coinX
@ arm/soar_wram.arm.c:105:                     (CurrentProc->coinY - MAP_YOFS) >> 4, (void *)&gObj_8x8,
	ldrsh	r2, [r4, #90]	@ _311, CurrentProc_6(D)->coinY
@ arm/soar_wram.arm.c:104:       ObjInsertSafe(8, 176 + (CurrentProc->coinX >> 4),
	asr	r1, r1, #4	@ tmp309, CurrentProc_6(D)->coinX,
	ldr	r3, .L55+84	@ tmp314,
@ arm/soar_wram.arm.c:105:                     (CurrentProc->coinY - MAP_YOFS) >> 4, (void *)&gObj_8x8,
	asr	r2, r2, #4	@ _51, _311,
@ arm/soar_wram.arm.c:104:       ObjInsertSafe(8, 176 + (CurrentProc->coinX >> 4),
	add	r1, r1, #176	@ tmp311, tmp309,
	lsl	r2, r2, #16	@, _51,
	lsl	r1, r1, #16	@, tmp311,
	str	r3, [sp]	@ tmp314,
	mov	r0, #8	@,
	ldr	r3, .L55+72	@,
	lsr	r2, r2, #16	@,,
	lsr	r1, r1, #16	@,,
	mov	lr, pc
	bx	r5		@ tmp436
	b	.L15		@
.L54:
@ arm/soar_wram.arm.c:149:                     OAM_ATTR2(CursorBaseTID + CurrentProc->sPlayerYaw, 2,
	ldr	r3, [r4, #60]	@ CurrentProc_6(D)->sPlayerYaw, CurrentProc_6(D)->sPlayerYaw
	add	r3, r3, #704	@ tmp392, CurrentProc_6(D)->sPlayerYaw,
@ arm/soar_wram.arm.c:147:       ObjInsertSafe(8, (176 + (posX >> 4)), (posY - MAP_YOFS) >> 4,
	asr	r1, r7, #4	@ _113, _55,
@ arm/soar_wram.arm.c:147:       ObjInsertSafe(8, (176 + (posX >> 4)), (posY - MAP_YOFS) >> 4,
	orr	r3, r3, #55296	@ tmp396, tmp392,
@ arm/soar_wram.arm.c:147:       ObjInsertSafe(8, (176 + (posX >> 4)), (posY - MAP_YOFS) >> 4,
	asr	r2, r6, #4	@ _116, _59,
@ arm/soar_wram.arm.c:147:       ObjInsertSafe(8, (176 + (posX >> 4)), (posY - MAP_YOFS) >> 4,
	lsl	r3, r3, #16	@ tmp397, tmp396,
	add	r1, r1, #176	@ tmp387, _113,
	lsr	r3, r3, #16	@ tmp397, tmp397,
	lsl	r2, r2, #16	@, _116,
	lsl	r1, r1, #16	@, tmp387,
	str	r3, [sp]	@ tmp397,
	mov	r0, #8	@,
	ldr	r3, .L55+72	@,
	lsr	r2, r2, #16	@,,
	lsr	r1, r1, #16	@,,
	mov	lr, pc
	bx	r5		@ tmp436
	b	.L20		@
.L10:
@ arm/soar_wram.arm.c:87:     switch (CurrentProc->sPlayerYaw) {
	cmp	r3, #12	@ _33,
	moveq	r1, #160	@ prephitmp_233,
	beq	.L11		@,
	b	.L8		@
.L56:
	.align	2
.L55:
	.word	51728
	.word	51744
	.word	51760
	.word	gObj_32x32
	.word	ObjInsertSafe
	.word	50343936
	.word	15151
	.word	gObj_aff32x32
	.word	cam_dy_Angles
	.word	cam_dx_Angles
	.word	1022
	.word	translatedLocations
	.word	thumb_loop
	.word	WorldMapNodes
	.word	gObj_32x8
	.word	10959
	.word	gObj_64x64
	.word	33812480
	.word	gObj_8x8
	.word	iwram_Render_arm
	.word	SoarCollectCoin
	.word	23488
	.size	NewWMLoop, .-NewWMLoop
	.ident	"GCC: (devkitARM release 66) 15.1.0"
