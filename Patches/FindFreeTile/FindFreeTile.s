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
	.file	"FindFreeTile.c"
@ GNU C23 (devkitARM release 66) version 15.1.0 (arm-none-eabi)
@	compiled by GNU C version 13.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -Os
	.text
	.align	1
	.global	FindFreeTile
	.syntax unified
	.code	16
	.thumb_func
	.type	FindFreeTile, %function
FindFreeTile:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
@ FindFreeTile.c:41:     int activeDeployID = gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos];
	ldr	r3, .L26	@ tmp224,
@ FindFreeTile.c:39: {
	sub	sp, sp, #20	@,,
@ FindFreeTile.c:39: {
	str	r2, [sp, #8]	@ yOut, %sfp
@ FindFreeTile.c:41:     int activeDeployID = gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos];
	ldr	r2, [r3]	@ gActiveUnit.9_2, gActiveUnit
	movs	r3, #17	@ _4,
@ FindFreeTile.c:39: {
	str	r1, [sp, #4]	@ xOut, %sfp
@ FindFreeTile.c:41:     int activeDeployID = gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos];
	ldr	r1, .L26+4	@ tmp227,
@ FindFreeTile.c:41:     int activeDeployID = gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos];
	ldrsb	r3, [r2, r3]	@ _4,* _4
@ FindFreeTile.c:41:     int activeDeployID = gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos];
	ldr	r1, [r1]	@ gMapUnit, gMapUnit
@ FindFreeTile.c:41:     int activeDeployID = gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos];
	ldrb	r2, [r2, #16]	@ _9,
@ FindFreeTile.c:41:     int activeDeployID = gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos];
	lsls	r3, r3, #2	@ tmp228, _4,
@ FindFreeTile.c:41:     int activeDeployID = gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos];
	ldr	r3, [r3, r1]	@ *_6, *_6
@ FindFreeTile.c:41:     int activeDeployID = gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos];
	lsls	r2, r2, #24	@ _9, _9,
	asrs	r2, r2, #24	@ _9, _9,
