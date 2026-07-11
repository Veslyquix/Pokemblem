	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 23, 1
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"Accessories.c"
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
	movs	r0, #1
	@ sp needed
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L7
	ldr	r5, .L7+4
	ldrb	r3, [r4, #18]
	ldr	r2, [r5]
	adds	r3, r3, #12
	lsls	r3, r3, #1
	adds	r3, r2, r3
	ldrh	r0, [r3, #6]
	ldr	r3, .L7+8
	bl	.L9
	movs	r3, #3
	lsls	r0, r0, #9
	bpl	.L2
	ldrb	r3, [r4, #18]
	ldr	r2, [r5]
	adds	r3, r3, #12
	lsls	r3, r3, #1
	adds	r3, r2, r3
	movs	r2, #6
	ldrsh	r2, [r3, r2]
	movs	r3, #1
	cmp	r2, #0
	bge	.L2
	adds	r3, r3, #2
.L2:
	movs	r0, r3
	@ sp needed
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L15
	ldr	r5, .L15+4
	ldrb	r3, [r4, #18]
	ldr	r2, [r5]
	adds	r3, r3, #12
	lsls	r3, r3, #1
	adds	r3, r2, r3
	ldrh	r0, [r3, #6]
	ldr	r3, .L15+8
	bl	.L9
	movs	r3, #3
	lsls	r0, r0, #9
	bpl	.L10
	ldrb	r3, [r4, #18]
	ldr	r2, [r5]
	adds	r3, r3, #12
	lsls	r3, r3, #1
	adds	r3, r2, r3
	movs	r2, #6
	ldrsh	r2, [r3, r2]
	movs	r3, #1
	cmp	r2, #0
	blt	.L10
	adds	r3, r3, #2
.L10:
	movs	r0, r3
	@ sp needed
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
	push	{r3, r4, r5, r6, r7, lr}
	movs	r6, #128
	movs	r5, r0
	movs	r4, #0
	lsls	r6, r6, #15
.L19:
	movs	r2, r4
	ldr	r7, .L34
	adds	r2, r2, #12
	ldr	r3, [r7]
	lsls	r2, r2, #1
	adds	r3, r3, r2
	ldrh	r0, [r3, #6]
	ldr	r3, .L34+4
	bl	.L9
	ldr	r3, [r7]
	tst	r0, r6
	beq	.L18
	lsls	r2, r4, #1
	adds	r2, r3, r2
	movs	r7, #30
	ldrsh	r0, [r2, r7]
	ldrh	r1, [r2, #30]
	cmp	r0, #0
	bge	.L18
	lsls	r1, r1, #17
	lsrs	r1, r1, #17
	strh	r1, [r2, #30]
.L18:
	adds	r4, r4, #1
	cmp	r4, #4
	bne	.L19
	ldr	r2, .L34+8
	ldrb	r2, [r2, #18]
	lsls	r0, r2, #1
	adds	r0, r3, r0
	ldrh	r4, [r0, #30]
	ldr	r1, .L34+12
	orrs	r1, r4
	strh	r1, [r0, #30]
	cmp	r2, #4
	bne	.L20
	ldrh	r2, [r3, #36]
	strh	r2, [r3, #38]
.L21:
	ldrh	r2, [r3, #34]
	strh	r2, [r3, #36]
.L23:
	ldrh	r2, [r3, #32]
	strh	r2, [r3, #34]
.L25:
	ldrh	r2, [r3, #30]
	strh	r2, [r3, #32]
	b	.L26
.L20:
	cmp	r2, #2
	bhi	.L21
	beq	.L23
	cmp	r2, #0
	bne	.L25
.L26:
	@ sp needed
	movs	r2, #128
	strh	r1, [r3, #30]
	ldr	r1, [r3, #12]
	lsls	r2, r2, #3
	orrs	r2, r1
	movs	r0, r5
	str	r2, [r3, #12]
	ldr	r3, .L34+16
	bl	.L9
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
	push	{r3, r4, r5, r6, r7, lr}
	movs	r6, #128
	movs	r5, r0
	movs	r4, #0
	lsls	r6, r6, #15
.L38:
	movs	r2, r4
	ldr	r7, .L43
	adds	r2, r2, #12
	ldr	r3, [r7]
	lsls	r2, r2, #1
	adds	r3, r3, r2
	ldrh	r0, [r3, #6]
	ldr	r3, .L43+4
	bl	.L9
	tst	r0, r6
	beq	.L37
	ldr	r3, [r7]
	lsls	r2, r4, #1
	adds	r3, r3, r2
	movs	r0, #30
	ldrsh	r1, [r3, r0]
	ldrh	r2, [r3, #30]
	cmp	r1, #0
	bge	.L37
	lsls	r2, r2, #17
	lsrs	r2, r2, #17
	strh	r2, [r3, #30]
.L37:
	adds	r4, r4, #1
	cmp	r4, #5
	bne	.L38
	@ sp needed
	movs	r0, r5
	ldr	r3, .L43+8
	bl	.L9
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
	push	{r4, r5, r6, lr}
	cmp	r0, #0
	beq	.L46
	movs	r4, r0
	movs	r6, #128
	adds	r0, r0, #40
	movs	r5, r0
	adds	r4, r4, #30
	lsls	r6, r6, #15
.L49:
	ldrh	r0, [r4]
	ldr	r3, .L57
	bl	.L9
	tst	r0, r6
	beq	.L47
	movs	r2, #0
	ldrsh	r3, [r4, r2]
	ldrh	r0, [r4]
	cmp	r3, #0
	bge	.L47
	lsls	r0, r0, #24
	lsrs	r0, r0, #24
.L45:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L47:
	adds	r4, r4, #2
	cmp	r4, r5
	bne	.L49
.L46:
	movs	r0, #0
	b	.L45
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
	push	{r4, r5, r6, lr}
	cmp	r0, #0
	beq	.L60
	movs	r6, #128
	adds	r0, r0, #30
	movs	r4, r0
	movs	r5, #0
	lsls	r6, r6, #15
.L63:
	ldrh	r0, [r4]
	ldr	r3, .L71
	bl	.L9
	tst	r0, r6
	beq	.L61
	movs	r2, #0
	ldrsh	r3, [r4, r2]
	cmp	r3, #0
	blt	.L59
.L61:
	adds	r5, r5, #1
	adds	r4, r4, #2
	cmp	r5, #5
	bne	.L63
.L60:
	movs	r5, #1
	rsbs	r5, r5, #0
.L59:
	movs	r0, r5
	@ sp needed
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
	push	{r4, r5, r6, lr}
	cmp	r0, #0
	beq	.L74
	movs	r4, r0
	movs	r6, #128
	adds	r0, r0, #40
	movs	r5, r0
	adds	r4, r4, #30
	lsls	r6, r6, #15
.L77:
	ldrh	r0, [r4]
	ldr	r3, .L85
	bl	.L9
	tst	r0, r6
	beq	.L75
	movs	r2, #0
	ldrsh	r3, [r4, r2]
	ldrh	r0, [r4]
	cmp	r3, #0
	bge	.L75
	lsls	r0, r0, #18
	lsrs	r0, r0, #26
.L73:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L75:
	adds	r4, r4, #2
	cmp	r4, r5
	bne	.L77
.L74:
	movs	r0, #0
	b	.L73
.L86:
	.align	2
.L85:
	.word	GetItemAttributes
	.size	EquippedAccessoryDurabilityGetter, .-EquippedAccessoryDurabilityGetter
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
	push	{r3, r4, r5, r6, r7, lr}
	cmp	r0, #0
	beq	.L88
	movs	r4, r0
	movs	r6, #128
	adds	r0, r0, #40
	movs	r5, r0
	adds	r4, r4, #30
	lsls	r6, r6, #15
.L91:
	ldr	r3, .L99
	ldrh	r0, [r4]
	bl	.L9
	ldr	r3, .L99+4
	movs	r7, r0
	ldrh	r0, [r4]
	bl	.L9
	ldr	r3, .L99+8
	ldrb	r3, [r3]
	cmp	r0, r3
	bne	.L89
	tst	r7, r6
	beq	.L89
	movs	r2, #0
	ldrsh	r3, [r4, r2]
	ldrh	r0, [r4]
	cmp	r3, #0
	bge	.L89
	lsls	r0, r0, #18
	lsrs	r0, r0, #26
.L87:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L89:
	adds	r4, r4, #2
	cmp	r4, r5
	bne	.L91
.L88:
	movs	r0, #0
	b	.L87
.L100:
	.align	2
.L99:
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
	push	{r4, r5, r6, lr}
	movs	r5, r0
	adds	r0, r0, #40
	movs	r4, r0
	adds	r5, r5, #30
.L102:
	ldrh	r0, [r5]
	ldr	r3, .L104
	adds	r5, r5, #2
	bl	.L9
	cmp	r5, r4
	bne	.L102
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L105:
	.align	2
.L104:
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
	push	{r4, lr}
	bl	EquippedAccessoryGetter
	cmp	r0, #0
	beq	.L106
	ldr	r3, .L111
	bl	.L9
.L106:
	@ sp needed
	pop	{r4}
	pop	{r1}
	bx	r1
.L112:
	.align	2
.L111:
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
	push	{r4, lr}
	movs	r4, r1
	@ sp needed
	bl	AccessoryEffectGetter
	subs	r0, r0, r4
	rsbs	r3, r0, #0
	adcs	r0, r0, r3
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
	push	{r4, r5, r6, lr}
	movs	r5, r0
	bl	EquippedAccessoryGetter
	subs	r4, r0, #0
	bne	.L115
.L117:
	movs	r0, #0
.L114:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L115:
	movs	r1, #1
	movs	r0, r5
	bl	AccessoryEffectTester
	cmp	r0, #0
	beq	.L117
	movs	r0, r5
	bl	EquippedAccessoryDurabilityGetter
	ldr	r3, .L128
	ldrb	r3, [r3]
	subs	r3, r3, r4
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	movs	r2, r0
	rsbs	r0, r3, #0
	ldr	r3, .L128+4
	ldrb	r3, [r3]
	ands	r0, r2
	cmp	r3, r4
	bne	.L119
	movs	r0, r2
	adds	r0, r0, #64
.L119:
	ldr	r3, .L128+8
	ldrb	r3, [r3]
	cmp	r3, r4
	bne	.L120
	movs	r0, r2
	adds	r0, r0, #128
.L120:
	ldr	r3, .L128+12
	ldrb	r3, [r3]
	cmp	r3, r4
	bne	.L121
	adds	r2, r2, #192
	movs	r0, r2
.L121:
	ldr	r3, [r5, #4]
	ldr	r2, .L128+16
	ldrb	r3, [r3, #4]
	ldr	r2, [r2]
	cmp	r3, r2
	beq	.L122
	ldr	r2, .L128+20
	ldr	r2, [r2]
	cmp	r2, r0
	bne	.L122
	movs	r0, #0
.L122:
	ldr	r2, .L128+24
	ldr	r2, [r2]
	cmp	r3, r2
	beq	.L114
	ldr	r2, .L128+28
	ldr	r2, [r2]
	cmp	r3, r2
	beq	.L114
	ldr	r3, .L128+32
	ldr	r3, [r3]
	cmp	r3, r0
	bne	.L114
	b	.L117
.L129:
	.align	2
.L128:
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
	ldr	r3, [r2]
	push	{r4, lr}
	movs	r4, r1
	lsls	r3, r3, #30
	bmi	.L130
	movs	r0, r1
	bl	EquippedAccessoryGetter
	cmp	r0, #0
	beq	.L130
	ldr	r3, .L142
	bl	.L9
	lsls	r0, r0, #8
	bpl	.L130
	movs	r0, r4
	bl	DepleteEquippedAccessoryUse
.L130:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L143:
	.align	2
.L142:
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
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L167
	movs	r6, r0
	sub	sp, sp, #20
	ldr	r0, .L167+4
	movs	r5, r1
	bl	.L9
	cmp	r0, #0
	bne	.L146
	lsls	r0, r5, #24
	ldr	r3, .L167+8
	lsrs	r0, r0, #24
	bl	.L9
	lsls	r0, r0, #9
	bpl	.L146
	movs	r0, r6
	bl	EquippedAccessoryGetter
	cmp	r0, #0
	bne	.L146
	movs	r2, #11
	movs	r3, #192
	ldrsb	r2, [r6, r2]
	tst	r2, r3
	bne	.L146
	movs	r3, #128
	lsls	r3, r3, #8
	orrs	r5, r3
	movs	r3, #128
	ldr	r2, [r6, #12]
	lsls	r3, r3, #3
	orrs	r3, r2
	str	r3, [r6, #12]
.L146:
	ldr	r3, .L167+12
	movs	r0, r5
	bl	.L9
	ldr	r3, .L167+16
	str	r0, [sp, #12]
	movs	r0, r5
	bl	.L9
	ldr	r3, .L167+20
	str	r0, [sp, #4]
	movs	r0, r5
	bl	.L9
	ldr	r3, .L167+24
	str	r0, [sp, #8]
.L148:
	ldrb	r7, [r3]
	cmp	r7, #0
	bne	.L150
.L149:
	lsls	r0, r5, #24
	ldr	r3, .L167+8
	lsrs	r0, r0, #24
	bl	.L9
	movs	r3, #128
	lsls	r3, r3, #15
	ands	r0, r3
	movs	r3, r6
	movs	r4, r0
	adds	r3, r3, #30
	str	r3, [sp]
	orrs	r4, r7
	bne	.L160
.L155:
	ldr	r2, [sp]
	lsls	r3, r4, #1
	ldrh	r7, [r2, r3]
	cmp	r7, #0
	bne	.L152
	adds	r4, r4, #12
	lsls	r4, r4, #1
	adds	r4, r6, r4
	strh	r5, [r4, #6]
.L153:
	movs	r0, #1
	b	.L144
.L150:
	ldr	r2, [sp, #8]
	adds	r3, r3, #1
	cmp	r2, r7
	bne	.L148
	movs	r7, #1
	b	.L149
.L152:
	ldr	r3, .L167+20
	movs	r0, r7
	bl	.L9
	ldr	r3, [sp, #8]
	cmp	r3, r0
	bne	.L154
	ldr	r3, .L167+16
	movs	r0, r7
	bl	.L9
	ldr	r3, [sp, #4]
	adds	r0, r0, r3
	ldr	r3, [sp, #12]
	cmp	r0, r3
	bgt	.L154
	ldr	r3, [sp, #4]
	adds	r4, r4, #12
	lsls	r4, r4, #1
	lsls	r3, r3, #8
	adds	r4, r6, r4
	adds	r7, r7, r3
	strh	r7, [r4, #6]
	b	.L153
.L154:
	adds	r4, r4, #1
	cmp	r4, #5
	bne	.L155
.L158:
	movs	r0, #0
.L144:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L160:
	movs	r3, #0
.L151:
	ldr	r1, [sp]
	lsls	r2, r3, #1
	ldrh	r2, [r1, r2]
	cmp	r2, #0
	bne	.L157
	adds	r3, r3, #12
	lsls	r3, r3, #1
	adds	r3, r6, r3
	strh	r5, [r3, #6]
	b	.L153
.L157:
	adds	r3, r3, #1
	cmp	r3, #5
	bne	.L151
	b	.L158
.L168:
	.align	2
.L167:
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
