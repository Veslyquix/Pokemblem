	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 23, 1	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 1	@ Tag_ABI_enum_size
	.eabi_attribute 30, 4	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"soar_voxel.c"
@ GNU C23 (devkitARM release 66) version 15.1.0 (arm-none-eabi)
@	compiled by GNU C version 13.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -march=armv4t -Os -fomit-frame-pointer -ffast-math -fno-jump-tables
	.text
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.type	getPtHeight_thumb, %function
getPtHeight_thumb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ src/soar_voxel.c:582:   if ((ptx >= MAP_DIMENSIONS) || (pty >= MAP_DIMENSIONS) || (ptx < 0) ||
	movs	r2, #128	@ tmp123,
@ src/soar_voxel.c:581: static inline int getPtHeight_thumb(int ptx, int pty) {
	push	{r4, lr}	@
@ src/soar_voxel.c:582:   if ((ptx >= MAP_DIMENSIONS) || (pty >= MAP_DIMENSIONS) || (ptx < 0) ||
	movs	r4, r0	@ _13, ptx
@ src/soar_voxel.c:584:     return 0;
	movs	r3, #0	@ <retval>,
@ src/soar_voxel.c:582:   if ((ptx >= MAP_DIMENSIONS) || (pty >= MAP_DIMENSIONS) || (ptx < 0) ||
	orrs	r4, r1	@ _13, pty
	lsls	r2, r2, #3	@ tmp123, tmp123,
	cmp	r4, r2	@ _13, tmp123
	bcs	.L1		@,
@ src/soar_voxel.c:585:   return heightMap[(pty << MAP_DIMENSIONS_LOG2) + ptx];
	ldr	r3, .L4	@ tmp124,
@ src/soar_voxel.c:585:   return heightMap[(pty << MAP_DIMENSIONS_LOG2) + ptx];
	lsls	r1, r1, #10	@ _1, pty,
@ src/soar_voxel.c:585:   return heightMap[(pty << MAP_DIMENSIONS_LOG2) + ptx];
	adds	r3, r3, r0	@ tmp126, tmp124, ptx
	ldrb	r3, [r3, r1]	@ <retval>, heightMap
.L1:
@ src/soar_voxel.c:586: };
	@ sp needed	@
	movs	r0, r3	@, <retval>
	pop	{r4}
	pop	{r1}
	bx	r1
.L5:
	.align	2
.L4:
	.word	heightMap
	.size	getPtHeight_thumb, .-getPtHeight_thumb
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.type	SoaringLandRoutine, %function
SoaringLandRoutine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ src/soar_voxel.c:136:   u8 index = CurrentProc->location - 1;
	ldr	r3, [r0, #80]	@ CurrentProc_15(D)->location, CurrentProc_15(D)->location
@ src/soar_voxel.c:135: static void SoaringLandRoutine(SoarProc *CurrentProc) {
	push	{r4, lr}	@
@ src/soar_voxel.c:136:   u8 index = CurrentProc->location - 1;
	subs	r3, r3, #1	@ tmp131,
@ src/soar_voxel.c:140:       FlyLocationTable[index * 4 + 1],
	lsls	r3, r3, #24	@ _3, tmp131,
@ src/soar_voxel.c:140:       FlyLocationTable[index * 4 + 1],
	ldr	r2, .L7	@ tmp134,
@ src/soar_voxel.c:157: }
	@ sp needed	@
@ src/soar_voxel.c:140:       FlyLocationTable[index * 4 + 1],
	lsrs	r3, r3, #24	@ _3, _3,
	lsls	r3, r3, #2	@ _4, _3,
@ src/soar_voxel.c:152:   memcpy((void *)0x202B670, &eventList,
	ldr	r0, .L7+4	@ tmp139,
@ src/soar_voxel.c:140:       FlyLocationTable[index * 4 + 1],
	adds	r1, r2, r3	@ tmp135, tmp134, _4
@ src/soar_voxel.c:146:       FlyLocationTable[index * 4],
	ldrb	r2, [r2, r3]	@ _13, FlyLocationTable
@ src/soar_voxel.c:152:   memcpy((void *)0x202B670, &eventList,
	ldr	r3, .L7+8	@ tmp140,
@ src/soar_voxel.c:140:       FlyLocationTable[index * 4 + 1],
	ldrb	r4, [r1, #1]	@ _7, FlyLocationTable
@ src/soar_voxel.c:142:       FlyLocationTable[index * 4 + 2],
	ldrb	r1, [r1, #2]	@ _10, FlyLocationTable
@ src/soar_voxel.c:152:   memcpy((void *)0x202B670, &eventList,
	str	r3, [r0]	@ tmp140, MEM <int> [(char * {ref-all})33732208B]
	ldr	r3, .L7+12	@ tmp142,
	str	r3, [r0, #4]	@ tmp142, MEM <int> [(char * {ref-all})33732208B + 4B]
	str	r3, [r0, #28]	@ tmp142, MEM <int> [(char * {ref-all})33732208B + 28B]
	ldr	r3, .L7+16	@ tmp155,
	str	r1, [r0, #16]	@ _10, MEM <int> [(char * {ref-all})33732208B + 16B]
	str	r3, [r0, #36]	@ tmp155, MEM <int> [(char * {ref-all})33732208B + 36B]
	movs	r1, #164	@ tmp148,
	ldr	r3, .L7+20	@ tmp157,
	str	r3, [r0, #40]	@ tmp157, MEM <int> [(char * {ref-all})33732208B + 40B]
	movs	r3, #144	@ tmp159,
	lsls	r1, r1, #4	@ tmp148, tmp148,
	str	r4, [r0, #8]	@ _7, MEM <int> [(char * {ref-all})33732208B + 8B]
	str	r1, [r0, #20]	@ tmp148, MEM <int> [(char * {ref-all})33732208B + 20B]
	ldr	r4, .L7+24	@ tmp145,
	ldr	r1, .L7+28	@ tmp150,
	lsls	r3, r3, #1	@ tmp159, tmp159,
	str	r1, [r0, #24]	@ tmp150, MEM <int> [(char * {ref-all})33732208B + 24B]
	str	r3, [r0, #44]	@ tmp159, MEM <int> [(char * {ref-all})33732208B + 44B]
@ src/soar_voxel.c:156:   CallMapEventEngine((void *)(0x202B670), 1);
	movs	r1, #1	@,
@ src/soar_voxel.c:152:   memcpy((void *)0x202B670, &eventList,
	str	r4, [r0, #12]	@ tmp145, MEM <int> [(char * {ref-all})33732208B + 12B]
	str	r2, [r0, #32]	@ _13, MEM <int> [(char * {ref-all})33732208B + 32B]
@ src/soar_voxel.c:156:   CallMapEventEngine((void *)(0x202B670), 1);
	ldr	r3, .L7+32	@ tmp161,
	bl	.L9		@
@ src/soar_voxel.c:157: }
	pop	{r4}
	pop	{r0}
	bx	r0
.L8:
	.align	2
.L7:
	.word	FlyLocationTable
	.word	33732208
	.word	3938081
	.word	132416
	.word	-185822
	.word	459304
	.word	329024
	.word	FlyDestinationEvent
	.word	CallMapEventEngine
	.size	SoaringLandRoutine, .-SoaringLandRoutine
	.align	1
	.global	SoarVBlankInterrupt
	.syntax unified
	.code	16
	.thumb_func
	.type	SoarVBlankInterrupt, %function
SoarVBlankInterrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ src/soar_voxel.c:103:   *(u16 *)(0x3007ff8) = 1;
	movs	r2, #1	@ tmp130,
	ldr	r3, .L21	@ tmp129,
@ src/soar_voxel.c:102: void SoarVBlankInterrupt() {
	push	{r4, lr}	@
@ src/soar_voxel.c:103:   *(u16 *)(0x3007ff8) = 1;
	strh	r2, [r3]	@ tmp130, MEM[(u16 *)50364408B]
@ src/soar_voxel.c:104:   IncrementGameClock();
	bl	IncrementGameClock		@
@ src/soar_voxel.c:105:   m4aSoundVSync();
	bl	m4aSoundVSync		@
@ src/soar_voxel.c:106:   SyncLoOAM();
	ldr	r3, .L21+4	@ tmp132,
	bl	.L9		@
@ src/soar_voxel.c:107:   if (gGameState.boolMainLoopEnded) {
	ldr	r3, .L21+8	@ tmp133,
@ src/soar_voxel.c:107:   if (gGameState.boolMainLoopEnded) {
	ldrb	r2, [r3]	@ gGameState, gGameState
	cmp	r2, #0	@ gGameState,
	beq	.L11		@,
@ src/soar_voxel.c:108:     gGameState.boolMainLoopEnded = 0;
	movs	r2, #0	@ tmp136,
	strb	r2, [r3]	@ tmp136, gGameState.boolMainLoopEnded
@ src/soar_voxel.c:109:     ExecProc((Proc *)*(int *)(0x2026A70));
	ldr	r3, .L21+12	@ tmp138,
@ src/soar_voxel.c:109:     ExecProc((Proc *)*(int *)(0x2026A70));
	ldr	r0, [r3]	@, MEM[(int *)33712752B]
	ldr	r3, .L21+16	@ tmp139,
	bl	.L9		@
@ src/soar_voxel.c:110:     SyncLCDControl();
	ldr	r3, .L21+20	@ tmp140,
	bl	.L9		@
@ src/soar_voxel.c:111:     SyncBgAndPals();
	ldr	r3, .L21+24	@ tmp141,
	bl	.L9		@
@ src/soar_voxel.c:112:     SyncRegisteredTiles();
	ldr	r3, .L21+28	@ tmp142,
	bl	.L9		@
@ src/soar_voxel.c:113:     SyncHiOAM();
	ldr	r3, .L21+32	@ tmp143,
	bl	.L9		@
.L11:
@ src/soar_voxel.c:115:   m4aSoundMain();
	bl	m4aSoundMain		@
@ src/soar_voxel.c:117:   int animClock = *(u8 *)(0x3000014) & 0x3F;
	ldr	r3, .L21+36	@ tmp144,
	ldrb	r2, [r3]	@, MEM[(u8 *)50331668B]
	movs	r3, #63	@ tmp148,
	ands	r3, r2	@ _15, MEM[(u8 *)50331668B]
@ src/soar_voxel.c:118:   if ((animClock < 0x10) | (animClock > 0x30))
	movs	r1, r3	@ _6, _15
	subs	r1, r1, #16	@ _6,
	ldr	r2, .L21+40	@ tmp173,
@ src/soar_voxel.c:118:   if ((animClock < 0x10) | (animClock > 0x30))
	cmp	r1, #32	@ _6,
	bls	.L12		@,
@ src/soar_voxel.c:119:     g_REG_BG2X -= 0x30; // the same as eirika's map sprite?
	ldr	r1, [r2]	@ _7, MEM[(volatile vu32 *)50344144B]
@ src/soar_voxel.c:119:     g_REG_BG2X -= 0x30; // the same as eirika's map sprite?
	subs	r1, r1, #48	@ _8,
	str	r1, [r2]	@ _8, MEM[(volatile vu32 *)50344144B]
@ src/soar_voxel.c:127:   if (animClock == 0) // resets once per 63 frames so close enough
	cmp	r3, #0	@ _15,
	beq	.L13		@,
.L10:
@ src/soar_voxel.c:133: };
	@ sp needed	@
	pop	{r4}
	pop	{r0}
	bx	r0
.L12:
@ src/soar_voxel.c:120:   else if (g_REG_BG2X < 0x9fd0)
	ldr	r0, [r2]	@ _9, MEM[(volatile vu32 *)50344144B]
@ src/soar_voxel.c:120:   else if (g_REG_BG2X < 0x9fd0)
	ldr	r1, .L21+44	@ tmp154,
	cmp	r0, r1	@ _9, tmp154
	bhi	.L15		@,
@ src/soar_voxel.c:121:     g_REG_BG2X += 0x30;
	ldr	r1, [r2]	@ _10, MEM[(volatile vu32 *)50344144B]
@ src/soar_voxel.c:121:     g_REG_BG2X += 0x30;
	adds	r1, r1, #48	@ _11,
	str	r1, [r2]	@ _11, MEM[(volatile vu32 *)50344144B]
.L15:
@ src/soar_voxel.c:123:   if ((animClock == 0x20) && (gChapterData.muteSfxOption == 0))
	cmp	r3, #32	@ _15,
	bne	.L10		@,
@ src/soar_voxel.c:123:   if ((animClock == 0x20) && (gChapterData.muteSfxOption == 0))
	ldr	r3, .L21+48	@ tmp160,
	ldrb	r3, [r3]	@, gChapterData
@ src/soar_voxel.c:123:   if ((animClock == 0x20) && (gChapterData.muteSfxOption == 0))
	lsls	r3, r3, #30	@ tmp174, gChapterData,
	bmi	.L10		@,
@ src/soar_voxel.c:124:     m4aSongNumStart(0xa6);
	movs	r0, #166	@,
	ldr	r3, .L21+52	@ tmp168,
	bl	.L9		@
	b	.L10		@
.L13:
@ src/soar_voxel.c:129:     FPS_CURRENT = FPS_COUNTER;
	ldr	r2, .L21+56	@ tmp169,
@ src/soar_voxel.c:129:     FPS_CURRENT = FPS_COUNTER;
	ldr	r1, .L21+60	@ tmp170,
@ src/soar_voxel.c:129:     FPS_CURRENT = FPS_COUNTER;
	ldr	r0, [r2]	@ _14, MEM[(int *)33816568B]
@ src/soar_voxel.c:129:     FPS_CURRENT = FPS_COUNTER;
	str	r0, [r1]	@ _14, MEM[(int *)33816572B]
@ src/soar_voxel.c:130:     FPS_COUNTER = 0;
	str	r3, [r2]	@ _15, MEM[(int *)33816568B]
@ src/soar_voxel.c:133: };
	b	.L10		@
.L22:
	.align	2
.L21:
	.word	50364408
	.word	SyncLoOAM
	.word	gGameState
	.word	33712752
	.word	ExecProc
	.word	SyncLCDControl
	.word	SyncBgAndPals
	.word	SyncRegisteredTiles
	.word	SyncHiOAM
	.word	50331668
	.word	50344144
	.word	40911
	.word	gChapterData+65
	.word	m4aSongNumStart
	.word	33816568
	.word	33816572
	.size	SoarVBlankInterrupt, .-SoarVBlankInterrupt
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.type	BumpScreen.part.0, %function
BumpScreen.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ src/soar_voxel.c:572:     g_REG_BG2PA = 0x00;   // rotate and stretch
	movs	r3, #0	@ tmp115,
@ src/soar_voxel.c:579: };
	@ sp needed	@
@ src/soar_voxel.c:573:     g_REG_BG2PB = 0xFF0C; // a bit bigger than the screen (-0xF4?)
	movs	r1, #244	@ tmp118,
@ src/soar_voxel.c:572:     g_REG_BG2PA = 0x00;   // rotate and stretch
	ldr	r2, .L24	@ tmp114,
	strh	r3, [r2]	@ tmp115, MEM[(volatile vu16 *)50344136B]
@ src/soar_voxel.c:573:     g_REG_BG2PB = 0xFF0C; // a bit bigger than the screen (-0xF4?)
	ldr	r2, .L24+4	@ tmp117,
	rsbs	r1, r1, #0	@ tmp118, tmp118
	strh	r1, [r2]	@ tmp118, MEM[(volatile vu16 *)50344138B]
@ src/soar_voxel.c:574:     g_REG_BG2PC = 0x85;   //
	ldr	r2, .L24+8	@ tmp120,
	adds	r1, r1, #122	@ tmp121,
	adds	r1, r1, #255	@ tmp121,
	strh	r1, [r2]	@ tmp121, MEM[(volatile vu16 *)50344140B]
@ src/soar_voxel.c:575:     g_REG_BG2PD = 0x00;   //
	ldr	r2, .L24+12	@ tmp123,
	strh	r3, [r2]	@ tmp115, MEM[(volatile vu16 *)50344142B]
@ src/soar_voxel.c:576:     g_REG_BG2X = 0x9e40;  // offset 'horizontal' can bump 0x180 each way
	ldr	r3, .L24+16	@ tmp126,
	ldr	r2, .L24+20	@ tmp127,
	str	r2, [r3]	@ tmp127, MEM[(volatile vu32 *)50344144B]
@ src/soar_voxel.c:577:     g_REG_BG2Y = 0x180;   // can bump it 0x180 each way
	movs	r2, #192	@ tmp129,
	ldr	r3, .L24+24	@ tmp128,
	lsls	r2, r2, #1	@ tmp129, tmp129,
	str	r2, [r3]	@ tmp129, MEM[(volatile vu32 *)50344148B]
@ src/soar_voxel.c:579: };
	bx	lr
.L25:
	.align	2
.L24:
	.word	50344136
	.word	50344138
	.word	50344140
	.word	50344142
	.word	50344144
	.word	40512
	.word	50344148
	.size	BumpScreen.part.0, .-BumpScreen.part.0
	.align	1
	.global	vid_flip
	.syntax unified
	.code	16
	.thumb_func
	.type	vid_flip, %function
vid_flip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ src/soar_voxel.c:86:   vid_page = (u16 *)((u32)vid_page ^ VID_FLIP);
	movs	r3, #160	@ tmp120,
@ src/soar_voxel.c:90: }
	@ sp needed	@
@ src/soar_voxel.c:86:   vid_page = (u16 *)((u32)vid_page ^ VID_FLIP);
	lsls	r3, r3, #8	@ tmp120, tmp120,
	eors	r0, r3	@ _2, tmp120
@ src/soar_voxel.c:87:   g_LCDIOBuffer ^= DCNT_PAGE; // update control register
	movs	r3, #16	@ tmp126,
@ src/soar_voxel.c:87:   g_LCDIOBuffer ^= DCNT_PAGE; // update control register
	ldr	r2, .L27	@ tmp121,
	ldrh	r1, [r2]	@ MEM[(volatile vu16 *)50344064B], MEM[(volatile vu16 *)50344064B]
@ src/soar_voxel.c:87:   g_LCDIOBuffer ^= DCNT_PAGE; // update control register
	eors	r3, r1	@ _4, MEM[(volatile vu16 *)50344064B]
	strh	r3, [r2]	@ _4, MEM[(volatile vu16 *)50344064B]
@ src/soar_voxel.c:90: }
	bx	lr
.L28:
	.align	2
.L27:
	.word	50344064
	.size	vid_flip, .-vid_flip
	.align	1
	.global	StartSoaring
	.syntax unified
	.code	16
	.thumb_func
	.type	StartSoaring, %function
StartSoaring:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ src/soar_voxel.c:94:   START_PROC(Proc_Soaring, ROOT_PROC_3); // create new proc with parent
	movs	r1, #3	@,
@ src/soar_voxel.c:98: };
	@ sp needed	@
@ src/soar_voxel.c:94:   START_PROC(Proc_Soaring, ROOT_PROC_3); // create new proc with parent
	ldr	r0, .L30	@ tmp116,
	ldr	r3, .L30+4	@ tmp117,
	bl	.L9		@
@ src/soar_voxel.c:98: };
	movs	r0, #23	@,
	pop	{r4}
	pop	{r1}
	bx	r1
.L31:
	.align	2
.L30:
	.word	Proc_Soaring
	.word	ProcStart
	.size	StartSoaring, .-StartSoaring
	.align	1
	.global	SoarUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	SoarUsability, %function
SoarUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ src/soar_voxel.c:100: int SoarUsability() { return 1; };
	movs	r0, #1	@,
	@ sp needed	@
	bx	lr
	.size	SoarUsability, .-SoarUsability
	.align	1
	.global	ram_overclock
	.syntax unified
	.code	16
	.thumb_func
	.type	ram_overclock, %function
ram_overclock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ src/soar_voxel.c:161:   *memctrl_register = 0x0E000020;
	ldr	r3, .L34	@ tmp115,
	ldr	r2, .L34+4	@ tmp116,
@ src/soar_voxel.c:159: bool ram_overclock() {
	sub	sp, sp, #8	@,,
@ src/soar_voxel.c:171: }
	movs	r0, #0	@,
@ src/soar_voxel.c:161:   *memctrl_register = 0x0E000020;
	str	r2, [r3]	@ tmp116, MEM[(volatile unsigned int *)67110912B]
@ src/soar_voxel.c:163:   *ewram_static_data = 1;
	movs	r3, #1	@ tmp117,
	str	r3, [sp, #4]	@ tmp117, MEM[(volatile int *)&ewram_static_data]
@ src/soar_voxel.c:171: }
	add	sp, sp, #8	@,,
	@ sp needed	@
	bx	lr
.L35:
	.align	2
.L34:
	.word	67110912
	.word	234881056
	.size	ram_overclock, .-ram_overclock
	.align	1
	.global	canLandHere
	.syntax unified
	.code	16
	.thumb_func
	.type	canLandHere, %function
canLandHere:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ src/soar_voxel.c:188:   if (CurrentProc->location == 0) {
	ldr	r0, [r0, #80]	@ <retval>, CurrentProc_7(D)->location
@ src/soar_voxel.c:187: int canLandHere(SoarProc *CurrentProc) {
	push	{r4, lr}	@
@ src/soar_voxel.c:188:   if (CurrentProc->location == 0) {
	cmp	r0, #0	@ <retval>,
	beq	.L36		@,
@ src/soar_voxel.c:193:     label = SaffronArrivedLabel;
	ldr	r3, .L48	@ tmp118,
@ src/soar_voxel.c:192:   if (CurrentProc->location == 9) {
	cmp	r0, #9	@ <retval>,
	beq	.L47		@,
@ src/soar_voxel.c:195:     label = CinnabarArrivedLabel;
	ldr	r3, .L48+4	@ tmp119,
@ src/soar_voxel.c:194:   } else if (CurrentProc->location == 10) {
	cmp	r0, #10	@ <retval>,
	beq	.L47		@,
@ src/soar_voxel.c:196:   } else if (CurrentProc->location == 11) {
	cmp	r0, #11	@ <retval>,
	bne	.L41		@,
@ src/soar_voxel.c:197:     label = IndigoPlateauArrivedLabel;
	ldr	r3, .L48+8	@ tmp120,
.L47:
	ldrh	r3, [r3]	@ label,
@ src/soar_voxel.c:200:     return true;
	movs	r0, #1	@ <retval>,
@ src/soar_voxel.c:199:   if (label == 0) {
	cmp	r3, #0	@ label,
	beq	.L36		@,
@ src/soar_voxel.c:202:   return CheckEventId(label);
	movs	r0, r3	@, label
	bl	CheckEventId		@
.L36:
@ src/soar_voxel.c:203: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L41:
@ src/soar_voxel.c:200:     return true;
	movs	r0, #1	@ <retval>,
	b	.L36		@
.L49:
	.align	2
.L48:
	.word	SaffronArrivedLabel
	.word	CinnabarArrivedLabel
	.word	IndigoPlateauArrivedLabel
	.size	canLandHere, .-canLandHere
	.align	1
	.global	isMaleAvatar
	.syntax unified
	.code	16
	.thumb_func
	.type	isMaleAvatar, %function
isMaleAvatar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ src/soar_voxel.c:205: int isMaleAvatar() { return !CheckEventId(GirlProtagFlag_Link); }
	ldr	r3, .L51	@ tmp119,
@ src/soar_voxel.c:205: int isMaleAvatar() { return !CheckEventId(GirlProtagFlag_Link); }
	push	{r4, lr}	@
@ src/soar_voxel.c:205: int isMaleAvatar() { return !CheckEventId(GirlProtagFlag_Link); }
	ldrh	r0, [r3]	@ _2, GirlProtagFlag_Link
@ src/soar_voxel.c:205: int isMaleAvatar() { return !CheckEventId(GirlProtagFlag_Link); }
	@ sp needed	@
@ src/soar_voxel.c:205: int isMaleAvatar() { return !CheckEventId(GirlProtagFlag_Link); }
	bl	CheckEventId		@
@ src/soar_voxel.c:205: int isMaleAvatar() { return !CheckEventId(GirlProtagFlag_Link); }
	rsbs	r3, r0, #0	@ tmp124, _3
	adcs	r0, r0, r3	@ _4, _3, tmp124
@ src/soar_voxel.c:205: int isMaleAvatar() { return !CheckEventId(GirlProtagFlag_Link); }
	pop	{r4}
	pop	{r1}
	bx	r1
.L52:
	.align	2
.L51:
	.word	GirlProtagFlag_Link
	.size	isMaleAvatar, .-isMaleAvatar
	.align	1
	.global	SoarSpawnCoin
	.syntax unified
	.code	16
	.thumb_func
	.type	SoarSpawnCoin, %function
SoarSpawnCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ src/soar_voxel.c:273:   if (!CoinsEnabled) {
	ldr	r3, .L56	@ tmp117,
@ src/soar_voxel.c:273:   if (!CoinsEnabled) {
	ldr	r2, [r3]	@ CoinsEnabled, CoinsEnabled
	subs	r3, r2, #0	@ _6, CoinsEnabled,
	beq	.L54		@,
@ src/soar_voxel.c:279:   CurrentProc->coinX = TEST_COIN_X;
	ldr	r3, .L56+4	@ tmp119,
	str	r3, [r0, #88]	@ tmp119, MEM <unsigned int> [(short int *)CurrentProc_3(D) + 88B]
	movs	r3, #1	@ _6,
.L54:
@ src/soar_voxel.c:288: }
	@ sp needed	@
@ src/soar_voxel.c:274:     CurrentProc->coinZ = 0;
	adds	r0, r0, #92	@ tmp122,
	strh	r3, [r0]	@ _6, CurrentProc_3(D)->coinZ
@ src/soar_voxel.c:288: }
	bx	lr
.L57:
	.align	2
.L56:
	.word	CoinsEnabled
	.word	20971648
	.size	SoarSpawnCoin, .-SoarSpawnCoin
	.align	1
	.global	SoarCollectCoin
	.syntax unified
	.code	16
	.thumb_func
	.type	SoarCollectCoin, %function
SoarCollectCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ src/soar_voxel.c:291:   if (!CoinsEnabled) {
	ldr	r3, .L63	@ tmp120,
@ src/soar_voxel.c:291:   if (!CoinsEnabled) {
	ldr	r3, [r3]	@ CoinsEnabled, CoinsEnabled
@ src/soar_voxel.c:290: void SoarCollectCoin(SoarProc *CurrentProc) {
	push	{r4, lr}	@
@ src/soar_voxel.c:290: void SoarCollectCoin(SoarProc *CurrentProc) {
	movs	r4, r0	@ CurrentProc, CurrentProc
@ src/soar_voxel.c:291:   if (!CoinsEnabled) {
	cmp	r3, #0	@ CoinsEnabled,
	bne	.L59		@,
@ src/soar_voxel.c:292:     CurrentProc->coinZ = 0;
	adds	r4, r4, #92	@ tmp124,
	strh	r3, [r4]	@ CoinsEnabled, CurrentProc_12(D)->coinZ
.L58:
@ src/soar_voxel.c:300: }
	@ sp needed	@
	pop	{r4}
	pop	{r0}
	bx	r0
.L59:
@ src/soar_voxel.c:296:   SetPartyGoldAmount(GetPartyGoldAmount() + 1000);
	ldr	r3, .L63+4	@ tmp127,
	bl	.L9		@
@ src/soar_voxel.c:296:   SetPartyGoldAmount(GetPartyGoldAmount() + 1000);
	movs	r3, #250	@ tmp146,
	lsls	r3, r3, #2	@ tmp146, tmp146,
	adds	r0, r0, r3	@ _3, _2, tmp146
	ldr	r3, .L63+8	@ tmp129,
	bl	.L9		@
@ src/soar_voxel.c:297:   if (gChapterData.muteSfxOption == 0)
	ldr	r3, .L63+12	@ tmp133,
	ldrb	r3, [r3]	@, gChapterData
@ src/soar_voxel.c:297:   if (gChapterData.muteSfxOption == 0)
	lsls	r3, r3, #30	@ tmp144, gChapterData,
	bmi	.L61		@,
@ src/soar_voxel.c:298:     m4aSongNumStart(0x5A);
	movs	r0, #90	@,
	ldr	r3, .L63+16	@ tmp141,
	bl	.L9		@
.L61:
@ src/soar_voxel.c:299:   SoarSpawnCoin(CurrentProc);
	movs	r0, r4	@, CurrentProc
	bl	SoarSpawnCoin		@
	b	.L58		@
.L64:
	.align	2
.L63:
	.word	CoinsEnabled
	.word	GetPartyGoldAmount
	.word	SetPartyGoldAmount
	.word	gChapterData+65
	.word	m4aSongNumStart
	.size	SoarCollectCoin, .-SoarCollectCoin
	.align	1
	.global	LoadSprite
	.syntax unified
	.code	16
	.thumb_func
	.type	LoadSprite, %function
LoadSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}	@
@ src/soar_voxel.c:304:   if (isMaleAvatar()) {
	bl	isMaleAvatar		@
	ldr	r4, .L69	@ tmp162,
@ src/soar_voxel.c:304:   if (isMaleAvatar()) {
	cmp	r0, #0	@ _1,
	beq	.L66		@,
@ src/soar_voxel.c:305:     LZ77UnCompVram(&pkSprite, &tile_mem[5][PKBaseTID]);
	ldr	r0, .L69+4	@ tmp116,
	ldr	r1, .L69+8	@,
	bl	LZ77UnCompVram		@
@ src/soar_voxel.c:306:     ApplyPalette((void *)&pkPal, 0x1c);
	ldr	r0, .L69+12	@ tmp118,
.L68:
@ src/soar_voxel.c:327: };
	@ sp needed	@
@ src/soar_voxel.c:310:     ApplyPalette((void *)&pkPalF, 0x1c);
	movs	r1, #224	@,
	movs	r2, #32	@,
	lsls	r1, r1, #2	@,,
	bl	.L71		@
@ src/soar_voxel.c:312:   LZ77UnCompVram(&locationSprites, &tile_mem[5][LocationBaseTID]); // yeah
	ldr	r0, .L69+16	@ tmp126,
	ldr	r1, .L69+20	@,
	bl	LZ77UnCompVram		@
@ src/soar_voxel.c:313:   LZ77UnCompVram(&miniCursorSprite, &tile_mem[5][CursorBaseTID]);
	ldr	r0, .L69+24	@ tmp128,
	ldr	r1, .L69+28	@,
	bl	LZ77UnCompVram		@
@ src/soar_voxel.c:314:   LZ77UnCompVram(&minimapSprite, &tile_mem[5][MinimapBaseTID]);
	ldr	r0, .L69+32	@ tmp130,
	ldr	r1, .L69+36	@,
	bl	LZ77UnCompVram		@
@ src/soar_voxel.c:315:   LZ77UnCompVram(&fpsSprite, &tile_mem[5][FPSBaseTID]); // fps numbers
	ldr	r0, .L69+40	@ tmp132,
	ldr	r1, .L69+44	@,
	bl	LZ77UnCompVram		@
@ src/soar_voxel.c:316:   LZ77UnCompVram(&lensFlareSprite, &tile_mem[5][LensFlareBaseTID]);
	ldr	r0, .L69+48	@ tmp134,
	ldr	r1, .L69+52	@,
	bl	LZ77UnCompVram		@
@ src/soar_voxel.c:317:   CpuFastFill(0, &tile_mem[5][CoinBaseTID], (512 - CoinBaseTID) * sizeof(TILE));
	movs	r3, #0	@ tmp135,
	ldr	r2, .L69+56	@,
	str	r3, [sp, #4]	@ tmp135, tmp
	add	r0, sp, #4	@,,
	ldr	r3, .L69+60	@ tmp139,
	ldr	r1, .L69+64	@,
	bl	.L9		@
@ src/soar_voxel.c:318:   LZ77UnCompVram(&coinSprite, &tile_mem[5][CoinBaseTID]);
	ldr	r0, .L69+68	@ tmp141,
	ldr	r1, .L69+64	@,
	bl	LZ77UnCompVram		@
@ src/soar_voxel.c:319:   LZ77UnCompVram(&coinMinimapSprite, &tile_mem[5][CoinMinimapBaseTID]);
	ldr	r0, .L69+72	@ tmp143,
	ldr	r1, .L69+76	@,
	bl	LZ77UnCompVram		@
@ src/soar_voxel.c:321:   ApplyPalette((void *)&miniCursorPal, 0x1d);
	movs	r1, #232	@,
	movs	r2, #32	@,
	ldr	r0, .L69+80	@ tmp145,
	lsls	r1, r1, #2	@,,
	bl	.L71		@
@ src/soar_voxel.c:322:   ApplyPalette((void *)&locationPal, 0x1e);
	movs	r1, #240	@,
	movs	r2, #32	@,
	ldr	r0, .L69+84	@ tmp148,
	lsls	r1, r1, #2	@,,
	bl	.L71		@
@ src/soar_voxel.c:323:   ApplyPalette((void *)&minimapPal, 0x12);
	movs	r1, #144	@,
	movs	r2, #32	@,
	ldr	r0, .L69+88	@ tmp151,
	lsls	r1, r1, #2	@,,
	bl	.L71		@
@ src/soar_voxel.c:324:   ApplyPalette((void *)&lensFlarePal, 0x13);
	movs	r1, #152	@,
	movs	r2, #32	@,
	ldr	r0, .L69+92	@ tmp154,
	lsls	r1, r1, #2	@,,
	bl	.L71		@
@ src/soar_voxel.c:325:   ApplyPalette((void *)&coinPal, 0x14);
	movs	r1, #160	@,
	movs	r2, #32	@,
	ldr	r0, .L69+96	@ tmp157,
	lsls	r1, r1, #2	@,,
	bl	.L71		@
@ src/soar_voxel.c:326:   ApplyPalette((void *)&coinMinimapPal, 0x15);
	movs	r1, #168	@,
	movs	r2, #32	@,
	ldr	r0, .L69+100	@ tmp160,
	lsls	r1, r1, #2	@,,
	bl	.L71		@
@ src/soar_voxel.c:327: };
	pop	{r0, r1, r4}
	pop	{r0}
	bx	r0
.L66:
@ src/soar_voxel.c:309:     LZ77UnCompVram(&pkSpriteF, &tile_mem[5][PKBaseTID]);
	ldr	r0, .L69+104	@ tmp121,
	ldr	r1, .L69+8	@,
	bl	LZ77UnCompVram		@
@ src/soar_voxel.c:310:     ApplyPalette((void *)&pkPalF, 0x1c);
	ldr	r0, .L69+108	@ tmp123,
	b	.L68		@
.L70:
	.align	2
.L69:
	.word	CopyToPaletteBuffer
	.word	pkSprite
	.word	100745216
	.word	pkPal
	.word	locationSprites
	.word	100747264
	.word	miniCursorSprite
	.word	100751360
	.word	minimapSprite
	.word	100751872
	.word	fpsSprite
	.word	100753920
	.word	lensFlareSprite
	.word	100754944
	.word	16783872
	.word	CpuFastSet
	.word	100755456
	.word	coinSprite
	.word	coinMinimapSprite
	.word	100759552
	.word	miniCursorPal
	.word	locationPal
	.word	minimapPal
	.word	lensFlarePal
	.word	coinPal
	.word	coinMinimapPal
	.word	pkSpriteF
	.word	pkPalF
	.size	LoadSprite, .-LoadSprite
	.align	1
	.global	SetUpNewWMGraphics
	.syntax unified
	.code	16
	.thumb_func
	.type	SetUpNewWMGraphics, %function
SetUpNewWMGraphics:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
@ src/soar_voxel.c:208:   int StartX = originCoords[gChapterData.chapterIndex][0];
	ldr	r3, .L76	@ tmp136,
@ src/soar_voxel.c:207: void SetUpNewWMGraphics(SoarProc *CurrentProc) {
	sub	sp, sp, #28	@,,
@ src/soar_voxel.c:208:   int StartX = originCoords[gChapterData.chapterIndex][0];
	str	r3, [sp, #12]	@ tmp136, %sfp
	ldrb	r1, [r3, #14]	@ _2,
@ src/soar_voxel.c:209:   int StartY = originCoords[gChapterData.chapterIndex][1];
	ldr	r2, .L76+4	@ tmp137,
	lsls	r1, r1, #1	@ tmp138, _2,
	adds	r3, r2, r1	@ tmp139, tmp137, tmp138
@ src/soar_voxel.c:208:   int StartX = originCoords[gChapterData.chapterIndex][0];
	ldrb	r2, [r1, r2]	@ StartX_15, originCoords
@ src/soar_voxel.c:212:   CurrentProc->sPlayerPosZ = CAMERA_MIN_HEIGHT + (2 * CAMERA_Z_STEP);
	movs	r1, #96	@ tmp144,
@ src/soar_voxel.c:222:   CurrentProc->location = 0;
	movs	r5, #0	@ tmp149,
@ src/soar_voxel.c:207: void SetUpNewWMGraphics(SoarProc *CurrentProc) {
	movs	r4, r0	@ CurrentProc, CurrentProc
@ src/soar_voxel.c:209:   int StartY = originCoords[gChapterData.chapterIndex][1];
	ldrb	r3, [r3, #1]	@ StartY, originCoords
@ src/soar_voxel.c:212:   CurrentProc->sPlayerPosZ = CAMERA_MIN_HEIGHT + (2 * CAMERA_Z_STEP);
	str	r1, [r0, #52]	@ tmp144, CurrentProc_17(D)->sPlayerPosZ
@ src/soar_voxel.c:210:   CurrentProc->sPlayerPosX = (StartX << 6); // x coord mapped to 1024 map size
	lsls	r2, r2, #6	@ _5, StartX_15,
@ src/soar_voxel.c:211:   CurrentProc->sPlayerPosY = ((StartY << 6) + MAP_YOFS);
	lsls	r3, r3, #6	@ _6, StartY,
@ src/soar_voxel.c:213:   CurrentProc->sPlayerStepZ = 2;
	subs	r1, r1, #94	@ tmp259,
@ src/soar_voxel.c:210:   CurrentProc->sPlayerPosX = (StartX << 6); // x coord mapped to 1024 map size
	str	r2, [r0, #44]	@ _5, CurrentProc_17(D)->sPlayerPosX
@ src/soar_voxel.c:211:   CurrentProc->sPlayerPosY = ((StartY << 6) + MAP_YOFS);
	str	r3, [r0, #48]	@ _6, CurrentProc_17(D)->sPlayerPosY
@ src/soar_voxel.c:213:   CurrentProc->sPlayerStepZ = 2;
	str	r1, [r0, #56]	@ tmp259, CurrentProc_17(D)->sPlayerStepZ
@ src/soar_voxel.c:216:       CurrentProc->sPlayerPosX + cam_pivot_dx_Angles[CurrentProc->sPlayerYaw];
	adds	r2, r2, #45	@ _7,
@ src/soar_voxel.c:214:   CurrentProc->sPlayerYaw = a_SE;
	adds	r1, r1, #4	@ tmp146,
@ src/soar_voxel.c:218:       CurrentProc->sPlayerPosY + cam_pivot_dy_Angles[CurrentProc->sPlayerYaw];
	adds	r3, r3, #45	@ _8,
@ src/soar_voxel.c:214:   CurrentProc->sPlayerYaw = a_SE;
	str	r1, [r0, #60]	@ tmp146, CurrentProc_17(D)->sPlayerYaw
@ src/soar_voxel.c:215:   CurrentProc->sFocusPtX =
	str	r2, [r0, #72]	@ _7, CurrentProc_17(D)->sFocusPtX
@ src/soar_voxel.c:217:   CurrentProc->sFocusPtY =
	str	r3, [r0, #76]	@ _8, CurrentProc_17(D)->sFocusPtY
@ src/soar_voxel.c:219:   SoarSpawnCoin(CurrentProc);
	bl	SoarSpawnCoin		@
@ src/soar_voxel.c:222:   CurrentProc->location = 0;
	str	r5, [r4, #80]	@ tmp149, CurrentProc_17(D)->location
@ src/soar_voxel.c:223:   CurrentProc->sunsetVal = 0;
	str	r5, [r4, #84]	@ tmp149, CurrentProc_17(D)->sunsetVal
@ src/soar_voxel.c:224:   CurrentProc->sunTransition = 0;
	adds	r1, r4, #6	@ tmp151, CurrentProc,
	ldrh	r2, [r1, #62]	@, MEM <unsigned short> [(void *)CurrentProc_17(D) + 68B]
	ldr	r3, .L76+8	@ tmp156,
	ands	r2, r3	@ tmp155, tmp156
	movs	r3, #160	@ tmp159,
@ src/soar_voxel.c:174:   const u16 prev_dispcnt = REG_DISPCNT;
	movs	r7, #128	@ tmp161,
@ src/soar_voxel.c:224:   CurrentProc->sunTransition = 0;
	lsls	r3, r3, #3	@ tmp159, tmp159,
	orrs	r3, r2	@ tmp158, tmp155
	strh	r3, [r1, #62]	@ tmp158, MEM <unsigned short> [(void *)CurrentProc_17(D) + 68B]
@ src/soar_voxel.c:176:   REG_DISPCNT = DCNT_MODE0 | DCNT_BG0;
	movs	r3, #128	@ tmp163,
@ src/soar_voxel.c:174:   const u16 prev_dispcnt = REG_DISPCNT;
	lsls	r7, r7, #19	@ tmp161, tmp161,
	ldr	r6, [r7]	@ _57, MEM[(volatile u32 *)67108864B]
@ src/soar_voxel.c:176:   REG_DISPCNT = DCNT_MODE0 | DCNT_BG0;
	lsls	r3, r3, #1	@ tmp163, tmp163,
	lsls	r6, r6, #16	@ _61, _57,
	str	r3, [r7]	@ tmp163, MEM[(volatile u32 *)67108864B]
	lsrs	r6, r6, #16	@ _61, _61,
@ src/soar_voxel.c:179:   ram_overclock();
	bl	ram_overclock		@
@ src/soar_voxel.c:181:   const bool detected = !(REG_DISPCNT & DCNT_BG0);
	ldr	r3, [r7]	@ _58, MEM[(volatile u32 *)67108864B]
@ src/soar_voxel.c:183:   REG_DISPCNT = prev_dispcnt;
	str	r6, [r7]	@ _61, MEM[(volatile u32 *)67108864B]
@ src/soar_voxel.c:181:   const bool detected = !(REG_DISPCNT & DCNT_BG0);
	movs	r6, #1	@ tmp170,
@ src/soar_voxel.c:228:   CurrentProc->disableFlare = detect_android_myboy_emulator();
	movs	r2, r4	@ tmp173, CurrentProc
	movs	r1, r6	@ tmp177, tmp170
	movs	r0, #16	@ tmp262,
@ src/soar_voxel.c:181:   const bool detected = !(REG_DISPCNT & DCNT_BG0);
	lsls	r3, r3, #23	@ tmp168, _58,
@ src/soar_voxel.c:228:   CurrentProc->disableFlare = detect_android_myboy_emulator();
	adds	r2, r2, #69	@ tmp173,
@ src/soar_voxel.c:181:   const bool detected = !(REG_DISPCNT & DCNT_BG0);
	lsrs	r3, r3, #31	@ tmp167, tmp168,
@ src/soar_voxel.c:228:   CurrentProc->disableFlare = detect_android_myboy_emulator();
	bics	r1, r3	@ tmp177, tmp167
	ldrb	r3, [r2]	@, CurrentProc_17(D)->disableFlare
	lsls	r1, r1, #4	@ tmp180, tmp177,
	bics	r3, r0	@ tmp183, tmp262
	orrs	r3, r1	@ tmp187, tmp180
	strb	r3, [r2]	@ tmp187, CurrentProc_17(D)->disableFlare
@ src/soar_voxel.c:237:   CpuFastCopy(NewWMLoop, (void *)IRAM_NewWMLoop, SIZEOF_NewWMLoop);
	movs	r2, #192	@,
@ src/soar_voxel.c:231:   CurrentProc->vid_page = (u16 *)(0x600A000);
	ldr	r3, .L76+12	@ tmp189,
@ src/soar_voxel.c:237:   CpuFastCopy(NewWMLoop, (void *)IRAM_NewWMLoop, SIZEOF_NewWMLoop);
	ldr	r0, .L76+16	@ tmp192,
@ src/soar_voxel.c:231:   CurrentProc->vid_page = (u16 *)(0x600A000);
	str	r3, [r4, #64]	@ tmp189, CurrentProc_17(D)->vid_page
@ src/soar_voxel.c:237:   CpuFastCopy(NewWMLoop, (void *)IRAM_NewWMLoop, SIZEOF_NewWMLoop);
	ldr	r1, .L76+20	@,
	lsls	r2, r2, #2	@,,
	ldr	r7, .L76+24	@ tmp193,
	bl	.L78		@
@ src/soar_voxel.c:239:   VBlankIntrWait();
	ldr	r3, .L76+28	@ tmp194,
	bl	.L9		@
@ src/soar_voxel.c:241:   g_LCDIOBuffer = DISPCNT_MODE_5
	ldr	r3, .L76+32	@ tmp195,
	ldr	r2, .L76+36	@ tmp196,
@ src/soar_voxel.c:246:   SetColorEffectsParameters(3, 4, 0x10, 0); // do these even do anything?
	movs	r1, #4	@,
@ src/soar_voxel.c:241:   g_LCDIOBuffer = DISPCNT_MODE_5
	strh	r2, [r3]	@ tmp196, MEM[(volatile vu16 *)50344064B]
@ src/soar_voxel.c:246:   SetColorEffectsParameters(3, 4, 0x10, 0); // do these even do anything?
	movs	r0, #3	@,
	movs	r3, r5	@, tmp149
	movs	r2, #16	@,
	ldr	r4, .L76+40	@ tmp198,
	bl	.L71		@
@ src/soar_voxel.c:247:   SetColorEffectsFirstTarget(0, 0, 0, 0, 0);
	movs	r1, r5	@, tmp149
	movs	r2, r5	@, tmp149
	movs	r3, r5	@, tmp149
	movs	r0, r5	@, tmp149
	str	r5, [sp]	@ tmp149,
	ldr	r4, .L76+44	@ tmp200,
	bl	.L71		@
@ src/soar_voxel.c:248:   SetColorEffectBackdropFirstTarget(1);
	movs	r0, r6	@, tmp170
	ldr	r3, .L76+48	@ tmp201,
	bl	.L9		@
@ src/soar_voxel.c:254:   g_REG_BG2PB = 0xFF0C; // a bit bigger than the screen (-0xF4?)
	movs	r2, #244	@ tmp206,
@ src/soar_voxel.c:253:   g_REG_BG2PA = 0x00;   // rotate and stretch
	ldr	r3, .L76+52	@ tmp202,
	strh	r5, [r3]	@ tmp149, MEM[(volatile vu16 *)50344136B]
@ src/soar_voxel.c:254:   g_REG_BG2PB = 0xFF0C; // a bit bigger than the screen (-0xF4?)
	ldr	r3, .L76+56	@ tmp205,
	rsbs	r2, r2, #0	@ tmp206, tmp206
	strh	r2, [r3]	@ tmp206, MEM[(volatile vu16 *)50344138B]
@ src/soar_voxel.c:255:   g_REG_BG2PC = 0x85;   //
	ldr	r3, .L76+60	@ tmp208,
	adds	r2, r2, #122	@ tmp209,
	adds	r2, r2, #255	@ tmp209,
	strh	r2, [r3]	@ tmp209, MEM[(volatile vu16 *)50344140B]
@ src/soar_voxel.c:256:   g_REG_BG2PD = 0x00;   //
	ldr	r3, .L76+64	@ tmp211,
@ src/soar_voxel.c:257:   g_REG_BG2X = 0x9e40;  // offset 'horizontal' can bump 0x180 each way
	ldr	r2, .L76+68	@ tmp215,
@ src/soar_voxel.c:256:   g_REG_BG2PD = 0x00;   //
	strh	r5, [r3]	@ tmp149, MEM[(volatile vu16 *)50344142B]
@ src/soar_voxel.c:257:   g_REG_BG2X = 0x9e40;  // offset 'horizontal' can bump 0x180 each way
	ldr	r3, .L76+72	@ tmp214,
	str	r2, [r3]	@ tmp215, MEM[(volatile vu32 *)50344144B]
@ src/soar_voxel.c:258:   g_REG_BG2Y = 0x180;   // can bump it 0x180 each way
	movs	r2, #192	@ tmp217,
	ldr	r3, .L76+76	@ tmp216,
	lsls	r2, r2, #1	@ tmp217, tmp217,
@ src/soar_voxel.c:260:   Sound_FadeSongOut(10);
	movs	r0, #10	@,
@ src/soar_voxel.c:258:   g_REG_BG2Y = 0x180;   // can bump it 0x180 each way
	str	r2, [r3]	@ tmp217, MEM[(volatile vu32 *)50344148B]
@ src/soar_voxel.c:260:   Sound_FadeSongOut(10);
	ldr	r3, .L76+80	@ tmp218,
	bl	.L9		@
@ src/soar_voxel.c:261:   LoadSprite();
	bl	LoadSprite		@
@ src/soar_voxel.c:262:   if (gChapterData.unk41_1 == 0)
	ldr	r3, [sp, #12]	@ tmp136, %sfp
	adds	r3, r3, #65	@ tmp136,
	ldrb	r3, [r3]	@ _10, gChapterData
@ src/soar_voxel.c:263:     m4aSongNumStart(0x58); // unused slot //if muted option is false
	movs	r0, #88	@,
@ src/soar_voxel.c:262:   if (gChapterData.unk41_1 == 0)
	tst	r3, r6	@ _10, tmp170
	beq	.L75		@,
@ src/soar_voxel.c:264:   else if (gChapterData.muteSfxOption == 0)
	movs	r2, #2	@ tmp264,
	tst	r3, r2	@ _10, tmp264
	bne	.L74		@,
@ src/soar_voxel.c:265:     m4aSongNumStart(0x4e); // windy (play if sfx but no music)
	movs	r0, #78	@,
.L75:
	ldr	r3, .L76+84	@ tmp234,
	bl	.L9		@
.L74:
@ src/soar_voxel.c:266:   gCurrentMusic = 0x58;
	movs	r2, #88	@ tmp236,
	ldr	r3, .L76+88	@ tmp235,
@ src/soar_voxel.c:267:   CpuFastFill16(0, VRAM, (MODE5_WIDTH * MODE5_HEIGHT << 1)); // make it black
	movs	r1, #192	@,
@ src/soar_voxel.c:266:   gCurrentMusic = 0x58;
	strh	r2, [r3]	@ tmp236, MEM[(volatile u16 *)33705568B]
@ src/soar_voxel.c:267:   CpuFastFill16(0, VRAM, (MODE5_WIDTH * MODE5_HEIGHT << 1)); // make it black
	movs	r3, #0	@ tmp238,
	ldr	r2, .L76+92	@,
	lsls	r1, r1, #19	@,,
	add	r0, sp, #20	@,,
	str	r3, [sp, #20]	@ tmp238, tmp
	bl	.L78		@
@ src/soar_voxel.c:269:   SetInterrupt_LCDVBlank(SoarVBlankInterrupt);
	ldr	r0, .L76+96	@ tmp243,
	ldr	r3, .L76+100	@ tmp244,
	bl	.L9		@
@ src/soar_voxel.c:270: };
	add	sp, sp, #28	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L77:
	.align	2
.L76:
	.word	gChapterData
	.word	originCoords
	.word	-28672
	.word	100704256
	.word	NewWMLoop
	.word	50360320
	.word	CpuFastSet
	.word	VBlankIntrWait
	.word	50344064
	.word	5189
	.word	SetColorEffectsParameters
	.word	SetColorEffectsFirstTarget
	.word	SetColorEffectBackdropFirstTarget
	.word	50344136
	.word	50344138
	.word	50344140
	.word	50344142
	.word	40512
	.word	50344144
	.word	50344148
	.word	Sound_FadeSongOut
	.word	m4aSongNumStart
	.word	33705568
	.word	16787456
	.word	SoarVBlankInterrupt
	.word	SetInterrupt_LCDVBlank
	.size	SetUpNewWMGraphics, .-SetUpNewWMGraphics
	.align	1
	.global	EndLoop
	.syntax unified
	.code	16
	.thumb_func
	.type	EndLoop, %function
EndLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}	@
@ src/soar_voxel.c:524: void EndLoop(SoarProc *CurrentProc) {
	movs	r4, r0	@ CurrentProc, CurrentProc
@ src/soar_voxel.c:545: };
	@ sp needed	@
@ src/soar_voxel.c:525:   SetInterrupt_LCDVBlank(OnVBlankMain);
	ldr	r0, .L80	@ tmp117,
	ldr	r3, .L80+4	@ tmp118,
	bl	.L9		@
@ src/soar_voxel.c:527:   VBlankIntrWait();
	ldr	r5, .L80+8	@ tmp119,
@ src/soar_voxel.c:526:   u16 *vid_page = CurrentProc->vid_page; // CAREFUL HERE
	ldr	r6, [r4, #64]	@ vid_page, CurrentProc_4(D)->vid_page
@ src/soar_voxel.c:527:   VBlankIntrWait();
	bl	.L82		@
@ src/soar_voxel.c:528:   CpuFastFill(0, vid_page,
	movs	r3, #0	@ tmp120,
	movs	r1, r6	@, vid_page
	ldr	r2, .L80+12	@,
	str	r3, [sp, #4]	@ tmp120, tmp
	add	r0, sp, #4	@,,
	ldr	r3, .L80+16	@ tmp123,
	bl	.L9		@
@ src/soar_voxel.c:530:   CurrentProc->vid_page = vid_flip(vid_page);
	movs	r0, r6	@, vid_page
	bl	vid_flip		@
@ src/soar_voxel.c:530:   CurrentProc->vid_page = vid_flip(vid_page);
	str	r0, [r4, #64]	@ _1, CurrentProc_4(D)->vid_page
@ src/soar_voxel.c:532:   VBlankIntrWait();
	bl	.L82		@
@ src/soar_voxel.c:533:   g_LCDIOBuffer = DISPCNT_MODE_5; // disable all layers
	movs	r2, #5	@ tmp126,
	ldr	r3, .L80+20	@ tmp125,
@ src/soar_voxel.c:542:   BreakProcLoop((void *)CurrentProc);
	movs	r0, r4	@, CurrentProc
@ src/soar_voxel.c:533:   g_LCDIOBuffer = DISPCNT_MODE_5; // disable all layers
	strh	r2, [r3]	@ tmp126, MEM[(volatile vu16 *)50344064B]
@ src/soar_voxel.c:542:   BreakProcLoop((void *)CurrentProc);
	ldr	r3, .L80+24	@ tmp128,
	bl	.L9		@
@ src/soar_voxel.c:544:   Sound_FadeSongOut(10);
	movs	r0, #10	@,
	ldr	r3, .L80+28	@ tmp129,
	bl	.L9		@
@ src/soar_voxel.c:545: };
	pop	{r0, r1, r4, r5, r6}
	pop	{r0}
	bx	r0
.L81:
	.align	2
.L80:
	.word	OnVBlankMain
	.word	SetInterrupt_LCDVBlank
	.word	VBlankIntrWait
	.word	16787456
	.word	CpuFastSet
	.word	50344064
	.word	BreakProcLoop
	.word	Sound_FadeSongOut
	.size	EndLoop, .-EndLoop
	.align	1
	.global	BumpScreen
	.syntax unified
	.code	16
	.thumb_func
	.type	BumpScreen, %function
BumpScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ src/soar_voxel.c:548:   switch (direction) {
	cmp	r0, #2	@ direction,
	beq	.L84		@,
	bgt	.L85		@,
	cmp	r0, #1	@ direction,
	bls	.L83		@,
.L86:
	bl	BumpScreen.part.0		@
@ src/soar_voxel.c:579: };
	b	.L83		@
.L85:
@ src/soar_voxel.c:548:   switch (direction) {
	cmp	r0, #3	@ direction,
	bne	.L86		@,
@ src/soar_voxel.c:564:     g_REG_BG2Y = 0x0500; // offset horizontal
	movs	r2, #160	@ tmp133,
	ldr	r3, .L90	@ tmp132,
	lsls	r2, r2, #3	@ tmp133, tmp133,
	str	r2, [r3]	@ tmp133, MEM[(volatile vu32 *)50344148B]
@ src/soar_voxel.c:565:     g_REG_BG2X = 0x9c40;
	ldr	r3, .L90+4	@ tmp134,
	ldr	r2, .L90+8	@ tmp135,
	str	r2, [r3]	@ tmp135, MEM[(volatile vu32 *)50344144B]
@ src/soar_voxel.c:566:     g_REG_BG2PA = 0xFFF2;
	movs	r2, #14	@ tmp137,
	ldr	r3, .L90+12	@ tmp136,
	rsbs	r2, r2, #0	@ tmp137, tmp137
	strh	r2, [r3]	@ tmp137, MEM[(volatile vu16 *)50344136B]
@ src/soar_voxel.c:567:     g_REG_BG2PB = 0xFF1C;
	ldr	r3, .L90+16	@ tmp139,
	subs	r2, r2, #214	@ tmp140,
	strh	r2, [r3]	@ tmp140, MEM[(volatile vu16 *)50344138B]
@ src/soar_voxel.c:568:     g_REG_BG2PC = 0x0080;
	ldr	r3, .L90+20	@ tmp142,
	adds	r2, r2, #101	@ tmp143,
	adds	r2, r2, #255	@ tmp143,
	strh	r2, [r3]	@ tmp143, MEM[(volatile vu16 *)50344140B]
@ src/soar_voxel.c:569:     g_REG_BG2PD = 0xFFF8;
	ldr	r3, .L90+24	@ tmp145,
	subs	r2, r2, #136	@ tmp146,
	b	.L89		@
.L84:
@ src/soar_voxel.c:556:     g_REG_BG2Y = 0x180; // offset horizontal
	movs	r2, #192	@ tmp117,
	ldr	r3, .L90	@ tmp116,
	lsls	r2, r2, #1	@ tmp117, tmp117,
	str	r2, [r3]	@ tmp117, MEM[(volatile vu32 *)50344148B]
@ src/soar_voxel.c:557:     g_REG_BG2X = 0x9280;
	ldr	r3, .L90+4	@ tmp118,
	ldr	r2, .L90+28	@ tmp119,
	str	r2, [r3]	@ tmp119, MEM[(volatile vu32 *)50344144B]
@ src/soar_voxel.c:558:     g_REG_BG2PA = 0x000E;
	movs	r2, #14	@ tmp121,
	ldr	r3, .L90+12	@ tmp120,
	strh	r2, [r3]	@ tmp121, MEM[(volatile vu16 *)50344136B]
@ src/soar_voxel.c:559:     g_REG_BG2PB = 0xFF1C;
	ldr	r3, .L90+16	@ tmp123,
	subs	r2, r2, #242	@ tmp124,
	strh	r2, [r3]	@ tmp124, MEM[(volatile vu16 *)50344138B]
@ src/soar_voxel.c:560:     g_REG_BG2PC = 0x0080;
	ldr	r3, .L90+20	@ tmp126,
	adds	r2, r2, #101	@ tmp127,
	adds	r2, r2, #255	@ tmp127,
	strh	r2, [r3]	@ tmp127, MEM[(volatile vu16 *)50344140B]
@ src/soar_voxel.c:561:     g_REG_BG2PD = 0x0008;
	ldr	r3, .L90+24	@ tmp129,
	subs	r2, r2, #120	@ tmp130,
.L89:
@ src/soar_voxel.c:569:     g_REG_BG2PD = 0xFFF8;
	strh	r2, [r3]	@ tmp146,
.L83:
@ src/soar_voxel.c:579: };
	@ sp needed	@
	pop	{r4}
	pop	{r0}
	bx	r0
.L91:
	.align	2
.L90:
	.word	50344148
	.word	50344144
	.word	40000
	.word	50344136
	.word	50344138
	.word	50344140
	.word	50344142
	.word	37504
	.size	BumpScreen, .-BumpScreen
	.align	1
	.global	SoarProjectCoin
	.syntax unified
	.code	16
	.thumb_func
	.type	SoarProjectCoin, %function
SoarProjectCoin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
@ src/soar_voxel.c:589:   if (!CoinsEnabled || !CurrentProc->coinZ) {
	ldr	r3, .L100	@ tmp167,
@ src/soar_voxel.c:589:   if (!CoinsEnabled || !CurrentProc->coinZ) {
	ldr	r3, [r3]	@ CoinsEnabled, CoinsEnabled
@ src/soar_voxel.c:588: void SoarProjectCoin(SoarProc *CurrentProc) {
	push	{r0, r1, r2, r4, r5, r6, r7, lr}	@
@ src/soar_voxel.c:588: void SoarProjectCoin(SoarProc *CurrentProc) {
	movs	r6, r0	@ CurrentProc, CurrentProc
@ src/soar_voxel.c:589:   if (!CoinsEnabled || !CurrentProc->coinZ) {
	cmp	r3, #0	@ CoinsEnabled,
	beq	.L99		@,
@ src/soar_voxel.c:589:   if (!CoinsEnabled || !CurrentProc->coinZ) {
	movs	r3, r0	@ tmp171, CurrentProc
	adds	r3, r3, #92	@ tmp171,
@ src/soar_voxel.c:589:   if (!CoinsEnabled || !CurrentProc->coinZ) {
	movs	r2, #0	@ tmp245,
	ldrsh	r3, [r3, r2]	@ tmp172, tmp171, tmp245
	cmp	r3, #0	@ tmp172,
	beq	.L99		@,
@ src/soar_voxel.c:597:   int relX = CurrentProc->coinX - CurrentProc->sPlayerPosX;
	movs	r2, r0	@ tmp177, CurrentProc
@ src/soar_voxel.c:595:   int yaw = CurrentProc->sPlayerYaw & 0xF;
	movs	r1, #15	@ tmp268,
	ldr	r3, [r0, #60]	@ CurrentProc_44(D)->sPlayerYaw, CurrentProc_44(D)->sPlayerYaw
@ src/soar_voxel.c:597:   int relX = CurrentProc->coinX - CurrentProc->sPlayerPosX;
	adds	r2, r2, #88	@ tmp177,
@ src/soar_voxel.c:595:   int yaw = CurrentProc->sPlayerYaw & 0xF;
	ands	r3, r1	@ yaw, tmp268
@ src/soar_voxel.c:597:   int relX = CurrentProc->coinX - CurrentProc->sPlayerPosX;
	movs	r1, #0	@ tmp246,
	ldrsh	r2, [r2, r1]	@ _6, tmp177, tmp246
	str	r2, [sp]	@ _6, %sfp
@ src/soar_voxel.c:597:   int relX = CurrentProc->coinX - CurrentProc->sPlayerPosX;
	ldr	r2, [r0, #44]	@ CurrentProc_44(D)->sPlayerPosX, CurrentProc_44(D)->sPlayerPosX
	ldr	r0, [sp]	@ _6, %sfp
	subs	r2, r0, r2	@ relX, _6, CurrentProc_44(D)->sPlayerPosX
	mov	ip, r2	@ relX, relX
@ src/soar_voxel.c:598:   int relY = CurrentProc->coinY - CurrentProc->sPlayerPosY;
	movs	r2, r6	@ tmp181, CurrentProc
	adds	r2, r2, #90	@ tmp181,
	movs	r1, #0	@ tmp247,
	ldrsh	r2, [r2, r1]	@ _9, tmp181, tmp247
@ src/soar_voxel.c:598:   int relY = CurrentProc->coinY - CurrentProc->sPlayerPosY;
	ldr	r4, [r6, #48]	@ CurrentProc_44(D)->sPlayerPosY, CurrentProc_44(D)->sPlayerPosY
@ src/soar_voxel.c:598:   int relY = CurrentProc->coinY - CurrentProc->sPlayerPosY;
	str	r2, [sp, #4]	@ _9, %sfp
@ src/soar_voxel.c:598:   int relY = CurrentProc->coinY - CurrentProc->sPlayerPosY;
	subs	r4, r2, r4	@ relY, _9, CurrentProc_44(D)->sPlayerPosY
@ src/soar_voxel.c:600:       ((relX * cam_pivot_dx_Angles[yaw]) + (relY * cam_pivot_dy_Angles[yaw])) >>
	ldr	r2, .L100+4	@ tmp183,
	lsls	r0, r3, #1	@ tmp184, yaw,
	ldrsh	r5, [r0, r2]	@ _12, cam_pivot_dx_Angles
@ src/soar_voxel.c:600:       ((relX * cam_pivot_dx_Angles[yaw]) + (relY * cam_pivot_dy_Angles[yaw])) >>
	movs	r7, r5	@ _12, _12
@ src/soar_voxel.c:600:       ((relX * cam_pivot_dx_Angles[yaw]) + (relY * cam_pivot_dy_Angles[yaw])) >>
	adds	r0, r2, r0	@ tmp189, tmp183, tmp184
	movs	r1, #32	@ tmp249,
	ldrsh	r0, [r0, r1]	@ _15, tmp189, tmp249
@ src/soar_voxel.c:600:       ((relX * cam_pivot_dx_Angles[yaw]) + (relY * cam_pivot_dy_Angles[yaw])) >>
	mov	r5, ip	@ _13, relX
	muls	r5, r7	@ _13, _12
@ src/soar_voxel.c:600:       ((relX * cam_pivot_dx_Angles[yaw]) + (relY * cam_pivot_dy_Angles[yaw])) >>
	muls	r0, r4	@ _16, relY
@ src/soar_voxel.c:600:       ((relX * cam_pivot_dx_Angles[yaw]) + (relY * cam_pivot_dy_Angles[yaw])) >>
	adds	r5, r5, r0	@ _17, _13, _16
@ src/soar_voxel.c:606:   if ((forward <= 4) || (forward > 512)) {
	movs	r0, #254	@ tmp194,
@ src/soar_voxel.c:599:   int forward =
	asrs	r7, r5, #6	@ forward, _17,
@ src/soar_voxel.c:606:   if ((forward <= 4) || (forward > 512)) {
	subs	r1, r7, #5	@ _26, forward,
@ src/soar_voxel.c:606:   if ((forward <= 4) || (forward > 512)) {
	lsls	r0, r0, #1	@ tmp194, tmp194,
	cmp	r1, r0	@ _26, tmp194
	bcs	.L99		@,
@ src/soar_voxel.c:596:   int rightYaw = (yaw + 4) & 0xF;
	movs	r1, #15	@ tmp267,
@ src/soar_voxel.c:596:   int rightYaw = (yaw + 4) & 0xF;
	adds	r3, r3, #4	@ _4,
@ src/soar_voxel.c:596:   int rightYaw = (yaw + 4) & 0xF;
	ands	r3, r1	@ rightYaw, tmp267
@ src/soar_voxel.c:602:   int lateral = ((relX * cam_pivot_dx_Angles[rightYaw]) +
	lsls	r3, r3, #1	@ tmp198, rightYaw,
	ldrsh	r0, [r3, r2]	@ _19, cam_pivot_dx_Angles
@ src/soar_voxel.c:602:   int lateral = ((relX * cam_pivot_dx_Angles[rightYaw]) +
	movs	r1, r0	@ _19, _19
@ src/soar_voxel.c:603:                  (relY * cam_pivot_dy_Angles[rightYaw])) >>
	adds	r2, r2, r3	@ tmp203, tmp183, tmp198
	movs	r3, #32	@ _22,
	ldrsh	r3, [r2, r3]	@ _22, tmp203, _22
@ src/soar_voxel.c:602:   int lateral = ((relX * cam_pivot_dx_Angles[rightYaw]) +
	mov	r0, ip	@ _20, relX
	muls	r0, r1	@ _20, _19
@ src/soar_voxel.c:603:                  (relY * cam_pivot_dy_Angles[rightYaw])) >>
	muls	r3, r4	@ _23, relY
@ src/soar_voxel.c:602:   int lateral = ((relX * cam_pivot_dx_Angles[rightYaw]) +
	adds	r0, r0, r3	@ _24, _20, _23
@ src/soar_voxel.c:612:   int column = 64 + Div(lateral << 6, forward);
	movs	r3, #63	@ tmp209,
	movs	r1, r7	@, forward
	bics	r0, r3	@ _27, tmp209
	ldr	r3, .L100+8	@ tmp210,
	bl	.L9		@
@ src/soar_voxel.c:615:   if ((column < -32) || (column > 160) || (zdist <= 0) || (zdist > 510)) {
	movs	r3, r0	@ _34, _28
	adds	r3, r3, #96	@ _34,
@ src/soar_voxel.c:612:   int column = 64 + Div(lateral << 6, forward);
	movs	r4, r0	@ _28,
@ src/soar_voxel.c:615:   if ((column < -32) || (column > 160) || (zdist <= 0) || (zdist > 510)) {
	cmp	r3, #192	@ _34,
	bhi	.L99		@,
@ src/soar_voxel.c:613:   int zdist = forward + (forward >> 2) + (forward >> 3) + (forward >> 5);
	asrs	r2, r5, #8	@ _29, _17,
@ src/soar_voxel.c:613:   int zdist = forward + (forward >> 2) + (forward >> 3) + (forward >> 5);
	asrs	r3, r5, #9	@ _31, _17,
@ src/soar_voxel.c:613:   int zdist = forward + (forward >> 2) + (forward >> 3) + (forward >> 5);
	adds	r2, r2, r7	@ _30, _29, forward
@ src/soar_voxel.c:613:   int zdist = forward + (forward >> 2) + (forward >> 3) + (forward >> 5);
	adds	r2, r2, r3	@ _32, _30, _31
@ src/soar_voxel.c:615:   if ((column < -32) || (column > 160) || (zdist <= 0) || (zdist > 510)) {
	movs	r3, #255	@ tmp217,
@ src/soar_voxel.c:613:   int zdist = forward + (forward >> 2) + (forward >> 3) + (forward >> 5);
	asrs	r5, r5, #11	@ _33, _17,
@ src/soar_voxel.c:613:   int zdist = forward + (forward >> 2) + (forward >> 3) + (forward >> 5);
	adds	r5, r2, r5	@ zdist, _32, _33
@ src/soar_voxel.c:615:   if ((column < -32) || (column > 160) || (zdist <= 0) || (zdist > 510)) {
	lsls	r3, r3, #1	@ tmp217, tmp217,
	cmp	r5, r3	@ zdist, tmp217
	bgt	.L99		@,
@ src/soar_voxel.c:622:       getPtHeight_thumb(CurrentProc->coinX, CurrentProc->coinY) + 16;
	ldr	r1, [sp, #4]	@, %sfp
	ldr	r0, [sp]	@, %sfp
	bl	getPtHeight_thumb		@
@ src/soar_voxel.c:628:   int screenY = 136 - hosTables[CurrentProc->sPlayerStepZ][zIndex][coinHeight];
	ldr	r3, [r6, #56]	@ CurrentProc_44(D)->sPlayerStepZ, CurrentProc_44(D)->sPlayerStepZ
@ src/soar_voxel.c:626:   int zIndex = zdist >> 1;
	asrs	r1, r5, #1	@ zIndex_53, zdist,
@ src/soar_voxel.c:621:   int coinHeight =
	adds	r0, r0, #16	@ coinHeight_51,
@ src/soar_voxel.c:628:   int screenY = 136 - hosTables[CurrentProc->sPlayerStepZ][zIndex][coinHeight];
	lsls	r5, r3, #8	@ tmp222, CurrentProc_44(D)->sPlayerStepZ,
	ldr	r2, .L100+12	@ tmp219,
@ src/soar_voxel.c:630:   *CoinScreenX = screenX;
	adds	r4, r4, #112	@ _60,
@ src/soar_voxel.c:628:   int screenY = 136 - hosTables[CurrentProc->sPlayerStepZ][zIndex][coinHeight];
	adds	r5, r5, r1	@ tmp223, tmp222, zIndex_53
@ src/soar_voxel.c:623:   if (coinHeight > 255)
	cmp	r0, #255	@ coinHeight_51,
	ble	.L94		@,
	movs	r0, #255	@ coinHeight_51,
.L94:
@ src/soar_voxel.c:631:   *CoinScreenY = screenY;
	movs	r3, #136	@ tmp228,
@ src/soar_voxel.c:628:   int screenY = 136 - hosTables[CurrentProc->sPlayerStepZ][zIndex][coinHeight];
	lsls	r5, r5, #8	@ tmp225, tmp223,
	adds	r2, r2, r5	@ tmp226, tmp219, tmp225
	ldrb	r2, [r2, r0]	@ _39, hosTables
@ src/soar_voxel.c:631:   *CoinScreenY = screenY;
	subs	r3, r3, r2	@ _58, tmp228, _39
.L93:
@ src/soar_voxel.c:590:     *CoinScreenX = -1;
	ldr	r2, .L100+16	@ tmp230,
@ src/soar_voxel.c:647: }
	@ sp needed	@
@ src/soar_voxel.c:590:     *CoinScreenX = -1;
	strh	r4, [r2]	@ _60, MEM[(s16 *)33681736B]
@ src/soar_voxel.c:591:     *CoinScreenY = -1;
	ldr	r2, .L100+20	@ tmp232,
	strh	r3, [r2]	@ _58, MEM[(s16 *)33681738B]
@ src/soar_voxel.c:647: }
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L99:
	movs	r4, #1	@ _60,
	rsbs	r4, r4, #0	@ _60, _60
	movs	r3, r4	@ _58, _60
	b	.L93		@
.L101:
	.align	2
.L100:
	.word	CoinsEnabled
	.word	.LANCHOR0
	.word	Div
	.word	hosTables
	.word	33681736
	.word	33681738
	.size	SoarProjectCoin, .-SoarProjectCoin
	.align	1
	.global	thumb_loop
	.syntax unified
	.code	16
	.thumb_func
	.type	thumb_loop, %function
thumb_loop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	movs	r4, r0	@ CurrentProc, CurrentProc
@ src/soar_voxel.c:653:       (cam_dx_Angles[(CurrentProc->oceanClock >> 2)] |
	adds	r0, r0, #71	@ tmp271,
	ldrb	r3, [r0]	@ _3,
@ src/soar_voxel.c:653:       (cam_dx_Angles[(CurrentProc->oceanClock >> 2)] |
	ldr	r2, .L157	@ tmp273,
@ src/soar_voxel.c:653:       (cam_dx_Angles[(CurrentProc->oceanClock >> 2)] |
	lsrs	r5, r3, #2	@ _5, _3,
@ src/soar_voxel.c:653:       (cam_dx_Angles[(CurrentProc->oceanClock >> 2)] |
	lsls	r5, r5, #1	@ tmp277, _5,
	adds	r2, r2, r5	@ tmp278, tmp273, tmp277
@ src/soar_voxel.c:652:   CurrentProc->oceanOffset +=
	ldrh	r5, [r2, #62]	@, cam_dx_Angles
	movs	r2, #1	@ tmp284,
	orrs	r2, r5	@ tmp283, tmp281
@ src/soar_voxel.c:652:   CurrentProc->oceanOffset +=
	movs	r5, r4	@ tmp287, CurrentProc
	adds	r5, r5, #70	@ tmp287,
@ src/soar_voxel.c:652:   CurrentProc->oceanOffset +=
	ldrb	r6, [r5]	@,
	adds	r2, r2, r6	@ tmp291, tmp283, tmp289
@ src/soar_voxel.c:650: {
	sub	sp, sp, #20	@,,
@ src/soar_voxel.c:652:   CurrentProc->oceanOffset +=
	strb	r2, [r5]	@ tmp291, CurrentProc_157(D)->oceanOffset
@ src/soar_voxel.c:655:   CurrentProc->oceanClock = (CurrentProc->oceanClock + 1) & 0x3F;
	movs	r2, #63	@ tmp299,
@ src/soar_voxel.c:658:       (CurrentProc->sPlayerStepZ < (CAMERA_NUM_STEPS - 3))) {
	movs	r7, #6	@ tmp317,
@ src/soar_voxel.c:655:   CurrentProc->oceanClock = (CurrentProc->oceanClock + 1) & 0x3F;
	adds	r3, r3, #1	@ tmp296,
@ src/soar_voxel.c:655:   CurrentProc->oceanClock = (CurrentProc->oceanClock + 1) & 0x3F;
	ands	r3, r2	@ tmp298, tmp299
@ src/soar_voxel.c:655:   CurrentProc->oceanClock = (CurrentProc->oceanClock + 1) & 0x3F;
	strb	r3, [r0]	@ tmp298, CurrentProc_157(D)->oceanClock
@ src/soar_voxel.c:657:   if ((CurrentProc->takeOffTransition) &
	subs	r0, r0, #2	@ tmp310,
	ldrb	r2, [r0]	@ *CurrentProc_157(D), *CurrentProc_157(D)
	str	r0, [sp]	@ tmp310, %sfp
@ src/soar_voxel.c:658:       (CurrentProc->sPlayerStepZ < (CAMERA_NUM_STEPS - 3))) {
	movs	r0, r7	@ tmp317, tmp317
	movs	r7, #0	@ tmp319,
@ src/soar_voxel.c:658:       (CurrentProc->sPlayerStepZ < (CAMERA_NUM_STEPS - 3))) {
	ldr	r5, [r4, #56]	@ _15, CurrentProc_157(D)->sPlayerStepZ
@ src/soar_voxel.c:658:       (CurrentProc->sPlayerStepZ < (CAMERA_NUM_STEPS - 3))) {
	lsrs	r3, r5, #31	@ tmp318, _15,
	cmp	r0, r5	@ tmp317, _15
	adcs	r3, r3, r7	@ tmp316, tmp318, tmp319
@ src/soar_voxel.c:657:   if ((CurrentProc->takeOffTransition) &
	lsls	r6, r2, #29	@ tmp314, *CurrentProc_157(D),
@ src/soar_voxel.c:657:   if ((CurrentProc->takeOffTransition) &
	lsrs	r6, r6, #31	@ tmp324, tmp314,
@ src/soar_voxel.c:653:       (cam_dx_Angles[(CurrentProc->oceanClock >> 2)] |
	ldr	r1, .L157+4	@ tmp272,
@ src/soar_voxel.c:657:   if ((CurrentProc->takeOffTransition) &
	tst	r6, r3	@ tmp324, tmp316
	beq	.L103		@,
@ src/soar_voxel.c:660:         (CurrentProc->sPlayerPosZ - (CAMERA_Z_STEP))) {
	ldr	r6, [r4, #52]	@ _17, CurrentProc_157(D)->sPlayerPosZ
@ src/soar_voxel.c:659:     if (getPtHeight_thumb(CurrentProc->sFocusPtX, CurrentProc->sFocusPtY) >
	ldr	r1, [r4, #76]	@, CurrentProc_157(D)->sFocusPtY
	ldr	r0, [r4, #72]	@, CurrentProc_157(D)->sFocusPtX
	bl	getPtHeight_thumb		@
@ src/soar_voxel.c:659:     if (getPtHeight_thumb(CurrentProc->sFocusPtX, CurrentProc->sFocusPtY) >
	movs	r3, r6	@ _18, _17
	subs	r3, r3, #31	@ _18,
@ src/soar_voxel.c:659:     if (getPtHeight_thumb(CurrentProc->sFocusPtX, CurrentProc->sFocusPtY) >
	cmp	r3, r0	@ _18, _21
	bgt	.L104		@,
@ src/soar_voxel.c:661:       CurrentProc->sPlayerPosZ += CAMERA_Z_STEP;
	adds	r6, r6, #32	@ _17,
@ src/soar_voxel.c:662:       CurrentProc->sPlayerStepZ += 1;
	adds	r5, r5, #1	@ _15,
.L104:
@ src/soar_voxel.c:664:     CurrentProc->sPlayerPosZ += CAMERA_Z_STEP;
	adds	r6, r6, #32	@ _25,
	str	r6, [r4, #52]	@ _25, CurrentProc_157(D)->sPlayerPosZ
@ src/soar_voxel.c:665:     CurrentProc->sPlayerStepZ += 1;
	adds	r5, r5, #1	@ _27,
.L154:
@ src/soar_voxel.c:679:       CurrentProc->sPlayerStepZ -= 1;
	str	r5, [r4, #56]	@ _38, CurrentProc_157(D)->sPlayerStepZ
.L105:
@ src/soar_voxel.c:666:     return 1;
	movs	r0, #1	@ <retval>,
	b	.L102		@
.L103:
@ src/soar_voxel.c:668:     CurrentProc->takeOffTransition = 0;
	movs	r3, #4	@ tmp336,
	bics	r2, r3	@ tmp335, tmp336
	ldr	r3, [sp]	@ tmp310, %sfp
	strb	r2, [r3]	@ tmp335, CurrentProc_157(D)->takeOffTransition
@ src/soar_voxel.c:670:   if (CurrentProc->landingTransition) {
	lsls	r3, r2, #24	@ _28, tmp335,
	lsrs	r3, r3, #24	@ _28, _28,
@ src/soar_voxel.c:670:   if (CurrentProc->landingTransition) {
	lsls	r2, r2, #28	@ tmp677, tmp335,
	bpl	.L106		@,
@ src/soar_voxel.c:672:         (CurrentProc->sPlayerPosZ - (2 * CAMERA_Z_STEP))) {
	ldr	r6, [r4, #52]	@ _30, CurrentProc_157(D)->sPlayerPosZ
@ src/soar_voxel.c:671:     if (getPtHeight_thumb(CurrentProc->sFocusPtX, CurrentProc->sFocusPtY) >
	ldr	r1, [r4, #76]	@, CurrentProc_157(D)->sFocusPtY
	ldr	r0, [r4, #72]	@, CurrentProc_157(D)->sFocusPtX
	bl	getPtHeight_thumb		@
@ src/soar_voxel.c:671:     if (getPtHeight_thumb(CurrentProc->sFocusPtX, CurrentProc->sFocusPtY) >
	movs	r3, r6	@ _31, _30
	subs	r3, r3, #63	@ _31,
@ src/soar_voxel.c:671:     if (getPtHeight_thumb(CurrentProc->sFocusPtX, CurrentProc->sFocusPtY) >
	cmp	r3, r0	@ _31, _34
	bgt	.L107		@,
@ src/soar_voxel.c:673:       if (gChapterData.muteSfxOption == 0)
	ldr	r3, .L157+8	@ tmp350,
	ldrb	r3, [r3]	@, gChapterData
@ src/soar_voxel.c:673:       if (gChapterData.muteSfxOption == 0)
	lsls	r3, r3, #30	@ tmp678, gChapterData,
	bmi	.L108		@,
@ src/soar_voxel.c:674:         m4aSongNumStart(0x73); // phase transition
	movs	r0, #115	@,
	ldr	r3, .L157+12	@ tmp358,
	bl	.L9		@
.L108:
@ src/soar_voxel.c:675:       EndLoop(CurrentProc);
	movs	r0, r4	@, CurrentProc
	bl	EndLoop		@
@ src/soar_voxel.c:676:       return 0;
	movs	r0, #0	@ <retval>,
.L102:
@ src/soar_voxel.c:831: };
	add	sp, sp, #20	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L107:
@ src/soar_voxel.c:678:       CurrentProc->sPlayerPosZ -= CAMERA_Z_STEP;
	subs	r6, r6, #32	@ _37,
	str	r6, [r4, #52]	@ _37, CurrentProc_157(D)->sPlayerPosZ
@ src/soar_voxel.c:679:       CurrentProc->sPlayerStepZ -= 1;
	subs	r5, r5, #1	@ _38,
	b	.L154		@
.L106:
@ src/soar_voxel.c:686:   if (gKeyState.heldKeys & DPAD_LEFT) {
	movs	r0, #32	@ tmp363,
@ src/soar_voxel.c:686:   if (gKeyState.heldKeys & DPAD_LEFT) {
	ldr	r6, .L157+16	@ tmp361,
	ldrh	r2, [r6, #4]	@ _39,
@ src/soar_voxel.c:686:   if (gKeyState.heldKeys & DPAD_LEFT) {
	mov	ip, r0	@ tmp363, tmp363
	tst	r2, r0	@ _39, tmp363
	bne	.LCB1236	@
	b	.L110	@long jump	@
.LCB1236:
@ src/soar_voxel.c:688:     if (CurrentProc->turningCooldown) {
	movs	r7, #96	@ tmp368,
@ src/soar_voxel.c:688:     if (CurrentProc->turningCooldown) {
	tst	r3, r7	@ _28, tmp368
	bne	.LCB1242	@
	b	.L111	@long jump	@
.LCB1242:
.L114:
@ src/soar_voxel.c:689:       CurrentProc->turningCooldown--;
	movs	r1, #3	@ tmp389,
@ src/soar_voxel.c:689:       CurrentProc->turningCooldown--;
	ldr	r3, [sp]	@ tmp310, %sfp
	ldrb	r2, [r3]	@ *CurrentProc_157(D), *CurrentProc_157(D)
	lsls	r3, r2, #25	@ tmp385, *CurrentProc_157(D),
	lsrs	r3, r3, #30	@ _41, tmp385,
@ src/soar_voxel.c:689:       CurrentProc->turningCooldown--;
	adds	r3, r3, #3	@ tmp386,
	ands	r3, r1	@ tmp388, tmp389
	adds	r1, r1, #93	@ tmp403,
	lsls	r3, r3, #5	@ tmp399, tmp388,
	bics	r2, r1	@ tmp402, tmp403
	orrs	r2, r3	@ tmp406, tmp399
	ldr	r3, [sp]	@ tmp310, %sfp
	strb	r2, [r3]	@ tmp406, CurrentProc_157(D)->turningCooldown
.L112:
@ src/soar_voxel.c:738:   CurrentProc->sPlayerPosX += cam_dx_Angles[CurrentProc->sPlayerYaw];
	ldr	r3, [r4, #60]	@ _84, CurrentProc_157(D)->sPlayerYaw
@ src/soar_voxel.c:738:   CurrentProc->sPlayerPosX += cam_dx_Angles[CurrentProc->sPlayerYaw];
	ldr	r2, .L157	@ tmp507,
	lsls	r3, r3, #1	@ tmp508, _84,
	adds	r2, r2, r3	@ tmp509, tmp507, tmp508
	ldr	r5, .L157+4	@ tmp506,
	movs	r1, #62	@ _86,
	ldrsh	r1, [r2, r1]	@ _86, tmp509, _86
@ src/soar_voxel.c:738:   CurrentProc->sPlayerPosX += cam_dx_Angles[CurrentProc->sPlayerYaw];
	ldr	r2, [r4, #44]	@ CurrentProc_157(D)->sPlayerPosX, CurrentProc_157(D)->sPlayerPosX
	adds	r1, r1, r2	@ _87, _86, CurrentProc_157(D)->sPlayerPosX
@ src/soar_voxel.c:739:   CurrentProc->sPlayerPosY += cam_dy_Angles[CurrentProc->sPlayerYaw];
	movs	r2, r5	@ tmp516, tmp506
	adds	r2, r2, #96	@ tmp516,
	ldrsh	r2, [r3, r2]	@ _90, cam_dy_Angles
@ src/soar_voxel.c:739:   CurrentProc->sPlayerPosY += cam_dy_Angles[CurrentProc->sPlayerYaw];
	ldr	r0, [r4, #48]	@ CurrentProc_157(D)->sPlayerPosY, CurrentProc_157(D)->sPlayerPosY
	adds	r2, r2, r0	@ _91, _90, CurrentProc_157(D)->sPlayerPosY
@ src/soar_voxel.c:742:       cam_pivot_dx_Angles[CurrentProc->sPlayerYaw]; // set focal point
	ldrsh	r0, [r3, r5]	@ _93, cam_pivot_dx_Angles
@ src/soar_voxel.c:738:   CurrentProc->sPlayerPosX += cam_dx_Angles[CurrentProc->sPlayerYaw];
	str	r1, [r4, #44]	@ _87, CurrentProc_157(D)->sPlayerPosX
@ src/soar_voxel.c:745:       cam_pivot_dy_Angles[CurrentProc->sPlayerYaw]; // set focal point
	adds	r3, r5, r3	@ tmp526, tmp506, tmp508
@ src/soar_voxel.c:741:       CurrentProc->sPlayerPosX +
	adds	r1, r0, r1	@ _94, _93, _87
@ src/soar_voxel.c:740:   CurrentProc->sFocusPtX =
	str	r1, [r4, #72]	@ _94, CurrentProc_157(D)->sFocusPtX
@ src/soar_voxel.c:745:       cam_pivot_dy_Angles[CurrentProc->sPlayerYaw]; // set focal point
	movs	r1, #32	@ tmp698,
	ldrsh	r3, [r3, r1]	@ _96, tmp526, tmp698
@ src/soar_voxel.c:739:   CurrentProc->sPlayerPosY += cam_dy_Angles[CurrentProc->sPlayerYaw];
	str	r2, [r4, #48]	@ _91, CurrentProc_157(D)->sPlayerPosY
@ src/soar_voxel.c:744:       CurrentProc->sPlayerPosY +
	adds	r3, r3, r2	@ _97, _96, _91
@ src/soar_voxel.c:748:   if (gKeyState.pressedKeys & (START_BUTTON | A_BUTTON)) {
	movs	r2, #9	@ tmp534,
@ src/soar_voxel.c:743:   CurrentProc->sFocusPtY =
	str	r3, [r4, #76]	@ _97, CurrentProc_157(D)->sFocusPtY
@ src/soar_voxel.c:748:   if (gKeyState.pressedKeys & (START_BUTTON | A_BUTTON)) {
	ldr	r6, .L157+16	@ tmp530,
@ src/soar_voxel.c:748:   if (gKeyState.pressedKeys & (START_BUTTON | A_BUTTON)) {
	ldrh	r3, [r6, #8]	@,
	tst	r2, r3	@ tmp534, tmp531
	beq	.L116		@,
@ src/soar_voxel.c:749:     if (canLandHere(CurrentProc)) {
	movs	r0, r4	@, CurrentProc
	bl	canLandHere		@
@ src/soar_voxel.c:749:     if (canLandHere(CurrentProc)) {
	cmp	r0, #0	@ _99,
	bne	.LCB1293	@
	b	.L117	@long jump	@
.LCB1293:
@ src/soar_voxel.c:750:       CurrentProc->landingTransition = TRUE;
	movs	r2, r4	@ tmp540, CurrentProc
	movs	r3, #8	@ tmp546,
	adds	r2, r2, #69	@ tmp540,
	ldrb	r1, [r2]	@, CurrentProc_157(D)->landingTransition
	orrs	r3, r1	@ tmp545, CurrentProc_157(D)->landingTransition
	strb	r3, [r2]	@ tmp545, CurrentProc_157(D)->landingTransition
.L116:
@ src/soar_voxel.c:776:   if (gKeyState.pressedKeys & R_BUTTON) {
	ldrh	r3, [r6, #8]	@,
	lsls	r3, r3, #23	@ tmp681, tmp561,
	bpl	.L119		@,
@ src/soar_voxel.c:777:     CurrentProc->ShowMap ^= 1;
	movs	r0, #1	@ tmp580,
@ src/soar_voxel.c:777:     CurrentProc->ShowMap ^= 1;
	movs	r1, r4	@ tmp574, CurrentProc
@ src/soar_voxel.c:777:     CurrentProc->ShowMap ^= 1;
	movs	r7, r0	@ tmp587, tmp580
@ src/soar_voxel.c:777:     CurrentProc->ShowMap ^= 1;
	adds	r1, r1, #69	@ tmp574,
	ldrb	r3, [r1]	@ *CurrentProc_157(D), *CurrentProc_157(D)
	lsls	r2, r3, #31	@ tmp578, *CurrentProc_157(D),
	lsrs	r2, r2, #31	@ _103, tmp578,
@ src/soar_voxel.c:777:     CurrentProc->ShowMap ^= 1;
	bics	r7, r2	@ tmp587, _103
	bics	r3, r0	@ tmp591, tmp580
	orrs	r3, r7	@ tmp595, tmp587
	strb	r3, [r1]	@ tmp595, CurrentProc_157(D)->ShowMap
.L119:
@ src/soar_voxel.c:780:   if (gKeyState.heldKeys & B_BUTTON) { // turbo
	ldrh	r6, [r6, #4]	@ _105,
@ src/soar_voxel.c:780:   if (gKeyState.heldKeys & B_BUTTON) { // turbo
	lsls	r3, r6, #30	@ tmp682, _105,
	bpl	.L120		@,
@ src/soar_voxel.c:781:     CurrentProc->sPlayerPosX += cam_dx_Angles[CurrentProc->sPlayerYaw];
	ldr	r3, [r4, #60]	@ _107, CurrentProc_157(D)->sPlayerYaw
@ src/soar_voxel.c:781:     CurrentProc->sPlayerPosX += cam_dx_Angles[CurrentProc->sPlayerYaw];
	adds	r2, r5, #2	@ tmp604, tmp506,
	lsls	r3, r3, #1	@ tmp605, _107,
	adds	r2, r2, r3	@ tmp606, tmp604, tmp605
	movs	r0, #62	@ _109,
	ldrsh	r0, [r2, r0]	@ _109, tmp606, _109
@ src/soar_voxel.c:781:     CurrentProc->sPlayerPosX += cam_dx_Angles[CurrentProc->sPlayerYaw];
	ldr	r2, [r4, #44]	@ CurrentProc_157(D)->sPlayerPosX, CurrentProc_157(D)->sPlayerPosX
	adds	r2, r2, r0	@ _110, CurrentProc_157(D)->sPlayerPosX, _109
	str	r2, [r4, #44]	@ _110, CurrentProc_157(D)->sPlayerPosX
@ src/soar_voxel.c:782:     CurrentProc->sPlayerPosY += cam_dy_Angles[CurrentProc->sPlayerYaw];
	movs	r2, r5	@ tmp614, tmp506
	adds	r2, r2, #96	@ tmp614,
@ src/soar_voxel.c:782:     CurrentProc->sPlayerPosY += cam_dy_Angles[CurrentProc->sPlayerYaw];
	ldr	r1, [r4, #48]	@ pretmp_294, CurrentProc_157(D)->sPlayerPosY
@ src/soar_voxel.c:782:     CurrentProc->sPlayerPosY += cam_dy_Angles[CurrentProc->sPlayerYaw];
	ldrsh	r3, [r3, r2]	@ _113, cam_dy_Angles
@ src/soar_voxel.c:782:     CurrentProc->sPlayerPosY += cam_dy_Angles[CurrentProc->sPlayerYaw];
	adds	r3, r3, r1	@ _114, _113, pretmp_294
	str	r3, [r4, #48]	@ _114, CurrentProc_157(D)->sPlayerPosY
.L120:
	movs	r3, #128	@ tmp619,
	movs	r2, r6	@ _200, _105
	ands	r2, r3	@ _200, tmp619
	str	r2, [sp, #12]	@ _200, %sfp
@ src/soar_voxel.c:784:   if (gKeyState.heldKeys & DPAD_DOWN) { // hover
	tst	r6, r3	@ _105, tmp619
	beq	.L121		@,
@ src/soar_voxel.c:785:     CurrentProc->sPlayerPosX -= cam_dx_Angles[CurrentProc->sPlayerYaw];
	ldr	r2, [r4, #60]	@ _116, CurrentProc_157(D)->sPlayerYaw
@ src/soar_voxel.c:785:     CurrentProc->sPlayerPosX -= cam_dx_Angles[CurrentProc->sPlayerYaw];
	adds	r3, r5, #2	@ tmp622, tmp506,
	lsls	r2, r2, #1	@ tmp623, _116,
	adds	r3, r3, r2	@ tmp624, tmp622, tmp623
	movs	r0, #62	@ _118,
	ldrsh	r0, [r3, r0]	@ _118, tmp624, _118
@ src/soar_voxel.c:785:     CurrentProc->sPlayerPosX -= cam_dx_Angles[CurrentProc->sPlayerYaw];
	ldr	r3, [r4, #44]	@ CurrentProc_157(D)->sPlayerPosX, CurrentProc_157(D)->sPlayerPosX
@ src/soar_voxel.c:786:     CurrentProc->sPlayerPosY -= cam_dy_Angles[CurrentProc->sPlayerYaw];
	adds	r5, r5, #96	@ tmp632,
@ src/soar_voxel.c:785:     CurrentProc->sPlayerPosX -= cam_dx_Angles[CurrentProc->sPlayerYaw];
	subs	r3, r3, r0	@ _119, CurrentProc_157(D)->sPlayerPosX, _118
@ src/soar_voxel.c:786:     CurrentProc->sPlayerPosY -= cam_dy_Angles[CurrentProc->sPlayerYaw];
	ldr	r1, [r4, #48]	@ pretmp_292, CurrentProc_157(D)->sPlayerPosY
@ src/soar_voxel.c:785:     CurrentProc->sPlayerPosX -= cam_dx_Angles[CurrentProc->sPlayerYaw];
	str	r3, [r4, #44]	@ _119, CurrentProc_157(D)->sPlayerPosX
@ src/soar_voxel.c:786:     CurrentProc->sPlayerPosY -= cam_dy_Angles[CurrentProc->sPlayerYaw];
	ldrsh	r3, [r2, r5]	@ _122, cam_dy_Angles
@ src/soar_voxel.c:786:     CurrentProc->sPlayerPosY -= cam_dy_Angles[CurrentProc->sPlayerYaw];
	subs	r3, r1, r3	@ _123, pretmp_292, _122
	str	r3, [r4, #48]	@ _123, CurrentProc_157(D)->sPlayerPosY
.L121:
@ src/soar_voxel.c:793:       getPtHeight_thumb(CurrentProc->sFocusPtX, CurrentProc->sFocusPtY);
	ldr	r1, [r4, #76]	@, CurrentProc_157(D)->sFocusPtY
	ldr	r0, [r4, #72]	@, CurrentProc_157(D)->sFocusPtX
	bl	getPtHeight_thumb		@
@ src/soar_voxel.c:796:   int camera_ht = CurrentProc->sPlayerPosZ - (CAMERA_Z_STEP)-10;
	ldr	r5, [r4, #52]	@ _128, CurrentProc_157(D)->sPlayerPosZ
@ src/soar_voxel.c:796:   int camera_ht = CurrentProc->sPlayerPosZ - (CAMERA_Z_STEP)-10;
	movs	r7, r5	@ camera_ht, _128
@ src/soar_voxel.c:795:       getPtHeight_thumb(CurrentProc->sPlayerPosX, CurrentProc->sPlayerPosY);
	ldr	r3, [r4, #44]	@ _126, CurrentProc_157(D)->sPlayerPosX
	str	r3, [sp]	@ _126, %sfp
	ldr	r3, [r4, #48]	@ _127, CurrentProc_157(D)->sPlayerPosY
@ src/soar_voxel.c:796:   int camera_ht = CurrentProc->sPlayerPosZ - (CAMERA_Z_STEP)-10;
	subs	r7, r7, #42	@ camera_ht,
@ src/soar_voxel.c:793:       getPtHeight_thumb(CurrentProc->sFocusPtX, CurrentProc->sFocusPtY);
	str	r0, [sp, #8]	@, %sfp
@ src/soar_voxel.c:795:       getPtHeight_thumb(CurrentProc->sPlayerPosX, CurrentProc->sPlayerPosY);
	str	r3, [sp, #4]	@ _127, %sfp
@ src/soar_voxel.c:797:   if ((player_terrain_ht > (camera_ht)) || (camera_terrain_ht > camera_ht)) {
	cmp	r0, r7	@, camera_ht
	bgt	.L122		@,
@ src/soar_voxel.c:795:       getPtHeight_thumb(CurrentProc->sPlayerPosX, CurrentProc->sPlayerPosY);
	ldr	r1, [sp, #4]	@, %sfp
	ldr	r0, [sp]	@, %sfp
	bl	getPtHeight_thumb		@
@ src/soar_voxel.c:797:   if ((player_terrain_ht > (camera_ht)) || (camera_terrain_ht > camera_ht)) {
	cmp	r0, r7	@ camera_terrain_ht, camera_ht
	bgt	.LCB1386	@
	b	.L123	@long jump	@
.LCB1386:
.L122:
@ src/soar_voxel.c:799:     CurrentProc->sPlayerStepZ += 1;
	ldr	r3, [r4, #56]	@ CurrentProc_157(D)->sPlayerStepZ, CurrentProc_157(D)->sPlayerStepZ
@ src/soar_voxel.c:798:     CurrentProc->sPlayerPosZ += CAMERA_Z_STEP;
	adds	r5, r5, #32	@ _129,
	str	r5, [r4, #52]	@ _129, CurrentProc_157(D)->sPlayerPosZ
@ src/soar_voxel.c:799:     CurrentProc->sPlayerStepZ += 1;
	adds	r3, r3, #1	@ _131,
.L156:
@ src/soar_voxel.c:806:       CurrentProc->sPlayerStepZ -= 1;
	str	r3, [r4, #56]	@ _138, CurrentProc_157(D)->sPlayerStepZ
.L124:
@ src/soar_voxel.c:810:   if (gKeyState.heldKeys & DPAD_UP) {
	lsls	r6, r6, #25	@ tmp683, _105,
	bpl	.L126		@,
@ src/soar_voxel.c:811:     if (CurrentProc->sPlayerPosZ < CAMERA_MAX_HEIGHT) {
	movs	r2, #160	@ tmp650,
@ src/soar_voxel.c:811:     if (CurrentProc->sPlayerPosZ < CAMERA_MAX_HEIGHT) {
	ldr	r3, [r4, #52]	@ _139, CurrentProc_157(D)->sPlayerPosZ
@ src/soar_voxel.c:811:     if (CurrentProc->sPlayerPosZ < CAMERA_MAX_HEIGHT) {
	lsls	r2, r2, #1	@ tmp650, tmp650,
	cmp	r3, r2	@ _139, tmp650
	bge	.L126		@,
@ src/soar_voxel.c:812:       CurrentProc->sPlayerPosZ += CAMERA_Z_STEP;
	adds	r3, r3, #32	@ _140,
	str	r3, [r4, #52]	@ _140, CurrentProc_157(D)->sPlayerPosZ
@ src/soar_voxel.c:813:       CurrentProc->sPlayerStepZ += 1;
	ldr	r3, [r4, #56]	@ CurrentProc_157(D)->sPlayerStepZ, CurrentProc_157(D)->sPlayerStepZ
	adds	r3, r3, #1	@ _142,
	str	r3, [r4, #56]	@ _142, CurrentProc_157(D)->sPlayerStepZ
.L126:
@ src/soar_voxel.c:820:   if (CurrentProc->sPlayerPosX > (MAP_DIMENSIONS - 10))
	ldr	r3, .L157+20	@ tmp664,
	ldr	r2, [sp]	@ _126, %sfp
	cmp	r2, r3	@ _126, tmp664
	bgt	.LCB1418	@
	b	.L127	@long jump	@
.LCB1418:
@ src/soar_voxel.c:821:     CurrentProc->sPlayerPosX = MAP_DIMENSIONS - 10;
	str	r3, [r4, #44]	@ tmp664, CurrentProc_157(D)->sPlayerPosX
.L128:
@ src/soar_voxel.c:825:   if (CurrentProc->sPlayerPosY > (MAP_DIMENSIONS - 10))
	ldr	r2, [sp, #4]	@ _127, %sfp
	cmp	r2, r3	@ _127, tmp664
	bgt	.LCB1424	@
	b	.L129	@long jump	@
.LCB1424:
.L153:
@ src/soar_voxel.c:828:     CurrentProc->sPlayerPosY = 10;
	str	r3, [r4, #48]	@ tmp659, CurrentProc_157(D)->sPlayerPosY
	b	.L105		@
.L111:
@ src/soar_voxel.c:692:       newx = CurrentProc->sPlayerPosX +
	ldr	r2, [r4, #44]	@ pretmp_295, CurrentProc_157(D)->sPlayerPosX
	str	r2, [sp, #4]	@ pretmp_295, %sfp
@ src/soar_voxel.c:693:              cam_pivot_dx_Angles[CurrentProc->sPlayerYaw]; // step forward to
	ldr	r2, [r4, #60]	@ pretmp_296, CurrentProc_157(D)->sPlayerYaw
@ src/soar_voxel.c:693:              cam_pivot_dx_Angles[CurrentProc->sPlayerYaw]; // step forward to
	lsls	r6, r2, #1	@ tmp409, pretmp_296,
	ldrsh	r0, [r6, r1]	@ _298, cam_pivot_dx_Angles
	movs	r5, r0	@ _298, _298
@ src/soar_voxel.c:695:       newy = CurrentProc->sPlayerPosY +
	ldr	r0, [r4, #48]	@ pretmp_299, CurrentProc_157(D)->sPlayerPosY
@ src/soar_voxel.c:696:              cam_pivot_dy_Angles[CurrentProc->sPlayerYaw]; // step forward to
	adds	r6, r1, r6	@ tmp412, tmp272, tmp409
@ src/soar_voxel.c:695:       newy = CurrentProc->sPlayerPosY +
	str	r0, [sp, #8]	@ pretmp_299, %sfp
@ src/soar_voxel.c:696:              cam_pivot_dy_Angles[CurrentProc->sPlayerYaw]; // step forward to
	movs	r0, #32	@ tmp688,
	ldrsh	r6, [r6, r0]	@ _301, tmp412, tmp688
@ src/soar_voxel.c:691:       CurrentProc->turningCooldown = 1;
	mov	r0, ip	@ tmp363, tmp363
	bics	r3, r7	@ tmp421, tmp368
	orrs	r3, r0	@ tmp424, tmp363
	ldr	r0, [sp]	@ tmp310, %sfp
	strb	r3, [r0]	@ tmp424, CurrentProc_157(D)->turningCooldown
@ src/soar_voxel.c:695:       newy = CurrentProc->sPlayerPosY +
	ldr	r3, [sp, #8]	@ pretmp_299, %sfp
@ src/soar_voxel.c:692:       newx = CurrentProc->sPlayerPosX +
	ldr	r0, [sp, #4]	@ pretmp_295, %sfp
	adds	r0, r0, r5	@ pretmp_295, pretmp_295, _298
@ src/soar_voxel.c:695:       newy = CurrentProc->sPlayerPosY +
	adds	r5, r6, r3	@ _301, _301, pretmp_299
@ src/soar_voxel.c:698:       CurrentProc->sPlayerYaw = (CurrentProc->sPlayerYaw - 1) &
	movs	r3, #15	@ tmp428,
@ src/soar_voxel.c:698:       CurrentProc->sPlayerYaw = (CurrentProc->sPlayerYaw - 1) &
	subs	r2, r2, #1	@ _51,
@ src/soar_voxel.c:698:       CurrentProc->sPlayerYaw = (CurrentProc->sPlayerYaw - 1) &
	ands	r2, r3	@ _52, tmp428
@ src/soar_voxel.c:698:       CurrentProc->sPlayerYaw = (CurrentProc->sPlayerYaw - 1) &
	str	r2, [r4, #60]	@ _52, CurrentProc_157(D)->sPlayerYaw
@ src/soar_voxel.c:702:       newy -= (cam_pivot_dy_Angles[CurrentProc->sPlayerYaw] >> 2) *
	lsls	r2, r2, #1	@ tmp430, _52,
	adds	r3, r1, r2	@ tmp431, tmp272, tmp430
@ src/soar_voxel.c:702:       newy -= (cam_pivot_dy_Angles[CurrentProc->sPlayerYaw] >> 2) *
	movs	r6, #32	@ tmp689,
	ldrsh	r3, [r3, r6]	@ tmp433, tmp431, tmp689
	asrs	r3, r3, #2	@ _59, tmp433,
@ src/soar_voxel.c:702:       newy -= (cam_pivot_dy_Angles[CurrentProc->sPlayerYaw] >> 2) *
	lsls	r6, r3, #2	@ tmp437, _59,
	subs	r3, r3, r6	@ _60, _59, tmp437
@ src/soar_voxel.c:702:       newy -= (cam_pivot_dy_Angles[CurrentProc->sPlayerYaw] >> 2) *
	adds	r5, r3, r5	@ newy, _60, newy
@ src/soar_voxel.c:700:       newx -= (cam_pivot_dx_Angles[CurrentProc->sPlayerYaw] >> 2) *
	ldrsh	r3, [r2, r1]	@ tmp441, cam_pivot_dx_Angles
	asrs	r3, r3, #2	@ _55, tmp441,
@ src/soar_voxel.c:700:       newx -= (cam_pivot_dx_Angles[CurrentProc->sPlayerYaw] >> 2) *
	lsls	r2, r3, #2	@ tmp445, _55,
	subs	r3, r3, r2	@ _56, _55, tmp445
@ src/soar_voxel.c:700:       newx -= (cam_pivot_dx_Angles[CurrentProc->sPlayerYaw] >> 2) *
	adds	r3, r3, r0	@ newx_175, _56, newx
@ src/soar_voxel.c:706:       BumpScreen(bump_left);
	movs	r0, #2	@,
@ src/soar_voxel.c:704:       CurrentProc->sPlayerPosX = newx;
	str	r3, [r4, #44]	@ newx_175, CurrentProc_157(D)->sPlayerPosX
@ src/soar_voxel.c:705:       CurrentProc->sPlayerPosY = newy;
	str	r5, [r4, #48]	@ newy, CurrentProc_157(D)->sPlayerPosY
.L155:
@ src/soar_voxel.c:727:       BumpScreen(bump_right);
	bl	BumpScreen		@
	b	.L112		@
.L110:
@ src/soar_voxel.c:708:   } else if (gKeyState.heldKeys & DPAD_RIGHT) {
	lsls	r2, r2, #27	@ tmp679, _39,
	bpl	.L113		@,
@ src/soar_voxel.c:709:     if (CurrentProc->turningCooldown) {
	movs	r7, #96	@ tmp454,
@ src/soar_voxel.c:709:     if (CurrentProc->turningCooldown) {
	tst	r3, r7	@ _28, tmp454
	beq	.LCB1489	@
	b	.L114	@long jump	@
.LCB1489:
@ src/soar_voxel.c:692:       newx = CurrentProc->sPlayerPosX +
	ldr	r2, [r4, #44]	@ pretmp_302, CurrentProc_157(D)->sPlayerPosX
	str	r2, [sp, #4]	@ pretmp_302, %sfp
@ src/soar_voxel.c:693:              cam_pivot_dx_Angles[CurrentProc->sPlayerYaw]; // step forward to
	ldr	r2, [r4, #60]	@ pretmp_303, CurrentProc_157(D)->sPlayerYaw
@ src/soar_voxel.c:693:              cam_pivot_dx_Angles[CurrentProc->sPlayerYaw]; // step forward to
	lsls	r6, r2, #1	@ tmp459, pretmp_303,
@ src/soar_voxel.c:714:              cam_pivot_dx_Angles[CurrentProc->sPlayerYaw]; // step forward to
	ldrsh	r0, [r6, r1]	@ _305, cam_pivot_dx_Angles
@ src/soar_voxel.c:712:       CurrentProc->turningCooldown = 1;
	mov	r5, ip	@ tmp363, tmp363
	bics	r3, r7	@ tmp471, tmp454
	orrs	r5, r3	@ tmp363, tmp471
@ src/soar_voxel.c:714:              cam_pivot_dx_Angles[CurrentProc->sPlayerYaw]; // step forward to
	str	r0, [sp, #8]	@ _305, %sfp
@ src/soar_voxel.c:712:       CurrentProc->turningCooldown = 1;
	ldr	r3, [sp]	@ tmp310, %sfp
@ src/soar_voxel.c:695:       newy = CurrentProc->sPlayerPosY +
	ldr	r0, [r4, #48]	@ pretmp_306, CurrentProc_157(D)->sPlayerPosY
@ src/soar_voxel.c:696:              cam_pivot_dy_Angles[CurrentProc->sPlayerYaw]; // step forward to
	adds	r6, r1, r6	@ tmp462, tmp272, tmp459
@ src/soar_voxel.c:712:       CurrentProc->turningCooldown = 1;
	strb	r5, [r3]	@ tmp474, CurrentProc_157(D)->turningCooldown
@ src/soar_voxel.c:695:       newy = CurrentProc->sPlayerPosY +
	str	r0, [sp, #12]	@ pretmp_306, %sfp
@ src/soar_voxel.c:713:       newx = CurrentProc->sPlayerPosX +
	ldr	r3, [sp, #8]	@ _305, %sfp
@ src/soar_voxel.c:717:              cam_pivot_dy_Angles[CurrentProc->sPlayerYaw]; // step forward to
	movs	r0, #32	@ tmp692,
	ldrsh	r6, [r6, r0]	@ _308, tmp462, tmp692
@ src/soar_voxel.c:713:       newx = CurrentProc->sPlayerPosX +
	ldr	r0, [sp, #4]	@ pretmp_302, %sfp
	adds	r0, r0, r3	@ pretmp_302, pretmp_302, _305
@ src/soar_voxel.c:716:       newy = CurrentProc->sPlayerPosY +
	ldr	r3, [sp, #12]	@ pretmp_306, %sfp
	adds	r5, r6, r3	@ _308, _308, pretmp_306
@ src/soar_voxel.c:719:       CurrentProc->sPlayerYaw = (CurrentProc->sPlayerYaw + 1) &
	movs	r3, #15	@ tmp478,
@ src/soar_voxel.c:719:       CurrentProc->sPlayerYaw = (CurrentProc->sPlayerYaw + 1) &
	adds	r2, r2, #1	@ _72,
@ src/soar_voxel.c:719:       CurrentProc->sPlayerYaw = (CurrentProc->sPlayerYaw + 1) &
	ands	r2, r3	@ _73, tmp478
@ src/soar_voxel.c:719:       CurrentProc->sPlayerYaw = (CurrentProc->sPlayerYaw + 1) &
	str	r2, [r4, #60]	@ _73, CurrentProc_157(D)->sPlayerYaw
@ src/soar_voxel.c:723:       newy -= (cam_pivot_dy_Angles[CurrentProc->sPlayerYaw] >> 2) *
	lsls	r2, r2, #1	@ tmp480, _73,
	adds	r3, r1, r2	@ tmp481, tmp272, tmp480
@ src/soar_voxel.c:723:       newy -= (cam_pivot_dy_Angles[CurrentProc->sPlayerYaw] >> 2) *
	movs	r6, #32	@ tmp693,
	ldrsh	r3, [r3, r6]	@ tmp483, tmp481, tmp693
	asrs	r3, r3, #2	@ _80, tmp483,
@ src/soar_voxel.c:723:       newy -= (cam_pivot_dy_Angles[CurrentProc->sPlayerYaw] >> 2) *
	lsls	r6, r3, #2	@ tmp487, _80,
	subs	r3, r3, r6	@ _81, _80, tmp487
@ src/soar_voxel.c:723:       newy -= (cam_pivot_dy_Angles[CurrentProc->sPlayerYaw] >> 2) *
	adds	r5, r3, r5	@ newy, _81, newy
@ src/soar_voxel.c:721:       newx -= (cam_pivot_dx_Angles[CurrentProc->sPlayerYaw] >> 2) *
	ldrsh	r3, [r2, r1]	@ tmp491, cam_pivot_dx_Angles
	asrs	r3, r3, #2	@ _76, tmp491,
@ src/soar_voxel.c:721:       newx -= (cam_pivot_dx_Angles[CurrentProc->sPlayerYaw] >> 2) *
	lsls	r2, r3, #2	@ tmp495, _76,
	subs	r3, r3, r2	@ _77, _76, tmp495
@ src/soar_voxel.c:721:       newx -= (cam_pivot_dx_Angles[CurrentProc->sPlayerYaw] >> 2) *
	adds	r3, r3, r0	@ newx_165, _77, newx
@ src/soar_voxel.c:725:       CurrentProc->sPlayerPosX = newx;
	str	r3, [r4, #44]	@ newx_165, CurrentProc_157(D)->sPlayerPosX
@ src/soar_voxel.c:727:       BumpScreen(bump_right);
	movs	r0, #3	@,
@ src/soar_voxel.c:726:       CurrentProc->sPlayerPosY = newy;
	str	r5, [r4, #48]	@ newy, CurrentProc_157(D)->sPlayerPosY
	b	.L155		@
.L113:
@ src/soar_voxel.c:729:   } else if (gKeyState.prevKeys & (DPAD_LEFT | DPAD_RIGHT)) {
	movs	r2, #48	@ tmp502,
	ldrh	r3, [r6, #10]	@,
	tst	r2, r3	@ tmp502, tmp499
	bne	.LCB1541	@
	b	.L112	@long jump	@
.LCB1541:
	bl	BumpScreen.part.0		@
@ src/soar_voxel.c:579: };
	b	.L112		@
.L117:
@ src/soar_voxel.c:751:     } else if (gChapterData.muteSfxOption == 0)
	ldr	r3, .L157+8	@ tmp551,
	ldrb	r3, [r3]	@, gChapterData
@ src/soar_voxel.c:751:     } else if (gChapterData.muteSfxOption == 0)
	lsls	r3, r3, #30	@ tmp680, gChapterData,
	bpl	.LCB1555	@
	b	.L116	@long jump	@
.LCB1555:
@ src/soar_voxel.c:752:       m4aSongNumStart(0x6c); // invalid sfx
	movs	r0, #108	@,
	ldr	r3, .L157+12	@ tmp559,
	bl	.L9		@
	b	.L116		@
.L123:
@ src/soar_voxel.c:800:   } else if (gKeyState.heldKeys & DPAD_DOWN) { // prevent clipping through
	ldr	r3, [sp, #12]	@ _200, %sfp
	cmp	r3, #0	@ _200,
	bne	.LCB1565	@
	b	.L124	@long jump	@
.LCB1565:
@ src/soar_voxel.c:802:     if ((CurrentProc->sPlayerPosZ > CAMERA_MIN_HEIGHT) &
	ldr	r3, [sp, #8]	@ player_terrain_ht, %sfp
@ src/soar_voxel.c:804:         (camera_ht > (camera_terrain_ht + CAMERA_Z_STEP))) {
	adds	r0, r0, #32	@ _134,
@ src/soar_voxel.c:802:     if ((CurrentProc->sPlayerPosZ > CAMERA_MIN_HEIGHT) &
	adds	r3, r3, #32	@ player_terrain_ht,
	cmp	r3, r0	@ _223, _134
	bge	.L125		@,
	movs	r3, r0	@ _223, _134
.L125:
	cmp	r7, r3	@ camera_ht, _223
	bgt	.LCB1576	@
	b	.L124	@long jump	@
.LCB1576:
@ src/soar_voxel.c:806:       CurrentProc->sPlayerStepZ -= 1;
	ldr	r3, [r4, #56]	@ CurrentProc_157(D)->sPlayerStepZ, CurrentProc_157(D)->sPlayerStepZ
@ src/soar_voxel.c:805:       CurrentProc->sPlayerPosZ -= CAMERA_Z_STEP;
	subs	r5, r5, #32	@ _136,
	str	r5, [r4, #52]	@ _136, CurrentProc_157(D)->sPlayerPosZ
@ src/soar_voxel.c:806:       CurrentProc->sPlayerStepZ -= 1;
	subs	r3, r3, #1	@ _138,
	b	.L156		@
.L127:
@ src/soar_voxel.c:822:   else if (CurrentProc->sPlayerPosX < 10)
	ldr	r2, [sp]	@ _126, %sfp
	cmp	r2, #9	@ _126,
	ble	.LCB1587	@
	b	.L128	@long jump	@
.LCB1587:
@ src/soar_voxel.c:823:     CurrentProc->sPlayerPosX = 10;
	movs	r2, #10	@ tmp656,
	str	r2, [r4, #44]	@ tmp656, CurrentProc_157(D)->sPlayerPosX
	b	.L128		@
.L129:
@ src/soar_voxel.c:827:   else if (CurrentProc->sPlayerPosY < 10)
	ldr	r3, [sp, #4]	@ _127, %sfp
	cmp	r3, #9	@ _127,
	ble	.LCB1596	@
	b	.L105	@long jump	@
.LCB1596:
@ src/soar_voxel.c:828:     CurrentProc->sPlayerPosY = 10;
	movs	r3, #10	@ tmp659,
	b	.L153		@
.L158:
	.align	2
.L157:
	.word	.LANCHOR0+2
	.word	.LANCHOR0
	.word	gChapterData+65
	.word	m4aSongNumStart
	.word	gKeyState
	.word	1014
	.size	thumb_loop, .-thumb_loop
	.global	translatedLocations
	.global	WorldMapNodes
	.global	gObj_aff32x32
	.global	gObj_64x64
	.global	gObj_32x8
	.global	PkOamData
	.global	cam_pivot_dy_Angles
	.global	cam_pivot_dx_Angles
	.global	cam_dy_Angles
	.global	cam_dx_Angles
	.global	fogClrs
	.global	skies
	.global	Proc_Soaring
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC76:
	.ascii	"NewWorldMap\000"
	.global	originCoords
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cam_pivot_dx_Angles, %object
	.size	cam_pivot_dx_Angles, 32
cam_pivot_dx_Angles:
	.short	0
	.short	24
	.short	45
	.short	58
	.short	64
	.short	58
	.short	45
	.short	24
	.short	0
	.short	-24
	.short	-45
	.short	-58
	.short	-64
	.short	-58
	.short	-45
	.short	-24
	.type	cam_pivot_dy_Angles, %object
	.size	cam_pivot_dy_Angles, 32
cam_pivot_dy_Angles:
	.short	-64
	.short	-58
	.short	-45
	.short	-24
	.short	0
	.short	24
	.short	45
	.short	58
	.short	64
	.short	58
	.short	45
	.short	24
	.short	0
	.short	-24
	.short	-45
	.short	-58
	.type	cam_dx_Angles, %object
	.size	cam_dx_Angles, 32
cam_dx_Angles:
	.short	0
	.short	1
	.short	2
	.short	3
	.short	4
	.short	3
	.short	2
	.short	1
	.short	0
	.short	-1
	.short	-2
	.short	-3
	.short	-4
	.short	-3
	.short	-2
	.short	-1
	.type	cam_dy_Angles, %object
	.size	cam_dy_Angles, 32
cam_dy_Angles:
	.short	-4
	.short	-3
	.short	-2
	.short	-1
	.short	0
	.short	1
	.short	2
	.short	3
	.short	4
	.short	3
	.short	2
	.short	1
	.short	0
	.short	-1
	.short	-2
	.short	-3
	.type	translatedLocations, %object
	.size	translatedLocations, 12
translatedLocations:
	.ascii	"\000\001\002\003\004\005\006\007\010\011\012\013"
	.type	WorldMapNodes, %object
	.size	WorldMapNodes, 256
WorldMapNodes:
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000"
	.ascii	"\013\013\000\000\000\000\000\000\000\000\000\004\000"
	.ascii	"\000\000\000"
	.ascii	"\013\013\003\000\000\000\000\000\000\000\004\004\004"
	.ascii	"\000\000\000"
	.ascii	"\013\003\003\003\000\000\000\000\000\000\000\004\000"
	.ascii	"\000\000\000"
	.ascii	"\000\000\003\000\000\000\000\000\010\000\011\011\000"
	.ascii	"\000\006\000"
	.ascii	"\000\000\000\000\000\000\000\010\010\010\011\011\000"
	.ascii	"\006\006\006"
	.ascii	"\000\000\002\000\000\000\000\000\010\000\011\011\000"
	.ascii	"\000\006\000"
	.ascii	"\000\002\002\002\000\000\000\000\000\000\005\005\000"
	.ascii	"\000\000\000"
	.ascii	"\000\000\001\000\000\000\000\000\000\000\005\005\005"
	.ascii	"\000\000\000"
	.ascii	"\000\001\001\001\000\000\000\000\000\007\000\005\000"
	.ascii	"\000\000\000"
	.ascii	"\000\000\001\000\000\000\000\000\007\007\007\000\000"
	.ascii	"\000\000\000"
	.ascii	"\000\000\012\000\000\000\000\000\000\007\000\000\000"
	.ascii	"\000\000\000"
	.ascii	"\000\012\012\012\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000"
	.ascii	"\000\000\012\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000"
	.type	gObj_aff32x32, %object
	.size	gObj_aff32x32, 6
gObj_aff32x32:
	.short	1
	.short	1024
	.short	-32768
	.type	gObj_64x64, %object
	.size	gObj_64x64, 6
gObj_64x64:
	.short	1
	.short	0
	.short	-16384
	.type	gObj_32x8, %object
	.size	gObj_32x8, 6
gObj_32x8:
	.short	1
	.short	16384
	.short	16384
	.space	2
	.type	PkOamData, %object
	.size	PkOamData, 4
PkOamData:
	.space	4
	.type	fogClrs, %object
	.size	fogClrs, 10
fogClrs:
	.short	32628
	.short	32628
	.short	27277
	.short	20935
	.short	13536
	.space	2
	.type	skies, %object
	.size	skies, 20
skies:
	.word	SkyBG
	.word	SkyBG
	.word	SkyBG
	.word	SkyBG
	.word	SkyBG
	.type	Proc_Soaring, %object
	.size	Proc_Soaring, 152
Proc_Soaring:
@ type:
	.short	1
@ sArg:
	.short	0
@ lArg:
	.word	.LC76
@ type:
	.short	2
@ sArg:
	.short	0
@ lArg:
	.word	LockGameLogic
@ type:
	.short	2
@ sArg:
	.short	0
@ lArg:
	.word	LockGameGraphicsLogic
@ type:
	.short	2
@ sArg:
	.short	0
@ lArg:
	.word	MU_AllDisable
@ type:
	.short	24
@ sArg:
	.short	8
@ lArg:
	.word	NewFadeIn
@ type:
	.short	20
@ sArg:
	.short	0
@ lArg:
	.word	FadeInExists
@ type:
	.short	14
@ sArg:
	.short	1
@ lArg:
	.word	0
@ type:
	.short	2
@ sArg:
	.short	0
@ lArg:
	.word	SetUpNewWMGraphics
@ type:
	.short	14
@ sArg:
	.short	8
@ lArg:
	.word	0
@ type:
	.short	3
@ sArg:
	.short	0
@ lArg:
	.word	50360320
@ type:
	.short	2
@ sArg:
	.short	0
@ lArg:
	.word	SoaringLandRoutine
@ type:
	.short	2
@ sArg:
	.short	0
@ lArg:
	.word	134848105
@ type:
	.short	24
@ sArg:
	.short	8
@ lArg:
	.word	NewFadeIn
@ type:
	.short	20
@ sArg:
	.short	0
@ lArg:
	.word	FadeInExists
@ type:
	.short	14
@ sArg:
	.short	1
@ lArg:
	.word	0
@ type:
	.short	2
@ sArg:
	.short	0
@ lArg:
	.word	UnlockGameLogic
@ type:
	.short	2
@ sArg:
	.short	0
@ lArg:
	.word	UnlockGameGraphicsLogic
@ type:
	.short	2
@ sArg:
	.short	0
@ lArg:
	.word	MU_AllEnable
@ type:
	.short	0
@ sArg:
	.short	0
@ lArg:
	.word	0
	.type	originCoords, %object
	.size	originCoords, 212
originCoords:
	.ascii	"\002\013"
	.ascii	"\002\013"
	.ascii	"\002\012"
	.ascii	"\002\011"
	.ascii	"\002\010"
	.ascii	"\002\007"
	.ascii	"\002\007"
	.ascii	"\002\006"
	.ascii	"\002\005"
	.ascii	"\002\005"
	.ascii	"\004\005"
	.ascii	"\007\004"
	.ascii	"\010\004"
	.ascii	"\010\004"
	.ascii	"\010\004"
	.ascii	"\011\004"
	.ascii	"\013\004"
	.ascii	"\013\004"
	.ascii	"\013\003"
	.ascii	"\014\003"
	.ascii	"\013\005"
	.ascii	"\013\010"
	.ascii	"\013\012"
	.ascii	"\013\012"
	.ascii	"\013\012"
	.ascii	"\014\012"
	.ascii	"\014\012"
	.ascii	"\014\004"
	.ascii	"\015\004"
	.ascii	"\016\004"
	.ascii	"\016\005"
	.ascii	"\016\006"
	.ascii	"\016\007"
	.ascii	"\011\007"
	.ascii	"\016\007"
	.ascii	"\016\007"
	.ascii	"\016\007"
	.ascii	"\016\007"
	.ascii	"\016\007"
	.ascii	"\016\010"
	.ascii	"\016\011"
	.ascii	"\015\013"
	.ascii	"\014\014"
	.ascii	"\012\014"
	.ascii	"\011\014"
	.ascii	"\011\014"
	.ascii	"\011\014"
	.ascii	"\011\014"
	.ascii	"\011\014"
	.ascii	"\011\014"
	.ascii	"\007\014"
	.ascii	"\004\013"
	.ascii	"\004\011"
	.ascii	"\007\007"
	.ascii	"\010\007"
	.ascii	"\010\007"
	.ascii	"\014\007"
	.ascii	"\013\007"
	.ascii	"\013\007"
	.ascii	"\013\007"
	.ascii	"\011\016"
	.ascii	"\006\016"
	.ascii	"\003\016"
	.ascii	"\002\016"
	.ascii	"\002\016"
	.ascii	"\002\015"
	.ascii	"\002\011"
	.ascii	"\001\011"
	.ascii	"\001\010"
	.ascii	"\001\007"
	.ascii	"\001\005"
	.ascii	"\000\000"
	.ascii	"\000\000"
	.ascii	"\013\007"
	.ascii	"\013\007"
	.ascii	"\013\007"
	.ascii	"\013\007"
	.ascii	"\013\007"
	.ascii	"\006\016"
	.ascii	"\006\016"
	.ascii	"\006\016"
	.ascii	"\006\016"
	.ascii	"\006\016"
	.ascii	"\002\016"
	.ascii	"\002\016"
	.ascii	"\002\016"
	.ascii	"\002\016"
	.ascii	"\016\005"
	.ascii	"\012\004"
	.ascii	"\012\004"
	.ascii	"\012\004"
	.ascii	"\001\005"
	.ascii	"\001\005"
	.ascii	"\001\005"
	.ascii	"\001\004"
	.ascii	"\001\004"
	.ascii	"\001\004"
	.ascii	"\001\004"
	.ascii	"\001\004"
	.ascii	"\001\004"
	.ascii	"\000\000"
	.ascii	"\001\004"
	.ascii	"\000\000"
	.ascii	"\013\012"
	.ascii	"\002\016"
	.ascii	"\000\000"
	.ident	"GCC: (devkitARM release 66) 15.1.0"
	.text
	.code 16
	.align	1
.L9:
	bx	r3
.L71:
	bx	r4
.L82:
	bx	r5
.L78:
	bx	r7
