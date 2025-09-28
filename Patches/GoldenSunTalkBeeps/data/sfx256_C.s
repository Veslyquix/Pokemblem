	.include "MPlayDef.s"

	.equ	sfx256_grp, GoldenSunVoices
	.equ	sfx256_pri, 0
	.equ	sfx256_rev, 0
	.equ	sfx256_mvl, 127
	.equ	sfx256_key, 0
	.equ	sfx256_tbs, 1
	.equ	sfx256_exg, 0
	.equ	sfx256_cmp, 1

	.section .rodata
	.global	sfx256
	.align	2


@**************** Track 1 (Midi-Chn.0) ****************@

sfx256_001:
@  #01 @000   ----------------------------------------
 .byte   VOL , 127*sfx256_mvl/mxv
 .byte   KEYSH , sfx256_key+0
 .byte   VOICE , 0
 .byte   TIE ,Cn3 ,v127
 .byte   W96
@  #01 @001   ----------------------------------------
 .byte   EOT
 .byte   FINE

@******************************************************@
	.align	2

sfx256:
	.byte	1	@ NumTrks
	.byte	0	@ NumBlks
	.byte	sfx256_pri	@ Priority
	.byte	sfx256_rev	@ Reverb.
    
	.word	sfx256_grp
    
	.word	sfx256_001

	.end
