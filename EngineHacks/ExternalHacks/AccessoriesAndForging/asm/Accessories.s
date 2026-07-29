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
	.file	"Accessories.c"
@ GNU C23 (devkitARM release 66) version 15.1.0 (arm-none-eabi)
@	compiled by GNU C version 13.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -Os
	.text
	.align	1
	.global	CanUnitUseAccessory
	.syntax unified
	.code	16
	.thumb_func
	.type	CanUnitUseAccessory, %function
CanUnitUseAccessory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ Accessories.c:62: }
	movs	r0, #1	@,
	@ sp needed	@
	bx	lr
	.size	CanUnitUseAccessory, .-CanUnitUseAccessory
	.align	1
	.global	EquipAccessoryUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	EquipAccessoryUsability, %function
EquipAccessoryUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ Accessories.c:68:   if ((GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	ldr	r4, .L7	@ tmp129,
@ Accessories.c:68:   if ((GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	ldr	r5, .L7+4	@ tmp128,
@ Accessories.c:68:   if ((GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	ldrb	r3, [r4, #18]	@ _3,
@ Accessories.c:68:   if ((GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	ldr	r2, [r5]	@ gActiveUnit, gActiveUnit
	adds	r3, r3, #12	@ tmp131,
	lsls	r3, r3, #1	@ tmp132, tmp131,
	adds	r3, r2, r3	@ tmp133, gActiveUnit, tmp132
@ Accessories.c:68:   if ((GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	ldrh	r0, [r3, #6]	@ _5, *gActiveUnit.0_1
	ldr	r3, .L7+8	@ tmp136,
	bl	.L9		@
@ Accessories.c:77:     return 3;
	movs	r3, #3	@ <retval>,
@ Accessories.c:68:   if ((GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	lsls	r0, r0, #9	@ tmp164, _6,
	bpl	.L2		@,
@ Accessories.c:70:       !(ITEM_EQUIPPED(gActiveUnit->items[gActionData.itemSlotIndex]))) {
	ldrb	r3, [r4, #18]	@ _10,
	ldr	r2, [r5]	@ gActiveUnit, gActiveUnit
	adds	r3, r3, #12	@ tmp143,
	lsls	r3, r3, #1	@ tmp144, tmp143,
	adds	r3, r2, r3	@ tmp145, gActiveUnit, tmp144
@ Accessories.c:69:        IA_ACCESSORY) &&
	movs	r2, #6	@ tmp149,
	ldrsh	r2, [r3, r2]	@ tmp149, tmp145, tmp149
@ Accessories.c:73:       return 1;
	movs	r3, #1	@ <retval>,
@ Accessories.c:69:        IA_ACCESSORY) &&
	cmp	r2, #0	@ tmp149,
	bge	.L2		@,
@ Accessories.c:77:     return 3;
	adds	r3, r3, #2	@ <retval>,
.L2:
@ Accessories.c:78: }
	movs	r0, r3	@, <retval>
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L8:
	.align	2
.L7:
	.word	gActionData
	.word	gActiveUnit
	.word	GetItemAttributes
	.size	EquipAccessoryUsability, .-EquipAccessoryUsability
	.align	1
	.global	UnequipAccessoryUsability
	.syntax unified
	.code	16
	.thumb_func
	.type	UnequipAccessoryUsability, %function
UnequipAccessoryUsability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ Accessories.c:82:       (GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	ldr	r4, .L15	@ tmp129,
@ Accessories.c:82:       (GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	ldr	r5, .L15+4	@ tmp128,
@ Accessories.c:82:       (GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	ldrb	r3, [r4, #18]	@ _3,
@ Accessories.c:82:       (GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	ldr	r2, [r5]	@ gActiveUnit, gActiveUnit
	adds	r3, r3, #12	@ tmp131,
	lsls	r3, r3, #1	@ tmp132, tmp131,
	adds	r3, r2, r3	@ tmp133, gActiveUnit, tmp132
@ Accessories.c:82:       (GetItemAttributes(gActiveUnit->items[gActionData.itemSlotIndex]) &
	ldrh	r0, [r3, #6]	@ _5, *gActiveUnit.4_1
	ldr	r3, .L15+8	@ tmp136,
	bl	.L9		@
@ Accessories.c:88:   return 3;
	movs	r3, #3	@ <retval>,
@ Accessories.c:84:   if (isItemAnAccessory) {
	lsls	r0, r0, #9	@ tmp161, _6,
	bpl	.L10		@,
@ Accessories.c:85:     if (ITEM_EQUIPPED(gActiveUnit->items[gActionData.itemSlotIndex]))
	ldrb	r3, [r4, #18]	@ _9,
	ldr	r2, [r5]	@ gActiveUnit, gActiveUnit
	adds	r3, r3, #12	@ tmp143,
	lsls	r3, r3, #1	@ tmp144, tmp143,
	adds	r3, r2, r3	@ tmp145, gActiveUnit, tmp144
@ Accessories.c:85:     if (ITEM_EQUIPPED(gActiveUnit->items[gActionData.itemSlotIndex]))
	movs	r2, #6	@ tmp149,
	ldrsh	r2, [r3, r2]	@ tmp149, tmp145, tmp149
@ Accessories.c:86:       return 1;
	movs	r3, #1	@ <retval>,
@ Accessories.c:85:     if (ITEM_EQUIPPED(gActiveUnit->items[gActionData.itemSlotIndex]))
	cmp	r2, #0	@ tmp149,
	blt	.L10		@,
@ Accessories.c:88:   return 3;
	adds	r3, r3, #2	@ <retval>,
.L10:
@ Accessories.c:89: }
	movs	r0, r3	@, <retval>
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L16:
	.align	2
.L15:
	.word	gActionData
	.word	gActiveUnit
	.word	GetItemAttributes
	.size	UnequipAccessoryUsability, .-UnequipAccessoryUsability
	.align	1
	.global	EquipAccessoryEffect
	.syntax unified
	.code	16
	.thumb_func
	.type	EquipAccessoryEffect, %function
EquipAccessoryEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ Accessories.c:101:     if (isItemAnAccessory) {
	movs	r6, #128	@ tmp151,
@ Accessories.c:91: int EquipAccessoryEffect(void *CurrentMenuProc) {
	movs	r5, r0	@ CurrentMenuProc, CurrentMenuProc
@ Accessories.c:98:   for (int i = 0; i < 4; i++) {
	movs	r4, #0	@ i,
@ Accessories.c:101:     if (isItemAnAccessory) {
	lsls	r6, r6, #15	@ tmp151, tmp151,
.L19:
@ Accessories.c:100:         GetItemAttributes(gActiveUnit->items[i]) & IA_ACCESSORY;
	movs	r2, r4	@ tmp143, i
	ldr	r7, .L34	@ tmp142,
	adds	r2, r2, #12	@ tmp143,
	ldr	r3, [r7]	@ gActiveUnit, gActiveUnit
	lsls	r2, r2, #1	@ tmp144, tmp143,
	adds	r3, r3, r2	@ tmp145, gActiveUnit, tmp144
@ Accessories.c:100:         GetItemAttributes(gActiveUnit->items[i]) & IA_ACCESSORY;
	ldrh	r0, [r3, #6]	@ _3, *gActiveUnit.9_1
	ldr	r3, .L34+4	@ tmp148,
	bl	.L9		@
@ Accessories.c:102:       if (ITEM_EQUIPPED(gActiveUnit->items[i])) { // Unequip accessories
	ldr	r3, [r7]	@ pretmp_42, gActiveUnit
@ Accessories.c:101:     if (isItemAnAccessory) {
	tst	r0, r6	@ _4, tmp151
	beq	.L18		@,
	lsls	r2, r4, #1	@ _44, i,
	adds	r2, r3, r2	@ _23, pretmp_42, _44
@ Accessories.c:102:       if (ITEM_EQUIPPED(gActiveUnit->items[i])) { // Unequip accessories
	movs	r7, #30	@ tmp191,
	ldrsh	r0, [r2, r7]	@ _6, _23, tmp191
@ Accessories.c:102:       if (ITEM_EQUIPPED(gActiveUnit->items[i])) { // Unequip accessories
	ldrh	r1, [r2, #30]	@ _6, MEM <u16> [(struct Unit *)_23 + 30B]
@ Accessories.c:102:       if (ITEM_EQUIPPED(gActiveUnit->items[i])) { // Unequip accessories
	cmp	r0, #0	@ _6,
	bge	.L18		@,
@ Accessories.c:103:         gActiveUnit->items[i] &= 0x7FFF;          // Unequip current accessory
	lsls	r1, r1, #17	@ tmp157, _6,
	lsrs	r1, r1, #17	@ tmp156, tmp157,
	strh	r1, [r2, #30]	@ tmp156, MEM <u16> [(struct Unit *)_23 + 30B]
.L18:
@ Accessories.c:98:   for (int i = 0; i < 4; i++) {
	adds	r4, r4, #1	@ i,
@ Accessories.c:98:   for (int i = 0; i < 4; i++) {
	cmp	r4, #4	@ i,
	bne	.L19		@,
@ Accessories.c:110:   gActiveUnit->items[gActionData.itemSlotIndex] |= (1 << 15);
	ldr	r2, .L34+8	@ tmp159,
	ldrb	r2, [r2, #18]	@ _10,
	lsls	r0, r2, #1	@ _48, _10,
	adds	r0, r3, r0	@ _49, pretmp_42, _48
@ Accessories.c:110:   gActiveUnit->items[gActionData.itemSlotIndex] |= (1 << 15);
	ldrh	r4, [r0, #30]	@, MEM <u16> [(struct Unit *)_49 + 30B]
	ldr	r1, .L34+12	@ tmp164,
	orrs	r1, r4	@ tmp163, MEM <u16> [(struct Unit *)_49 + 30B]
	strh	r1, [r0, #30]	@ tmp163, MEM <u16> [(struct Unit *)_49 + 30B]
@ Accessories.c:115:   if (gActionData.itemSlotIndex == 4)
	cmp	r2, #4	@ _10,
	bne	.L20		@,
@ Accessories.c:116:     gActiveUnit->items[4] = gActiveUnit->items[3];
	ldrh	r2, [r3, #36]	@ tmp167,
	strh	r2, [r3, #38]	@ tmp167, pretmp_42->items[4]
.L21:
@ Accessories.c:118:     gActiveUnit->items[3] = gActiveUnit->items[2];
	ldrh	r2, [r3, #34]	@ tmp171,
	strh	r2, [r3, #36]	@ tmp171, pretmp_42->items[3]
.L23:
@ Accessories.c:120:     gActiveUnit->items[2] = gActiveUnit->items[1];
	ldrh	r2, [r3, #32]	@ tmp173,
	strh	r2, [r3, #34]	@ tmp173, pretmp_42->items[2]
.L25:
@ Accessories.c:122:     gActiveUnit->items[1] = gActiveUnit->items[0];
	ldrh	r2, [r3, #30]	@ tmp175,
	strh	r2, [r3, #32]	@ tmp175, pretmp_42->items[1]
	b	.L26		@
.L20:
@ Accessories.c:117:   if (gActionData.itemSlotIndex >= 3)
	cmp	r2, #2	@ _10,
	bhi	.L21		@,
@ Accessories.c:119:   if (gActionData.itemSlotIndex >= 2)
	beq	.L23		@,
@ Accessories.c:121:   if (gActionData.itemSlotIndex >= 1)
	cmp	r2, #0	@ _10,
	bne	.L25		@,
.L26:
@ Accessories.c:127: }
	@ sp needed	@
@ Accessories.c:124:   gActiveUnit->state |= 0x400; // used galeforce this turn
	movs	r2, #128	@ tmp180,
@ Accessories.c:123:   gActiveUnit->items[0] = newItemZero;
	strh	r1, [r3, #30]	@ tmp163, pretmp_42->items[0]
@ Accessories.c:124:   gActiveUnit->state |= 0x400; // used galeforce this turn
	ldr	r1, [r3, #12]	@ pretmp_42->state, pretmp_42->state
	lsls	r2, r2, #3	@ tmp180, tmp180,
	orrs	r2, r1	@ _19, pretmp_42->state
@ Accessories.c:126:   return CancelMenu(CurrentMenuProc);
	movs	r0, r5	@, CurrentMenuProc
@ Accessories.c:124:   gActiveUnit->state |= 0x400; // used galeforce this turn
	str	r2, [r3, #12]	@ _19, pretmp_42->state
@ Accessories.c:126:   return CancelMenu(CurrentMenuProc);
	ldr	r3, .L34+16	@ tmp181,
	bl	.L9		@
@ Accessories.c:127: }
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L35:
	.align	2
.L34:
	.word	gActiveUnit
	.word	GetItemAttributes
	.word	gActionData
	.word	-32768
	.word	CancelMenu
	.size	EquipAccessoryEffect, .-EquipAccessoryEffect
	.align	1
	.global	UnequipAccessoryEffect
	.syntax unified
	.code	16
	.thumb_func
	.type	UnequipAccessoryEffect, %function
UnequipAccessoryEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ Accessories.c:133:     if (isItemAnAccessory) {
	movs	r6, #128	@ tmp138,
@ Accessories.c:129: int UnequipAccessoryEffect(void *CurrentMenuProc) {
	movs	r5, r0	@ CurrentMenuProc, CurrentMenuProc
@ Accessories.c:130:   for (int i = 0; i < 5; i++) {
	movs	r4, #0	@ i,
@ Accessories.c:133:     if (isItemAnAccessory) {
	lsls	r6, r6, #15	@ tmp138, tmp138,
.L38:
@ Accessories.c:132:         GetItemAttributes(gActiveUnit->items[i]) & IA_ACCESSORY;
	movs	r2, r4	@ tmp131, i
	ldr	r7, .L43	@ tmp130,
	adds	r2, r2, #12	@ tmp131,
	ldr	r3, [r7]	@ gActiveUnit, gActiveUnit
	lsls	r2, r2, #1	@ tmp132, tmp131,
	adds	r3, r3, r2	@ tmp133, gActiveUnit, tmp132
@ Accessories.c:132:         GetItemAttributes(gActiveUnit->items[i]) & IA_ACCESSORY;
	ldrh	r0, [r3, #6]	@ _3, *gActiveUnit.27_1
	ldr	r3, .L43+4	@ tmp136,
	bl	.L9		@
@ Accessories.c:133:     if (isItemAnAccessory) {
	tst	r0, r6	@ _4, tmp138
	beq	.L37		@,
	ldr	r3, [r7]	@ gActiveUnit, gActiveUnit
	lsls	r2, r4, #1	@ _11, i,
	adds	r3, r3, r2	@ _9, gActiveUnit, _11
@ Accessories.c:134:       if (ITEM_EQUIPPED(gActiveUnit->items[i]))
	movs	r0, #30	@ tmp158,
	ldrsh	r1, [r3, r0]	@ _6, _9, tmp158
@ Accessories.c:134:       if (ITEM_EQUIPPED(gActiveUnit->items[i]))
	ldrh	r2, [r3, #30]	@ _6, MEM <u16> [(struct Unit *)_9 + 30B]
@ Accessories.c:134:       if (ITEM_EQUIPPED(gActiveUnit->items[i]))
	cmp	r1, #0	@ _6,
	bge	.L37		@,
@ Accessories.c:135:         gActiveUnit->items[i] &= 0x7FFF; // & isItemAnAccessory
	lsls	r2, r2, #17	@ tmp146, _6,
	lsrs	r2, r2, #17	@ tmp145, tmp146,
	strh	r2, [r3, #30]	@ tmp145, MEM <u16> [(struct Unit *)_9 + 30B]
.L37:
@ Accessories.c:130:   for (int i = 0; i < 5; i++) {
	adds	r4, r4, #1	@ i,
@ Accessories.c:130:   for (int i = 0; i < 5; i++) {
	cmp	r4, #5	@ i,
	bne	.L38		@,
@ Accessories.c:139: }
	@ sp needed	@
@ Accessories.c:138:   return CancelMenu(CurrentMenuProc);
	movs	r0, r5	@, CurrentMenuProc
	ldr	r3, .L43+8	@ tmp148,
	bl	.L9		@
@ Accessories.c:139: }
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L44:
	.align	2
.L43:
	.word	gActiveUnit
	.word	GetItemAttributes
	.word	CancelMenu
	.size	UnequipAccessoryEffect, .-UnequipAccessoryEffect
	.align	1
	.global	EquippedAccessoryGetter
	.syntax unified
	.code	16
	.thumb_func
	.type	EquippedAccessoryGetter, %function
EquippedAccessoryGetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ Accessories.c:144:   if (!unit)
	cmp	r0, #0	@ unit,
	beq	.L46		@,
	movs	r4, r0	@ ivtmp.95, unit
@ Accessories.c:148:     if (isItemAnAccessory) {
	movs	r6, #128	@ tmp130,
	adds	r0, r0, #40	@ unit,
	movs	r5, r0	@ _30, unit
	adds	r4, r4, #30	@ ivtmp.95,
	lsls	r6, r6, #15	@ tmp130, tmp130,
.L49:
@ Accessories.c:147:     int isItemAnAccessory = GetItemAttributes(unit->items[i]) & IA_ACCESSORY;
	ldrh	r0, [r4]	@ _2, MEM[(short unsigned int *)_27]
	ldr	r3, .L57	@ tmp128,
	bl	.L9		@
@ Accessories.c:148:     if (isItemAnAccessory) {
	tst	r0, r6	@ _3, tmp130
	beq	.L47		@,
@ Accessories.c:149:       if (ITEM_EQUIPPED(unit->items[i]))
	movs	r2, #0	@ tmp142,
	ldrsh	r3, [r4, r2]	@ _4, ivtmp.95, tmp142
@ Accessories.c:149:       if (ITEM_EQUIPPED(unit->items[i]))
	ldrh	r0, [r4]	@ _4, MEM[(short unsigned int *)_27]
@ Accessories.c:149:       if (ITEM_EQUIPPED(unit->items[i]))
	cmp	r3, #0	@ _4,
	bge	.L47		@,
@ Accessories.c:150:         return ITEM_INDEX(unit->items[i]); // & isItemAnAccessory
	lsls	r0, r0, #24	@ <retval>, _4,
	lsrs	r0, r0, #24	@ <retval>, <retval>,
.L45:
@ Accessories.c:154: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L47:
@ Accessories.c:146:   for (int i = 0; i < 5; i++) {
	adds	r4, r4, #2	@ ivtmp.95,
	cmp	r4, r5	@ ivtmp.95, _30
	bne	.L49		@,
.L46:
@ Accessories.c:145:     return 0; // if no unit return no accessory effect
	movs	r0, #0	@ <retval>,
	b	.L45		@
.L58:
	.align	2
.L57:
	.word	GetItemAttributes
	.size	EquippedAccessoryGetter, .-EquippedAccessoryGetter
	.align	1
	.global	EquippedAccessoryGetSlot
	.syntax unified
	.code	16
	.thumb_func
	.type	EquippedAccessoryGetSlot, %function
EquippedAccessoryGetSlot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ Accessories.c:158:   if (!unit)
	cmp	r0, #0	@ unit,
	beq	.L60		@,
@ Accessories.c:162:     if (isItemAnAccessory) {
	movs	r6, #128	@ tmp128,
	adds	r0, r0, #30	@ unit,
	movs	r4, r0	@ ivtmp.106, unit
@ Accessories.c:160:   for (int i = 0; i < 5; i++) {
	movs	r5, #0	@ <retval>,
@ Accessories.c:162:     if (isItemAnAccessory) {
	lsls	r6, r6, #15	@ tmp128, tmp128,
.L63:
@ Accessories.c:161:     int isItemAnAccessory = GetItemAttributes(unit->items[i]) & IA_ACCESSORY;
	ldrh	r0, [r4]	@ _2, MEM[(short unsigned int *)_25]
	ldr	r3, .L71	@ tmp126,
	bl	.L9		@
@ Accessories.c:162:     if (isItemAnAccessory) {
	tst	r0, r6	@ _3, tmp128
	beq	.L61		@,
@ Accessories.c:163:       if (ITEM_EQUIPPED(unit->items[i]))
	movs	r2, #0	@ tmp138,
	ldrsh	r3, [r4, r2]	@ MEM[(short unsigned int *)_25], ivtmp.106, tmp138
	cmp	r3, #0	@ MEM[(short unsigned int *)_25],
	blt	.L59		@,
.L61:
@ Accessories.c:160:   for (int i = 0; i < 5; i++) {
	adds	r5, r5, #1	@ <retval>,
@ Accessories.c:160:   for (int i = 0; i < 5; i++) {
	adds	r4, r4, #2	@ ivtmp.106,
	cmp	r5, #5	@ <retval>,
	bne	.L63		@,
.L60:
@ Accessories.c:159:     return (-1); // if no unit return no accessory effect
	movs	r5, #1	@ <retval>,
	rsbs	r5, r5, #0	@ <retval>, <retval>
.L59:
@ Accessories.c:168: }
	movs	r0, r5	@, <retval>
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L72:
	.align	2
.L71:
	.word	GetItemAttributes
	.size	EquippedAccessoryGetSlot, .-EquippedAccessoryGetSlot
	.align	1
	.global	EquippedAccessoryDurabilityGetter
	.syntax unified
	.code	16
	.thumb_func
	.type	EquippedAccessoryDurabilityGetter, %function
EquippedAccessoryDurabilityGetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ Accessories.c:173:   if (!unit)
	cmp	r0, #0	@ unit,
	beq	.L74		@,
	movs	r4, r0	@ ivtmp.117, unit
@ Accessories.c:177:     if (isItemAnAccessory) {
	movs	r6, #128	@ tmp131,
	adds	r0, r0, #40	@ unit,
	movs	r5, r0	@ _31, unit
	adds	r4, r4, #30	@ ivtmp.117,
	lsls	r6, r6, #15	@ tmp131, tmp131,
.L77:
@ Accessories.c:176:     int isItemAnAccessory = GetItemAttributes(unit->items[i]) & IA_ACCESSORY;
	ldrh	r0, [r4]	@ _2, MEM[(short unsigned int *)_28]
	ldr	r3, .L85	@ tmp129,
	bl	.L9		@
@ Accessories.c:177:     if (isItemAnAccessory) {
	tst	r0, r6	@ _3, tmp131
	beq	.L75		@,
@ Accessories.c:178:       if (ITEM_EQUIPPED(unit->items[i]))
	movs	r2, #0	@ tmp145,
	ldrsh	r3, [r4, r2]	@ _4, ivtmp.117, tmp145
@ Accessories.c:178:       if (ITEM_EQUIPPED(unit->items[i]))
	ldrh	r0, [r4]	@ _4, MEM[(short unsigned int *)_28]
@ Accessories.c:178:       if (ITEM_EQUIPPED(unit->items[i]))
	cmp	r3, #0	@ _4,
	bge	.L75		@,
@ Accessories.c:179:         return ITEM_USES(unit->items[i]); // & isItemAnAccessory
	lsls	r0, r0, #18	@ tmp138, _4,
	lsrs	r0, r0, #26	@ <retval>, tmp138,
.L73:
@ Accessories.c:183: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L75:
@ Accessories.c:175:   for (int i = 0; i < 5; i++) {
	adds	r4, r4, #2	@ ivtmp.117,
	cmp	r4, r5	@ ivtmp.117, _31
	bne	.L77		@,
.L74:
@ Accessories.c:174:     return 0; // if no unit return no accessory effect
	movs	r0, #0	@ <retval>,
	b	.L73		@
.L86:
	.align	2
.L85:
	.word	GetItemAttributes
	.size	EquippedAccessoryDurabilityGetter, .-EquippedAccessoryDurabilityGetter
	.align	1
	.global	EquippedAccessoryGetItemAndDurability
	.syntax unified
	.code	16
	.thumb_func
	.type	EquippedAccessoryGetItemAndDurability, %function
EquippedAccessoryGetItemAndDurability:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ Accessories.c:186:   if (!unit) {
	cmp	r0, #0	@ unit,
	beq	.L88		@,
	movs	r4, r0	@ ivtmp.128, unit
@ Accessories.c:191:     if (isItemAnAccessory) {
	movs	r6, #128	@ tmp129,
	adds	r0, r0, #40	@ unit,
	movs	r5, r0	@ _29, unit
	adds	r4, r4, #30	@ ivtmp.128,
	lsls	r6, r6, #15	@ tmp129, tmp129,
.L91:
@ Accessories.c:190:     int isItemAnAccessory = GetItemAttributes(unit->items[i]) & IA_ACCESSORY;
	ldrh	r0, [r4]	@ _2, MEM[(short unsigned int *)_26]
	ldr	r3, .L99	@ tmp127,
	bl	.L9		@
@ Accessories.c:191:     if (isItemAnAccessory) {
	tst	r0, r6	@ _3, tmp129
	beq	.L89		@,
@ Accessories.c:192:       if (ITEM_EQUIPPED(unit->items[i]))
	movs	r2, #0	@ tmp138,
	ldrsh	r3, [r4, r2]	@ _5, ivtmp.128, tmp138
@ Accessories.c:192:       if (ITEM_EQUIPPED(unit->items[i]))
	ldrh	r0, [r4]	@ _5, MEM[(short unsigned int *)_26]
@ Accessories.c:192:       if (ITEM_EQUIPPED(unit->items[i]))
	cmp	r3, #0	@ _5,
	blt	.L87		@,
.L89:
@ Accessories.c:189:   for (int i = 0; i < 5; i++) {
	adds	r4, r4, #2	@ ivtmp.128,
	cmp	r4, r5	@ ivtmp.128, _29
	bne	.L91		@,
.L88:
@ Accessories.c:187:     return 0;
	movs	r0, #0	@ <retval>,
.L87:
@ Accessories.c:197: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L100:
	.align	2
.L99:
	.word	GetItemAttributes
	.size	EquippedAccessoryGetItemAndDurability, .-EquippedAccessoryGetItemAndDurability
	.align	1
	.global	EquippedShieldAccessoryDurabilityGetter
	.syntax unified
	.code	16
	.thumb_func
	.type	EquippedShieldAccessoryDurabilityGetter, %function
EquippedShieldAccessoryDurabilityGetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ Accessories.c:206:   if (!unit)
	cmp	r0, #0	@ unit,
	beq	.L102		@,
	movs	r4, r0	@ ivtmp.139, unit
@ Accessories.c:211:       if (isItemAnAccessory) {
	movs	r6, #128	@ tmp150,
	adds	r0, r0, #40	@ unit,
	movs	r5, r0	@ _38, unit
	adds	r4, r4, #30	@ ivtmp.139,
	lsls	r6, r6, #15	@ tmp150, tmp150,
.L105:
@ Accessories.c:209:     int isItemAnAccessory = GetItemAttributes(unit->items[i]) & IA_ACCESSORY;
	ldr	r3, .L113	@ tmp134,
	ldrh	r0, [r4]	@ _2, MEM[(short unsigned int *)_34]
	bl	.L9		@
@ Accessories.c:210:     if (Accessory_GetItemMight(unit->items[i]) == AE_NormalShield_Link) {
	ldr	r3, .L113+4	@ tmp136,
@ Accessories.c:209:     int isItemAnAccessory = GetItemAttributes(unit->items[i]) & IA_ACCESSORY;
	movs	r7, r0	@ _3,
@ Accessories.c:210:     if (Accessory_GetItemMight(unit->items[i]) == AE_NormalShield_Link) {
	ldrh	r0, [r4]	@ _5, MEM[(short unsigned int *)_34]
	bl	.L9		@
@ Accessories.c:210:     if (Accessory_GetItemMight(unit->items[i]) == AE_NormalShield_Link) {
	ldr	r3, .L113+8	@ tmp137,
	ldrb	r3, [r3]	@ _8, AE_NormalShield_Link
@ Accessories.c:210:     if (Accessory_GetItemMight(unit->items[i]) == AE_NormalShield_Link) {
	cmp	r0, r3	@ _6, _8
	bne	.L103		@,
@ Accessories.c:211:       if (isItemAnAccessory) {
	tst	r7, r6	@ _3, tmp150
	beq	.L103		@,
@ Accessories.c:212:         if (ITEM_EQUIPPED(unit->items[i]))
	movs	r2, #0	@ tmp156,
	ldrsh	r3, [r4, r2]	@ _9, ivtmp.139, tmp156
@ Accessories.c:212:         if (ITEM_EQUIPPED(unit->items[i]))
	ldrh	r0, [r4]	@ _9, MEM[(short unsigned int *)_34]
@ Accessories.c:212:         if (ITEM_EQUIPPED(unit->items[i]))
	cmp	r3, #0	@ _9,
	bge	.L103		@,
@ Accessories.c:213:           return ITEM_USES(unit->items[i]); // & isItemAnAccessory
	lsls	r0, r0, #18	@ tmp147, _9,
	lsrs	r0, r0, #26	@ <retval>, tmp147,
.L101:
@ Accessories.c:218: }
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L103:
@ Accessories.c:208:   for (int i = 0; i < 5; i++) {
	adds	r4, r4, #2	@ ivtmp.139,
	cmp	r4, r5	@ ivtmp.139, _38
	bne	.L105		@,
.L102:
@ Accessories.c:207:     return 0; // if no unit return no accessory effect
	movs	r0, #0	@ <retval>,
	b	.L101		@
.L114:
	.align	2
.L113:
	.word	GetItemAttributes
	.word	Accessory_GetItemMight
	.word	AE_NormalShield_Link
	.size	EquippedShieldAccessoryDurabilityGetter, .-EquippedShieldAccessoryDurabilityGetter
	.align	1
	.global	DepleteEquippedAccessoryUse
	.syntax unified
	.code	16
	.thumb_func
	.type	DepleteEquippedAccessoryUse, %function
DepleteEquippedAccessoryUse:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
	movs	r5, r0	@ ivtmp.150, unit
	adds	r0, r0, #40	@ unit,
	movs	r4, r0	@ _18, unit
	adds	r5, r5, #30	@ ivtmp.150,
.L116:
@ Accessories.c:222:     int isItemAnAccessory = GetItemAttributes(unit->items[i]) & IA_ACCESSORY;
	ldrh	r0, [r5]	@ _2, MEM[(short unsigned int *)_16]
	ldr	r3, .L118	@ tmp122,
@ Accessories.c:221:   for (int i = 0; i < 5; i++) {
	adds	r5, r5, #2	@ ivtmp.150,
@ Accessories.c:222:     int isItemAnAccessory = GetItemAttributes(unit->items[i]) & IA_ACCESSORY;
	bl	.L9		@
@ Accessories.c:221:   for (int i = 0; i < 5; i++) {
	cmp	r5, r4	@ ivtmp.150, _18
	bne	.L116		@,
@ Accessories.c:242: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L119:
	.align	2
.L118:
	.word	GetItemAttributes
	.size	DepleteEquippedAccessoryUse, .-DepleteEquippedAccessoryUse
	.align	1
	.global	AccessoryEffectGetter
	.syntax unified
	.code	16
	.thumb_func
	.type	AccessoryEffectGetter, %function
AccessoryEffectGetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ Accessories.c:245:   int item = EquippedAccessoryGetter(unit);
	bl	EquippedAccessoryGetter		@
@ Accessories.c:246:   if (!item)
	cmp	r0, #0	@ <retval>,
	beq	.L120		@,
@ Accessories.c:248:   return Accessory_GetItemMight(item); // item effect id uses the might byte
	ldr	r3, .L125	@ tmp116,
	bl	.L9		@
.L120:
@ Accessories.c:252: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L126:
	.align	2
.L125:
	.word	Accessory_GetItemMight
	.size	AccessoryEffectGetter, .-AccessoryEffectGetter
	.align	1
	.global	AccessoryEffectTester
	.syntax unified
	.code	16
	.thumb_func
	.type	AccessoryEffectTester, %function
AccessoryEffectTester:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ Accessories.c:254: int AccessoryEffectTester(struct Unit *unit, int AccessoryEffectID) {
	movs	r4, r1	@ AccessoryEffectID, AccessoryEffectID
@ Accessories.c:258: }
	@ sp needed	@
@ Accessories.c:255:   if (AccessoryEffectGetter(unit) == AccessoryEffectID)
	bl	AccessoryEffectGetter		@
@ Accessories.c:255:   if (AccessoryEffectGetter(unit) == AccessoryEffectID)
	subs	r0, r0, r4	@ tmp122, _1, AccessoryEffectID
	rsbs	r3, r0, #0	@ tmp123, tmp122
	adcs	r0, r0, r3	@ _7, tmp122, tmp123
@ Accessories.c:258: }
	pop	{r4}
	pop	{r1}
	bx	r1
	.size	AccessoryEffectTester, .-AccessoryEffectTester
	.align	1
	.global	AccessorySkillGetter
	.syntax unified
	.code	16
	.thumb_func
	.type	AccessorySkillGetter, %function
AccessorySkillGetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ Accessories.c:264: int AccessorySkillGetter(struct Unit *unit) {
	movs	r5, r0	@ unit, unit
@ Accessories.c:265:   int item = EquippedAccessoryGetter(
	bl	EquippedAccessoryGetter		@
	subs	r4, r0, #0	@ item,,
@ Accessories.c:267:   if (!item)
	bne	.L129		@,
.L131:
@ Accessories.c:268:     return 0;
	movs	r0, #0	@ <retval>,
.L128:
@ Accessories.c:301: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L129:
@ Accessories.c:269:   if (AccessoryEffectTester(unit,
	movs	r1, #1	@,
	movs	r0, r5	@, unit
	bl	AccessoryEffectTester		@
@ Accessories.c:269:   if (AccessoryEffectTester(unit,
	cmp	r0, #0	@ _1,
	beq	.L131		@,
@ Accessories.c:271:     int itemUses = EquippedAccessoryDurabilityGetter(unit);
	movs	r0, r5	@, unit
	bl	EquippedAccessoryDurabilityGetter		@
@ Accessories.c:274:     if (item == Ves_SkillBlockOne_Link) {
	ldr	r3, .L142	@ tmp135,
	ldrb	r3, [r3]	@ _3, Ves_SkillBlockOne_Link
@ Accessories.c:272:     int result = 0;
	subs	r3, r3, r4	@ tmp157, _3, item
	rsbs	r1, r3, #0	@ tmp158, tmp157
	adcs	r3, r3, r1	@ tmp156, tmp157, tmp158
@ Accessories.c:271:     int itemUses = EquippedAccessoryDurabilityGetter(unit);
	movs	r2, r0	@ itemUses,
@ Accessories.c:272:     int result = 0;
	rsbs	r0, r3, #0	@ tmp159, tmp156
@ Accessories.c:277:     if (item == Ves_SkillBlockTwo_Link) {
	ldr	r3, .L142+4	@ tmp137,
	ldrb	r3, [r3]	@ _5, Ves_SkillBlockTwo_Link
@ Accessories.c:272:     int result = 0;
	ands	r0, r2	@ <retval>, itemUses
@ Accessories.c:277:     if (item == Ves_SkillBlockTwo_Link) {
	cmp	r3, r4	@ _5, item
	bne	.L133		@,
@ Accessories.c:278:       result = ((itemUses) + 64);
	movs	r0, r2	@ <retval>, itemUses
	adds	r0, r0, #64	@ <retval>,
.L133:
@ Accessories.c:280:     if (item == Ves_SkillBlockThree_Link) {
	ldr	r3, .L142+8	@ tmp139,
	ldrb	r3, [r3]	@ _7, Ves_SkillBlockThree_Link
@ Accessories.c:280:     if (item == Ves_SkillBlockThree_Link) {
	cmp	r3, r4	@ _7, item
	bne	.L134		@,
@ Accessories.c:281:       result = ((itemUses) + 128);
	movs	r0, r2	@ <retval>, itemUses
	adds	r0, r0, #128	@ <retval>,
.L134:
@ Accessories.c:283:     if (item == Ves_SkillBlockFour_Link) {
	ldr	r3, .L142+12	@ tmp141,
	ldrb	r3, [r3]	@ _9, Ves_SkillBlockFour_Link
@ Accessories.c:283:     if (item == Ves_SkillBlockFour_Link) {
	cmp	r3, r4	@ _9, item
	bne	.L135		@,
@ Accessories.c:284:       result = ((itemUses) + 192);
	adds	r2, r2, #192	@ itemUses,
	movs	r0, r2	@ <retval>, itemUses
.L135:
@ Accessories.c:287:     if (unit->pClassData->number != FarfetchdID_Link &&
	ldr	r3, [r5, #4]	@ unit_28(D)->pClassData, unit_28(D)->pClassData
@ Accessories.c:287:     if (unit->pClassData->number != FarfetchdID_Link &&
	ldr	r2, .L142+16	@ tmp144,
@ Accessories.c:287:     if (unit->pClassData->number != FarfetchdID_Link &&
	ldrb	r3, [r3, #4]	@ _12,
@ Accessories.c:287:     if (unit->pClassData->number != FarfetchdID_Link &&
	ldr	r2, [r2]	@ FarfetchdID_Link, FarfetchdID_Link
	cmp	r3, r2	@ _12, FarfetchdID_Link
	beq	.L136		@,
@ Accessories.c:288:         result == PridefulWarriorID_Link) {
	ldr	r2, .L142+20	@ tmp146,
@ Accessories.c:287:     if (unit->pClassData->number != FarfetchdID_Link &&
	ldr	r2, [r2]	@ PridefulWarriorID_Link, PridefulWarriorID_Link
	cmp	r2, r0	@ PridefulWarriorID_Link, <retval>
	bne	.L136		@,
@ Accessories.c:289:       result = 0;
	movs	r0, #0	@ <retval>,
.L136:
@ Accessories.c:291:     if (unit->pClassData->number != CuboneID_Link &&
	ldr	r2, .L142+24	@ tmp148,
@ Accessories.c:291:     if (unit->pClassData->number != CuboneID_Link &&
	ldr	r2, [r2]	@ CuboneID_Link, CuboneID_Link
	cmp	r3, r2	@ _12, CuboneID_Link
	beq	.L128		@,
@ Accessories.c:292:         unit->pClassData->number != MarowakID_Link &&
	ldr	r2, .L142+28	@ tmp150,
@ Accessories.c:291:     if (unit->pClassData->number != CuboneID_Link &&
	ldr	r2, [r2]	@ MarowakID_Link, MarowakID_Link
	cmp	r3, r2	@ _12, MarowakID_Link
	beq	.L128		@,
@ Accessories.c:293:         result == ThickClubSkillID_Link) {
	ldr	r3, .L142+32	@ tmp152,
@ Accessories.c:292:         unit->pClassData->number != MarowakID_Link &&
	ldr	r3, [r3]	@ ThickClubSkillID_Link, ThickClubSkillID_Link
	cmp	r3, r0	@ ThickClubSkillID_Link, <retval>
	bne	.L128		@,
	b	.L131		@
.L143:
	.align	2
.L142:
	.word	Ves_SkillBlockOne_Link
	.word	Ves_SkillBlockTwo_Link
	.word	Ves_SkillBlockThree_Link
	.word	Ves_SkillBlockFour_Link
	.word	FarfetchdID_Link
	.word	PridefulWarriorID_Link
	.word	CuboneID_Link
	.word	MarowakID_Link
	.word	ThickClubSkillID_Link
	.size	AccessorySkillGetter, .-AccessorySkillGetter
	.align	1
	.global	Proc_CheckForAccessory
	.syntax unified
	.code	16
	.thumb_func
	.type	Proc_CheckForAccessory, %function
Proc_CheckForAccessory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ Accessories.c:411:   if (!(roundData->attributes &
	ldr	r3, [r2]	@ *roundData_7(D), *roundData_7(D)
@ Accessories.c:410:                             struct BattleHit *roundData) {
	push	{r4, lr}	@
@ Accessories.c:410:                             struct BattleHit *roundData) {
	movs	r4, r1	@ defender, defender
@ Accessories.c:411:   if (!(roundData->attributes &
	lsls	r3, r3, #30	@ tmp136, *roundData_7(D),
	bmi	.L144		@,
@ Accessories.c:413:     int accessory = EquippedAccessoryGetter(&defender->unit);
	movs	r0, r1	@, defender
	bl	EquippedAccessoryGetter		@
@ Accessories.c:414:     if (accessory) { // if the defender has an accessory equipped
	cmp	r0, #0	@ accessory,
	beq	.L144		@,
@ Accessories.c:415:       if (GetItemAttributes(accessory) & IA_DEPLETEUSESONDEFENSE) {
	ldr	r3, .L156	@ tmp129,
	bl	.L9		@
@ Accessories.c:415:       if (GetItemAttributes(accessory) & IA_DEPLETEUSESONDEFENSE) {
	lsls	r0, r0, #8	@ tmp137, _3,
	bpl	.L144		@,
@ Accessories.c:416:         DepleteEquippedAccessoryUse(&defender->unit);
	movs	r0, r4	@, defender
	bl	DepleteEquippedAccessoryUse		@
.L144:
@ Accessories.c:420: }
	@ sp needed	@
	pop	{r4}
	pop	{r0}
	bx	r0
.L157:
	.align	2
.L156:
	.word	GetItemAttributes
	.size	Proc_CheckForAccessory, .-Proc_CheckForAccessory
	.align	1
	.global	UnitAddItem
	.syntax unified
	.code	16
	.thumb_func
	.type	UnitAddItem, %function
UnitAddItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
@ Accessories.c:426:   if (!Proc_Find((const ProcInstruction *)0x8A1829C)) { // prep
	ldr	r3, .L181	@ tmp160,
@ Accessories.c:423: int UnitAddItem(struct Unit *unit, u16 item) {
	movs	r6, r0	@ unit, unit
	sub	sp, sp, #20	@,,
@ Accessories.c:426:   if (!Proc_Find((const ProcInstruction *)0x8A1829C)) { // prep
	ldr	r0, .L181+4	@,
@ Accessories.c:423: int UnitAddItem(struct Unit *unit, u16 item) {
	movs	r5, r1	@ item, item
@ Accessories.c:426:   if (!Proc_Find((const ProcInstruction *)0x8A1829C)) { // prep
	bl	.L9		@
@ Accessories.c:426:   if (!Proc_Find((const ProcInstruction *)0x8A1829C)) { // prep
	cmp	r0, #0	@ _1,
	bne	.L160		@,
@ Accessories.c:427:     if ((GetItemAttributes(ITEM_INDEX(item)) & IA_ACCESSORY) &&
	lsls	r0, r5, #24	@ _69, item,
	ldr	r3, .L181+8	@ tmp165,
	lsrs	r0, r0, #24	@ _69, _69,
	bl	.L9		@
@ Accessories.c:427:     if ((GetItemAttributes(ITEM_INDEX(item)) & IA_ACCESSORY) &&
	lsls	r0, r0, #9	@ tmp236, _4,
	bpl	.L160		@,
@ Accessories.c:428:         !(EquippedAccessoryGetter(unit))) {
	movs	r0, r6	@, unit
	bl	EquippedAccessoryGetter		@
@ Accessories.c:427:     if ((GetItemAttributes(ITEM_INDEX(item)) & IA_ACCESSORY) &&
	cmp	r0, #0	@ _6,
	bne	.L160		@,
@ Accessories.c:429:       if (!(unit->index & 0xC0)) {
	movs	r2, #11	@ _8,
@ Accessories.c:429:       if (!(unit->index & 0xC0)) {
	movs	r3, #192	@ tmp170,
@ Accessories.c:429:       if (!(unit->index & 0xC0)) {
	ldrsb	r2, [r6, r2]	@ _8,* _8
@ Accessories.c:429:       if (!(unit->index & 0xC0)) {
	tst	r2, r3	@ _8, tmp170
	bne	.L160		@,
@ Accessories.c:430:         item |=
	movs	r3, #128	@ tmp171,
	lsls	r3, r3, #8	@ tmp171, tmp171,
	orrs	r5, r3	@ item, tmp171
@ Accessories.c:432:         unit->state |= 0x400; // used galeforce this turn
	movs	r3, #128	@ tmp176,
	ldr	r2, [r6, #12]	@ unit_44(D)->state, unit_44(D)->state
	lsls	r3, r3, #3	@ tmp176, tmp176,
	orrs	r3, r2	@ _11, unit_44(D)->state
	str	r3, [r6, #12]	@ _11, unit_44(D)->state
.L160:
@ Accessories.c:437:   int maxUse = GetItemMaxUses(item);
	ldr	r3, .L181+12	@ tmp177,
	movs	r0, r5	@, item
	bl	.L9		@
@ Accessories.c:438:   int curUse = GetItemUses(item);
	ldr	r3, .L181+16	@ tmp178,
@ Accessories.c:437:   int maxUse = GetItemMaxUses(item);
	str	r0, [sp, #12]	@, %sfp
@ Accessories.c:438:   int curUse = GetItemUses(item);
	movs	r0, r5	@, item
	bl	.L9		@
@ Accessories.c:440:   int newItem = GetItemIndex(item);
	ldr	r3, .L181+20	@ tmp179,
@ Accessories.c:438:   int curUse = GetItemUses(item);
	str	r0, [sp, #4]	@, %sfp
@ Accessories.c:440:   int newItem = GetItemIndex(item);
	movs	r0, r5	@, item
	bl	.L9		@
	ldr	r3, .L181+24	@ ivtmp.187,
	str	r0, [sp, #8]	@, %sfp
.L162:
@ Accessories.c:446:   while (DurabilityItemList[i] != 0) {
	ldrb	r7, [r3]	@ _15, MEM[(unsigned char *)_85]
@ Accessories.c:446:   while (DurabilityItemList[i] != 0) {
	cmp	r7, #0	@ _15,
	bne	.L164		@,
.L163:
@ Accessories.c:454:   if ((!(GetItemAttributes(ITEM_INDEX(item)) & IA_ACCESSORY)) & (!durBased)) {
	lsls	r0, r5, #24	@ _16, item,
	ldr	r3, .L181+8	@ tmp186,
	lsrs	r0, r0, #24	@ _16, _16,
	bl	.L9		@
@ Accessories.c:454:   if ((!(GetItemAttributes(ITEM_INDEX(item)) & IA_ACCESSORY)) & (!durBased)) {
	movs	r3, #128	@ tmp188,
	lsls	r3, r3, #15	@ tmp188, tmp188,
	ands	r0, r3	@ _17, tmp188
	movs	r3, r6	@ _81, unit
	movs	r4, r0	@ _18, _17
	adds	r3, r3, #30	@ _81,
	str	r3, [sp]	@ _81, %sfp
@ Accessories.c:454:   if ((!(GetItemAttributes(ITEM_INDEX(item)) & IA_ACCESSORY)) & (!durBased)) {
	orrs	r4, r7	@ _20, durBased
@ Accessories.c:454:   if ((!(GetItemAttributes(ITEM_INDEX(item)) & IA_ACCESSORY)) & (!durBased)) {
	bne	.L174		@,
.L169:
@ Accessories.c:456:       invSlotItem = unit->items[i];
	ldr	r2, [sp]	@ _81, %sfp
	lsls	r3, r4, #1	@ _77, i,
	ldrh	r7, [r2, r3]	@ _21, MEM[(short unsigned int *)_78 + _77 * 1]
@ Accessories.c:457:       if (invSlotItem == 0) {
	cmp	r7, #0	@ _21,
	bne	.L166		@,
@ Accessories.c:458:         unit->items[i] = item;
	adds	r4, r4, #12	@ tmp192,
	lsls	r4, r4, #1	@ tmp193, tmp192,
	adds	r4, r6, r4	@ tmp194, unit, tmp193
	strh	r5, [r4, #6]	@ item, unit_44(D)->items[i_2]
.L167:
@ Accessories.c:459:         return TRUE;
	movs	r0, #1	@ <retval>,
	b	.L158		@
.L164:
@ Accessories.c:447:     if (newItem == DurabilityItemList[i]) {
	ldr	r2, [sp, #8]	@ tmp229, %sfp
	adds	r3, r3, #1	@ ivtmp.187,
	cmp	r2, r7	@ tmp229, _15
	bne	.L162		@,
@ Accessories.c:448:       durBased = true;
	movs	r7, #1	@ durBased,
	b	.L163		@
.L166:
@ Accessories.c:461:       if (GetItemIndex(invSlotItem) == newItem) {
	ldr	r3, .L181+20	@ tmp197,
	movs	r0, r7	@, _21
	bl	.L9		@
@ Accessories.c:461:       if (GetItemIndex(invSlotItem) == newItem) {
	ldr	r3, [sp, #8]	@ tmp229, %sfp
	cmp	r3, r0	@ tmp229, tmp231
	bne	.L168		@,
@ Accessories.c:463:         if ((curUse + GetItemUses(invSlotItem)) <= maxUse) {
	ldr	r3, .L181+16	@ tmp200,
	movs	r0, r7	@, _21
	bl	.L9		@
@ Accessories.c:463:         if ((curUse + GetItemUses(invSlotItem)) <= maxUse) {
	ldr	r3, [sp, #4]	@ curUse, %sfp
	adds	r0, r0, r3	@ _24, _23, curUse
@ Accessories.c:463:         if ((curUse + GetItemUses(invSlotItem)) <= maxUse) {
	ldr	r3, [sp, #12]	@ maxUse, %sfp
	cmp	r0, r3	@ _24, maxUse
	bgt	.L168		@,
@ Accessories.c:464:           unit->items[i] = invSlotItem + (curUse << 8);
	ldr	r3, [sp, #4]	@ curUse, %sfp
@ Accessories.c:464:           unit->items[i] = invSlotItem + (curUse << 8);
	adds	r4, r4, #12	@ tmp202,
	lsls	r4, r4, #1	@ tmp203, tmp202,
@ Accessories.c:464:           unit->items[i] = invSlotItem + (curUse << 8);
	lsls	r3, r3, #8	@ tmp207, curUse,
@ Accessories.c:464:           unit->items[i] = invSlotItem + (curUse << 8);
	adds	r4, r6, r4	@ tmp204, unit, tmp203
@ Accessories.c:464:           unit->items[i] = invSlotItem + (curUse << 8);
	adds	r7, r7, r3	@ tmp209, _21, tmp207
@ Accessories.c:464:           unit->items[i] = invSlotItem + (curUse << 8);
	strh	r7, [r4, #6]	@ tmp209, unit_44(D)->items[i_2]
@ Accessories.c:465:           return true;
	b	.L167		@
.L168:
@ Accessories.c:455:     for (i = 0; i < 5; ++i) {
	adds	r4, r4, #1	@ i,
@ Accessories.c:455:     for (i = 0; i < 5; ++i) {
	cmp	r4, #5	@ i,
	bne	.L169		@,
.L172:
@ Accessories.c:483:   return FALSE;
	movs	r0, #0	@ <retval>,
.L158:
@ Accessories.c:484: }
	add	sp, sp, #20	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L174:
@ Accessories.c:474:     for (i = 0; i < 5; ++i) {
	movs	r3, #0	@ i,
.L165:
@ Accessories.c:475:       if (unit->items[i] == 0) {
	ldr	r1, [sp]	@ _81, %sfp
@ Accessories.c:475:       if (unit->items[i] == 0) {
	lsls	r2, r3, #1	@ _80, i,
@ Accessories.c:475:       if (unit->items[i] == 0) {
	ldrh	r2, [r1, r2]	@ MEM[(short unsigned int *)_81 + _80 * 1], MEM[(short unsigned int *)_81 + _80 * 1]
	cmp	r2, #0	@ MEM[(short unsigned int *)_81 + _80 * 1],
	bne	.L171		@,
@ Accessories.c:476:         unit->items[i] = item;
	adds	r3, r3, #12	@ tmp214,
	lsls	r3, r3, #1	@ tmp215, tmp214,
	adds	r3, r6, r3	@ tmp216, unit, tmp215
	strh	r5, [r3, #6]	@ item, unit_44(D)->items[i_66]
@ Accessories.c:477:         return TRUE;
	b	.L167		@
.L171:
@ Accessories.c:474:     for (i = 0; i < 5; ++i) {
	adds	r3, r3, #1	@ i,
@ Accessories.c:474:     for (i = 0; i < 5; ++i) {
	cmp	r3, #5	@ i,
	bne	.L165		@,
	b	.L172		@
.L182:
	.align	2
.L181:
	.word	ProcFind
	.word	144802460
	.word	GetItemAttributes
	.word	GetItemMaxUses
	.word	GetItemUses
	.word	GetItemIndex
	.word	DurabilityItemList
	.size	UnitAddItem, .-UnitAddItem
	.ident	"GCC: (devkitARM release 66) 15.1.0"
	.code 16
	.align	1
.L9:
	bx	r3
