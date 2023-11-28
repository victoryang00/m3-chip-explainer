	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0	sdk_version 14, 0
	.globl	_daxpy                          ; -- Begin function daxpy
	.p2align	2
_daxpy:                                 ; @daxpy
	.cfi_startproc
; %bb.0:
                                        ; kill: def $d0 killed $d0 def $z0
	cmp	w2, #1
	b.lt	LBB0_9
; %bb.1:
	mov	w8, w2
	cnth	x10
	cmp	x10, x8
	b.hi	LBB0_6
; %bb.2:
	lsl	x9, x8, #3
	add	x11, x1, x9
	add	x9, x0, x9
	cmp	x9, x1
	ccmp	x11, x0, #0, hi
	b.hi	LBB0_6
; %bb.3:
	mov	x11, #0
	udiv	x9, x8, x10
	mul	x9, x9, x10
	rdvl	x12, #1
	lsr	x12, x12, #4
	and	x15, x12, #0xffffffff
	add	x13, x15, w12, uxtw #1
	sub	x12, x8, x9
	lsl	x16, x13, #4
	add	x13, x0, x16
	lsl	x17, x15, #5
	add	x14, x0, x17
	lsl	x2, x15, #4
	mov	z1.d, d0
	add	x15, x0, x2
	add	x16, x1, x16
	add	x17, x1, x17
	add	x2, x1, x2
	ptrue	p0.d
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ld1d	{ z2.d }, p0/z, [x0, x11, lsl  #3]
	ld1d	{ z3.d }, p0/z, [x15, x11, lsl  #3]
	ld1d	{ z4.d }, p0/z, [x14, x11, lsl  #3]
	ld1d	{ z5.d }, p0/z, [x13, x11, lsl  #3]
	ld1d	{ z6.d }, p0/z, [x1, x11, lsl  #3]
	ld1d	{ z7.d }, p0/z, [x2, x11, lsl  #3]
	ld1d	{ z16.d }, p0/z, [x17, x11, lsl  #3]
	ld1d	{ z17.d }, p0/z, [x16, x11, lsl  #3]
	fmad	z2.d, p0/m, z1.d, z6.d
	fmad	z3.d, p0/m, z1.d, z7.d
	fmad	z4.d, p0/m, z1.d, z16.d
	fmad	z5.d, p0/m, z1.d, z17.d
	st1d	{ z2.d }, p0, [x1, x11, lsl  #3]
	st1d	{ z3.d }, p0, [x2, x11, lsl  #3]
	st1d	{ z4.d }, p0, [x17, x11, lsl  #3]
	st1d	{ z5.d }, p0, [x16, x11, lsl  #3]
	add	x11, x11, x10
	cmp	x9, x11
	b.ne	LBB0_4
; %bb.5:
	cbnz	x12, LBB0_7
	b	LBB0_9
LBB0_6:
	mov	x9, #0
LBB0_7:
	lsl	x11, x9, #3
	add	x10, x1, x11
	add	x11, x0, x11
	sub	x8, x8, x9
LBB0_8:                                 ; =>This Inner Loop Header: Depth=1
	ldr	d1, [x11], #8
	ldr	d2, [x10]
	fmadd	d1, d0, d1, d2
	str	d1, [x10], #8
	subs	x8, x8, #1
	b.ne	LBB0_8
LBB0_9:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