@ FindFreeTile.c:41:     int activeDeployID = gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos];
	ldrb	r1, [r3, r2]	@ _11, *_10
	str	r1, [sp, #12]	@ _11, %sfp
@ FindFreeTile.c:45:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0xFF;
	movs	r1, #255	@ tmp231,
	strb	r1, [r3, r2]	@ tmp231, *_10
@ FindFreeTile.c:49:     FillMovementMapForUnitAndMovement(unit, 15); // fill with flier movement & own movement
	ldr	r3, .L26+8	@ tmp233,
	subs	r1, r1, #240	@,
@ FindFreeTile.c:39: {
	movs	r5, r0	@ unit, unit
@ FindFreeTile.c:49:     FillMovementMapForUnitAndMovement(unit, 15); // fill with flier movement & own movement
	bl	.L28		@
@ FindFreeTile.c:51:     for (iy = gMapSize.y - 1; iy >= 0; --iy)
	ldr	r3, .L26+12	@ tmp234,
	ldrh	r6, [r3, #2]	@ _14,
@ FindFreeTile.c:40:     int iy, ix, minDistance = 9999;
	ldr	r3, .L26+16	@ minDistance,
	str	r3, [sp]	@ minDistance, %sfp
@ FindFreeTile.c:51:     for (iy = gMapSize.y - 1; iy >= 0; --iy)
	subs	r6, r6, #1	@ iy,
.L2:
@ FindFreeTile.c:51:     for (iy = gMapSize.y - 1; iy >= 0; --iy)
	adds	r3, r6, #1	@ tmp329, iy,
	bne	.L8		@,
@ FindFreeTile.c:83:     if (*xOut == (-1))
	ldr	r3, [sp, #4]	@ xOut, %sfp
	ldr	r3, [r3]	@ *xOut_124(D), *xOut_124(D)
	adds	r3, r3, #1	@ tmp330, *xOut_124(D),
	beq	.L9		@,
.L19:
@ FindFreeTile.c:124:     if (gActiveUnit)
	ldr	r3, .L26	@ tmp270,
	ldr	r2, [r3]	@ gActiveUnit.39_90, gActiveUnit
@ FindFreeTile.c:124:     if (gActiveUnit)
	cmp	r2, #0	@ gActiveUnit.39_90,
	beq	.LCB46	@
	b	.L10	@long jump	@
.LCB46:
.L1:
@ FindFreeTile.c:129: }
	add	sp, sp, #20	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8:
@ FindFreeTile.c:53:         for (ix = gMapSize.x - 1; ix >= 0; --ix)
	ldr	r3, .L26+12	@ tmp236,
	ldrh	r4, [r3]	@ _16, gMapSize
	lsls	r7, r6, #2	@ _157, iy,
@ FindFreeTile.c:53:         for (ix = gMapSize.x - 1; ix >= 0; --ix)
	subs	r4, r4, #1	@ ix,
.L3:
@ FindFreeTile.c:53:         for (ix = gMapSize.x - 1; ix >= 0; --ix)
	adds	r3, r4, #1	@ tmp328, ix,
	bne	.L7		@,
@ FindFreeTile.c:51:     for (iy = gMapSize.y - 1; iy >= 0; --iy)
	adds	r6, r6, r4	@ iy, iy,
	b	.L2		@
.L7:
@ FindFreeTile.c:57:             if (gMapMovement[iy][ix] >
	ldr	r3, .L26+20	@ tmp239,
	ldr	r3, [r3]	@ gMapMovement, gMapMovement
@ FindFreeTile.c:57:             if (gMapMovement[iy][ix] >
	ldr	r3, [r3, r7]	@ *_20, *_20
@ FindFreeTile.c:57:             if (gMapMovement[iy][ix] >
	ldrb	r3, [r3, r4]	@ *_23, *_23
	cmp	r3, #14	@ *_23,
	bhi	.L6		@,
@ FindFreeTile.c:61:             if (gMapUnit[iy][ix] != 0)
	ldr	r3, .L26+4	@ tmp245,
	ldr	r3, [r3]	@ gMapUnit, gMapUnit
@ FindFreeTile.c:61:             if (gMapUnit[iy][ix] != 0)
	ldr	r3, [r3, r7]	@ *_26, *_26
@ FindFreeTile.c:61:             if (gMapUnit[iy][ix] != 0)
	ldrb	r3, [r3, r4]	@ *_28, *_28
	cmp	r3, #0	@ *_28,
	bne	.L6		@,
@ FindFreeTile.c:64:             if (gMapHidden[iy][ix] & HIDDEN_BIT_UNIT)
	movs	r2, #1	@ tmp339,
@ FindFreeTile.c:64:             if (gMapHidden[iy][ix] & HIDDEN_BIT_UNIT)
	ldr	r3, .L26+24	@ tmp249,
	ldr	r3, [r3]	@ gMapHidden, gMapHidden
@ FindFreeTile.c:64:             if (gMapHidden[iy][ix] & HIDDEN_BIT_UNIT)
	ldr	r3, [r3, r7]	@ *_31, *_31
@ FindFreeTile.c:64:             if (gMapHidden[iy][ix] & HIDDEN_BIT_UNIT)
	ldrb	r3, [r3, r4]	@, *_33
	tst	r2, r3	@ tmp339, *_33
	bne	.L6		@,
@ FindFreeTile.c:68:                     unit, gMapTerrain[iy][ix])) // movement costs that are 0x80 or higher won't be accepted
	ldr	r3, .L26+28	@ tmp259,
	ldr	r3, [r3]	@ gMapTerrain, gMapTerrain
@ FindFreeTile.c:67:             if (!CanUnitCrossTerrain(
	ldr	r3, [r3, r7]	@ *_36, *_36
	movs	r0, r5	@, unit
	ldrb	r1, [r3, r4]	@ *_38, *_38
	ldr	r3, .L26+32	@ tmp262,
	bl	.L28		@
@ FindFreeTile.c:67:             if (!CanUnitCrossTerrain(
	cmp	r0, #0	@ _40,
	beq	.L6		@,
@ FindFreeTile.c:71:             distance = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);
	movs	r3, #16	@ _42,
	ldrsb	r3, [r5, r3]	@ _42,* _42
	subs	r3, r4, r3	@ _43, ix, _42
	asrs	r1, r3, #31	@ tmp326, _43,
	adds	r2, r3, r1	@ _44, _43, tmp326
	movs	r3, #17	@ _46,
	ldrsb	r3, [r5, r3]	@ _46,* _46
	subs	r3, r6, r3	@ _47, iy, _46
	eors	r2, r1	@ _44, tmp326
	asrs	r1, r3, #31	@ tmp327, _47,
	adds	r3, r3, r1	@ _48, _47, tmp327
	eors	r3, r1	@ _48, tmp327
@ FindFreeTile.c:71:             distance = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);
	adds	r3, r2, r3	@ distance, _44, _48
@ FindFreeTile.c:73:             if (minDistance >= distance)
	ldr	r2, [sp]	@ minDistance, %sfp
	cmp	r2, r3	@ minDistance, distance
	blt	.L6		@,
@ FindFreeTile.c:77:                 *xOut = ix;
	ldr	r2, [sp, #4]	@ xOut, %sfp
	str	r4, [r2]	@ ix, *xOut_124(D)
@ FindFreeTile.c:78:                 *yOut = iy;
	ldr	r2, [sp, #8]	@ yOut, %sfp
@ FindFreeTile.c:75:                 minDistance = distance;
	str	r3, [sp]	@ distance, %sfp
@ FindFreeTile.c:78:                 *yOut = iy;
	str	r6, [r2]	@ iy, *yOut_133(D)
.L6:
@ FindFreeTile.c:53:         for (ix = gMapSize.x - 1; ix >= 0; --ix)
	subs	r4, r4, #1	@ ix,
	b	.L3		@
.L9:
@ FindFreeTile.c:88:         MapMovementFillMovementFromPosition(
	movs	r1, #17	@ _53,
	movs	r0, #16	@ _51,
	ldr	r3, .L26+36	@ tmp274,
	ldr	r2, .L26+40	@ tmp271,
	ldrsb	r1, [r5, r1]	@ _53,* _53
	ldrsb	r0, [r5, r0]	@ _51,* _51
	bl	.L28		@
@ FindFreeTile.c:92:         for (iy = gMapSize.y - 1; iy >= 0; --iy)
	ldr	r3, .L26+12	@ tmp275,
	ldrh	r6, [r3, #2]	@ _55,
@ FindFreeTile.c:92:         for (iy = gMapSize.y - 1; iy >= 0; --iy)
	subs	r6, r6, #1	@ iy,
.L12:
@ FindFreeTile.c:92:         for (iy = gMapSize.y - 1; iy >= 0; --iy)
	adds	r3, r6, #1	@ tmp334, iy,
	beq	.L19		@,
@ FindFreeTile.c:94:             for (ix = gMapSize.x - 1; ix >= 0; --ix)
	ldr	r3, .L26+12	@ tmp277,
	ldrh	r4, [r3]	@ _57, gMapSize
	lsls	r7, r6, #2	@ _154, iy,
@ FindFreeTile.c:94:             for (ix = gMapSize.x - 1; ix >= 0; --ix)
	subs	r4, r4, #1	@ ix,
.L13:
@ FindFreeTile.c:94:             for (ix = gMapSize.x - 1; ix >= 0; --ix)
	adds	r3, r4, #1	@ tmp333, ix,
	bne	.L17		@,
@ FindFreeTile.c:92:         for (iy = gMapSize.y - 1; iy >= 0; --iy)
	adds	r6, r6, r4	@ iy, iy,
	b	.L12		@
.L17:
@ FindFreeTile.c:98:                 if (gMapMovement[iy][ix] > 14) // I think high movement costs might cause an overflow issue here? So I'm
	ldr	r3, .L26+20	@ tmp280,
	ldr	r3, [r3]	@ gMapMovement, gMapMovement
@ FindFreeTile.c:98:                 if (gMapMovement[iy][ix] > 14) // I think high movement costs might cause an overflow issue here? So I'm
	ldr	r3, [r3, r7]	@ *_61, *_61
@ FindFreeTile.c:98:                 if (gMapMovement[iy][ix] > 14) // I think high movement costs might cause an overflow issue here? So I'm
	ldrb	r3, [r3, r4]	@ *_64, *_64
	cmp	r3, #14	@ *_64,
	bhi	.L16		@,
@ FindFreeTile.c:102:                 if (gMapUnit[iy][ix] != 0)
	ldr	r3, .L26+4	@ tmp286,
	ldr	r3, [r3]	@ gMapUnit, gMapUnit
@ FindFreeTile.c:102:                 if (gMapUnit[iy][ix] != 0)
	ldr	r3, [r3, r7]	@ *_67, *_67
@ FindFreeTile.c:102:                 if (gMapUnit[iy][ix] != 0)
	ldrb	r3, [r3, r4]	@ *_69, *_69
	cmp	r3, #0	@ *_69,
	bne	.L16		@,
@ FindFreeTile.c:105:                 if (gMapHidden[iy][ix] & HIDDEN_BIT_UNIT)
	movs	r2, #1	@ tmp344,
@ FindFreeTile.c:105:                 if (gMapHidden[iy][ix] & HIDDEN_BIT_UNIT)
	ldr	r3, .L26+24	@ tmp290,
	ldr	r3, [r3]	@ gMapHidden, gMapHidden
@ FindFreeTile.c:105:                 if (gMapHidden[iy][ix] & HIDDEN_BIT_UNIT)
	ldr	r3, [r3, r7]	@ *_72, *_72
@ FindFreeTile.c:105:                 if (gMapHidden[iy][ix] & HIDDEN_BIT_UNIT)
	ldrb	r3, [r3, r4]	@, *_74
	tst	r2, r3	@ tmp344, *_74
	bne	.L16		@,
@ FindFreeTile.c:108:                 if (!CanUnitCrossTerrain(unit, gMapTerrain[iy][ix]))
	ldr	r3, .L26+28	@ tmp300,
	ldr	r3, [r3]	@ gMapTerrain, gMapTerrain
@ FindFreeTile.c:108:                 if (!CanUnitCrossTerrain(unit, gMapTerrain[iy][ix]))
	ldr	r3, [r3, r7]	@ *_77, *_77
	movs	r0, r5	@, unit
	ldrb	r1, [r3, r4]	@ *_79, *_79
	ldr	r3, .L26+32	@ tmp303,
	bl	.L28		@
@ FindFreeTile.c:108:                 if (!CanUnitCrossTerrain(unit, gMapTerrain[iy][ix]))
	cmp	r0, #0	@ _81,
	beq	.L16		@,
@ FindFreeTile.c:111:                 distance = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);
	movs	r3, #16	@ _83,
	ldrsb	r3, [r5, r3]	@ _83,* _83
	subs	r3, r4, r3	@ _84, ix, _83
	asrs	r1, r3, #31	@ tmp331, _84,
	adds	r2, r3, r1	@ _85, _84, tmp331
	movs	r3, #17	@ _87,
	ldrsb	r3, [r5, r3]	@ _87,* _87
	subs	r3, r6, r3	@ _88, iy, _87
	eors	r2, r1	@ _85, tmp331
	asrs	r1, r3, #31	@ tmp332, _88,
	adds	r3, r3, r1	@ _89, _88, tmp332
	eors	r3, r1	@ _89, tmp332
@ FindFreeTile.c:111:                 distance = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);
	adds	r3, r2, r3	@ distance, _85, _89
@ FindFreeTile.c:113:                 if (minDistance >= distance)
	ldr	r2, [sp]	@ minDistance, %sfp
	cmp	r2, r3	@ minDistance, distance
	blt	.L16		@,
@ FindFreeTile.c:117:                     *xOut = ix;
	ldr	r2, [sp, #4]	@ xOut, %sfp
	str	r4, [r2]	@ ix, *xOut_124(D)
@ FindFreeTile.c:118:                     *yOut = iy;
	ldr	r2, [sp, #8]	@ yOut, %sfp
@ FindFreeTile.c:115:                     minDistance = distance;
	str	r3, [sp]	@ distance, %sfp
@ FindFreeTile.c:118:                     *yOut = iy;
	str	r6, [r2]	@ iy, *yOut_133(D)
.L16:
@ FindFreeTile.c:94:             for (ix = gMapSize.x - 1; ix >= 0; --ix)
	subs	r4, r4, #1	@ ix,
	b	.L13		@
.L10:
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	movs	r3, #17	@ _93,
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	ldr	r1, .L26+4	@ tmp312,
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	ldrsb	r3, [r2, r3]	@ _93,* _93
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	ldr	r1, [r1]	@ gMapUnit, gMapUnit
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	ldrb	r2, [r2, #16]	@ _98,
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	lsls	r3, r3, #2	@ tmp313, _93,
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	ldr	r3, [r3, r1]	@ *_95, *_95
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	lsls	r2, r2, #24	@ _98, _98,
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	ldr	r1, [sp, #12]	@ _11, %sfp
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	asrs	r2, r2, #24	@ _98, _98,
@ FindFreeTile.c:127:         gMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = activeDeployID;
	strb	r1, [r3, r2]	@ _11, *_99
@ FindFreeTile.c:129: }
	b	.L1		@
.L27:
	.align	2
.L26:
	.word	gActiveUnit
	.word	gMapUnit
	.word	FillMovementMapForUnitAndMovement
	.word	gMapSize
	.word	9999
	.word	gMapMovement
	.word	gMapHidden
	.word	gMapTerrain
	.word	CanUnitCrossTerrain
	.word	MapMovementFillMovementFromPosition
	.word	GenericMovCost
	.size	FindFreeTile, .-FindFreeTile
	.align	1
	.global	ASMC_FindFreeTile
	.syntax unified
	.code	16
	.thumb_func
	.type	ASMC_FindFreeTile, %function
ASMC_FindFreeTile:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}	@
@ FindFreeTile.c:14:     int unitID = gEventSlot[1];
	ldr	r6, .L35	@ tmp139,
@ FindFreeTile.c:15:     struct Unit * unit = GetUnitStructFromEventParameter(unitID);
	ldr	r3, .L35+4	@ tmp140,
	ldr	r0, [r6, #4]	@, gEventSlot[1]
	bl	.L28		@
	movs	r5, r0	@ unit,
@ FindFreeTile.c:13:     int result = false; // default
	subs	r4, r0, #0	@ result, unit,
@ FindFreeTile.c:16:     if (UNIT_IS_VALID(unit))
	beq	.L30		@,
@ FindFreeTile.c:13:     int result = false; // default
	movs	r4, #0	@ result,
@ FindFreeTile.c:16:     if (UNIT_IS_VALID(unit))
	ldr	r3, [r0]	@ unit_29->pCharacterData, unit_29->pCharacterData
	cmp	r3, r4	@ unit_29->pCharacterData,
	beq	.L30		@,
@ FindFreeTile.c:18:         result = unit->yPos << 16 | unit->xPos;
	movs	r4, #17	@ _4,
@ FindFreeTile.c:18:         result = unit->yPos << 16 | unit->xPos;
	movs	r3, #16	@ _7,
@ FindFreeTile.c:18:         result = unit->yPos << 16 | unit->xPos;
	ldrsb	r4, [r0, r4]	@ _4,* _4
@ FindFreeTile.c:18:         result = unit->yPos << 16 | unit->xPos;
	ldrsb	r3, [r0, r3]	@ _7,* _7
@ FindFreeTile.c:18:         result = unit->yPos << 16 | unit->xPos;
	lsls	r4, r4, #16	@ _5, _4,
@ FindFreeTile.c:18:         result = unit->yPos << 16 | unit->xPos;
	orrs	r4, r3	@ result, _7
@ FindFreeTile.c:20:         xOut = gEventSlot[0xB] & 0xFFFF;
	ldr	r3, [r6, #44]	@ _8, gEventSlot[11]
	lsls	r2, r3, #16	@ _25, _8,
	lsrs	r2, r2, #16	@ _25, _25,
@ FindFreeTile.c:22:         yOut = (gEventSlot[0xB] & 0xFFFF0000) >> 16;
	lsrs	r3, r3, #16	@ _10, _8,
@ FindFreeTile.c:25:         FindFreeTile(unit, &xOut, &yOut);
	mov	r1, sp	@,
@ FindFreeTile.c:20:         xOut = gEventSlot[0xB] & 0xFFFF;
	str	r2, [sp]	@ _25, xOut
@ FindFreeTile.c:23:         unit->xPos = xOut;
	strb	r2, [r0, #16]	@ _25, unit_29->xPos
@ FindFreeTile.c:24:         unit->yPos = yOut;
	strb	r3, [r0, #17]	@ _10, unit_29->yPos
@ FindFreeTile.c:25:         FindFreeTile(unit, &xOut, &yOut);
	add	r2, sp, #4	@,,
@ FindFreeTile.c:22:         yOut = (gEventSlot[0xB] & 0xFFFF0000) >> 16;
	str	r3, [sp, #4]	@ _10, yOut
@ FindFreeTile.c:25:         FindFreeTile(unit, &xOut, &yOut);
	bl	FindFreeTile		@
@ FindFreeTile.c:29:         if ((xOut != 9999) && (yOut != 9999))
	ldr	r2, [sp]	@ xOut.3_18, xOut
@ FindFreeTile.c:29:         if ((xOut != 9999) && (yOut != 9999))
	ldr	r1, .L35+8	@ tmp154,
@ FindFreeTile.c:27:         unit->yPos = (result & 0xFFFF0000) >> 16;
	lsrs	r3, r4, #16	@ _16, result,
@ FindFreeTile.c:26:         unit->xPos = result & 0xFFFF;
	strb	r4, [r5, #16]	@ result, unit_29->xPos
@ FindFreeTile.c:27:         unit->yPos = (result & 0xFFFF0000) >> 16;
	strb	r3, [r5, #17]	@ _16, unit_29->yPos
@ FindFreeTile.c:29:         if ((xOut != 9999) && (yOut != 9999))
	cmp	r2, r1	@ xOut.3_18, tmp154
	beq	.L30		@,
@ FindFreeTile.c:29:         if ((xOut != 9999) && (yOut != 9999))
	ldr	r3, [sp, #4]	@ yOut.4_19, yOut
@ FindFreeTile.c:29:         if ((xOut != 9999) && (yOut != 9999))
	cmp	r3, r1	@ yOut.4_19, tmp154
	beq	.L30		@,
@ FindFreeTile.c:31:             result = (yOut << 16) | xOut;
	lsls	r4, r3, #16	@ _20, yOut.4_19,
@ FindFreeTile.c:31:             result = (yOut << 16) | xOut;
	orrs	r4, r2	@ result, xOut.3_18
.L30:
@ FindFreeTile.c:34:     gEventSlot[0xC] = result; // if no unit, return 0 as coord
	str	r4, [r6, #48]	@ result, gEventSlot[12]
@ FindFreeTile.c:36: }
	@ sp needed	@
@ FindFreeTile.c:35:     ClearMenuCommandOverride();
	ldr	r3, .L35+12	@ tmp158,
	bl	.L28		@
@ FindFreeTile.c:36: }
	pop	{r0, r1, r4, r5, r6}
	pop	{r0}
	bx	r0
.L36:
	.align	2
.L35:
	.word	gEventSlot
	.word	GetUnitStructFromEventParameter
	.word	9999
	.word	ClearMenuCommandOverride
	.size	ASMC_FindFreeTile, .-ASMC_FindFreeTile
	.ident	"GCC: (devkitARM release 66) 15.1.0"
	.code 16
	.align	1
.L28:
	bx	r3
