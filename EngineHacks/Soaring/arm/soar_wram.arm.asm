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
	push	{r4, r5, r6, r7, r8, r9, lr}	@
@ arm/soar_wram.arm.c:11:   if (thumb_loop(CurrentProc)) {
	ldr	r3, .L81	@ tmp219,
@ arm/soar_wram.arm.c:9: void NewWMLoop(SoarProc *CurrentProc) {
	sub	sp, sp, #12	@,,
@ arm/soar_wram.arm.c:9: void NewWMLoop(SoarProc *CurrentProc) {
	mov	r4, r0	@ CurrentProc, CurrentProc
@ arm/soar_wram.arm.c:11:   if (thumb_loop(CurrentProc)) {
	mov	lr, pc
	bx	r3		@ tmp219
@ arm/soar_wram.arm.c:11:   if (thumb_loop(CurrentProc)) {
	cmp	r0, #0	@ _1,
	bne	.L74		@,
@ arm/soar_wram.arm.c:17: };
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, lr}	@
	bx	lr	@
.L74:
@ arm/soar_wram.arm.c:59:   u8 animClock = *(u8 *)(0x3000014) & 0x3F;
	mov	r3, #50331648	@ tmp220,
	ldrb	r3, [r3, #20]	@ zero_extendqisi2	@ _11, MEM[(u8 *)50331668B]
@ arm/soar_wram.arm.c:61:   if (animClock < 0x10)
	tst	r3, #48	@ _11,
@ arm/soar_wram.arm.c:59:   u8 animClock = *(u8 *)(0x3000014) & 0x3F;
	mov	r5, r3	@ _11, _11
@ arm/soar_wram.arm.c:59:   u8 animClock = *(u8 *)(0x3000014) & 0x3F;
	and	r7, r3, #63	@ animClock, _11,
@ arm/soar_wram.arm.c:61:   if (animClock < 0x10)
	beq	.L75		@,
@ arm/soar_wram.arm.c:64:   else if (animClock < 0x20)
	tst	r3, #32	@ _11,
@ arm/soar_wram.arm.c:65:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	ldreq	r3, .L81+4	@ tmp232,
@ arm/soar_wram.arm.c:64:   else if (animClock < 0x20)
	beq	.L67		@,
@ arm/soar_wram.arm.c:67:   else if (animClock < 0x30)
	cmp	r7, #47	@ animClock,
@ arm/soar_wram.arm.c:68:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	ldrls	r3, .L81+8	@ tmp237,
@ arm/soar_wram.arm.c:71:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	ldrhi	r3, .L81+12	@ tmp240,
.L67:
	ldr	ip, .L81+16	@ tmp414,
	str	r3, [sp]	@ tmp240,
	mov	r2, #88	@,
	ldr	r3, .L81+20	@,
	mov	r1, #104	@,
	mov	r0, #8	@,
	mov	r6, ip	@ tmp414, tmp414
	mov	lr, pc
	bx	ip		@ tmp414
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	tst	r3, #1	@ _15,
	bne	.L76		@,
.L7:
@ arm/soar_wram.arm.c:78:   if (CurrentProc->ShowFPS)
	tst	r3, #2	@ _15,
	bne	.L77		@,
.L8:
@ arm/soar_wram.arm.c:82:   if (CurrentProc->disableFlare == 0) { // draw lens flare test
	tst	r3, #16	@ _15,
	bne	.L9		@,
@ arm/soar_wram.arm.c:87:     switch (CurrentProc->sPlayerYaw) {
	ldr	r2, [r4, #60]	@ _33, CurrentProc_6(D)->sPlayerYaw
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	ldr	r3, .L81+24	@ tmp266,
@ arm/soar_wram.arm.c:87:     switch (CurrentProc->sPlayerYaw) {
	cmp	r2, #11	@ _33,
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	ldr	r3, [r3, #208]	@ _28, MEM[(volatile vu32 *)50344144B]
@ arm/soar_wram.arm.c:87:     switch (CurrentProc->sPlayerYaw) {
	beq	.L27		@,
	bgt	.L11		@,
	cmp	r2, #9	@ _33,
	beq	.L28		@,
	cmp	r2, #10	@ _33,
	moveq	r1, #96	@ prephitmp_230,
	bne	.L9		@,
.L12:
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	sub	r3, r3, #40448	@ _29, _28,
	sub	r3, r3, #64	@ _29, _29,
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	ldr	r2, [r4, #56]	@ CurrentProc_6(D)->sPlayerStepZ, CurrentProc_6(D)->sPlayerStepZ
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	lsr	r3, r3, #10	@ _30, _29,
@ arm/soar_wram.arm.c:86:         80 - (CurrentProc->sPlayerStepZ << 2) - ((g_REG_BG2X - 0x9e40) >> 10);
	rsb	r3, r3, #80	@ _148, _30,
	sub	r2, r3, r2, lsl #2	@ _32, _148, CurrentProc_6(D)->sPlayerStepZ,
@ arm/soar_wram.arm.c:97:       ObjInsertSafe(9, flarex, flarey, (void *)&gObj_aff32x32,
	ldr	r3, .L81+28	@ tmp277,
	lsl	r2, r2, #16	@, _32,
	str	r3, [sp]	@ tmp277,
	mov	r0, #9	@,
	ldr	r3, .L81+32	@,
	lsr	r2, r2, #16	@,,
	mov	lr, pc
	bx	r6		@ tmp414
.L9:
@ arm/soar_wram.arm.c:104:   int posY = CurrentProc->sFocusPtY;
	ldr	r3, [r4, #76]	@ posY, CurrentProc_6(D)->sFocusPtY
@ arm/soar_wram.arm.c:108:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	sub	r2, r3, #1	@ _44, posY,
@ arm/soar_wram.arm.c:104:   int posY = CurrentProc->sFocusPtY;
	mov	r8, r3	@ posY, posY
@ arm/soar_wram.arm.c:108:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	ldr	r3, .L81+36	@ tmp280,
	cmp	r2, r3	@ _44, tmp280
	bhi	.L72		@,
@ arm/soar_wram.arm.c:103:   int posX = CurrentProc->sFocusPtX;
	ldr	r2, [r4, #72]	@ posX, CurrentProc_6(D)->sFocusPtX
	mov	r9, r2	@ posX, posX
@ arm/soar_wram.arm.c:108:   if ((posY > MAP_YOFS) && (posY < (MAP_DIMENSIONS - MAP_YOFS)) && (posX > 0) &&
	sub	r2, r2, #1	@ _46, posX,
	cmp	r2, r3	@ _46, tmp280
	bhi	.L72		@,
@ arm/soar_wram.arm.c:110:     if (CurrentProc->ShowMap)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ *CurrentProc_6(D), *CurrentProc_6(D)
@ arm/soar_wram.arm.c:110:     if (CurrentProc->ShowMap)
	tst	r3, #1	@ *CurrentProc_6(D),
	bne	.L78		@,
.L20:
@ arm/soar_wram.arm.c:118:     loc = WorldMapNodes[posY][posX];
	ldr	r2, .L81+40	@ tmp312,
@ arm/soar_wram.arm.c:117:     posY = (posY - MAP_YOFS) >> 6;
	asr	r3, r8, #6	@ posY_59, posY,
@ arm/soar_wram.arm.c:118:     loc = WorldMapNodes[posY][posX];
	add	r3, r2, r3, lsl #4	@ tmp316, tmp312, posY_59,
	ldrb	r3, [r3, r9, asr #6]	@ zero_extendqisi2	@ loc, WorldMapNodes[posY_59][posX_58]
	mov	r8, r3	@ loc, loc
@ arm/soar_wram.arm.c:120:   if (loc > 11)
	cmp	r3, #11	@ loc,
@ arm/soar_wram.arm.c:125:   if (CoinsEnabled && CurrentProc->coinZ) {
	ldr	r3, .L81+44	@ tmp318,
	ldr	r3, [r3]	@ pretmp_255, CoinsEnabled
@ arm/soar_wram.arm.c:120:   if (loc > 11)
	bhi	.L79		@,
@ arm/soar_wram.arm.c:125:   if (CoinsEnabled && CurrentProc->coinZ) {
	cmp	r3, #0	@ pretmp_255,
@ arm/soar_wram.arm.c:123:   CurrentProc->location = translatedLocations[loc];
	ldr	r3, .L81+48	@ tmp329,
	ldrb	r3, [r3, r8]	@ zero_extendqisi2	@ translatedLocations[_62], translatedLocations[_62]
	str	r3, [r4, #80]	@ translatedLocations[_62], CurrentProc_6(D)->location
@ arm/soar_wram.arm.c:125:   if (CoinsEnabled && CurrentProc->coinZ) {
	beq	.L23		@,
@ arm/soar_wram.arm.c:125:   if (CoinsEnabled && CurrentProc->coinZ) {
	ldrsh	r3, [r4, #92]	@ CurrentProc_6(D)->coinZ, CurrentProc_6(D)->coinZ
	cmp	r3, #0	@ CurrentProc_6(D)->coinZ,
	bne	.L19		@,
.L23:
@ arm/soar_wram.arm.c:194:   if (loc > 0) { // location name isn't drawing atm, and moving this above the
	cmp	r8, #0	@ loc,
	beq	.L17		@,
@ arm/soar_wram.arm.c:198:     ObjInsertSafe(8, 0x10, 0x10, (void *)&gObj_32x8,
	mov	r2, #16	@,
@ arm/soar_wram.arm.c:199:                   (OAM_ATTR2(LocationBaseTID + ((loc - 1) << 3), 2,
	sub	r3, r8, #1	@ tmp387, loc,
	lsl	r3, r3, #19	@ tmp390, tmp387,
	lsr	r5, r3, r2	@ _105, tmp390,
	add	r3, r5, #576	@ tmp392, _105,
@ arm/soar_wram.arm.c:198:     ObjInsertSafe(8, 0x10, 0x10, (void *)&gObj_32x8,
	orr	r3, r3, #59392	@ tmp396, tmp392,
	lsl	r3, r3, r2	@ tmp398, tmp396,
	lsr	r3, r3, r2	@ tmp397, tmp398,
	mov	r1, r2	@,
	mov	r0, #8	@,
	str	r3, [sp]	@ tmp397,
	ldr	r3, .L81+52	@,
	mov	lr, pc
	bx	r6		@ tmp414
@ arm/soar_wram.arm.c:201:     ObjInsertSafe(8, 0x30, 0x10, (void *)&gObj_32x8,
	mov	r2, #16	@,
@ arm/soar_wram.arm.c:202:                   (OAM_ATTR2(LocationBaseTID + ((loc - 1) << 3) + 4, 2,
	add	ip, r5, #580	@ tmp401, _105,
@ arm/soar_wram.arm.c:201:     ObjInsertSafe(8, 0x30, 0x10, (void *)&gObj_32x8,
	orr	ip, ip, #59392	@ tmp405, tmp401,
	lsl	ip, ip, r2	@ tmp407, tmp405,
	lsr	ip, ip, r2	@ tmp406, tmp407,
	mov	r1, #48	@,
	mov	r0, #8	@,
	ldr	r3, .L81+52	@,
	str	ip, [sp]	@ tmp406,
	mov	lr, pc
	bx	r6		@ tmp414
.L17:
@ arm/soar_wram.arm.c:13:     iwram_Render_arm(CurrentProc);
	mov	r0, r4	@, CurrentProc
	ldr	r3, .L81+56	@ tmp409,
	mov	lr, pc
	bx	r3		@ tmp409
@ arm/soar_wram.arm.c:15:     FPS_COUNTER += 1;
	ldr	r2, .L81+60	@ tmp410,
	ldr	r3, [r2, #4088]	@ MEM[(int *)33816568B], MEM[(int *)33816568B]
	add	r3, r3, #1	@ _3, MEM[(int *)33816568B],
	str	r3, [r2, #4088]	@ _3, MEM[(int *)33816568B]
@ arm/soar_wram.arm.c:17: };
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, lr}	@
	bx	lr	@
.L72:
@ arm/soar_wram.arm.c:123:   CurrentProc->location = translatedLocations[loc];
	ldr	r3, .L81+48	@ tmp283,
	ldrb	r3, [r3]	@ zero_extendqisi2	@ translatedLocations[0], translatedLocations[0]
	str	r3, [r4, #80]	@ translatedLocations[0], CurrentProc_6(D)->location
@ arm/soar_wram.arm.c:125:   if (CoinsEnabled && CurrentProc->coinZ) {
	ldr	r3, .L81+44	@ tmp285,
@ arm/soar_wram.arm.c:125:   if (CoinsEnabled && CurrentProc->coinZ) {
	ldr	r3, [r3]	@ CoinsEnabled, CoinsEnabled
	cmp	r3, #0	@ CoinsEnabled,
	beq	.L17		@,
.L69:
@ arm/soar_wram.arm.c:125:   if (CoinsEnabled && CurrentProc->coinZ) {
	ldrsh	r3, [r4, #92]	@ CurrentProc_6(D)->coinZ, CurrentProc_6(D)->coinZ
	cmp	r3, #0	@ CurrentProc_6(D)->coinZ,
@ arm/soar_wram.arm.c:121:     loc = 0;
	movne	r8, #0	@ loc,
@ arm/soar_wram.arm.c:125:   if (CoinsEnabled && CurrentProc->coinZ) {
	beq	.L17		@,
.L19:
@ arm/soar_wram.arm.c:126:     SoarProjectCoin(CurrentProc);
	ldr	r3, .L81+64	@ tmp332,
	mov	r0, r4	@, CurrentProc
	mov	lr, pc
	bx	r3		@ tmp332
@ arm/soar_wram.arm.c:128:     if (CurrentProc->ShowMap && ((animClock & 0x10) == 0))
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ *CurrentProc_6(D), *CurrentProc_6(D)
@ arm/soar_wram.arm.c:128:     if (CurrentProc->ShowMap && ((animClock & 0x10) == 0))
	tst	r3, #1	@ *CurrentProc_6(D),
	beq	.L24		@,
@ arm/soar_wram.arm.c:128:     if (CurrentProc->ShowMap && ((animClock & 0x10) == 0))
	tst	r5, #16	@ _11,
	bne	.L24		@,
@ arm/soar_wram.arm.c:129:       ObjInsertSafe(8,
	ldrsh	r1, [r4, #88]	@ CurrentProc_6(D)->coinX, CurrentProc_6(D)->coinX
@ arm/soar_wram.arm.c:131:                     (CurrentProc->coinY - MAP_YOFS) >> 4, (void *)&gObj_8x8,
	ldrsh	r2, [r4, #90]	@ _254, CurrentProc_6(D)->coinY
@ arm/soar_wram.arm.c:129:       ObjInsertSafe(8,
	asr	r1, r1, #4	@ tmp347, CurrentProc_6(D)->coinX,
	ldr	r3, .L81+68	@ tmp352,
@ arm/soar_wram.arm.c:131:                     (CurrentProc->coinY - MAP_YOFS) >> 4, (void *)&gObj_8x8,
	asr	r2, r2, #4	@ _76, _254,
@ arm/soar_wram.arm.c:129:       ObjInsertSafe(8,
	add	r1, r1, #169	@ tmp349, tmp347,
	lsl	r2, r2, #16	@, _76,
	lsl	r1, r1, #16	@, tmp349,
	str	r3, [sp]	@ tmp352,
	mov	r0, #8	@,
	ldr	r3, .L81+72	@,
	lsr	r2, r2, #16	@,,
	lsr	r1, r1, #16	@,,
	mov	lr, pc
	bx	r6		@ tmp414
.L24:
@ arm/soar_wram.arm.c:136:     int collectDy = CurrentProc->coinY - CurrentProc->sFocusPtY;
	ldr	r1, [r4, #76]	@ CurrentProc_6(D)->sFocusPtY, CurrentProc_6(D)->sFocusPtY
@ arm/soar_wram.arm.c:136:     int collectDy = CurrentProc->coinY - CurrentProc->sFocusPtY;
	ldrsh	r2, [r4, #90]	@ _83, CurrentProc_6(D)->coinY
@ arm/soar_wram.arm.c:136:     int collectDy = CurrentProc->coinY - CurrentProc->sFocusPtY;
	sub	r2, r2, r1	@ collectDy, _83, CurrentProc_6(D)->sFocusPtY
@ arm/soar_wram.arm.c:138:     if ((collectDx * collectDx + collectDy * collectDy) < (24 * 24)) {
	mul	r1, r2, r2	@ _87, collectDy, collectDy
	mov	r2, r1	@ _87, _87
@ arm/soar_wram.arm.c:135:     int collectDx = CurrentProc->coinX - CurrentProc->sFocusPtX;
	ldrsh	r3, [r4, #88]	@ _79, CurrentProc_6(D)->coinX
@ arm/soar_wram.arm.c:135:     int collectDx = CurrentProc->coinX - CurrentProc->sFocusPtX;
	ldr	r1, [r4, #72]	@ CurrentProc_6(D)->sFocusPtX, CurrentProc_6(D)->sFocusPtX
	sub	r3, r3, r1	@ collectDx, _79, CurrentProc_6(D)->sFocusPtX
@ arm/soar_wram.arm.c:138:     if ((collectDx * collectDx + collectDy * collectDy) < (24 * 24)) {
	mla	r1, r3, r3, r2	@ _88, collectDx, collectDx, _87
@ arm/soar_wram.arm.c:138:     if ((collectDx * collectDx + collectDy * collectDy) < (24 * 24)) {
	cmp	r1, #576	@ _88,
	blt	.L80		@,
@ arm/soar_wram.arm.c:141:       int screenX = *CoinScreenX;
	ldr	r3, .L81+76	@ tmp362,
	ldrsh	r1, [r3, #72]	@ _89, MEM[(s16 *)33681736B]
@ arm/soar_wram.arm.c:165:       if ((screenX >= 0) && (screenX <= 208) && (screenY >= 0) &&
	ldrh	r2, [r3, #74]	@ _143, MEM[(s16 *)33681738B]
	cmp	r1, #208	@ _89,
	cmpls	r2, #128	@, _143,
	bhi	.L23		@,
@ arm/soar_wram.arm.c:185:                       OAM_ATTR2(CoinBaseTID + ((animClock >> 3) << 4), 2, 0x4));
	lsr	r3, r7, #3	@ tmp378, animClock,
	lsl	r3, r3, #4	@ tmp379, tmp378,
	add	r3, r3, #832	@ tmp381, tmp379,
@ arm/soar_wram.arm.c:184:         ObjInsertSafe(9, screenX, screenY, (void *)&gObj_32x32,
	orr	r3, r3, #18432	@ tmp384, tmp381,
	lsl	r1, r1, #16	@, _89,
	str	r3, [sp]	@ tmp384,
	mov	r0, #9	@,
	ldr	r3, .L81+20	@,
	lsr	r1, r1, #16	@,,
	mov	lr, pc
	bx	r6		@ tmp414
	b	.L23		@
.L75:
@ arm/soar_wram.arm.c:62:     ObjInsertSafe(8, 0x68, 0x58, (void *)&gObj_32x32,
	mov	ip, #51712	@ tmp226,
	ldr	lr, .L81+16	@ tmp414,
	ldr	r3, .L81+20	@,
	str	ip, [sp]	@ tmp226,
	mov	r2, #88	@,
	mov	r1, #104	@,
	mov	r0, #8	@,
	mov	ip, lr	@ tmp414, tmp414
	mov	r6, lr	@ tmp414, tmp414
	mov	lr, pc
	bx	ip		@ tmp414
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
@ arm/soar_wram.arm.c:74:   if (CurrentProc->ShowMap)
	tst	r3, #1	@ _15,
	beq	.L7		@,
.L76:
@ arm/soar_wram.arm.c:75:     ObjInsertSafe(8, 176, 0, (void *)&gObj_64x64,
	ldr	r3, .L81+80	@ tmp246,
	mov	r2, #0	@,
	str	r3, [sp]	@ tmp246,
	mov	r1, #176	@,
	ldr	r3, .L81+84	@,
	mov	r0, #8	@,
	mov	lr, pc
	bx	r6		@ tmp414
@ arm/soar_wram.arm.c:78:   if (CurrentProc->ShowFPS)
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
@ arm/soar_wram.arm.c:78:   if (CurrentProc->ShowFPS)
	tst	r3, #2	@ _15,
	beq	.L8		@,
.L77:
@ arm/soar_wram.arm.c:79:     ObjInsertSafe(8, 0, 0, (void *)&gObj_8x8,
	mov	r2, #0	@,
@ arm/soar_wram.arm.c:80:                   (OAM_ATTR2(FPSBaseTID + FPS_CURRENT, 2, 0xC))); // fps counter
	ldr	r3, .L81+60	@ tmp252,
	ldr	r3, [r3, #4092]	@ MEM[(int *)33816572B], MEM[(int *)33816572B]
	add	r3, r3, #784	@ tmp255, MEM[(int *)33816572B],
@ arm/soar_wram.arm.c:79:     ObjInsertSafe(8, 0, 0, (void *)&gObj_8x8,
	orr	r3, r3, #51200	@ tmp259, tmp255,
	lsl	r3, r3, #16	@ tmp260, tmp259,
	lsr	r3, r3, #16	@ tmp260, tmp260,
	str	r3, [sp]	@ tmp260,
	mov	r0, #8	@,
	ldr	r3, .L81+72	@,
	mov	r1, r2	@,
	mov	lr, pc
	bx	r6		@ tmp414
@ arm/soar_wram.arm.c:82:   if (CurrentProc->disableFlare == 0) { // draw lens flare test
	ldrb	r3, [r4, #69]	@ zero_extendqisi2	@ _15, *CurrentProc_6(D)
	b	.L8		@
.L79:
@ arm/soar_wram.arm.c:125:   if (CoinsEnabled && CurrentProc->coinZ) {
	cmp	r3, #0	@ pretmp_255,
@ arm/soar_wram.arm.c:123:   CurrentProc->location = translatedLocations[loc];
	ldr	r3, .L81+48	@ tmp321,
	ldrb	r3, [r3]	@ zero_extendqisi2	@ translatedLocations[0], translatedLocations[0]
	str	r3, [r4, #80]	@ translatedLocations[0], CurrentProc_6(D)->location
@ arm/soar_wram.arm.c:125:   if (CoinsEnabled && CurrentProc->coinZ) {
	beq	.L17		@,
	b	.L69		@
.L28:
@ arm/soar_wram.arm.c:87:     switch (CurrentProc->sPlayerYaw) {
	mov	r1, #64	@ prephitmp_230,
	b	.L12		@
.L80:
@ arm/soar_wram.arm.c:139:       SoarCollectCoin(CurrentProc);
	mov	r0, r4	@, CurrentProc
	ldr	r3, .L81+88	@ tmp361,
	mov	lr, pc
	bx	r3		@ tmp361
	b	.L23		@
.L11:
@ arm/soar_wram.arm.c:87:     switch (CurrentProc->sPlayerYaw) {
	cmp	r2, #12	@ _33,
	moveq	r1, #160	@ prephitmp_230,
	beq	.L12		@,
	b	.L9		@
.L27:
	mov	r1, #128	@ prephitmp_230,
	b	.L12		@
.L78:
@ arm/soar_wram.arm.c:114:                     OAM_ATTR2(CursorBaseTID + CurrentProc->sPlayerYaw, 2,
	ldr	r3, [r4, #60]	@ CurrentProc_6(D)->sPlayerYaw, CurrentProc_6(D)->sPlayerYaw
	add	r3, r3, #704	@ tmp304, CurrentProc_6(D)->sPlayerYaw,
@ arm/soar_wram.arm.c:111:       ObjInsertSafe(8, 176 + (posX >> 4) + MINIMAP_CURSOR_X_OFFSET,
	asr	r1, r9, #4	@ _49, posX,
@ arm/soar_wram.arm.c:111:       ObjInsertSafe(8, 176 + (posX >> 4) + MINIMAP_CURSOR_X_OFFSET,
	orr	r3, r3, #55296	@ tmp308, tmp304,
@ arm/soar_wram.arm.c:112:                     ((posY - MAP_YOFS) >> 4) + MINIMAP_CURSOR_Y_OFFSET,
	asr	r2, r8, #4	@ _52, posY,
@ arm/soar_wram.arm.c:111:       ObjInsertSafe(8, 176 + (posX >> 4) + MINIMAP_CURSOR_X_OFFSET,
	lsl	r3, r3, #16	@ tmp309, tmp308,
	add	r1, r1, #169	@ tmp299, _49,
	lsr	r3, r3, #16	@ tmp309, tmp309,
	lsl	r1, r1, #16	@, tmp299,
	lsl	r2, r2, #16	@, _52,
	str	r3, [sp]	@ tmp309,
	mov	r0, #8	@,
	ldr	r3, .L81+72	@,
	lsr	r1, r1, #16	@,,
	lsr	r2, r2, #16	@,,
	mov	lr, pc
	bx	r6		@ tmp414
	b	.L20		@
.L82:
	.align	2
.L81:
	.word	thumb_loop
	.word	51728
	.word	51744
	.word	51760
	.word	ObjInsertSafe
	.word	gObj_32x32
	.word	50343936
	.word	15151
	.word	gObj_aff32x32
	.word	1022
	.word	WorldMapNodes
	.word	CoinsEnabled
	.word	translatedLocations
	.word	gObj_32x8
	.word	iwram_Render_arm
	.word	33812480
	.word	SoarProjectCoin
	.word	23488
	.word	gObj_8x8
	.word	33681664
	.word	10959
	.word	gObj_64x64
	.word	SoarCollectCoin
	.size	NewWMLoop, .-NewWMLoop
	.ident	"GCC: (devkitARM release 66) 15.1.0"
