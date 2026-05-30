	.include "MPlayDef.s"

	.equ	sfx257_grp, GoldenSunVoices
	.equ	sfx257_pri, 0
	.equ	sfx257_rev, 0
	.equ	sfx257_mvl, 127
	.equ	sfx257_key, 0
	.equ	sfx257_tbs, 1
	.equ	sfx257_exg, 0
	.equ	sfx257_cmp, 1

	.section .rodata
	.global	sfx257
	.align	2


@**************** Track 1 (Midi-Chn.0) ****************@

sfx257_001:
@  #01 @000   ----------------------------------------
 .byte   VOL , 127*sfx257_mvl/mxv
 .byte   KEYSH , sfx257_key+0
 .byte   VOICE , 0
 .byte   TIE ,An2 ,v127
 .byte   W96
@  #01 @001   ----------------------------------------
 .byte   EOT
 .byte   FINE

@******************************************************@
	.align	2

sfx257:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	sfx257_pri	@ Priority
	.byte	sfx257_rev	@ Reverb.
    
	.word	sfx257_grp
    
	.word	sfx257_001

	.end
