	.include "MPlayDef.s"

	.equ	song22_grp, voicegroup000
	.equ	song22_pri, 10
	.equ	song22_rev, 128
	.equ	song22_mvl, 127
	.equ	song22_key, 0
	.equ	song22_tbs, 1
	.equ	song22_exg, 0
	.equ	song22_cmp, 1

	.section .rodata
	.global	song22
	.align	2


@**************** Track 1 (Midi-Chn.0) ****************@

song22_001:
@  #01 @000   ----------------------------------------
 .byte   KEYSH , song22_key+0
 .byte   TEMPO , 94*song22_tbs/2
 .byte   VOICE , 1
 .byte   VOL , 68*song22_mvl/mxv
 .byte   LFOS 44
 .byte   BENDR, 12
 .byte   PAN , c_v+31
 .byte   BEND , c_v+0
 .byte   N36 ,An4 ,v080
 .byte   W09
 .byte   MOD 7
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W06
 .byte   TEMPO , 76*song22_tbs/2
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   MOD 0
 .byte   N06 ,En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   TEMPO , 94*song22_tbs/2
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N36 ,Gn4
 .byte   W09
 .byte   MOD 7
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W06
 .byte   TEMPO , 76*song22_tbs/2
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   MOD 0
 .byte   N06 ,Dn4
 .byte   W06
 .byte   Gn4
 .byte   W06
@  #01 @001   ----------------------------------------
 .byte   TEMPO , 94*song22_tbs/2
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N36 ,Fs4
 .byte   W09
 .byte   MOD 7
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W06
 .byte   TEMPO , 76*song22_tbs/2
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   MOD 0
 .byte   N06 ,Dn4
 .byte   W06
 .byte   Fs4
 .byte   W06
 .byte   TEMPO , 94*song22_tbs/2
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N48 ,En4
 .byte   W09
 .byte   MOD 7
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W06
@  #01 @002   ----------------------------------------
 .byte   TEMPO , 94*song22_tbs/2
 .byte   VOL , 68*song22_mvl/mxv
 .byte   MOD 0
 .byte   W96
@  #01 @003   ----------------------------------------
 .byte   W96
@  #01 @004   ----------------------------------------
 .byte   TEMPO , 110*song22_tbs/2
 .byte   W48
 .byte   TEMPO , 98*song22_tbs/2
 .byte   W24
 .byte   TEMPO , 76*song22_tbs/2
 .byte   W24
@  #01 @005   ----------------------------------------
 .byte   TEMPO , 98*song22_tbs/2
 .byte   W24
 .byte   TEMPO , 76*song22_tbs/2
 .byte   W24
 .byte   TEMPO , 98*song22_tbs/2
 .byte   W24
 .byte   TEMPO , 76*song22_tbs/2
 .byte   W24
@  #01 @006   ----------------------------------------
 .byte   TEMPO , 98*song22_tbs/2
 .byte   W48
 .byte   W96
@  #01 @007   ----------------------------------------
 .byte   W72
 .byte   VOICE , 2
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v+32
 .byte   TIE ,En1 ,v120
 .byte   W24
@  #01 @008   ----------------------------------------
 .byte   W24
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W24
 .byte   W02
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 85*song22_mvl/mxv
 .byte   W09
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W07
@  #01 @009   ----------------------------------------
 .byte   EOT
 .byte   TEMPO , 128*song22_tbs/2
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N12 ,En2 ,v127
 .byte   W12
 .byte   PAN , c_v-46
 .byte   N12 ,En1
 .byte   W12
 .byte   PAN , c_v+31
 .byte   N12 ,En2
 .byte   W12
 .byte   PAN , c_v-44
 .byte   N12 ,En1
 .byte   W12
 .byte   PAN , c_v+31
 .byte   N12 ,En2
 .byte   W12
 .byte   PAN , c_v-46
 .byte   N12 ,En1
 .byte   W12
 .byte   PAN , c_v+31
 .byte   N12 ,En2
 .byte   W12
 .byte   PAN , c_v-44
 .byte   N12 ,En1
 .byte   W12
@  #01 @010   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   N36 ,An1
 .byte   W36
 .byte   PAN , c_v-33
 .byte   N06 ,An2
 .byte   W06
 .byte   An2 ,v120
 .byte   W06
 .byte   PAN , c_v+32
 .byte   N36 ,Gn1 ,v127
 .byte   W36
 .byte   PAN , c_v-33
 .byte   N06 ,Gn2
 .byte   W06
 .byte   N06
 .byte   W06
@  #01 @011   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   N36 ,Fs1
 .byte   W36
 .byte   PAN , c_v-32
 .byte   N06 ,An2
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   PAN , c_v+31
 .byte   N24 ,Dn2
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,An1
 .byte   W24
@  #01 @012   ----------------------------------------
 .byte   An2
 .byte   W96
@  #01 @013   ----------------------------------------
 .byte   W96
@  #01 @014   ----------------------------------------
 .byte   W96
@  #01 @015   ----------------------------------------
 .byte   W96
@  #01 @016   ----------------------------------------
 .byte   W96
@  #01 @017   ----------------------------------------
 .byte   W96
@  #01 @018   ----------------------------------------
 .byte   W96
@  #01 @019   ----------------------------------------
 .byte   W96
@  #01 @020   ----------------------------------------
 .byte   W96
@  #01 @021   ----------------------------------------
 .byte   W96
@  #01 @022   ----------------------------------------
 .byte   W96
@  #01 @023   ----------------------------------------
 .byte   W96
@  #01 @024   ----------------------------------------
 .byte   W96
@  #01 @025   ----------------------------------------
 .byte   W96
@  #01 @026   ----------------------------------------
 .byte   W96
@  #01 @027   ----------------------------------------
 .byte   W96
@  #01 @028   ----------------------------------------
 .byte   W96
@  #01 @029   ----------------------------------------
 .byte   W96
@  #01 @030   ----------------------------------------
 .byte   TEMPO , 112*song22_tbs/2
 .byte   W24
 .byte   TEMPO , 112*song22_tbs/2
 .byte   W21
 .byte   TEMPO , 106*song22_tbs/2
 .byte   W24
 .byte   W03
 .byte   TEMPO , 96*song22_tbs/2
 .byte   W24
@  #01 @031   ----------------------------------------
 .byte   W24
 .byte   TEMPO , 90*song22_tbs/2
 .byte   W24
 .byte   TEMPO , 74*song22_tbs/2
 .byte   VOICE , 2
 .byte   W24
 .byte   TEMPO , 128*song22_tbs/2
 .byte   PAN , c_v+31
 .byte   N06 ,En2 ,v120
 .byte   W06
 .byte   En2 ,v088
 .byte   W06
 .byte   TEMPO , 128*song22_tbs/2
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
@  #01 @032   ----------------------------------------
 .byte   TEMPO , 130*song22_tbs/2
 .byte   PAN , c_v-32
 .byte   N24 ,An1 ,v120
 .byte   W48
 .byte   PAN , c_v+32
 .byte   W12
 .byte   N12 ,An2 ,v124
 .byte   W12
 .byte   PAN , c_v-32
 .byte   N12 ,An1
 .byte   W24
@  #01 @033   ----------------------------------------
 .byte   N24 ,Gn1 ,v120
 .byte   W60
 .byte   N12
 .byte   W12
 .byte   PAN , c_v+32
 .byte   N06 ,Gn2 ,v124
 .byte   W06
 .byte   Gn2 ,v116
 .byte   W06
 .byte   PAN , c_v-32
 .byte   N12 ,Gn1 ,v124
 .byte   W12
@  #01 @034   ----------------------------------------
 .byte   N24 ,An1 ,v120
 .byte   W48
 .byte   PAN , c_v+31
 .byte   W12
 .byte   N12 ,An2 ,v124
 .byte   W12
 .byte   PAN , c_v-30
 .byte   N12 ,An1
 .byte   W24
@  #01 @035   ----------------------------------------
 .byte   N24 ,An1 ,v120
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
 .byte   PAN , c_v+32
 .byte   N06 ,An2 ,v124
 .byte   W06
 .byte   An2 ,v116
 .byte   W06
 .byte   PAN , c_v-30
 .byte   N06 ,An1 ,v124
 .byte   W06
 .byte   N06
 .byte   W06
@  #01 @036   ----------------------------------------
 .byte   N24 ,An1 ,v120
 .byte   W36
 .byte   N12 ,An1 ,v124
 .byte   W24
 .byte   An1 ,v116
 .byte   W12
 .byte   PAN , c_v+32
 .byte   N06 ,An2 ,v124
 .byte   W06
 .byte   An2 ,v108
 .byte   W06
 .byte   PAN , c_v-32
 .byte   N12 ,Gs1 ,v124
 .byte   W12
@  #01 @037   ----------------------------------------
 .byte   N24 ,Gn1 ,v120
 .byte   W36
 .byte   N12 ,Gn1 ,v124
 .byte   W24
 .byte   Gn1 ,v120
 .byte   W12
 .byte   PAN , c_v+31
 .byte   N06 ,Gn2 ,v124
 .byte   W06
 .byte   Gn2 ,v116
 .byte   W06
 .byte   PAN , c_v-32
 .byte   N12 ,As1 ,v124
 .byte   W12
@  #01 @038   ----------------------------------------
 .byte   N24 ,An1 ,v120
 .byte   W36
 .byte   N12 ,An1 ,v124
 .byte   W24
 .byte   PAN , c_v+32
 .byte   N12 ,An2
 .byte   W12
 .byte   PAN , c_v-32
 .byte   N12 ,An1
 .byte   W12
 .byte   Gs1
 .byte   W12
@  #01 @039   ----------------------------------------
 .byte   TEMPO , 122*song22_tbs/2
 .byte   N08 ,An1 ,v120
 .byte   W08
 .byte   En1 ,v108
 .byte   W08
 .byte   An1 ,v104
 .byte   W08
 .byte   TEMPO , 116*song22_tbs/2
 .byte   PAN , c_v+32
 .byte   N08 ,Cs2 ,v120
 .byte   W08
 .byte   An1 ,v104
 .byte   W08
 .byte   Cs2
 .byte   W08
 .byte   TEMPO , 102*song22_tbs/2
 .byte   PAN , c_v-30
 .byte   N08 ,En2 ,v120
 .byte   W08
 .byte   Cs2 ,v104
 .byte   W04
 .byte   TEMPO , 90*song22_tbs/2
 .byte   W04
 .byte   En2
 .byte   W08
 .byte   TEMPO , 84*song22_tbs/2
 .byte   PAN , c_v+32
 .byte   N24 ,En1 ,v112
 .byte   W09
 .byte   VOL , 80*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
@  #01 @040   ----------------------------------------
 .byte   TEMPO , 104*song22_tbs/2
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W48
 .byte   TEMPO , 114*song22_tbs/2
 .byte   W24
 .byte   TEMPO , 124*song22_tbs/2
 .byte   W24
@  #01 @041   ----------------------------------------
 .byte   TEMPO , 130*song22_tbs/2
 .byte   W96
@  #01 @042   ----------------------------------------
 .byte   W96
@  #01 @043   ----------------------------------------
 .byte   VOICE , 10
 .byte   W48
 .byte   TEMPO , 118*song22_tbs/2
 .byte   N36 ,Gn3 ,v044
 .byte   W24
 .byte   TEMPO , 108*song22_tbs/2
 .byte   W12
 .byte   N06 ,Fs3
 .byte   W06
 .byte   Fn3
 .byte   W06
@  #01 @044   ----------------------------------------
 .byte   TEMPO , 104*song22_tbs/2
 .byte   N32 ,Dn3
 .byte   W32
 .byte   W01
 .byte   N15 ,Bn2
 .byte   W15
 .byte   TEMPO , 114*song22_tbs/2
 .byte   N48 ,Gn3
 .byte   W21
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   TEMPO , 124*song22_tbs/2
 .byte   PAN , c_v+16
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W02
 .byte   PAN , c_v+9
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W03
 .byte   PAN , c_v+4
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   PAN , c_v-1
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W04
 .byte   PAN , c_v-6
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   PAN , c_v-11
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   PAN , c_v-16
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W04
@  #01 @045   ----------------------------------------
 .byte   TEMPO , 130*song22_tbs/2
 .byte   PAN , c_v+32
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W96
@  #01 @046   ----------------------------------------
 .byte   W96
@  #01 @047   ----------------------------------------
 .byte   W72
 .byte   TEMPO , 102*song22_tbs/2
 .byte   W24
@  #01 @048   ----------------------------------------
 .byte   TEMPO , 130*song22_tbs/2
 .byte   W96
@  #01 @049   ----------------------------------------
 .byte   W24
 .byte   TEMPO , 114*song22_tbs/2
 .byte   W24
 .byte   TEMPO , 108*song22_tbs/2
 .byte   W24
 .byte   TEMPO , 96*song22_tbs/2
 .byte   VOICE , 2
 .byte   W24
@  #01 @050   ----------------------------------------
 .byte   TEMPO , 130*song22_tbs/2
 .byte   PAN , c_v+31
 .byte   VOL , 77*song22_mvl/mxv
 .byte   N12 ,An1 ,v096
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,En1
 .byte   W24
 .byte   PAN , c_v+31
 .byte   N12 ,An1
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,En1
 .byte   W24
@  #01 @051   ----------------------------------------
Label_01054512:
 .byte   PAN , c_v+31
 .byte   N12 ,An1 ,v096
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,En1
 .byte   W24
 .byte   PAN , c_v+31
 .byte   N12 ,An1
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,En1
 .byte   W24
 .byte   PEND 
@  #01 @052   ----------------------------------------
 .byte   PATT
  .word Label_01054512
@  #01 @053   ----------------------------------------
 .byte   PATT
  .word Label_01054512
@  #01 @054   ----------------------------------------
 .byte   PATT
  .word Label_01054512
@  #01 @055   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   N12 ,An1 ,v096
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,En1
 .byte   W24
 .byte   PAN , c_v+31
 .byte   VOL , 79*song22_mvl/mxv
 .byte   N06 ,En3 ,v108
 .byte   W06
 .byte   En3 ,v088
 .byte   W06
 .byte   PAN , c_v-24
 .byte   N12 ,En2 ,v120
 .byte   W12
 .byte   PAN , c_v+31
 .byte   N06 ,Cn3 ,v104
 .byte   W06
 .byte   Cn3 ,v088
 .byte   W06
 .byte   PAN , c_v-24
 .byte   N12 ,Cn2 ,v120
 .byte   W12
@  #01 @056   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   VOL , 77*song22_mvl/mxv
 .byte   N12 ,An1 ,v096
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,En1
 .byte   W24
 .byte   PAN , c_v+31
 .byte   N12 ,An1
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,En1
 .byte   W24
@  #01 @057   ----------------------------------------
 .byte   PATT
  .word Label_01054512
@  #01 @058   ----------------------------------------
 .byte   PATT
  .word Label_01054512
@  #01 @059   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   N12 ,An1 ,v096
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,En1
 .byte   W24
 .byte   PAN , c_v+31
 .byte   VOL , 79*song22_mvl/mxv
 .byte   N06 ,En3 ,v108
 .byte   W06
 .byte   En3 ,v088
 .byte   W06
 .byte   PAN , c_v-19
 .byte   N12 ,En2 ,v116
 .byte   W12
 .byte   PAN , c_v+31
 .byte   N06 ,Cn3 ,v108
 .byte   W06
 .byte   Cn3 ,v088
 .byte   W06
 .byte   PAN , c_v-22
 .byte   N12 ,Cn2 ,v120
 .byte   W12
@  #01 @060   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   VOL , 77*song22_mvl/mxv
 .byte   N06 ,An2
 .byte   W06
 .byte   N05
 .byte   W06
 .byte   N24 ,An1
 .byte   W03
 .byte   PAN , c_v-32
 .byte   W21
 .byte   PAN , c_v+32
 .byte   N06 ,An1 ,v127
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N06
 .byte   W36
@  #01 @061   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   N06 ,An2 ,v120
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N24 ,An1
 .byte   W03
 .byte   PAN , c_v-32
 .byte   W21
 .byte   PAN , c_v+32
 .byte   N06 ,An1 ,v127
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N06
 .byte   W36
@  #01 @062   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   N05 ,An2 ,v120
 .byte   W06
 .byte   N05
 .byte   W06
 .byte   N24 ,An1
 .byte   W03
 .byte   PAN , c_v-32
 .byte   W21
 .byte   PAN , c_v+32
 .byte   N06 ,An1 ,v127
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N06
 .byte   W36
@  #01 @063   ----------------------------------------
 .byte   VOICE , 15
 .byte   PAN , c_v+40
 .byte   N24 ,Cn4 ,v044
 .byte   W24
 .byte   Bn3
 .byte   W24
 .byte   An3
 .byte   W24
 .byte   Gs3
 .byte   W24
@  #01 @064   ----------------------------------------
 .byte   TEMPO , 116*song22_tbs/2
 .byte   An3
 .byte   W24
 .byte   TEMPO , 102*song22_tbs/2
 .byte   Gs3
 .byte   W24
 .byte   TEMPO , 90*song22_tbs/2
 .byte   Fn3
 .byte   W24
 .byte   TEMPO , 76*song22_tbs/2
 .byte   En3
 .byte   W24
@  #01 @065   ----------------------------------------
 .byte   TEMPO , 76*song22_tbs/2
 .byte   W96
@  #01 @066   ----------------------------------------
 .byte   TEMPO , 100*song22_tbs/2
 .byte   W96
@  #01 @067   ----------------------------------------
 .byte   W96
@  #01 @068   ----------------------------------------
 .byte   W96
@  #01 @069   ----------------------------------------
 .byte   W96
@  #01 @070   ----------------------------------------
 .byte   W96
@  #01 @071   ----------------------------------------
 .byte   W96
@  #01 @072   ----------------------------------------
 .byte   W96
@  #01 @073   ----------------------------------------
 .byte   VOICE , 26
 .byte   PAN , c_v-42
 .byte   N48 ,Cn3 ,v064
 .byte   W48
 .byte   N24 ,Gn3
 .byte   W24
 .byte   Cs3
 .byte   W24
@  #01 @074   ----------------------------------------
 .byte   N48 ,Fn3
 .byte   W60
 .byte   N36 ,Cn3
 .byte   W36
@  #01 @075   ----------------------------------------
 .byte   N48 ,Fn3
 .byte   W60
 .byte   N24 ,Bn2
 .byte   W24
 .byte   N12 ,Dn3
 .byte   W12
@  #01 @076   ----------------------------------------
 .byte   N48 ,En3
 .byte   W60
 .byte   N24 ,Bn2
 .byte   W24
 .byte   N12 ,An2
 .byte   W12
@  #01 @077   ----------------------------------------
 .byte   N48 ,Bn2
 .byte   W60
 .byte   N24 ,Fn3
 .byte   W24
 .byte   N12 ,En3
 .byte   W12
@  #01 @078   ----------------------------------------
 .byte   N48 ,An2
 .byte   W60
 .byte   N24
 .byte   W24
 .byte   N12 ,Dn3
 .byte   W12
@  #01 @079   ----------------------------------------
 .byte   N24 ,Cn3
 .byte   W24
 .byte   Bn2
 .byte   W24
 .byte   An2
 .byte   W24
 .byte   Cn3
 .byte   W24
@  #01 @080   ----------------------------------------
 .byte   N12 ,Dn3
 .byte   W12
 .byte   Cn3
 .byte   W12
 .byte   N36 ,Bn2
 .byte   W36
 .byte   N24 ,An2
 .byte   W24
 .byte   N12 ,Gn2
 .byte   W12
@  #01 @081   ----------------------------------------
 .byte   N48 ,Bn2
 .byte   W48
 .byte   N24 ,Gn3
 .byte   W24
 .byte   N12 ,Fn3
 .byte   W12
 .byte   En3
 .byte   W12
@  #01 @082   ----------------------------------------
 .byte   VOL , 55*song22_mvl/mxv
 .byte   N24 ,Dn3
 .byte   W24
 .byte   Bn2
 .byte   W24
 .byte   An2
 .byte   W24
 .byte   N12 ,Gs2
 .byte   W12
 .byte   Bn2
 .byte   W12
@  #01 @083   ----------------------------------------
 .byte   N96 ,Cs3
 .byte   W96
@  #01 @084   ----------------------------------------
 .byte   W48
 .byte   TEMPO , 84*song22_tbs/2
 .byte   W24
 .byte   TEMPO , 70*song22_tbs/2
 .byte   W24
@  #01 @085   ----------------------------------------
 .byte   TEMPO , 96*song22_tbs/2
 .byte   W96
@  #01 @086   ----------------------------------------
 .byte   TEMPO , 98*song22_tbs/2
 .byte   W96
@  #01 @087   ----------------------------------------
 .byte   TEMPO , 108*song22_tbs/2
 .byte   W96
@  #01 @088   ----------------------------------------
 .byte   TEMPO , 122*song22_tbs/2
 .byte   W96
@  #01 @089   ----------------------------------------
 .byte   TEMPO , 128*song22_tbs/2
 .byte   W96
@  #01 @090   ----------------------------------------
 .byte   TEMPO , 130*song22_tbs/2
 .byte   W96
@  #01 @091   ----------------------------------------
 .byte   W96
@  #01 @092   ----------------------------------------
 .byte   W96
@  #01 @093   ----------------------------------------
 .byte   W96
@  #01 @094   ----------------------------------------
 .byte   W96
@  #01 @095   ----------------------------------------
 .byte   W96
@  #01 @096   ----------------------------------------
 .byte   W96
@  #01 @097   ----------------------------------------
 .byte   W96
@  #01 @098   ----------------------------------------
 .byte   W96
@  #01 @099   ----------------------------------------
 .byte   W96
@  #01 @100   ----------------------------------------
 .byte   VOICE , 2
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v-32
 .byte   N96 ,Dn1 ,v108
 .byte   W96
@  #01 @101   ----------------------------------------
 .byte   N12
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
@  #01 @102   ----------------------------------------
 .byte   N96 ,En1
 .byte   W96
@  #01 @103   ----------------------------------------
 .byte   N12
 .byte   W36
 .byte   N12
 .byte   W12
 .byte   N06 ,En2
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N12 ,En1
 .byte   W24
 .byte   N12
 .byte   W12
@  #01 @104   ----------------------------------------
 .byte   Fn1
 .byte   W36
 .byte   N12
 .byte   W12
 .byte   N06 ,Fn2
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N12 ,Cn2
 .byte   W12
 .byte   N06 ,Fn2
 .byte   W12
 .byte   N12 ,Cn2
 .byte   W12
@  #01 @105   ----------------------------------------
 .byte   Cn2 ,v120
 .byte   W24
 .byte   An1
 .byte   W24
 .byte   Cs2
 .byte   W24
 .byte   An1
 .byte   W24
@  #01 @106   ----------------------------------------
 .byte   N03 ,Bn1 ,v127
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N12
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   N24 ,Gn1
 .byte   W24
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
@  #01 @107   ----------------------------------------
 .byte   N12
 .byte   W12
 .byte   N06 ,Dn1
 .byte   W24
 .byte   N12 ,Gn1
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   Gn1
 .byte   W24
 .byte   N12
 .byte   W12
@  #01 @108   ----------------------------------------
Label_01054706:
 .byte   N24 ,An1 ,v127
 .byte   W24
 .byte   En1
 .byte   W24
 .byte   An1
 .byte   W24
 .byte   En1
 .byte   W24
 .byte   PEND 
@  #01 @109   ----------------------------------------
 .byte   PATT
  .word Label_01054706
@  #01 @110   ----------------------------------------
 .byte   N24 ,An1 ,v127
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W36
@  #01 @111   ----------------------------------------
 .byte   N24
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W24
 .byte   Gs1
 .byte   W12
@  #01 @112   ----------------------------------------
 .byte   N48 ,Gn1
 .byte   W84
 .byte   N06 ,Dn2
 .byte   W12
@  #01 @113   ----------------------------------------
 .byte   N48 ,Gn1
 .byte   W72
 .byte   PAN , c_v+32
 .byte   W12
 .byte   N06 ,An2 ,v108
 .byte   W06
 .byte   An2 ,v100
 .byte   W06
@  #01 @114   ----------------------------------------
 .byte   N24 ,En2 ,v127
 .byte   W24
 .byte   PAN , c_v-36
 .byte   N24 ,An1
 .byte   W24
 .byte   PAN , c_v+32
 .byte   N24 ,En2
 .byte   W24
 .byte   PAN , c_v-36
 .byte   N24 ,An1
 .byte   W24
@  #01 @115   ----------------------------------------
 .byte   PAN , c_v+32
 .byte   N24 ,En2
 .byte   W24
 .byte   PAN , c_v-34
 .byte   N24 ,An1
 .byte   W24
 .byte   PAN , c_v+33
 .byte   N24 ,En2
 .byte   W24
 .byte   PAN , c_v-35
 .byte   W12
 .byte   PAN , c_v+33
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
@  #01 @116   ----------------------------------------
 .byte   PAN , c_v-35
 .byte   N24 ,Gn1
 .byte   W36
 .byte   PAN , c_v+34
 .byte   N06 ,Gn2
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   PAN , c_v-34
 .byte   N12 ,Gn1
 .byte   W24
 .byte   N12
 .byte   W12
@  #01 @117   ----------------------------------------
 .byte   N36
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
@  #01 @118   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   N24 ,An1
 .byte   W24
 .byte   PAN , c_v-40
 .byte   N24 ,En1
 .byte   W24
 .byte   PAN , c_v+31
 .byte   N24 ,An1
 .byte   W24
 .byte   PAN , c_v-40
 .byte   N24 ,En1
 .byte   W24
@  #01 @119   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   N24 ,An1
 .byte   W24
 .byte   PAN , c_v-40
 .byte   N24 ,En1
 .byte   W24
 .byte   PAN , c_v+32
 .byte   N12 ,An1
 .byte   W12
 .byte   PAN , c_v-40
 .byte   N12 ,En1
 .byte   W12
 .byte   PAN , c_v+31
 .byte   N12 ,An1
 .byte   W12
 .byte   En1
 .byte   W03
 .byte   PAN , c_v-40
 .byte   W09
@  #01 @120   ----------------------------------------
 .byte   PAN , c_v+34
 .byte   N06 ,En2
 .byte   W12
 .byte   PAN , c_v-40
 .byte   N12 ,An1
 .byte   W24
 .byte   PAN , c_v+31
 .byte   N06 ,An2
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   PAN , c_v-38
 .byte   N32 ,An1
 .byte   W12
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 11*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 0*song22_mvl/mxv
 .byte   W15
 .byte   FINE

@**************** Track 2 (Midi-Chn.1) ****************@

song22_002:
@  #02 @000   ----------------------------------------
 .byte   KEYSH , song22_key+0
 .byte   VOICE , 27
 .byte   PAN , c_v+0
 .byte   VOL , 68*song22_mvl/mxv
 .byte   LFOS 44
 .byte   BENDR, 12
 .byte   BEND , c_v+0
 .byte   W96
@  #02 @001   ----------------------------------------
 .byte   W96
@  #02 @002   ----------------------------------------
 .byte   W96
@  #02 @003   ----------------------------------------
 .byte   W96
@  #02 @004   ----------------------------------------
 .byte   W48
 .byte   VOICE , 28
 .byte   PAN , c_v+32
 .byte   N36 ,Cs4 ,v052
 .byte   W15
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 37*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 30*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W01
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N06 ,An3
 .byte   W06
 .byte   Cs4
 .byte   W06
@  #02 @005   ----------------------------------------
 .byte   N36 ,Bn3
 .byte   W15
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 37*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 30*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W01
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N06 ,Gn3
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   N36 ,An3
 .byte   W15
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 37*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 30*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W01
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N06 ,En3
 .byte   W06
 .byte   An3
 .byte   W06
@  #02 @006   ----------------------------------------
 .byte   TIE ,Bn3
 .byte   W48
 .byte   W84
@  #02 @007   ----------------------------------------
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 33*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W09
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W15
 .byte   VOL , 9*song22_mvl/mxv
 .byte   W24
 .byte   EOT
 .byte   VOL , 0*song22_mvl/mxv
 .byte   W24
@  #02 @008   ----------------------------------------
 .byte   VOL , 89*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   W96
@  #02 @009   ----------------------------------------
 .byte   W96
@  #02 @010   ----------------------------------------
 .byte   VOICE , 32
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,An4 ,v112
 .byte   W36
 .byte   N06 ,En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   N36 ,Gn4
 .byte   W36
 .byte   N06 ,Dn4
 .byte   W06
 .byte   Gn4
 .byte   W06
@  #02 @011   ----------------------------------------
 .byte   N72 ,Fs4
 .byte   W72
 .byte   N12 ,Gs4
 .byte   W12
 .byte   N06 ,En4
 .byte   W06
 .byte   Gs4
 .byte   W06
@  #02 @012   ----------------------------------------
 .byte   PAN , c_v+0
 .byte   N12 ,An4 ,v084
 .byte   W12
 .byte   An3 ,v076
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N21
 .byte   W24
@  #02 @013   ----------------------------------------
 .byte   N06
 .byte   W12
 .byte   N12
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   PAN , c_v+16
 .byte   W06
 .byte   N06 ,Fs3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Bn3 ,v112
 .byte   W06
@  #02 @014   ----------------------------------------
 .byte   VOICE , 32
 .byte   N36 ,Cs4 ,v127
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N06
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   N24 ,En4
 .byte   W24
 .byte   Cs4
 .byte   W24
@  #02 @015   ----------------------------------------
Label_010548B6:
 .byte   N24 ,Gn4 ,v127
 .byte   W24
 .byte   Fs4
 .byte   W24
 .byte   En4
 .byte   W24
 .byte   Dn4
 .byte   W24
 .byte   PEND 
@  #02 @016   ----------------------------------------
 .byte   N36 ,Cs4
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N03 ,An3
 .byte   W12
 .byte   N48 ,En4
 .byte   W12
 .byte   MOD 6
 .byte   W12
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W04
@  #02 @017   ----------------------------------------
 .byte   VOICE , 10
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   N36 ,An3 ,v072
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N03 ,En3
 .byte   W12
 .byte   N48 ,Cs4
 .byte   W12
 .byte   MOD 5
 .byte   W12
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W04
@  #02 @018   ----------------------------------------
 .byte   VOICE , 32
 .byte   VOL , 89*song22_mvl/mxv
 .byte   PAN , c_v+16
 .byte   N36 ,Cs4 ,v127
 .byte   W36
 .byte   MOD 0
 .byte   N06
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   N24 ,En4
 .byte   W24
 .byte   Cs4
 .byte   W24
@  #02 @019   ----------------------------------------
 .byte   PATT
  .word Label_010548B6
@  #02 @020   ----------------------------------------
 .byte   N36 ,Cs4 ,v127
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N03 ,An3
 .byte   W12
 .byte   N48 ,En4
 .byte   W12
 .byte   MOD 6
 .byte   W12
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W04
@  #02 @021   ----------------------------------------
 .byte   VOICE , 10
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   N36 ,An3 ,v072
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N03 ,En3
 .byte   W12
 .byte   N06 ,Cs4
 .byte   W12
 .byte   An3
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   N24 ,En4
 .byte   W24
@  #02 @022   ----------------------------------------
 .byte   VOICE , 32
 .byte   PAN , c_v+16
 .byte   N36 ,Dn4 ,v127
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N03 ,Bn3
 .byte   W12
 .byte   N48 ,Gn4
 .byte   W12
 .byte   MOD 6
 .byte   W12
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W04
@  #02 @023   ----------------------------------------
 .byte   VOICE , 10
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   N36 ,Gn3 ,v076
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N03 ,Dn3
 .byte   W12
 .byte   N48 ,Bn3
 .byte   W12
 .byte   MOD 6
 .byte   W12
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W04
@  #02 @024   ----------------------------------------
 .byte   VOICE , 32
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v+16
 .byte   N72 ,Cs4 ,v127
 .byte   W15
 .byte   MOD 6
 .byte   W56
 .byte   W01
 .byte   MOD 0
 .byte   N24 ,Dn4
 .byte   W24
@  #02 @025   ----------------------------------------
 .byte   N96 ,En4
 .byte   W12
 .byte   MOD 6
 .byte   W36
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W04
@  #02 @026   ----------------------------------------
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,Dn4 ,v112
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N03 ,Bn3
 .byte   W12
 .byte   N48 ,Gn4
 .byte   W12
 .byte   MOD 6
 .byte   W12
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W04
@  #02 @027   ----------------------------------------
 .byte   VOICE , 10
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   N36 ,Gn3 ,v076
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N03 ,Dn3
 .byte   W12
 .byte   N48 ,Bn3
 .byte   W12
 .byte   MOD 6
 .byte   W12
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W07
@  #02 @028   ----------------------------------------
 .byte   VOICE , 32
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v+16
 .byte   N80 ,En4 ,v127
 .byte   W12
 .byte   MOD 5
 .byte   W36
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 47*song22_mvl/mxv
 .byte   W04
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N06
 .byte   W06
 .byte   Gs4
 .byte   W06
@  #02 @029   ----------------------------------------
 .byte   N96 ,An4
 .byte   W12
 .byte   MOD 5
 .byte   W36
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 35*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W04
@  #02 @030   ----------------------------------------
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N12 ,Gn4 ,v112
 .byte   W24
 .byte   Fs4
 .byte   W24
 .byte   En4
 .byte   W24
 .byte   Dn4
 .byte   W24
@  #02 @031   ----------------------------------------
 .byte   N66 ,Cs4
 .byte   W12
 .byte   MOD 6
 .byte   W12
 .byte   VOL , 80*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 47*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 40*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 33*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 30*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 19*song22_mvl/mxv
 .byte   W10
 .byte   VOICE , 15
 .byte   PAN , c_v+0
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N06 ,Cs4 ,v072
 .byte   W06
 .byte   Bn3 ,v096
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Bn3
 .byte   W06
@  #02 @032   ----------------------------------------
 .byte   N12 ,Cs4
 .byte   W18
 .byte   N06 ,An3
 .byte   W06
 .byte   N12 ,Cs4
 .byte   W12
 .byte   N06
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   N24 ,En4
 .byte   W24
 .byte   Cs4
 .byte   W24
@  #02 @033   ----------------------------------------
Label_01054AE9:
 .byte   N24 ,Gn4 ,v096
 .byte   W24
 .byte   N21 ,Fs4
 .byte   W21
 .byte   N03 ,Fn4 ,v064
 .byte   W03
 .byte   N21 ,En4 ,v096
 .byte   W21
 .byte   N03 ,Ds4 ,v064
 .byte   W03
 .byte   N24 ,Dn4 ,v096
 .byte   W24
 .byte   PEND 
@  #02 @034   ----------------------------------------
Label_01054B01:
 .byte   N36 ,Cs4 ,v096
 .byte   W21
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N03 ,An3
 .byte   W12
 .byte   N48 ,En4
 .byte   W18
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
 .byte   PEND 
@  #02 @035   ----------------------------------------
Label_01054B2D:
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,An3 ,v096
 .byte   W21
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N03 ,En3
 .byte   W12
 .byte   N48 ,Cs4
 .byte   W18
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
 .byte   PEND 
@  #02 @036   ----------------------------------------
 .byte   Fs5
 .byte   N06
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   Cs4
 .byte   W12
 .byte   N06
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   N24 ,En4
 .byte   W24
 .byte   Cs4
 .byte   W24
@  #02 @037   ----------------------------------------
 .byte   PATT
  .word Label_01054AE9
@  #02 @038   ----------------------------------------
 .byte   PATT
  .word Label_01054B01
@  #02 @039   ----------------------------------------
 .byte   PATT
  .word Label_01054B2D
@  #02 @040   ----------------------------------------
 .byte   VOICE , 10
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,Dn4 ,v056
 .byte   W21
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N06 ,Bn3
 .byte   W12
 .byte   N48 ,Gn4
 .byte   W18
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
@  #02 @041   ----------------------------------------
 .byte   VOICE , 15
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,Gn3
 .byte   W21
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N06 ,Dn3
 .byte   W12
 .byte   N48 ,Bn3
 .byte   W18
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
@  #02 @042   ----------------------------------------
 .byte   VOL , 62*song22_mvl/mxv
 .byte   N72 ,Cs4
 .byte   W02
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W40
 .byte   N24 ,Dn4
 .byte   W24
@  #02 @043   ----------------------------------------
 .byte   N96 ,En4
 .byte   W42
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 49*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W07
@  #02 @044   ----------------------------------------
 .byte   VOICE , 10
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,Dn4 ,v044
 .byte   W21
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N06 ,Bn3
 .byte   W12
 .byte   N48 ,Gn4
 .byte   W18
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
@  #02 @045   ----------------------------------------
 .byte   VOICE , 15
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,Gn3 ,v056
 .byte   W21
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N12 ,Dn3
 .byte   W12
 .byte   N48 ,Bn3
 .byte   W18
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
@  #02 @046   ----------------------------------------
 .byte   VOL , 56*song22_mvl/mxv
 .byte   N80 ,En4
 .byte   W02
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W36
 .byte   N06
 .byte   W06
 .byte   Gs4
 .byte   W06
@  #02 @047   ----------------------------------------
 .byte   N96 ,An4
 .byte   W48
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W07
@  #02 @048   ----------------------------------------
 .byte   PAN , c_v+0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N12 ,Gn4 ,v060
 .byte   W24
 .byte   Fs4
 .byte   W24
 .byte   En4
 .byte   W24
 .byte   Dn4
 .byte   W24
@  #02 @049   ----------------------------------------
 .byte   N24 ,Cs4
 .byte   W24
 .byte   Bn3 ,v072
 .byte   W24
 .byte   An3 ,v080
 .byte   W24
 .byte   Gs3 ,v076
 .byte   W24
@  #02 @050   ----------------------------------------
 .byte   VOICE , 32
 .byte   PAN , c_v-34
 .byte   N06 ,An3 ,v096
 .byte   W24
 .byte   N15 ,Gs3
 .byte   W24
 .byte   N06 ,An3
 .byte   W24
 .byte   N24 ,En3
 .byte   W24
@  #02 @051   ----------------------------------------
Label_01054CF1:
 .byte   W12
 .byte   N06 ,An3 ,v096
 .byte   W24
 .byte   N12 ,Gs3
 .byte   W24
 .byte   N06 ,An3
 .byte   W24
 .byte   N12 ,En3
 .byte   W12
 .byte   PEND 
@  #02 @052   ----------------------------------------
Label_01054D00:
 .byte   N06 ,An3 ,v096
 .byte   W24
 .byte   N15 ,Gs3
 .byte   W24
 .byte   N06 ,An3
 .byte   W24
 .byte   N24 ,En3
 .byte   W24
 .byte   PEND 
@  #02 @053   ----------------------------------------
 .byte   PATT
  .word Label_01054CF1
@  #02 @054   ----------------------------------------
 .byte   PATT
  .word Label_01054D00
@  #02 @055   ----------------------------------------
 .byte   PATT
  .word Label_01054CF1
@  #02 @056   ----------------------------------------
 .byte   PATT
  .word Label_01054D00
@  #02 @057   ----------------------------------------
 .byte   PATT
  .word Label_01054CF1
@  #02 @058   ----------------------------------------
 .byte   PATT
  .word Label_01054D00
@  #02 @059   ----------------------------------------
 .byte   PATT
  .word Label_01054CF1
@  #02 @060   ----------------------------------------
 .byte   W12
 .byte   N06 ,An2 ,v127
 .byte   W06
 .byte   N06
 .byte   W18
 .byte   An1
 .byte   W24
 .byte   N06
 .byte   W24
 .byte   N24 ,Fn3
 .byte   W12
@  #02 @061   ----------------------------------------
 .byte   W12
 .byte   N06 ,An2
 .byte   W06
 .byte   N06
 .byte   W18
 .byte   An1
 .byte   W24
 .byte   N06
 .byte   W24
 .byte   N24 ,Fs3
 .byte   W12
@  #02 @062   ----------------------------------------
 .byte   W12
 .byte   N06 ,An2
 .byte   W06
 .byte   N06
 .byte   W18
 .byte   An1
 .byte   W24
 .byte   N06
 .byte   W24
 .byte   N24 ,Gs3
 .byte   W12
@  #02 @063   ----------------------------------------
 .byte   W12
 .byte   VOICE , 15
 .byte   N24 ,An4 ,v080
 .byte   W24
 .byte   Gs4
 .byte   W24
 .byte   Fn4
 .byte   W24
 .byte   En4
 .byte   W12
@  #02 @064   ----------------------------------------
 .byte   W12
 .byte   Fn4
 .byte   W24
 .byte   En4
 .byte   W24
 .byte   Cn4
 .byte   W24
 .byte   N12 ,Bn3
 .byte   W12
@  #02 @065   ----------------------------------------
 .byte   VOL , 18*song22_mvl/mxv
 .byte   N48 ,Cn4 ,v044
 .byte   W02
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W16
 .byte   VOL , 18*song22_mvl/mxv
 .byte   N48 ,Dn4
 .byte   W02
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W16
@  #02 @066   ----------------------------------------
 .byte   VOICE , 26
 .byte   PAN , c_v+0
 .byte   VOL , 52*song22_mvl/mxv
 .byte   N96 ,En4 ,v124
 .byte   W96
@  #02 @067   ----------------------------------------
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Fn4
 .byte   W12
 .byte   N21 ,Gn4
 .byte   W21
 .byte   N03 ,Gs4 ,v076
 .byte   W03
 .byte   N12 ,Gn4 ,v124
 .byte   W12
 .byte   N08
 .byte   W08
 .byte   Fn4
 .byte   W08
 .byte   En4
 .byte   W08
@  #02 @068   ----------------------------------------
 .byte   N12 ,Fn4
 .byte   W12
 .byte   N84 ,Dn4 ,v096
 .byte   W84
@  #02 @069   ----------------------------------------
 .byte   W24
 .byte   N24 ,Fn3 ,v080
 .byte   W24
 .byte   En3
 .byte   W24
 .byte   An3
 .byte   W24
@  #02 @070   ----------------------------------------
 .byte   N96 ,Dn4 ,v124
 .byte   W96
@  #02 @071   ----------------------------------------
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   En4
 .byte   W12
 .byte   N21 ,Fn4
 .byte   W21
 .byte   N03 ,Fs4 ,v080
 .byte   W03
 .byte   N12 ,Fn4 ,v124
 .byte   W12
 .byte   N08
 .byte   W08
 .byte   En4
 .byte   W08
 .byte   Dn4
 .byte   W08
@  #02 @072   ----------------------------------------
 .byte   N12 ,En4
 .byte   W12
 .byte   N84 ,Gn4
 .byte   W84
@  #02 @073   ----------------------------------------
 .byte   VOICE , 15
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W24
 .byte   N24 ,Cn4 ,v112
 .byte   W24
 .byte   Dn4
 .byte   W24
 .byte   En4
 .byte   W24
@  #02 @074   ----------------------------------------
 .byte   VOL , 24*song22_mvl/mxv
 .byte   N72 ,An4
 .byte   W02
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W01
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W56
 .byte   W01
 .byte   N24 ,Fn4
 .byte   W24
@  #02 @075   ----------------------------------------
 .byte   N36 ,Cn5
 .byte   W36
 .byte   N09 ,Bn4
 .byte   W09
 .byte   N03 ,Ds5 ,v080
 .byte   W03
 .byte   N12 ,Dn5 ,v112
 .byte   W12
 .byte   Cn5
 .byte   W12
 .byte   Bn4
 .byte   W12
 .byte   N09 ,An4
 .byte   W09
 .byte   N03 ,As4 ,v060
 .byte   W03
@  #02 @076   ----------------------------------------
 .byte   N24 ,An4 ,v112
 .byte   W24
 .byte   VOL , 26*song22_mvl/mxv
 .byte   N60 ,Gn4
 .byte   W02
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W42
 .byte   W01
 .byte   N12 ,En4
 .byte   W12
@  #02 @077   ----------------------------------------
 .byte   VOL , 24*song22_mvl/mxv
 .byte   N72 ,Gn4
 .byte   W02
 .byte   VOL , 27*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 35*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 47*song22_mvl/mxv
 .byte   W01
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W48
 .byte   W03
 .byte   N24 ,Fs4
 .byte   W24
@  #02 @078   ----------------------------------------
 .byte   VOL , 22*song22_mvl/mxv
 .byte   N72 ,Fn4
 .byte   W02
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 27*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 32*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W48
 .byte   N12 ,En4
 .byte   W12
 .byte   Fn4
 .byte   W12
@  #02 @079   ----------------------------------------
 .byte   N24 ,Dn4
 .byte   W24
 .byte   Cn4
 .byte   W24
 .byte   Bn3
 .byte   W24
 .byte   Dn4
 .byte   W24
@  #02 @080   ----------------------------------------
 .byte   N12 ,En4
 .byte   W12
 .byte   Gn3
 .byte   W12
 .byte   VOL , 22*song22_mvl/mxv
 .byte   N60 ,En4
 .byte   W02
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 35*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W01
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W42
 .byte   N12 ,Fn4
 .byte   W12
@  #02 @081   ----------------------------------------
 .byte   VOL , 14*song22_mvl/mxv
 .byte   TIE ,Gn4
 .byte   W03
 .byte   VOL , 17*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 19*song22_mvl/mxv
 .byte   W09
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W05
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 32*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W05
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W36
@  #02 @082   ----------------------------------------
 .byte   W42
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 35*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 32*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 27*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 19*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W05
 .byte   VOL , 17*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 15*song22_mvl/mxv
 .byte   W04
@  #02 @083   ----------------------------------------
 .byte   EOT
 .byte   TIE ,An4
 .byte   W05
 .byte   VOL , 11*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 12*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W10
 .byte   VOL , 15*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W05
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 35*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W22
@  #02 @084   ----------------------------------------
 .byte   W36
 .byte   W03
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W11
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 35*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 27*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 17*song22_mvl/mxv
 .byte   W09
 .byte   VOL , 15*song22_mvl/mxv
 .byte   W07
 .byte   EOT
 .byte   W03
@  #02 @085   ----------------------------------------
 .byte   PAN , c_v+0
 .byte   VOL , 72*song22_mvl/mxv
 .byte   N24 ,Gn4 ,v028
 .byte   W24
 .byte   Fs4 ,v032
 .byte   W24
 .byte   En4 ,v036
 .byte   W24
 .byte   Dn4 ,v044
 .byte   W24
@  #02 @086   ----------------------------------------
 .byte   VOL , 18*song22_mvl/mxv
 .byte   PAN , c_v-17
 .byte   N96 ,Cs4 ,v068
 .byte   W05
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W07
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 27*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 35*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W30
 .byte   W01
@  #02 @087   ----------------------------------------
 .byte   VOL , 14*song22_mvl/mxv
 .byte   N96 ,An3 ,v072
 .byte   W02
 .byte   VOL , 17*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 27*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 32*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 35*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 47*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W32
 .byte   W02
@  #02 @088   ----------------------------------------
 .byte   VOL , 24*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   N96 ,En3
 .byte   W02
 .byte   VOL , 27*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W36
@  #02 @089   ----------------------------------------
 .byte   N48 ,Dn3
 .byte   W48
 .byte   VOL , 47*song22_mvl/mxv
 .byte   N36 ,Gn3
 .byte   W02
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W21
 .byte   N06 ,Fs3
 .byte   W06
 .byte   Fn3
 .byte   W06
@  #02 @090   ----------------------------------------
 .byte   N48 ,En3
 .byte   W48
 .byte   VOL , 48*song22_mvl/mxv
 .byte   N36 ,Gn3
 .byte   W02
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W21
 .byte   N06 ,Fs3
 .byte   W06
 .byte   Fn3
 .byte   W06
@  #02 @091   ----------------------------------------
 .byte   N96 ,En3
 .byte   W96
@  #02 @092   ----------------------------------------
 .byte   VOL , 55*song22_mvl/mxv
 .byte   N96 ,Dn3
 .byte   W02
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W66
 .byte   W01
@  #02 @093   ----------------------------------------
 .byte   VOL , 71*song22_mvl/mxv
 .byte   N48 ,Bn2
 .byte   W02
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W30
 .byte   W01
 .byte   N36 ,Fs3
 .byte   W36
 .byte   N06 ,Dn3
 .byte   W06
 .byte   Fs3
 .byte   W06
@  #02 @094   ----------------------------------------
 .byte   N48 ,En3
 .byte   W48
 .byte   N36 ,Bn3
 .byte   W36
 .byte   N06 ,Gn3
 .byte   W06
 .byte   Bn3
 .byte   W06
@  #02 @095   ----------------------------------------
 .byte   N96 ,Cs4
 .byte   W48
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W07
@  #02 @096   ----------------------------------------
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N96 ,Dn4
 .byte   W36
 .byte   W03
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 85*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W08
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
@  #02 @097   ----------------------------------------
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N48 ,Bn3
 .byte   W24
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,Dn4
 .byte   W12
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 85*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W07
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N06 ,Bn3
 .byte   W06
 .byte   Dn4
 .byte   W06
@  #02 @098   ----------------------------------------
 .byte   N72 ,Cs4
 .byte   W24
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 54*song22_mvl/mxv
 .byte   W16
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N24 ,Bn3
 .byte   W24
@  #02 @099   ----------------------------------------
 .byte   N96 ,An3 ,v096
 .byte   W24
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 54*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W07
@  #02 @100   ----------------------------------------
 .byte   N72 ,Fs3 ,v100
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W30
 .byte   W01
 .byte   N24 ,Gs3
 .byte   W24
@  #02 @101   ----------------------------------------
 .byte   VOL , 64*song22_mvl/mxv
 .byte   N48 ,An3
 .byte   W02
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W28
 .byte   VOL , 64*song22_mvl/mxv
 .byte   N48 ,Fs3
 .byte   W02
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W28
@  #02 @102   ----------------------------------------
 .byte   VOL , 59*song22_mvl/mxv
 .byte   N72 ,Gs3
 .byte   W02
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 85*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W32
 .byte   W02
 .byte   N24 ,An3
 .byte   W24
@  #02 @103   ----------------------------------------
 .byte   VOL , 64*song22_mvl/mxv
 .byte   N48 ,Bn3
 .byte   W02
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W28
 .byte   VOL , 64*song22_mvl/mxv
 .byte   N48 ,Gs3
 .byte   W02
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W28
@  #02 @104   ----------------------------------------
 .byte   VOL , 59*song22_mvl/mxv
 .byte   N72 ,An3
 .byte   W02
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 85*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W32
 .byte   W02
 .byte   N24 ,Bn3
 .byte   W24
@  #02 @105   ----------------------------------------
 .byte   VOL , 64*song22_mvl/mxv
 .byte   N48 ,Cn4
 .byte   W02
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W28
 .byte   VOL , 64*song22_mvl/mxv
 .byte   N48 ,An3
 .byte   W02
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W28
@  #02 @106   ----------------------------------------
 .byte   VOL , 59*song22_mvl/mxv
 .byte   N72 ,Bn3
 .byte   W02
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 85*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W32
 .byte   W02
 .byte   N24 ,Cn4
 .byte   W24
@  #02 @107   ----------------------------------------
 .byte   VOL , 64*song22_mvl/mxv
 .byte   N48 ,Dn4
 .byte   W02
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W28
 .byte   VOL , 64*song22_mvl/mxv
 .byte   N48 ,Bn3
 .byte   W02
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W28
@  #02 @108   ----------------------------------------
 .byte   VOL , 51*song22_mvl/mxv
 .byte   TIE ,Cs4
 .byte   W02
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 54*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W40
@  #02 @109   ----------------------------------------
 .byte   W32
 .byte   W01
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W07
@  #02 @110   ----------------------------------------
 .byte   EOT
 .byte   TIE ,An3
 .byte   W03
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W30
 .byte   W01
@  #02 @111   ----------------------------------------
 .byte   W36
 .byte   W03
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 54*song22_mvl/mxv
 .byte   W04
@  #02 @112   ----------------------------------------
 .byte   EOT
 .byte   VOICE , 15
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,Gn3
 .byte   W36
 .byte   N03 ,Bn3
 .byte   W12
 .byte   N48 ,Dn4
 .byte   W48
@  #02 @113   ----------------------------------------
 .byte   N36 ,Bn3
 .byte   W36
 .byte   N03 ,Dn4
 .byte   W12
 .byte   N36 ,Gn4
 .byte   W36
 .byte   N06 ,Fs4
 .byte   W06
 .byte   Fn4
 .byte   W06
@  #02 @114   ----------------------------------------
 .byte   N48 ,En4
 .byte   W18
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W04
 .byte   VOICE , 10
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,Gn3
 .byte   W36
 .byte   N06 ,Fs3
 .byte   W06
 .byte   Fn3
 .byte   W06
@  #02 @115   ----------------------------------------
 .byte   N48 ,En3
 .byte   W24
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N24 ,Cs3
 .byte   W24
 .byte   En3
 .byte   W24
@  #02 @116   ----------------------------------------
 .byte   VOICE , 32
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,Gn3 ,v120
 .byte   W36
 .byte   N03 ,Bn3
 .byte   W12
 .byte   N48 ,Dn4
 .byte   W12
 .byte   MOD 8
 .byte   W06
 .byte   VOL , 85*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
@  #02 @117   ----------------------------------------
 .byte   VOL , 90*song22_mvl/mxv
 .byte   MOD 0
 .byte   N36 ,Bn3
 .byte   W36
 .byte   N03 ,Dn4
 .byte   W12
 .byte   N48 ,Gn4
 .byte   W12
 .byte   MOD 8
 .byte   W06
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W06
@  #02 @118   ----------------------------------------
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   TIE ,An4
 .byte   W09
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W24
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W04
 .byte   MOD 6
 .byte   W02
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W04
@  #02 @119   ----------------------------------------
 .byte   VOL , 71*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 73*song22_mvl/mxv
 .byte   W07
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 84*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 85*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 89*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W54
 .byte   W01
@  #02 @120   ----------------------------------------
 .byte   EOT
 .byte   MOD 0
 .byte   N09
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N06
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N09
 .byte   W48
 .byte   FINE

@**************** Track 3 (Midi-Chn.2) ****************@

song22_003:
@  #03 @000   ----------------------------------------
 .byte   KEYSH , song22_key+0
 .byte   VOICE , 15
 .byte   VOL , 56*song22_mvl/mxv
 .byte   LFOS 44
 .byte   BENDR, 12
 .byte   PAN , c_v-28
 .byte   W96
@  #03 @001   ----------------------------------------
 .byte   W96
@  #03 @002   ----------------------------------------
 .byte   TIE ,Bn2 ,v092
 .byte   W96
@  #03 @003   ----------------------------------------
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 17*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 11*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 6*song22_mvl/mxv
 .byte   W06
 .byte   EOT
 .byte   W12
@  #03 @004   ----------------------------------------
 .byte   W48
 .byte   PAN , c_v-32
 .byte   VOL , 50*song22_mvl/mxv
 .byte   N08 ,Cs4 ,v064
 .byte   W08
 .byte   An3
 .byte   W08
 .byte   Cs4
 .byte   W08
 .byte   N08
 .byte   W08
 .byte   An3
 .byte   W08
 .byte   Cs4
 .byte   W08
@  #03 @005   ----------------------------------------
 .byte   Bn3
 .byte   W08
 .byte   Gn3
 .byte   W08
 .byte   Bn3
 .byte   W08
 .byte   N08
 .byte   W08
 .byte   Gn3
 .byte   W08
 .byte   Bn3
 .byte   W08
 .byte   An3
 .byte   W08
 .byte   Fs3
 .byte   W08
 .byte   An3
 .byte   W08
 .byte   N08
 .byte   W08
 .byte   En3
 .byte   W08
 .byte   An3
 .byte   W08
@  #03 @006   ----------------------------------------
 .byte   Bn3
 .byte   W08
 .byte   En3
 .byte   W08
 .byte   Gs3
 .byte   W08
 .byte   Bn3
 .byte   W08
 .byte   Dn4
 .byte   W08
 .byte   En4
 .byte   W08
 .byte   N03
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
@  #03 @007   ----------------------------------------
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4 ,v048
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4 ,v032
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4 ,v020
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
@  #03 @008   ----------------------------------------
 .byte   En4 ,v008
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W24
 .byte   W03
 .byte   W96
@  #03 @009   ----------------------------------------
 .byte   PAN , c_v-33
 .byte   N92 ,Bn3 ,v088
 .byte   W96
@  #03 @010   ----------------------------------------
 .byte   VOICE , 15
 .byte   VOL , 70*song22_mvl/mxv
 .byte   N32 ,Cs3 ,v120
 .byte   W36
 .byte   N06 ,An2 ,v072
 .byte   W06
 .byte   Cs3 ,v127
 .byte   W06
 .byte   N36 ,Dn3
 .byte   W36
 .byte   N06 ,Bn2
 .byte   W06
 .byte   Dn3
 .byte   W06
@  #03 @011   ----------------------------------------
 .byte   N36 ,Fs3
 .byte   W36
 .byte   N06 ,Dn3
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   N24 ,An3
 .byte   W24
 .byte   N12 ,Gs3
 .byte   W12
 .byte   N06 ,En3
 .byte   W06
 .byte   Gs3
 .byte   W06
@  #03 @012   ----------------------------------------
 .byte   An3
 .byte   W96
@  #03 @013   ----------------------------------------
 .byte   W72
 .byte   VOICE , 33
 .byte   PAN , c_v+0
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W24
@  #03 @014   ----------------------------------------
 .byte   BEND , c_v+1
 .byte   N36 ,Cs4 ,v072
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N06
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   N24 ,En4
 .byte   W24
 .byte   Cs4
 .byte   W24
@  #03 @015   ----------------------------------------
Label_010554E1:
 .byte   N24 ,Gn4 ,v072
 .byte   W24
 .byte   Fs4
 .byte   W24
 .byte   En4
 .byte   W24
 .byte   Dn4
 .byte   W24
 .byte   PEND 
@  #03 @016   ----------------------------------------
Label_010554EC:
 .byte   N36 ,Cs4 ,v072
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N06 ,An3
 .byte   W12
 .byte   N48 ,En4
 .byte   W12
 .byte   MOD 6
 .byte   W36
 .byte   PEND 
@  #03 @017   ----------------------------------------
 .byte   CnM2
 .byte   N36 ,An3
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N06 ,En3
 .byte   W12
 .byte   N48 ,Cs4
 .byte   W12
 .byte   MOD 5
 .byte   W36
@  #03 @018   ----------------------------------------
 .byte   N36
 .byte   W36
 .byte   MOD 0
 .byte   N06
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   N24 ,En4
 .byte   W24
 .byte   Cs4
 .byte   W24
@  #03 @019   ----------------------------------------
 .byte   PATT
  .word Label_010554E1
@  #03 @020   ----------------------------------------
 .byte   PATT
  .word Label_010554EC
@  #03 @021   ----------------------------------------
 .byte   MOD 0
 .byte   N36 ,An3 ,v072
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N06 ,En3
 .byte   W12
 .byte   Cs4
 .byte   W12
 .byte   An3
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   N24 ,En4
 .byte   W24
@  #03 @022   ----------------------------------------
 .byte   N36 ,Dn4
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N06 ,Bn3
 .byte   W12
 .byte   N48 ,Gn4
 .byte   W12
 .byte   MOD 6
 .byte   W36
@  #03 @023   ----------------------------------------
Label_0105554C:
 .byte   MOD 0
 .byte   N36 ,Gn3 ,v072
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N06 ,Dn3
 .byte   W12
 .byte   N48 ,Bn3
 .byte   W12
 .byte   MOD 6
 .byte   W36
 .byte   PEND 
@  #03 @024   ----------------------------------------
 .byte   CnM2
 .byte   N72 ,Cs4
 .byte   W15
 .byte   MOD 6
 .byte   W56
 .byte   W01
 .byte   MOD 0
 .byte   N24 ,Dn4
 .byte   W24
@  #03 @025   ----------------------------------------
 .byte   N96 ,En4
 .byte   W12
 .byte   MOD 6
 .byte   W84
@  #03 @026   ----------------------------------------
 .byte   MOD 0
 .byte   N36 ,Dn4
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N03 ,Bn3
 .byte   W12
 .byte   N48 ,Gn4
 .byte   W12
 .byte   MOD 6
 .byte   W36
@  #03 @027   ----------------------------------------
 .byte   PATT
  .word Label_0105554C
@  #03 @028   ----------------------------------------
 .byte   MOD 0
 .byte   N80 ,En4 ,v072
 .byte   W12
 .byte   MOD 5
 .byte   W72
 .byte   MOD 0
 .byte   N06
 .byte   W06
 .byte   Gs4
 .byte   W06
@  #03 @029   ----------------------------------------
 .byte   N96 ,An4
 .byte   W12
 .byte   MOD 5
 .byte   W84
@  #03 @030   ----------------------------------------
 .byte   MOD 0
 .byte   N12 ,Gn4
 .byte   W24
 .byte   Fs4
 .byte   W24
 .byte   En4
 .byte   W24
 .byte   Dn4
 .byte   W24
@  #03 @031   ----------------------------------------
 .byte   N66 ,Cs4
 .byte   W12
 .byte   MOD 6
 .byte   W60
 .byte   MOD 0
 .byte   W24
@  #03 @032   ----------------------------------------
 .byte   VOICE , 34
 .byte   PAN , c_v+31
 .byte   VOL , 50*song22_mvl/mxv
 .byte   BEND , c_v+0
 .byte   N06 ,En4 ,v064
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   Cs5
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   Cs4
 .byte   W06
@  #03 @033   ----------------------------------------
Label_010555D8:
 .byte   N06 ,Dn4 ,v064
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   Gn4
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   Gn4
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   Gn4
 .byte   W06
 .byte   Bn4
 .byte   W06
 .byte   Gn4
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   PEND 
@  #03 @034   ----------------------------------------
Label_010555FB:
 .byte   N06 ,En4 ,v064
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   Cs5
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   PEND 
@  #03 @035   ----------------------------------------
Label_0105561E:
 .byte   N06 ,En4 ,v064
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   PEND 
@  #03 @036   ----------------------------------------
 .byte   PATT
  .word Label_010555FB
@  #03 @037   ----------------------------------------
 .byte   PATT
  .word Label_010555D8
@  #03 @038   ----------------------------------------
 .byte   PATT
  .word Label_010555FB
@  #03 @039   ----------------------------------------
 .byte   PATT
  .word Label_0105561E
@  #03 @040   ----------------------------------------
 .byte   VOICE , 35
 .byte   PAN , c_v-32
 .byte   VOL , 56*song22_mvl/mxv
 .byte   N04 ,Gn2 ,v092
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   PAN , c_v-16
 .byte   N04 ,Bn4
 .byte   W04
 .byte   Dn5
 .byte   W02
 .byte   PAN , c_v+16
 .byte   W02
 .byte   N04 ,Fs5
 .byte   W04
@  #03 @041   ----------------------------------------
 .byte   PAN , c_v+32
 .byte   N04 ,Gn5
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   PAN , c_v-16
 .byte   N04 ,Dn3
 .byte   W04
 .byte   Bn2
 .byte   W02
 .byte   PAN , c_v-32
 .byte   W02
 .byte   N04 ,Gn2
 .byte   W04
@  #03 @042   ----------------------------------------
 .byte   An2
 .byte   W04
 .byte   Cs3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   Cs3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   En5
 .byte   W04
 .byte   PAN , c_v-16
 .byte   N04 ,Cs5
 .byte   W04
 .byte   En5
 .byte   W02
 .byte   PAN , c_v+16
 .byte   W02
 .byte   N04 ,Gs5
 .byte   W04
@  #03 @043   ----------------------------------------
 .byte   PAN , c_v+32
 .byte   N04 ,An5
 .byte   W04
 .byte   En5
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   En5
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   Cs3
 .byte   W04
 .byte   PAN , c_v+16
 .byte   N04 ,En3
 .byte   W04
 .byte   Cs3
 .byte   W02
 .byte   PAN , c_v-16
 .byte   W02
 .byte   N04 ,An2
 .byte   W04
@  #03 @044   ----------------------------------------
 .byte   PAN , c_v-32
 .byte   N04 ,Gn2
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   PAN , c_v-16
 .byte   N04 ,Bn4
 .byte   W04
 .byte   Dn5
 .byte   W02
 .byte   PAN , c_v+16
 .byte   W02
 .byte   N04 ,Fs5
 .byte   W04
@  #03 @045   ----------------------------------------
 .byte   PAN , c_v+32
 .byte   N04 ,Gn5
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   PAN , c_v+16
 .byte   N04 ,Dn3
 .byte   W04
 .byte   Bn2
 .byte   W02
 .byte   PAN , c_v-16
 .byte   W02
 .byte   N04 ,Gn2
 .byte   W04
@  #03 @046   ----------------------------------------
 .byte   PAN , c_v-32
 .byte   N24 ,An4
 .byte   W24
 .byte   PAN , c_v+32
 .byte   N24 ,Gs4
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,Fs4
 .byte   W24
 .byte   PAN , c_v+32
 .byte   N24 ,En4
 .byte   W24
@  #03 @047   ----------------------------------------
 .byte   PAN , c_v-44
 .byte   N03 ,An2
 .byte   W03
 .byte   Bn2
 .byte   W03
 .byte   Cs3
 .byte   W03
 .byte   PAN , c_v-29
 .byte   N03 ,En3
 .byte   W03
 .byte   PAN , c_v-19
 .byte   N03 ,Fs3
 .byte   W03
 .byte   PAN , c_v+19
 .byte   N03 ,Gs3
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   PAN , c_v+34
 .byte   N03 ,Bn3
 .byte   W03
 .byte   PAN , c_v+44
 .byte   N03 ,Cs4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   PAN , c_v-32
 .byte   N03 ,Gs4
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   As4
 .byte   W03
 .byte   Cn5
 .byte   W03
 .byte   PAN , c_v-48
 .byte   N24 ,Cs5
 .byte   W24
 .byte   An4
 .byte   W24
@  #03 @048   ----------------------------------------
 .byte   VOICE , 10
 .byte   N24 ,Gn2
 .byte   W24
 .byte   An2
 .byte   W24
 .byte   Bn2
 .byte   W24
 .byte   Dn3
 .byte   W24
@  #03 @049   ----------------------------------------
 .byte   VOICE , 15
 .byte   PAN , c_v-32
 .byte   N12 ,En2 ,v080
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v+32
 .byte   N12 ,En2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   Gs2
 .byte   W12
 .byte   PAN , c_v-32
 .byte   N12 ,En2
 .byte   W12
 .byte   Gs2
 .byte   W12
@  #03 @050   ----------------------------------------
 .byte   W96
@  #03 @051   ----------------------------------------
 .byte   W96
@  #03 @052   ----------------------------------------
 .byte   W96
@  #03 @053   ----------------------------------------
 .byte   W96
@  #03 @054   ----------------------------------------
 .byte   W96
@  #03 @055   ----------------------------------------
 .byte   W96
@  #03 @056   ----------------------------------------
 .byte   W96
@  #03 @057   ----------------------------------------
 .byte   W96
@  #03 @058   ----------------------------------------
 .byte   W96
@  #03 @059   ----------------------------------------
 .byte   W96
@  #03 @060   ----------------------------------------
 .byte   N06 ,An3
 .byte   W06
 .byte   N06
 .byte   W30
 .byte   An2
 .byte   W24
 .byte   N06
 .byte   W12
 .byte   N24 ,Bn3
 .byte   W24
@  #03 @061   ----------------------------------------
 .byte   N06 ,An3
 .byte   W06
 .byte   N06
 .byte   W30
 .byte   An2
 .byte   W24
 .byte   N06
 .byte   W12
 .byte   N24 ,Cn4
 .byte   W24
@  #03 @062   ----------------------------------------
 .byte   W36
 .byte   N06 ,An2
 .byte   W24
 .byte   N06
 .byte   W12
 .byte   N24 ,Dn4
 .byte   W24
@  #03 @063   ----------------------------------------
 .byte   PAN , c_v+0
 .byte   N24 ,En4
 .byte   W24
 .byte   Ds4
 .byte   W24
 .byte   Cn4
 .byte   W24
 .byte   Bn3
 .byte   W24
@  #03 @064   ----------------------------------------
 .byte   Cn4
 .byte   W24
 .byte   Bn3
 .byte   W24
 .byte   An3
 .byte   W24
 .byte   Gs3
 .byte   W24
@  #03 @065   ----------------------------------------
 .byte   VOICE , 26
 .byte   PAN , c_v+26
 .byte   N48 ,Cn4
 .byte   W48
 .byte   Dn4 ,v092
 .byte   W48
@  #03 @066   ----------------------------------------
 .byte   PAN , c_v-32
 .byte   N96 ,Gn3 ,v080
 .byte   W96
@  #03 @067   ----------------------------------------
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   An3
 .byte   W12
 .byte   N21 ,Bn3
 .byte   W21
 .byte   N03 ,Cn4 ,v060
 .byte   W03
 .byte   N12 ,Bn3 ,v080
 .byte   W12
 .byte   N08
 .byte   W08
 .byte   An3
 .byte   W08
 .byte   Gn3
 .byte   W08
@  #03 @068   ----------------------------------------
 .byte   N12 ,An3
 .byte   W12
 .byte   N84 ,Fn3
 .byte   W84
@  #03 @069   ----------------------------------------
 .byte   W24
 .byte   N24 ,An2
 .byte   W24
 .byte   Gn2
 .byte   W24
 .byte   En3
 .byte   W24
@  #03 @070   ----------------------------------------
 .byte   N96 ,Fn3
 .byte   W96
@  #03 @071   ----------------------------------------
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Gn3
 .byte   W12
 .byte   N21 ,An3
 .byte   W21
 .byte   N03 ,As3 ,v056
 .byte   W03
 .byte   N12 ,An3 ,v080
 .byte   W12
 .byte   N08
 .byte   W08
 .byte   Gn3
 .byte   W08
 .byte   Fn3
 .byte   W08
@  #03 @072   ----------------------------------------
 .byte   N12 ,Gn3
 .byte   W12
 .byte   N72 ,Cn4
 .byte   W72
 .byte   N03 ,Gn2 ,v048
 .byte   W03
 .byte   An2
 .byte   W03
 .byte   Cn3 ,v060
 .byte   W03
 .byte   Dn3
 .byte   W03
@  #03 @073   ----------------------------------------
 .byte   VOICE , 35
 .byte   PAN , c_v+40
 .byte   VOL , 60*song22_mvl/mxv
 .byte   N48 ,En3 ,v068
 .byte   W48
 .byte   N24 ,Bn3 ,v064
 .byte   W24
 .byte   As3
 .byte   W24
@  #03 @074   ----------------------------------------
 .byte   En4
 .byte   W24
 .byte   Dn4
 .byte   W24
 .byte   Cn4
 .byte   W24
 .byte   Bn3
 .byte   W24
@  #03 @075   ----------------------------------------
 .byte   Gn4
 .byte   W24
 .byte   Bn3
 .byte   W24
 .byte   Fn4
 .byte   W24
 .byte   N12 ,Dn4
 .byte   W12
 .byte   Bn3
 .byte   W12
@  #03 @076   ----------------------------------------
 .byte   N24 ,An3
 .byte   W24
 .byte   Bn3
 .byte   W24
 .byte   N12 ,Dn4
 .byte   W12
 .byte   Cn4
 .byte   W12
 .byte   Bn3
 .byte   W12
 .byte   An3
 .byte   W12
@  #03 @077   ----------------------------------------
 .byte   Gn3
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   Bn3
 .byte   W12
 .byte   N24 ,Gn4
 .byte   W24
 .byte   Dn4
 .byte   W24
 .byte   N12 ,Bn3
 .byte   W12
@  #03 @078   ----------------------------------------
 .byte   Dn3
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   N36 ,Fn3 ,v080
 .byte   W36
 .byte   N12 ,En3
 .byte   W12
 .byte   Dn3
 .byte   W12
 .byte   En3
 .byte   W12
@  #03 @079   ----------------------------------------
 .byte   N24 ,Fn3 ,v064
 .byte   W24
 .byte   En3
 .byte   W24
 .byte   Gn3
 .byte   W24
 .byte   An3
 .byte   W24
@  #03 @080   ----------------------------------------
 .byte   N12 ,Bn3
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   N60 ,Bn3
 .byte   W60
 .byte   N12 ,An3
 .byte   W12
@  #03 @081   ----------------------------------------
 .byte   Bn3
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   Bn3
 .byte   W12
 .byte   N36 ,Dn4
 .byte   W36
 .byte   N24 ,Cn4
 .byte   W24
@  #03 @082   ----------------------------------------
 .byte   Gn3
 .byte   W24
 .byte   An3
 .byte   W24
 .byte   Bn3
 .byte   W24
 .byte   N12 ,Dn4
 .byte   W12
 .byte   N03 ,Cs3 ,v052
 .byte   W03
 .byte   En3 ,v060
 .byte   W03
 .byte   An3 ,v064
 .byte   W03
 .byte   Cs4 ,v072
 .byte   W03
@  #03 @083   ----------------------------------------
 .byte   N96 ,En4 ,v084
 .byte   W96
@  #03 @084   ----------------------------------------
 .byte   W96
@  #03 @085   ----------------------------------------
 .byte   VOICE , 35
 .byte   PAN , c_v+26
 .byte   N24 ,Gn3 ,v080
 .byte   W24
 .byte   An3
 .byte   W24
 .byte   Bn3
 .byte   W24
 .byte   N12 ,Dn4
 .byte   W12
 .byte   N03 ,An3 ,v064
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   PAN , c_v-16
 .byte   N03 ,Cs4
 .byte   W03
 .byte   PAN , c_v-32
 .byte   N03 ,Dn4
 .byte   W03
@  #03 @086   ----------------------------------------
 .byte   N24 ,En4 ,v080
 .byte   W48
 .byte   PAN , c_v+29
 .byte   N24 ,Dn4 ,v064
 .byte   W48
@  #03 @087   ----------------------------------------
 .byte   PAN , c_v-32
 .byte   N24 ,Cs4
 .byte   W48
 .byte   PAN , c_v+32
 .byte   N24 ,Bn3 ,v080
 .byte   W48
@  #03 @088   ----------------------------------------
 .byte   VOICE , 15
 .byte   PAN , c_v-32
 .byte   VOL , 24*song22_mvl/mxv
 .byte   N08 ,Cs3 ,v056
 .byte   W05
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   N08 ,An2
 .byte   W04
 .byte   VOL , 27*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W02
 .byte   N08 ,Cs3
 .byte   W01
 .byte   VOL , 32*song22_mvl/mxv
 .byte   W07
 .byte   VOL , 35*song22_mvl/mxv
 .byte   N08 ,An2
 .byte   W02
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 42*song22_mvl/mxv
 .byte   N08 ,Cs3
 .byte   W04
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W02
 .byte   N08 ,An2
 .byte   W01
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 55*song22_mvl/mxv
 .byte   N08 ,Cs3
 .byte   W02
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   N08 ,An2
 .byte   W08
 .byte   Cs3
 .byte   W08
 .byte   An2
 .byte   W08
 .byte   Cs3
 .byte   W08
 .byte   An2
 .byte   W08
@  #03 @089   ----------------------------------------
Label_010559CB:
 .byte   N08 ,Bn2 ,v056
 .byte   W08
 .byte   Gn2
 .byte   W08
 .byte   Bn2
 .byte   W08
 .byte   Gn2
 .byte   W08
 .byte   Bn2
 .byte   W08
 .byte   Gn2
 .byte   W08
 .byte   Bn2
 .byte   W08
 .byte   Gn2
 .byte   W08
 .byte   Bn2
 .byte   W08
 .byte   Gn2
 .byte   W08
 .byte   Bn2
 .byte   W08
 .byte   Gn2
 .byte   W08
 .byte   PEND 
@  #03 @090   ----------------------------------------
Label_010559E6:
 .byte   N08 ,Cs3 ,v056
 .byte   W08
 .byte   An2
 .byte   W08
 .byte   Cs3
 .byte   W08
 .byte   An2
 .byte   W08
 .byte   Cs3
 .byte   W08
 .byte   An2
 .byte   W08
 .byte   Cs3
 .byte   W08
 .byte   An2
 .byte   W08
 .byte   Cs3
 .byte   W08
 .byte   An2
 .byte   W08
 .byte   Cs3
 .byte   W08
 .byte   An2
 .byte   W08
 .byte   PEND 
@  #03 @091   ----------------------------------------
 .byte   PATT
  .word Label_010559E6
@  #03 @092   ----------------------------------------
 .byte   PATT
  .word Label_010559CB
@  #03 @093   ----------------------------------------
 .byte   PATT
  .word Label_010559CB
@  #03 @094   ----------------------------------------
 .byte   PATT
  .word Label_010559E6
@  #03 @095   ----------------------------------------
 .byte   PATT
  .word Label_010559E6
@  #03 @096   ----------------------------------------
 .byte   PATT
  .word Label_010559CB
@  #03 @097   ----------------------------------------
 .byte   PATT
  .word Label_010559CB
@  #03 @098   ----------------------------------------
 .byte   PATT
  .word Label_010559E6
@  #03 @099   ----------------------------------------
 .byte   PATT
  .word Label_010559E6
@  #03 @100   ----------------------------------------
 .byte   VOICE , 35
 .byte   N06 ,Fs2 ,v120
 .byte   W06
 .byte   An2
 .byte   W06
 .byte   Dn3
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   Fs4
 .byte   W06
 .byte   PAN , c_v+16
 .byte   N06 ,An4
 .byte   W06
 .byte   PAN , c_v+44
 .byte   N06 ,Dn5
 .byte   W48
@  #03 @101   ----------------------------------------
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N03 ,Dn5 ,v088
 .byte   W03
 .byte   Cs5 ,v064
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   PAN , c_v-36
 .byte   N03 ,Cs5 ,v088
 .byte   W03
 .byte   Bn4 ,v064
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   PAN , c_v+32
 .byte   N03 ,Bn4 ,v088
 .byte   W03
 .byte   An4 ,v064
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   PAN , c_v-32
 .byte   N03 ,An4 ,v088
 .byte   W03
 .byte   Gn4 ,v064
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   Bn3
 .byte   W06
@  #03 @102   ----------------------------------------
 .byte   PAN , c_v-38
 .byte   N06 ,Gs2 ,v120
 .byte   W06
 .byte   Bn2
 .byte   W06
 .byte   En3
 .byte   W06
 .byte   Gs3
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   PAN , c_v+16
 .byte   N06 ,En4
 .byte   W06
 .byte   PAN , c_v+40
 .byte   N06 ,Gs4
 .byte   W06
 .byte   Bn4
 .byte   W06
 .byte   En5
 .byte   W48
@  #03 @103   ----------------------------------------
 .byte   VOL , 73*song22_mvl/mxv
 .byte   PAN , c_v+38
 .byte   N03 ,En5 ,v088
 .byte   W03
 .byte   Dn5 ,v064
 .byte   W03
 .byte   Cs5
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   PAN , c_v-38
 .byte   N03 ,Dn5 ,v088
 .byte   W03
 .byte   Cs5 ,v064
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   PAN , c_v+32
 .byte   N03 ,Cs5 ,v088
 .byte   W03
 .byte   Bn4 ,v064
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   PAN , c_v-33
 .byte   N03 ,Bn4 ,v088
 .byte   W03
 .byte   An4 ,v064
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Cs4
 .byte   W06
@  #03 @104   ----------------------------------------
 .byte   PAN , c_v+32
 .byte   N03 ,Fn5 ,v088
 .byte   W03
 .byte   En5 ,v064
 .byte   W03
 .byte   Dn5
 .byte   W03
 .byte   Cn5
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   Fn4
 .byte   W03
 .byte   PAN , c_v-33
 .byte   N03 ,En5 ,v088
 .byte   W03
 .byte   Dn5 ,v064
 .byte   W03
 .byte   Cn5
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   Fn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   PAN , c_v+32
 .byte   N03 ,Dn5 ,v088
 .byte   W03
 .byte   Cn5 ,v064
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   Fn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   N03 ,Dn5
 .byte   W03
 .byte   PAN , c_v-33
 .byte   N03 ,Cn5 ,v088
 .byte   W03
 .byte   Bn4 ,v064
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   Fn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Cn4
 .byte   W03
@  #03 @105   ----------------------------------------
 .byte   PAN , c_v-38
 .byte   N06 ,Cn3 ,v120
 .byte   W06
 .byte   Fn3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Cn4
 .byte   W06
 .byte   Fn4
 .byte   W06
 .byte   PAN , c_v+16
 .byte   N06 ,An4
 .byte   W06
 .byte   PAN , c_v+40
 .byte   N06 ,Cn5
 .byte   W06
 .byte   Fn5 ,v092
 .byte   W06
 .byte   N48 ,An5 ,v088
 .byte   W48
@  #03 @106   ----------------------------------------
 .byte   PAN , c_v-33
 .byte   N03 ,Gn3 ,v120
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Cn4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   PAN , c_v+16
 .byte   N03 ,Cn5
 .byte   W03
 .byte   PAN , c_v+32
 .byte   N03 ,Dn5
 .byte   W03
 .byte   PAN , c_v+40
 .byte   N03 ,En5
 .byte   W03
 .byte   Fs5
 .byte   W03
 .byte   Gn5
 .byte   W03
 .byte   An5
 .byte   W03
 .byte   Bn5
 .byte   W03
 .byte   An5
 .byte   W03
 .byte   Gn5
 .byte   W03
 .byte   Fn5
 .byte   W03
 .byte   En5
 .byte   W03
 .byte   PAN , c_v-16
 .byte   N03 ,Dn5
 .byte   W03
 .byte   PAN , c_v-32
 .byte   N03 ,Cn5
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   PAN , c_v-40
 .byte   N03 ,An4
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   Fn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Cn4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   An3
 .byte   W03
@  #03 @107   ----------------------------------------
 .byte   PAN , c_v-32
 .byte   N06 ,Dn3
 .byte   W06
 .byte   Gn3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   Cn4
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   Fs4
 .byte   W06
 .byte   PAN , c_v+15
 .byte   N06 ,Gn4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   PAN , c_v+23
 .byte   N06 ,Bn4
 .byte   W06
 .byte   Cn5
 .byte   W06
 .byte   PAN , c_v+40
 .byte   N06 ,Dn5
 .byte   W06
 .byte   En5
 .byte   W06
 .byte   Fs5
 .byte   W06
 .byte   Gn5
 .byte   W06
@  #03 @108   ----------------------------------------
 .byte   PAN , c_v+48
 .byte   N03 ,En3 ,v104
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   An4
 .byte   W12
 .byte   PAN , c_v-48
 .byte   N03 ,An2
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   En4
 .byte   W12
 .byte   PAN , c_v+47
 .byte   N03 ,En2
 .byte   W03
 .byte   An2
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   Cs4
 .byte   W12
 .byte   PAN , c_v-48
 .byte   N03 ,An2
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   En4
 .byte   W12
@  #03 @109   ----------------------------------------
 .byte   PAN , c_v+48
 .byte   N03 ,En3
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   An4
 .byte   W12
 .byte   PAN , c_v-48
 .byte   N03 ,An2
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   En4
 .byte   W12
 .byte   PAN , c_v+47
 .byte   N03 ,En3
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   An4
 .byte   W12
 .byte   PAN , c_v-48
 .byte   N03 ,Cs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   Cs5
 .byte   W03
 .byte   En5
 .byte   W03
@  #03 @110   ----------------------------------------
 .byte   W96
@  #03 @111   ----------------------------------------
 .byte   W96
@  #03 @112   ----------------------------------------
 .byte   W96
@  #03 @113   ----------------------------------------
 .byte   W96
@  #03 @114   ----------------------------------------
 .byte   VOICE , 1
 .byte   W48
 .byte   N08 ,En4 ,v088
 .byte   W08
 .byte   Fs4
 .byte   W08
 .byte   N04 ,Gn4
 .byte   W08
 .byte   N08
 .byte   W08
 .byte   Fs4
 .byte   W08
 .byte   En4
 .byte   W08
@  #03 @115   ----------------------------------------
 .byte   Cs4
 .byte   W08
 .byte   Dn4
 .byte   W08
 .byte   Ds4
 .byte   W08
 .byte   N72 ,En4
 .byte   W72
@  #03 @116   ----------------------------------------
 .byte   VOICE , 36
 .byte   VOL , 45*song22_mvl/mxv
 .byte   PAN , c_v-64
 .byte   N36 ,Dn4 ,v064
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   MOD 0
 .byte   N03 ,Bn3
 .byte   W12
 .byte   N48 ,Gn4
 .byte   W12
 .byte   MOD 6
 .byte   W36
@  #03 @117   ----------------------------------------
 .byte   N36
 .byte   W36
 .byte   MOD 0
 .byte   N03 ,Dn4
 .byte   W12
 .byte   N48 ,Bn4
 .byte   W12
 .byte   MOD 6
 .byte   W36
@  #03 @118   ----------------------------------------
 .byte   MOD 0
 .byte   TIE ,En4
 .byte   W12
 .byte   MOD 6
 .byte   W84
@  #03 @119   ----------------------------------------
 .byte   W96
@  #03 @120   ----------------------------------------
 .byte   EOT
 .byte   MOD 0
 .byte   N03
 .byte   W12
 .byte   N03
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W48
 .byte   FINE

@**************** Track 4 (Midi-Chn.3) ****************@

song22_004:
@  #04 @000   ----------------------------------------
 .byte   KEYSH , song22_key+0
 .byte   VOICE , 40
 .byte   LFOS 44
 .byte   BENDR, 12
 .byte   PAN , c_v+0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   BEND , c_v+0
 .byte   W96
@  #04 @001   ----------------------------------------
 .byte   W96
@  #04 @002   ----------------------------------------
 .byte   W48
 .byte   TIE ,En1 ,v120
 .byte   W48
@  #04 @003   ----------------------------------------
 .byte   W24
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W09
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W09
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 12*song22_mvl/mxv
 .byte   W06
 .byte   EOT
 .byte   VOL , 5*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 0*song22_mvl/mxv
 .byte   W06
@  #04 @004   ----------------------------------------
 .byte   W48
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W96
@  #04 @005   ----------------------------------------
 .byte   W96
@  #04 @006   ----------------------------------------
 .byte   W96
@  #04 @007   ----------------------------------------
 .byte   W72
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v-24
 .byte   TIE
 .byte   W24
@  #04 @008   ----------------------------------------
 .byte   W24
 .byte   VOL , 87*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W08
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W10
@  #04 @009   ----------------------------------------
 .byte   EOT
 .byte   VOL , 82*song22_mvl/mxv
 .byte   PAN , c_v-6
 .byte   N12 ,En2 ,v127
 .byte   W12
 .byte   Bn1
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   Gs1
 .byte   W12
 .byte   Cs2
 .byte   W12
 .byte   En1
 .byte   W12
 .byte   Bn1
 .byte   W12
 .byte   Gs1
 .byte   W12
@  #04 @010   ----------------------------------------
 .byte   N36 ,An1
 .byte   W36
 .byte   N06
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   N36 ,Gn1
 .byte   W36
 .byte   N06 ,En1
 .byte   W06
 .byte   Cs1
 .byte   W06
@  #04 @011   ----------------------------------------
 .byte   N36 ,Fs1
 .byte   W36
 .byte   N06 ,Dn1
 .byte   W06
 .byte   En1
 .byte   W06
 .byte   N24 ,Fs1
 .byte   W24
 .byte   En1
 .byte   W24
@  #04 @012   ----------------------------------------
 .byte   N12 ,An2
 .byte   W12
 .byte   N21 ,An1
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   N06 ,En1
 .byte   W12
 .byte   N12 ,Gs1
 .byte   W12
@  #04 @013   ----------------------------------------
 .byte   N09 ,An1
 .byte   W12
 .byte   N21
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Gn1
 .byte   W12
 .byte   Fs1
 .byte   W12
@  #04 @014   ----------------------------------------
 .byte   N36 ,En1
 .byte   W36
 .byte   N12 ,Cs1
 .byte   W12
 .byte   N24 ,En1
 .byte   W24
 .byte   An1
 .byte   W24
@  #04 @015   ----------------------------------------
 .byte   Gn1
 .byte   W24
 .byte   Dn1
 .byte   W24
 .byte   Gn1
 .byte   W24
 .byte   Gs1
 .byte   W24
@  #04 @016   ----------------------------------------
 .byte   N36 ,An1
 .byte   W36
 .byte   N12 ,En1
 .byte   W12
 .byte   N24 ,An1
 .byte   W24
 .byte   N12 ,En2
 .byte   W12
 .byte   Cs2
 .byte   W12
@  #04 @017   ----------------------------------------
 .byte   VOICE , 10
 .byte   N36 ,Cs3 ,v056
 .byte   W36
 .byte   N06 ,An2
 .byte   W12
 .byte   N36 ,En3
 .byte   W36
 .byte   N06 ,Ds3
 .byte   W06
 .byte   Dn3
 .byte   W06
@  #04 @018   ----------------------------------------
 .byte   VOICE , 40
 .byte   N36 ,An1 ,v127
 .byte   W36
 .byte   N12 ,En1
 .byte   W12
 .byte   N24 ,An1
 .byte   W24
 .byte   N12 ,Cs2
 .byte   W12
 .byte   En1
 .byte   W12
@  #04 @019   ----------------------------------------
 .byte   N24 ,Gn1
 .byte   W24
 .byte   An1
 .byte   W24
 .byte   Bn1
 .byte   W24
 .byte   Dn2
 .byte   W24
@  #04 @020   ----------------------------------------
 .byte   N36 ,An1
 .byte   W36
 .byte   N12 ,En1
 .byte   W12
 .byte   N48 ,Cs1
 .byte   W48
@  #04 @021   ----------------------------------------
 .byte   VOICE , 10
 .byte   N36 ,Cs3 ,v056
 .byte   W36
 .byte   N12 ,An2
 .byte   W12
 .byte   N06 ,En3
 .byte   W12
 .byte   Cs3
 .byte   W06
 .byte   En3
 .byte   W06
 .byte   N24 ,An3
 .byte   W24
@  #04 @022   ----------------------------------------
 .byte   VOICE , 40
 .byte   N36 ,Gn1 ,v127
 .byte   W36
 .byte   N12 ,En1
 .byte   W12
 .byte   N48 ,Dn2
 .byte   W48
@  #04 @023   ----------------------------------------
 .byte   N36 ,Bn1
 .byte   W36
 .byte   N06 ,Gn1
 .byte   W12
 .byte   N48 ,Dn2
 .byte   W48
@  #04 @024   ----------------------------------------
 .byte   N36 ,An1
 .byte   W36
 .byte   N12 ,En2
 .byte   W12
 .byte   N24 ,Cs2
 .byte   W24
 .byte   N12 ,Bn1
 .byte   W12
 .byte   En1
 .byte   W12
@  #04 @025   ----------------------------------------
 .byte   N24 ,An1
 .byte   W24
 .byte   Bn1
 .byte   W24
 .byte   Cs2
 .byte   W24
 .byte   N06 ,Bn1
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   Bn1
 .byte   W06
 .byte   An1
 .byte   W06
@  #04 @026   ----------------------------------------
 .byte   N36 ,Gn1
 .byte   W36
 .byte   N12 ,Dn1
 .byte   W12
 .byte   N24 ,Gn1
 .byte   W24
 .byte   N12 ,Bn1
 .byte   W12
 .byte   An1
 .byte   W12
@  #04 @027   ----------------------------------------
 .byte   N36 ,Bn1 ,v072
 .byte   W36
 .byte   N06 ,Gn1
 .byte   W12
 .byte   N24 ,Bn1
 .byte   W24
 .byte   N12 ,Dn2
 .byte   W12
 .byte   Bn1
 .byte   W12
@  #04 @028   ----------------------------------------
 .byte   N24 ,Cs2 ,v127
 .byte   W24
 .byte   Bn1
 .byte   W24
 .byte   An1
 .byte   W24
 .byte   N12 ,En1
 .byte   W12
 .byte   Bn1
 .byte   W12
@  #04 @029   ----------------------------------------
 .byte   N24 ,En2
 .byte   W24
 .byte   Dn2
 .byte   W24
 .byte   Cs2
 .byte   W24
 .byte   N12 ,Bn1
 .byte   W12
 .byte   Gn1
 .byte   W12
@  #04 @030   ----------------------------------------
 .byte   N24 ,En1
 .byte   W24
 .byte   Fs1
 .byte   W24
 .byte   Gn1
 .byte   W24
 .byte   Dn1
 .byte   W24
@  #04 @031   ----------------------------------------
 .byte   W96
@  #04 @032   ----------------------------------------
 .byte   VOICE , 36
 .byte   N12 ,An1 ,v076
 .byte   W60
 .byte   N12
 .byte   W12
 .byte   En1
 .byte   W24
@  #04 @033   ----------------------------------------
 .byte   Gn1
 .byte   W60
 .byte   Bn1
 .byte   W12
 .byte   N03 ,Dn2
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N12 ,Bn1
 .byte   W12
@  #04 @034   ----------------------------------------
 .byte   An1
 .byte   W60
 .byte   N12
 .byte   W12
 .byte   En1
 .byte   W24
@  #04 @035   ----------------------------------------
 .byte   An1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   Cs2
 .byte   W12
 .byte   N03 ,En2
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   N03
 .byte   W06
@  #04 @036   ----------------------------------------
 .byte   N12 ,An1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
 .byte   N03 ,An2
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N12 ,Gs1
 .byte   W12
@  #04 @037   ----------------------------------------
 .byte   Gn1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   Bn1
 .byte   W12
 .byte   N03 ,Dn2
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N12 ,As1
 .byte   W12
@  #04 @038   ----------------------------------------
 .byte   An1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
 .byte   En1
 .byte   W12
 .byte   Gs1
 .byte   W12
@  #04 @039   ----------------------------------------
 .byte   N08 ,An1 ,v064
 .byte   W48
 .byte   N24 ,Cs2 ,v076
 .byte   W24
 .byte   N12 ,En2 ,v072
 .byte   W12
 .byte   N06 ,Ds2
 .byte   W06
 .byte   Dn2
 .byte   W06
@  #04 @040   ----------------------------------------
 .byte   VOICE , 40
 .byte   W96
@  #04 @041   ----------------------------------------
 .byte   W96
@  #04 @042   ----------------------------------------
 .byte   Cs4
 .byte W00 @ added 
 @.byte   N06 ,Cs5 ,v044 @ 0xD5 0x55 0x2C 0x86 
 .byte   W06
 .byte   Dn5
 .byte   W06
 .byte   En5
 .byte   W06
 .byte   Fs5
 .byte   W06
 .byte   N12 ,En5
 .byte   W12
 .byte   N04
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   N12 ,Bn4
 .byte   W12
 .byte   N04
 .byte   W04
 .byte   As4
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   N12 ,Gs4
 .byte   W12
 .byte   N04
 .byte   W04
 .byte   Fs4
 .byte   W04
 .byte   Fn4
 .byte   W04
@  #04 @043   ----------------------------------------
 .byte   N96 ,En4
 .byte   W36
 .byte   MOD 8
 .byte   W12
 .byte   VOL , 81*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 76*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 75*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W10
@  #04 @044   ----------------------------------------
 .byte   VOL , 82*song22_mvl/mxv
 .byte   MOD 0
 .byte   W96
@  #04 @045   ----------------------------------------
 .byte   W96
@  #04 @046   ----------------------------------------
 .byte   W96
@  #04 @047   ----------------------------------------
 .byte   W96
@  #04 @048   ----------------------------------------
 .byte   VOICE , 36
 .byte   VOL , 73*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   N06 ,Gn1 ,v072
 .byte   W12
 .byte   N06
 .byte   W36
 .byte   N06
 .byte   W12
 .byte   N24
 .byte   W24
 .byte   N12 ,Gs1
 .byte   W12
@  #04 @049   ----------------------------------------
 .byte   N48 ,An1
 .byte   W48
 .byte   N06 ,En1
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N24 ,Bn1
 .byte   W24
@  #04 @050   ----------------------------------------
 .byte   VOL , 73*song22_mvl/mxv
 .byte   N06 ,Cn2
 .byte   W24
 .byte   N24 ,Bn1
 .byte   W24
 .byte   N06 ,Cn2
 .byte   W24
 .byte   N24 ,Gs1
 .byte   W24
@  #04 @051   ----------------------------------------
Label_01055F41:
 .byte   N06 ,Cn2 ,v072
 .byte   W24
 .byte   N24 ,Bn1
 .byte   W24
 .byte   N06 ,Cn2
 .byte   W24
 .byte   N24 ,Gs1
 .byte   W24
 .byte   PEND 
@  #04 @052   ----------------------------------------
 .byte   PATT
  .word Label_01055F41
@  #04 @053   ----------------------------------------
 .byte   PATT
  .word Label_01055F41
@  #04 @054   ----------------------------------------
 .byte   PATT
  .word Label_01055F41
@  #04 @055   ----------------------------------------
 .byte   PATT
  .word Label_01055F41
@  #04 @056   ----------------------------------------
 .byte   PATT
  .word Label_01055F41
@  #04 @057   ----------------------------------------
 .byte   PATT
  .word Label_01055F41
@  #04 @058   ----------------------------------------
 .byte   PATT
  .word Label_01055F41
@  #04 @059   ----------------------------------------
 .byte   PATT
  .word Label_01055F41
@  #04 @060   ----------------------------------------
 .byte   W12
 .byte   N06 ,An2 ,v072
 .byte   W06
 .byte   N03
 .byte   W18
 .byte   N06 ,An1
 .byte   W24
 .byte   N06
 .byte   W24
 .byte   N24 ,Fn2
 .byte   W12
@  #04 @061   ----------------------------------------
 .byte   W12
 .byte   N06 ,An2
 .byte   W06
 .byte   N03
 .byte   W18
 .byte   N06 ,An1
 .byte   W24
 .byte   N06
 .byte   W24
 .byte   N24 ,Fs2
 .byte   W12
@  #04 @062   ----------------------------------------
 .byte   W12
 .byte   N06 ,An2
 .byte   W06
 .byte   N03
 .byte   W18
 .byte   N06 ,An1
 .byte   W24
 .byte   N06
 .byte   W36
@  #04 @063   ----------------------------------------
 .byte   W96
@  #04 @064   ----------------------------------------
 .byte   W96
@  #04 @065   ----------------------------------------
 .byte   W96
@  #04 @066   ----------------------------------------
 .byte   VOICE , 15
 .byte   VOL , 68*song22_mvl/mxv
 .byte   PAN , c_v+15
 .byte   N24 ,Cn1 ,v056
 .byte   W09
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W15
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W60
@  #04 @067   ----------------------------------------
Label_01055FB9:
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N24 ,Cn1 ,v056
 .byte   W09
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W15
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W60
 .byte   PEND 
@  #04 @068   ----------------------------------------
Label_01055FCD:
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N24 ,Dn1 ,v056
 .byte   W09
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W15
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W60
 .byte   PEND 
@  #04 @069   ----------------------------------------
 .byte   PATT
  .word Label_01055FCD
@  #04 @070   ----------------------------------------
Label_01055FE6:
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N24 ,Gn1 ,v056
 .byte   W09
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W15
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W60
 .byte   PEND 
@  #04 @071   ----------------------------------------
 .byte   PATT
  .word Label_01055FE6
@  #04 @072   ----------------------------------------
 .byte   PATT
  .word Label_01055FB9
@  #04 @073   ----------------------------------------
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N48 ,Cn1 ,v052
 .byte   W09
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W15
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W12
 .byte   N24 ,Dn1
 .byte   W24
 .byte   En1
 .byte   W24
@  #04 @074   ----------------------------------------
Label_0105601C:
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N24 ,Fn1 ,v056
 .byte   W09
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W15
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W60
 .byte   PEND 
@  #04 @075   ----------------------------------------
 .byte   PATT
  .word Label_0105601C
@  #04 @076   ----------------------------------------
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N24 ,En1 ,v056
 .byte   W09
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W15
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W60
@  #04 @077   ----------------------------------------
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N24
 .byte   W09
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W15
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N24
 .byte   W09
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N24 ,Ds1
 .byte   W09
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W03
@  #04 @078   ----------------------------------------
 .byte   PATT
  .word Label_01055FCD
@  #04 @079   ----------------------------------------
 .byte   PATT
  .word Label_01055FCD
@  #04 @080   ----------------------------------------
 .byte   PATT
  .word Label_01055FB9
@  #04 @081   ----------------------------------------
 .byte   PATT
  .word Label_01055FB9
@  #04 @082   ----------------------------------------
 .byte   W96
@  #04 @083   ----------------------------------------
 .byte   W96
@  #04 @084   ----------------------------------------
 .byte   W96
@  #04 @085   ----------------------------------------
 .byte   W96
@  #04 @086   ----------------------------------------
 .byte   W96
@  #04 @087   ----------------------------------------
 .byte   W96
@  #04 @088   ----------------------------------------
 .byte   W96
@  #04 @089   ----------------------------------------
 .byte   W96
@  #04 @090   ----------------------------------------
 .byte   W96
@  #04 @091   ----------------------------------------
 .byte   W96
@  #04 @092   ----------------------------------------
 .byte   VOICE , 36
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   N24 ,Gn1 ,v080
 .byte   W48
 .byte   N24
 .byte   W48
@  #04 @093   ----------------------------------------
 .byte   N24
 .byte   W48
 .byte   N24
 .byte   W24
 .byte   Gs1
 .byte   W24
@  #04 @094   ----------------------------------------
 .byte   N36 ,An1
 .byte   W36
 .byte   N12 ,En1
 .byte   W12
 .byte   N36 ,An1
 .byte   W36
 .byte   N12 ,Bn1
 .byte   W12
@  #04 @095   ----------------------------------------
 .byte   N06 ,An1
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N12 ,Gs1
 .byte   W12
 .byte   N06 ,An1
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N24 ,Cs2
 .byte   W24
@  #04 @096   ----------------------------------------
 .byte   N03 ,Gn1
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W24
 .byte   N12 ,Bn1
 .byte   W12
 .byte   N06 ,An1
 .byte   W12
 .byte   Gn1
 .byte   W12
 .byte   N24 ,Bn1
 .byte   W24
@  #04 @097   ----------------------------------------
 .byte   N06 ,Gn1
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N12 ,Dn1
 .byte   W12
 .byte   N06 ,Gn1
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N24 ,Gs1
 .byte   W24
@  #04 @098   ----------------------------------------
 .byte   N06 ,An1
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W24
 .byte   N12 ,En1
 .byte   W12
 .byte   N06 ,An1
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N12 ,En1
 .byte   W12
 .byte   Gs1
 .byte   W12
@  #04 @099   ----------------------------------------
 .byte   N06 ,An1
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N12 ,En1
 .byte   W12
 .byte   N06 ,An1
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Fs1
 .byte   W12
@  #04 @100   ----------------------------------------
 .byte   VOICE , 36
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N96 ,Dn1
 .byte   W96
@  #04 @101   ----------------------------------------
 .byte   N12
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N09
 .byte   W24
 .byte   N12
 .byte   W12
@  #04 @102   ----------------------------------------
 .byte   N96 ,En1
 .byte   W96
@  #04 @103   ----------------------------------------
 .byte   N12
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N09
 .byte   W24
 .byte   N09
 .byte   W12
@  #04 @104   ----------------------------------------
 .byte   N12 ,Fn1
 .byte   W36
 .byte   N12
 .byte   W12
 .byte   N06 ,An1
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N12 ,Fn1
 .byte   W12
 .byte   N06 ,Fn2
 .byte   W12
 .byte   N12 ,Fn1
 .byte   W12
@  #04 @105   ----------------------------------------
 .byte   N24 ,Cn2
 .byte   W24
 .byte   An1
 .byte   W24
 .byte   W03
 .byte   N21 ,Fn2
 .byte   W21
 .byte   N24 ,Cn2
 .byte   W24
@  #04 @106   ----------------------------------------
 .byte   N03 ,Bn1
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N12
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   Gn1
 .byte   W24
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
@  #04 @107   ----------------------------------------
 .byte   N12
 .byte   W12
 .byte   N06 ,Dn1
 .byte   W24
 .byte   N12
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   N06 ,Gn1
 .byte   W24
 .byte   N12
 .byte   W12
@  #04 @108   ----------------------------------------
Label_0105615E:
 .byte   N24 ,An1 ,v080
 .byte   W24
 .byte   En1
 .byte   W24
 .byte   An1
 .byte   W24
 .byte   En1
 .byte   W24
 .byte   PEND 
@  #04 @109   ----------------------------------------
 .byte   An1
 .byte   W24
 .byte   En1
 .byte   W24
 .byte   An1
 .byte   W24
 .byte   N12 ,Cs2
 .byte   W12
 .byte   Bn1
 .byte   W12
@  #04 @110   ----------------------------------------
 .byte   N24 ,An1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W24
 .byte   En1
 .byte   W12
@  #04 @111   ----------------------------------------
 .byte   N24 ,An1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W24
 .byte   Gs1
 .byte   W12
@  #04 @112   ----------------------------------------
 .byte   N36 ,Gn1 ,v076
 .byte   W36
 .byte   N12 ,Fs1 ,v080
 .byte   W12
 .byte   N36 ,Dn1
 .byte   W36
 .byte   N06 ,Dn2 ,v076
 .byte   W12
@  #04 @113   ----------------------------------------
 .byte   N36 ,Gn1
 .byte   W36
 .byte   N12 ,Dn1 ,v080
 .byte   W12
 .byte   N36 ,Bn1
 .byte   W36
 .byte   N06 ,An1
 .byte   W06
 .byte   Gn1
 .byte   W06
@  #04 @114   ----------------------------------------
 .byte   PATT
  .word Label_0105615E
@  #04 @115   ----------------------------------------
 .byte   N24 ,An1 ,v080
 .byte   W24
 .byte   En1
 .byte   W24
 .byte   An1
 .byte   W24
 .byte   N12 ,En1
 .byte   W12
 .byte   N06 ,En2
 .byte   W12
@  #04 @116   ----------------------------------------
 .byte   N24 ,Gn1
 .byte   W36
 .byte   N06
 .byte   W12
 .byte   N03
 .byte   W12
 .byte   N12 ,Dn1
 .byte   W24
 .byte   N12
 .byte   W12
@  #04 @117   ----------------------------------------
 .byte   N36 ,Gn1
 .byte   W36
 .byte   N06 ,Dn1
 .byte   W12
 .byte   N12 ,Gn1
 .byte   W12
 .byte   N24 ,Gs1
 .byte   W24
 .byte   N12 ,En1
 .byte   W12
@  #04 @118   ----------------------------------------
 .byte   PATT
  .word Label_0105615E
@  #04 @119   ----------------------------------------
 .byte   N24 ,An1 ,v096
 .byte   W24
 .byte   En1
 .byte   W24
 .byte   N12 ,An1
 .byte   W12
 .byte   En1
 .byte   W12
 .byte   An1
 .byte   W12
 .byte   En1
 .byte   W12
@  #04 @120   ----------------------------------------
 .byte   N06 ,An1 ,v092
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N09
 .byte   W48
 .byte   FINE

@**************** Track 5 (Midi-Chn.4) ****************@

song22_005:
@  #05 @000   ----------------------------------------
 .byte   KEYSH , song22_key+0
 .byte   VOICE , 35
 .byte   VOL , 87*song22_mvl/mxv
 .byte   PAN , c_v-48
 .byte   LFOS 44
 .byte   BENDR, 12
 .byte   W96
@  #05 @001   ----------------------------------------
 .byte   W96
@  #05 @002   ----------------------------------------
 .byte   N03 ,En3 ,v052
 .byte   W03
 .byte   Bn2
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   PAN , c_v+16
 .byte   N03 ,En4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   PAN , c_v+47
 .byte   N03 ,En5
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   PAN , c_v-48
 .byte   N03 ,Gs4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Bn2
 .byte   W03
 .byte   PAN , c_v+47
 .byte   N03 ,Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Bn2
 .byte   W03
 .byte   N24 ,Gs2
 .byte   W03
@  #05 @003   ----------------------------------------
 .byte   VOL , 83*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W01
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 27*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W76
@  #05 @004   ----------------------------------------
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W48
 .byte   VOICE , 41
 .byte   PAN , c_v-16
 .byte   N36 ,An5 ,v040
 .byte   W12
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N06 ,En5
 .byte   W06
 .byte   An5
 .byte   W06
@  #05 @005   ----------------------------------------
 .byte   PAN , c_v+16
 .byte   N36 ,Gn5
 .byte   W12
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N06 ,Dn5
 .byte   W06
 .byte   Gn5
 .byte   W06
 .byte   PAN , c_v-16
 .byte   N36 ,Fs5
 .byte   W12
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N06 ,Dn5
 .byte   W06
 .byte   Fs5
 .byte   W06
@  #05 @006   ----------------------------------------
 .byte   PAN , c_v+16
 .byte   N48 ,En5
 .byte   W12
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 10*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 2*song22_mvl/mxv
 .byte   W96
@  #05 @007   ----------------------------------------
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W72
 .byte   VOICE , 35
 .byte   W24
@  #05 @008   ----------------------------------------
 .byte   PAN , c_v-32
 .byte   N03 ,En4 ,v108
 .byte   W03
 .byte   Dn4 ,v092
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Dn3
 .byte   W03
 .byte   Bn2
 .byte   W03
 .byte   PAN , c_v+32
 .byte   N03 ,Fs4 ,v108
 .byte   W03
 .byte   En4 ,v092
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Dn3
 .byte   W03
 .byte   PAN , c_v-32
 .byte   N03 ,Gs4 ,v108
 .byte   W03
 .byte   Fs4 ,v088
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   PAN , c_v+32
 .byte   N03 ,Bn4 ,v108
 .byte   W03
 .byte   Gs4 ,v088
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
@  #05 @009   ----------------------------------------
 .byte   PAN , c_v-32
 .byte   N03 ,En5 ,v108
 .byte   W03
 .byte   Dn5 ,v092
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   PAN , c_v+32
 .byte   N03 ,Dn5 ,v108
 .byte   W03
 .byte   Bn4 ,v092
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   PAN , c_v-32
 .byte   N03 ,Bn4 ,v104
 .byte   W03
 .byte   Gs4 ,v088
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   PAN , c_v+32
 .byte   N03 ,Gs4 ,v104
 .byte   W03
 .byte   Fs4 ,v088
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
@  #05 @010   ----------------------------------------
 .byte   W96
@  #05 @011   ----------------------------------------
 .byte   W96
@  #05 @012   ----------------------------------------
 .byte   VOICE , 32
 .byte   PAN , c_v+12
 .byte   N12 ,An5 ,v080
 .byte   W12
 .byte   An4
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N21
 .byte   W24
@  #05 @013   ----------------------------------------
 .byte   N06
 .byte   W12
 .byte   N12
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W12
 .byte   N12
 .byte   W36
@  #05 @014   ----------------------------------------
 .byte   PAN , c_v-32
 .byte   W96
@  #05 @015   ----------------------------------------
 .byte   W96
@  #05 @016   ----------------------------------------
 .byte   W96
@  #05 @017   ----------------------------------------
 .byte   W96
@  #05 @018   ----------------------------------------
 .byte   W96
@  #05 @019   ----------------------------------------
 .byte   W96
@  #05 @020   ----------------------------------------
 .byte   W96
@  #05 @021   ----------------------------------------
 .byte   W96
@  #05 @022   ----------------------------------------
 .byte   W96
@  #05 @023   ----------------------------------------
 .byte   W96
@  #05 @024   ----------------------------------------
 .byte   W96
@  #05 @025   ----------------------------------------
 .byte   W96
@  #05 @026   ----------------------------------------
 .byte   W96
@  #05 @027   ----------------------------------------
 .byte   W96
@  #05 @028   ----------------------------------------
 .byte   W96
@  #05 @029   ----------------------------------------
 .byte   W96
@  #05 @030   ----------------------------------------
 .byte   W96
@  #05 @031   ----------------------------------------
 .byte   VOICE , 35
 .byte   N06 ,En2 ,v072
 .byte   W06
 .byte   An2
 .byte   W06
 .byte   Cs3
 .byte   W06
 .byte   En3
 .byte   W06
 .byte   An2
 .byte   W06
 .byte   Cs3
 .byte   W06
 .byte   En3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Cs3
 .byte   W06
 .byte   En3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   N03 ,An4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Cs3
 .byte   W03
 .byte   An2
 .byte   W03
@  #05 @032   ----------------------------------------
 .byte   VOICE , 32
 .byte   PAN , c_v-16
 .byte   VOL , 71*song22_mvl/mxv
 .byte   N06 ,An4 ,v112
 .byte   W12
 .byte   N12 ,An3
 .byte   W48
 .byte   En3 ,v120
 .byte   W12
 .byte   N06 ,Cs4
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
@  #05 @033   ----------------------------------------
Label_010563E0:
 .byte   N06 ,Gn4 ,v120
 .byte   W12
 .byte   N12 ,Gn3
 .byte   W48
 .byte   En4
 .byte   W12
 .byte   N03 ,An4
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06 ,En4
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   PEND 
@  #05 @034   ----------------------------------------
Label_010563F4:
 .byte   N06 ,En4 ,v120
 .byte   W12
 .byte   N12 ,En3
 .byte   W84
 .byte   PEND 
@  #05 @035   ----------------------------------------
 .byte   N06 ,En4
 .byte   W12
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W12
 .byte   En4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   N03 ,Cs5
 .byte   W06
 .byte   Cs5 ,v116
 .byte   W06
 .byte   N06
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W06
@  #05 @036   ----------------------------------------
 .byte   An4 ,v112
 .byte   W12
 .byte   N12 ,An3
 .byte   W24
 .byte   An3 ,v120
 .byte   W24
 .byte   En3
 .byte   W12
 .byte   N06 ,Cs4
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
@  #05 @037   ----------------------------------------
 .byte   PATT
  .word Label_010563E0
@  #05 @038   ----------------------------------------
 .byte   PATT
  .word Label_010563F4
@  #05 @039   ----------------------------------------
 .byte   N08 ,An3 ,v120
 .byte   W08
 .byte   En3
 .byte   W08
 .byte   An3
 .byte   W08
 .byte   Cs4
 .byte   W08
 .byte   An3
 .byte   W08
 .byte   Cs4
 .byte   W08
 .byte   N36 ,En4
 .byte   W36
 .byte   N06 ,Dn4 ,v088
 .byte   W06
 .byte   Cs4
 .byte   W06
@  #05 @040   ----------------------------------------
 .byte   VOICE , 35
 .byte   PAN , c_v+32
 .byte   VOL , 64*song22_mvl/mxv
 .byte   BEND , c_v+1
 .byte   W06
 .byte   N04 ,Gn2 ,v032
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Dn5
 .byte   W02
@  #05 @041   ----------------------------------------
Label_01056483:
 .byte   PAN , c_v-32
 .byte   W02
 .byte   N04 ,Fs5 ,v032
 .byte   W04
 .byte   Gn5
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Bn2
 .byte   W02
 .byte   PEND 
@  #05 @042   ----------------------------------------
 .byte   PAN , c_v+31
 .byte   W02
 .byte   N04 ,Gn2
 .byte   W04
 .byte   An2
 .byte   W04
 .byte   Cs3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   Cs3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   En5
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   En5
 .byte   W02
@  #05 @043   ----------------------------------------
 .byte   PAN , c_v-33
 .byte   W02
 .byte   N04 ,Gs5
 .byte   W04
 .byte   An5
 .byte   W04
 .byte   En5
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   En5
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   Cs5
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   An4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   En4
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   Cs4
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   An3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   Cs3
 .byte   W04
 .byte   En3
 .byte   W04
 .byte   Cs3
 .byte   W02
@  #05 @044   ----------------------------------------
 .byte   PAN , c_v+32
 .byte   W02
 .byte   N04 ,An2
 .byte   W04
 .byte   Gn2
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Bn2
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Dn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Gn3
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Bn3
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Dn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Gn4
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Dn5
 .byte   W04
 .byte   Bn4
 .byte   W04
 .byte   Dn5
 .byte   W02
@  #05 @045   ----------------------------------------
 .byte   PATT
  .word Label_01056483
@  #05 @046   ----------------------------------------
 .byte   PAN , c_v+32
 .byte   W02
 .byte   N04 ,Gn2 ,v032
 .byte   W04
 .byte   N24 ,An4
 .byte   W18
 .byte   PAN , c_v-32
 .byte   W06
 .byte   N24 ,Gs4
 .byte   W18
 .byte   PAN , c_v+31
 .byte   W06
 .byte   N24 ,Fs4
 .byte   W18
 .byte   PAN , c_v-32
 .byte   W06
 .byte   N24 ,En4
 .byte   W18
@  #05 @047   ----------------------------------------
 .byte   PAN , c_v+32
 .byte   W06
 .byte   N03 ,An2
 .byte   W03
 .byte   Bn2
 .byte   W03
 .byte   Cs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   PAN , c_v-16
 .byte   N03 ,Fs3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   PAN , c_v-32
 .byte   N03 ,An3
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Cs4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   An4
 .byte   W03
 .byte   As4
 .byte   W03
 .byte   Cn5
 .byte   W03
 .byte   N24 ,Cs5
 .byte   W24
 .byte   N18 ,An4
 .byte   W18
@  #05 @048   ----------------------------------------
 .byte   VOICE , 35
 .byte   PAN , c_v-32
 .byte   VOL , 65*song22_mvl/mxv
 .byte   BEND , c_v+0
 .byte   N12 ,Bn4 ,v088
 .byte   W12
 .byte   Dn4
 .byte   W12
 .byte   An4
 .byte   W12
 .byte   Dn4 ,v072
 .byte   W12
 .byte   Bn4 ,v088
 .byte   W12
 .byte   Dn4 ,v072
 .byte   W12
 .byte   Dn5 ,v088
 .byte   W12
 .byte   Dn4 ,v072
 .byte   W12
@  #05 @049   ----------------------------------------
 .byte   VOICE , 2
 .byte   PAN , c_v+35
 .byte   N24 ,An2 ,v112
 .byte   W24
 .byte   PAN , c_v-32
 .byte   N24 ,Gn2
 .byte   W24
 .byte   PAN , c_v+36
 .byte   N24 ,Fn2
 .byte   W24
 .byte   PAN , c_v-32
 .byte   VOL , 81*song22_mvl/mxv
 .byte   N06 ,En2 ,v100
 .byte   W06
 .byte   N05 ,En2 ,v108
 .byte   W06
 .byte   En2 ,v112
 .byte   W06
 .byte   En2 ,v127
 .byte   W06
@  #05 @050   ----------------------------------------
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W96
@  #05 @051   ----------------------------------------
 .byte   W96
@  #05 @052   ----------------------------------------
 .byte   VOICE , 15
 .byte   PAN , c_v+0
 .byte   N06 ,An3 ,v080
 .byte   W06
 .byte   N03 ,En3 ,v052
 .byte   W06
 .byte   N06 ,An3 ,v080
 .byte   W06
 .byte   N03 ,En3 ,v048
 .byte   W06
 .byte   N06 ,En4 ,v080
 .byte   W06
 .byte   N03 ,Cn4 ,v048
 .byte   W06
 .byte   N06 ,En4 ,v080
 .byte   W06
 .byte   N03 ,Cn4 ,v048
 .byte   W06
 .byte   N06 ,Ds4 ,v080
 .byte   W06
 .byte   N03 ,Cn4 ,v048
 .byte   W06
 .byte   N06 ,Ds4 ,v080
 .byte   W06
 .byte   N03 ,Cn4 ,v048
 .byte   W06
 .byte   N06 ,Gn4 ,v080
 .byte   W06
 .byte   N03 ,Ds4 ,v048
 .byte   W06
 .byte   N06 ,Gn4 ,v080
 .byte   W06
 .byte   N03 ,Ds4 ,v048
 .byte   W06
@  #05 @053   ----------------------------------------
 .byte   N06 ,Fs4 ,v080
 .byte   W06
 .byte   N03 ,Cn4 ,v048
 .byte   W06
 .byte   N06 ,Fs4 ,v080
 .byte   W06
 .byte   N03 ,Cn4 ,v048
 .byte   W06
 .byte   N06 ,Cs4 ,v080
 .byte   W06
 .byte   N03 ,An3 ,v048
 .byte   W06
 .byte   N06 ,Cs4 ,v080
 .byte   W06
 .byte   N03 ,An3 ,v048
 .byte   W06
 .byte   N06 ,Cn4 ,v080
 .byte   W06
 .byte   N03 ,En3 ,v048
 .byte   W06
 .byte   N06 ,Cn4 ,v080
 .byte   W06
 .byte   N03 ,En3 ,v048
 .byte   W06
 .byte   N06 ,En4 ,v080
 .byte   W06
 .byte   N03 ,An3 ,v048
 .byte   W06
 .byte   N06 ,En4 ,v080
 .byte   W06
 .byte   N03 ,An3 ,v048
 .byte   W06
@  #05 @054   ----------------------------------------
 .byte   N06 ,Ds4 ,v080
 .byte   W06
 .byte   N03 ,An3 ,v048
 .byte   W06
 .byte   N06 ,Ds4 ,v080
 .byte   W06
 .byte   N03 ,An3 ,v048
 .byte   W06
 .byte   N06 ,An3 ,v080
 .byte   W06
 .byte   N03 ,En3 ,v048
 .byte   W06
 .byte   N06 ,An3 ,v080
 .byte   W06
 .byte   N03 ,En3 ,v048
 .byte   W06
 .byte   N06 ,Gs3 ,v080
 .byte   W06
 .byte   N03 ,Dn3 ,v048
 .byte   W06
 .byte   N06 ,Gs3 ,v080
 .byte   W06
 .byte   N03 ,Dn3 ,v048
 .byte   W06
 .byte   N06 ,Dn4 ,v080
 .byte   W06
 .byte   N03 ,An3 ,v048
 .byte   W06
 .byte   N06 ,Dn4 ,v080
 .byte   W06
 .byte   N03 ,An3 ,v048
 .byte   W06
@  #05 @055   ----------------------------------------
 .byte   VOL , 71*song22_mvl/mxv
 .byte   N06 ,Cs4 ,v080
 .byte   W06
 .byte   N03 ,An3 ,v048
 .byte   W06
 .byte   N06 ,Cs4 ,v080
 .byte   W06
 .byte   N03 ,An3 ,v048
 .byte   W06
 .byte   N06 ,An3 ,v080
 .byte   W06
 .byte   N03 ,En3 ,v048
 .byte   W06
 .byte   N06 ,An3 ,v080
 .byte   W06
 .byte   N03 ,En3 ,v048
 .byte   W06
 .byte   VOL , 75*song22_mvl/mxv
 .byte   N06 ,Bn3 ,v080
 .byte   W06
 .byte   N03 ,En3 ,v048
 .byte   W06
 .byte   N06 ,Bn3 ,v080
 .byte   W06
 .byte   N03 ,En3 ,v048
 .byte   W06
 .byte   N06 ,Gs3 ,v080
 .byte   W06
 .byte   N03 ,Cn3 ,v048
 .byte   W06
 .byte   N06 ,Gs3 ,v080
 .byte   W06
 .byte   N03 ,Cn3 ,v048
 .byte   W06
@  #05 @056   ----------------------------------------
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N06 ,An4 ,v080
 .byte   W06
 .byte   N03 ,En4 ,v048
 .byte   W06
 .byte   N06 ,An4 ,v080
 .byte   W06
 .byte   N03 ,En4 ,v048
 .byte   W06
 .byte   N06 ,En5 ,v080
 .byte   W06
 .byte   N03 ,Cn5 ,v048
 .byte   W06
 .byte   N06 ,En5 ,v080
 .byte   W06
 .byte   N03 ,Cn5 ,v048
 .byte   W06
 .byte   N06 ,Ds5 ,v080
 .byte   W06
 .byte   N03 ,Cn5 ,v048
 .byte   W06
 .byte   N06 ,Ds5 ,v080
 .byte   W06
 .byte   N03 ,Cn5 ,v048
 .byte   W06
 .byte   N06 ,Gn5 ,v080
 .byte   W06
 .byte   N03 ,Ds5 ,v048
 .byte   W06
 .byte   N06 ,Gn5 ,v080
 .byte   W06
 .byte   N03 ,Ds5 ,v048
 .byte   W06
@  #05 @057   ----------------------------------------
 .byte   N06 ,Fs5 ,v080
 .byte   W06
 .byte   N03 ,Cn5 ,v044
 .byte   W06
 .byte   N06 ,Fs5 ,v080
 .byte   W06
 .byte   N03 ,Cn5 ,v044
 .byte   W06
 .byte   N06 ,Cs5 ,v080
 .byte   W06
 .byte   N03 ,An4 ,v048
 .byte   W06
 .byte   N06 ,Cs5 ,v080
 .byte   W06
 .byte   N03 ,An4 ,v048
 .byte   W06
 .byte   N06 ,Cn5 ,v080
 .byte   W06
 .byte   N03 ,En4 ,v048
 .byte   W06
 .byte   N06 ,Cn5 ,v080
 .byte   W06
 .byte   N03 ,En4 ,v048
 .byte   W06
 .byte   N06 ,En5 ,v080
 .byte   W06
 .byte   N03 ,An4 ,v048
 .byte   W06
 .byte   N06 ,En5 ,v080
 .byte   W06
 .byte   N03 ,An4 ,v048
 .byte   W06
@  #05 @058   ----------------------------------------
 .byte   N06 ,Ds5 ,v080
 .byte   W06
 .byte   N03 ,An4 ,v048
 .byte   W06
 .byte   N06 ,Ds5 ,v080
 .byte   W06
 .byte   N03 ,An4 ,v048
 .byte   W06
 .byte   N06 ,An4 ,v080
 .byte   W06
 .byte   N03 ,En4 ,v048
 .byte   W06
 .byte   N06 ,An4 ,v080
 .byte   W06
 .byte   N03 ,En4 ,v048
 .byte   W06
 .byte   N06 ,Gs4 ,v080
 .byte   W06
 .byte   N03 ,Dn4 ,v048
 .byte   W06
 .byte   N06 ,Gs4 ,v080
 .byte   W06
 .byte   N03 ,Dn4 ,v048
 .byte   W06
 .byte   N06 ,Dn5 ,v080
 .byte   W06
 .byte   N03 ,An4 ,v048
 .byte   W06
 .byte   N06 ,Dn5 ,v080
 .byte   W06
 .byte   N03 ,An4 ,v048
 .byte   W06
@  #05 @059   ----------------------------------------
 .byte   VOL , 72*song22_mvl/mxv
 .byte   N06 ,Cs5 ,v080
 .byte   W06
 .byte   N03 ,An4 ,v048
 .byte   W06
 .byte   N06 ,Cs5 ,v080
 .byte   W06
 .byte   N03 ,An4 ,v048
 .byte   W06
 .byte   N06 ,An4 ,v080
 .byte   W06
 .byte   N03 ,En4 ,v048
 .byte   W06
 .byte   N06 ,An4 ,v080
 .byte   W06
 .byte   N03 ,En4 ,v048
 .byte   W06
 .byte   VOL , 75*song22_mvl/mxv
 .byte   N06 ,Bn4 ,v080
 .byte   W06
 .byte   N03 ,En4 ,v048
 .byte   W06
 .byte   N06 ,Bn4 ,v080
 .byte   W06
 .byte   N03 ,En4 ,v048
 .byte   W06
 .byte   N06 ,Gs4 ,v080
 .byte   W06
 .byte   N03 ,Cn4 ,v048
 .byte   W06
 .byte   N06 ,Gs4 ,v080
 .byte   W06
 .byte   N03 ,Cn4 ,v048
 .byte   W06
@  #05 @060   ----------------------------------------
 .byte   VOICE , 42
 .byte   VOL , 65*song22_mvl/mxv
 .byte   N24 ,An4 ,v080
 .byte   W24
 .byte   An4 ,v040
 .byte   W24
 .byte   An4 ,v028
 .byte   W24
 .byte   An4 ,v016
 .byte   W24
@  #05 @061   ----------------------------------------
 .byte   An5 ,v080
 .byte   W24
 .byte   An5 ,v040
 .byte   W24
 .byte   An5 ,v028
 .byte   W24
 .byte   An5 ,v016
 .byte   W24
@  #05 @062   ----------------------------------------
 .byte   An4 ,v080
 .byte   W24
 .byte   An4 ,v040
 .byte   W24
 .byte   An4 ,v028
 .byte   W24
 .byte   An4 ,v016
 .byte   W24
@  #05 @063   ----------------------------------------
 .byte   N12 ,En5 ,v072
 .byte   W12
 .byte   N24 ,An5 ,v080
 .byte   W24
 .byte   Gs5
 .byte   W24
 .byte   Fn5
 .byte   W24
 .byte   En5
 .byte   W12
@  #05 @064   ----------------------------------------
 .byte   W12
 .byte   Fn5
 .byte   W24
 .byte   En5
 .byte   W24
 .byte   Cn5
 .byte   W24
 .byte   N12 ,Bn4
 .byte   W12
@  #05 @065   ----------------------------------------
 .byte   VOICE , 26
 .byte   VOL , 25*song22_mvl/mxv
 .byte   W12
 .byte   N36 ,Cn4 ,v020
 .byte   W48
 .byte   Dn4
 .byte   W36
@  #05 @066   ----------------------------------------
 .byte   VOICE , 26
 .byte   PAN , c_v-48
 .byte   VOL , 28*song22_mvl/mxv
 .byte   BEND , c_v+1
 .byte   W12
 .byte   N96 ,En4 ,v044
 .byte   W84
@  #05 @067   ----------------------------------------
 .byte   W12
 .byte   PAN , c_v+48
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Fn4
 .byte   W12
 .byte   N21 ,Gn4
 .byte   W21
 .byte   N03 ,Gs4
 .byte   W03
 .byte   N12 ,Gn4
 .byte   W12
 .byte   N08
 .byte   W08
 .byte   Fn4
 .byte   W04
@  #05 @068   ----------------------------------------
 .byte   W04
 .byte   En4
 .byte   W08
 .byte   N12 ,Fn4
 .byte   W12
 .byte   PAN , c_v-48
 .byte   N84 ,Dn4
 .byte   W72
@  #05 @069   ----------------------------------------
 .byte   W12
 .byte   PAN , c_v+48
 .byte   W24
 .byte   N24 ,Fn3
 .byte   W24
 .byte   En3
 .byte   W24
 .byte   An3
 .byte   W12
@  #05 @070   ----------------------------------------
 .byte   W12
 .byte   PAN , c_v-48
 .byte   N96 ,Dn4
 .byte   W84
@  #05 @071   ----------------------------------------
 .byte   W12
 .byte   PAN , c_v+48
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   En4
 .byte   W12
 .byte   N21 ,Fn4
 .byte   W21
 .byte   N03 ,Fs4
 .byte   W03
 .byte   N12 ,Fn4
 .byte   W12
 .byte   N08
 .byte   W08
 .byte   En4
 .byte   W04
@  #05 @072   ----------------------------------------
 .byte   PAN , c_v-37
 .byte   W04
 .byte   N08 ,Dn4
 .byte   W08
 .byte   N12 ,En4
 .byte   W12
 .byte   N72 ,Gn4
 .byte   W72
@  #05 @073   ----------------------------------------
 .byte   VOICE , 35
 .byte   VOL , 79*song22_mvl/mxv
 .byte   BEND , c_v+0
 .byte   W48
 .byte   N03 ,Gn3 ,v052
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Cn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   PAN , c_v-16
 .byte   N03 ,Cn5
 .byte   W03
 .byte   En5
 .byte   W03
 .byte   PAN , c_v+33
 .byte   N03 ,Gn5
 .byte   W03
 .byte   En5
 .byte   W03
 .byte   Cn5
 .byte   W03
 .byte   Gn4
 .byte   W03
 .byte   PAN , c_v-32
 .byte   N03 ,En4
 .byte   W03
 .byte   Cn4
 .byte   W03
 .byte   Gn3
 .byte   W03
 .byte   En3
 .byte   W03
@  #05 @074   ----------------------------------------
 .byte   W96
@  #05 @075   ----------------------------------------
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W96
@  #05 @076   ----------------------------------------
 .byte   W96
@  #05 @077   ----------------------------------------
 .byte   W96
@  #05 @078   ----------------------------------------
 .byte   W96
@  #05 @079   ----------------------------------------
 .byte   W96
@  #05 @080   ----------------------------------------
 .byte   W96
@  #05 @081   ----------------------------------------
 .byte   W96
@  #05 @082   ----------------------------------------
 .byte   W96
@  #05 @083   ----------------------------------------
 .byte   W96
@  #05 @084   ----------------------------------------
 .byte   W96
@  #05 @085   ----------------------------------------
 .byte   W96
@  #05 @086   ----------------------------------------
 .byte   W96
@  #05 @087   ----------------------------------------
 .byte   W96
@  #05 @088   ----------------------------------------
 .byte   W96
@  #05 @089   ----------------------------------------
 .byte   W96
@  #05 @090   ----------------------------------------
 .byte   W96
@  #05 @091   ----------------------------------------
 .byte   W96
@  #05 @092   ----------------------------------------
 .byte   W96
@  #05 @093   ----------------------------------------
 .byte   W96
@  #05 @094   ----------------------------------------
 .byte   W96
@  #05 @095   ----------------------------------------
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v-37
 .byte   W72
 .byte   VOICE , 32
 .byte   W12
 .byte   N06 ,En4 ,v096
 .byte   W06
 .byte   Fs4
 .byte   W06
@  #05 @096   ----------------------------------------
 .byte   N03 ,Gn4
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W36
 .byte   N06
 .byte   W06
 .byte   Fs4
 .byte   W06
 .byte   Gn4
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Bn4
 .byte   W12
@  #05 @097   ----------------------------------------
 .byte   N06 ,Gn4
 .byte   W12
 .byte   N06
 .byte   W36
 .byte   N06
 .byte   W06
 .byte   Fs4
 .byte   W06
 .byte   Gn4
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Bn4
 .byte   W12
@  #05 @098   ----------------------------------------
 .byte   N03 ,An4
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W24
 .byte   N09 ,En4
 .byte   W12
 .byte   N06 ,An4
 .byte   W06
 .byte   N03 ,Gs4
 .byte   W06
 .byte   N06 ,An4
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Gs4
 .byte   W12
@  #05 @099   ----------------------------------------
 .byte   N06 ,An4
 .byte   W12
 .byte   N06
 .byte   W36
 .byte   En4
 .byte   W12
 .byte   N06
 .byte   W36
@  #05 @100   ----------------------------------------
 .byte   Fs3 ,v108
 .byte   W12
 .byte   Dn3
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   An3
 .byte   W12
 .byte   Fs3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   N48 ,Dn4
 .byte   W48
@  #05 @101   ----------------------------------------
 .byte   VOICE , 10
 .byte   PAN , c_v+22
 .byte   N36 ,Dn3 ,v072
 .byte   W36
 .byte   N12 ,Cs3
 .byte   W12
 .byte   N36 ,Bn2
 .byte   W36
 .byte   N12 ,An2
 .byte   W12
@  #05 @102   ----------------------------------------
 .byte   VOICE , 32
 .byte   PAN , c_v-33
 .byte   N06 ,Gs3 ,v116
 .byte   W12
 .byte   En3
 .byte   W06
 .byte   Gs3
 .byte   W06
 .byte   N08 ,Bn3
 .byte   W08
 .byte   Gs3
 .byte   W08
 .byte   Bn3
 .byte   W08
 .byte   N48 ,En4
 .byte   W48
@  #05 @103   ----------------------------------------
 .byte   VOICE , 10
 .byte   PAN , c_v+22
 .byte   N24 ,En3 ,v072
 .byte   W24
 .byte   Dn3
 .byte   W24
 .byte   Fs3
 .byte   W24
 .byte   En3
 .byte   W24
@  #05 @104   ----------------------------------------
 .byte   VOICE , 32
 .byte   PAN , c_v-32
 .byte   N08 ,An3 ,v124
 .byte   W08
 .byte   Fn3
 .byte   W08
 .byte   An3
 .byte   W08
 .byte   Cn4
 .byte   W08
 .byte   An3
 .byte   W08
 .byte   Cn4
 .byte   W08
 .byte   N48 ,Fn4
 .byte   W48
@  #05 @105   ----------------------------------------
 .byte   VOICE , 10
 .byte   PAN , c_v+22
 .byte   N03 ,Fn4 ,v072
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N18
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W18
 .byte   Gn4
 .byte   W06
 .byte   N24 ,An4
 .byte   W24
@  #05 @106   ----------------------------------------
 .byte   VOL , 50*song22_mvl/mxv
 .byte   N60 ,Gn4
 .byte   W02
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W01
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W01
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W01
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W48
 .byte   N24 ,Dn4
 .byte   W24
 .byte   N12 ,Bn3
 .byte   W12
@  #05 @107   ----------------------------------------
 .byte   N48 ,Gn4
 .byte   W36
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N06 ,Gn4 ,v076
 .byte   W18
 .byte   An4
 .byte   W06
 .byte   N24 ,Bn4
 .byte   W24
@  #05 @108   ----------------------------------------
 .byte   VOICE , 1
 .byte   PAN , c_v+14
 .byte   N12 ,En5 ,v080
 .byte   W12
 .byte   Dn5
 .byte   W12
 .byte   Cs5
 .byte   W12
 .byte   Bn4
 .byte   W12
 .byte   An5
 .byte   W12
 .byte   Fs5
 .byte   W12
 .byte   Gs5
 .byte   W12
 .byte   Fs5
 .byte   W12
@  #05 @109   ----------------------------------------
 .byte   N36 ,En5
 .byte   W09
 .byte   MOD 8
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 86*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 82*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W04
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N12 ,Cs5
 .byte   W12
 .byte   N24 ,An4
 .byte   W24
 .byte   N03 ,Bn4
 .byte   W03
 .byte   Cs5
 .byte   W03
 .byte   En5
 .byte   W03
 .byte   Fs5
 .byte   W03
 .byte   Gs5
 .byte   W03
 .byte   An5
 .byte   W03
 .byte   Bn5
 .byte   W03
 .byte   Cs6
 .byte   W03
@  #05 @110   ----------------------------------------
 .byte   N06 ,An5
 .byte   W06
 .byte   Bn5
 .byte   W06
 .byte   An5
 .byte   W06
 .byte   Bn5
 .byte   W06
 .byte   N72 ,An5
 .byte   W12
 .byte   MOD 6
 .byte   W24
 .byte   VOL , 78*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 7*song22_mvl/mxv
 .byte   W03
@  #05 @111   ----------------------------------------
 .byte   VOICE , 32
 .byte   MOD 0
 .byte   VOL , 90*song22_mvl/mxv
 .byte   PAN , c_v+34
 .byte   N03 ,An3
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N24
 .byte   W06
 .byte   MOD 6
 .byte   W18
@  #05 @112   ----------------------------------------
 .byte   MOD 0
 .byte   PAN , c_v+16
 .byte   W96
@  #05 @113   ----------------------------------------
 .byte   W96
@  #05 @114   ----------------------------------------
 .byte   W96
@  #05 @115   ----------------------------------------
 .byte   VOICE , 32
 .byte   N03 ,En4 ,v120
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W24
 .byte   Cs4
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   En4
 .byte   W18
 .byte   Fs4
 .byte   W06
 .byte   N24 ,Gn4
 .byte   W24
@  #05 @116   ----------------------------------------
 .byte   W96
@  #05 @117   ----------------------------------------
 .byte   W96
@  #05 @118   ----------------------------------------
 .byte   N03 ,An4 ,v096
 .byte   W12
 .byte   N03
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W12
 .byte   N03
 .byte   W12
 .byte   N03
 .byte   W24
@  #05 @119   ----------------------------------------
 .byte   PAN , c_v+29
 .byte   N03
 .byte   W12
 .byte   N03
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   PAN , c_v+32
 .byte   N03
 .byte   W12
 .byte   N03
 .byte   W12
 .byte   N03
 .byte   W24
@  #05 @120   ----------------------------------------
 .byte   PAN , c_v+40
 .byte   N03 ,Cs4 ,v076
 .byte   W12
 .byte   N03
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N09
 .byte   W48
 .byte   FINE

@**************** Track 6 (Midi-Chn.5) ****************@

song22_006:
@  #06 @000   ----------------------------------------
 .byte   KEYSH , song22_key+0
 .byte   VOICE , 28
 .byte   PAN , c_v+0
 .byte   LFOS 44
 .byte   BENDR, 12
 .byte   VOL , 68*song22_mvl/mxv
 .byte   BEND , c_v+0
 .byte   N36 ,An3 ,v064
 .byte   W09
 .byte   MOD 6
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 49*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W06
 .byte   MOD 0
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N06 ,En3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N36 ,Gn3
 .byte   W09
 .byte   MOD 6
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 49*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W06
 .byte   MOD 0
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N06 ,Dn3
 .byte   W06
 .byte   Gn3
 .byte   W06
@  #06 @001   ----------------------------------------
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N36 ,Fs3
 .byte   W09
 .byte   MOD 6
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 49*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W06
 .byte   MOD 0
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N06 ,Dn3
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N48 ,En3
 .byte   W09
 .byte   MOD 6
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 49*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W06
@  #06 @002   ----------------------------------------
 .byte   MOD 0
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N03
 .byte   W03
 .byte   Fs3 ,v048
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v044
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v040
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v040
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v048
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v044
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v040
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v040
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v048
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v044
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v040
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v040
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v048
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v044
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v040
 .byte   W03
 .byte   En3 ,v064
 .byte   W03
 .byte   Fs3 ,v040
 .byte   W03
@  #06 @003   ----------------------------------------
 .byte   En3 ,v032
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3 ,v020
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Fs3
 .byte   W48
 .byte   W03
@  #06 @004   ----------------------------------------
 .byte   W48
 .byte   VOICE , 1
 .byte   VOL , 86*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   N03 ,As4 ,v064
 .byte   W03
 .byte   N32 ,An4
 .byte   W15
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 86*song22_mvl/mxv
 .byte   N06 ,En4
 .byte   W06
 .byte   An4
 .byte   W06
@  #06 @005   ----------------------------------------
 .byte   VOL , 86*song22_mvl/mxv
 .byte   N36 ,Gn4
 .byte   W18
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 86*song22_mvl/mxv
 .byte   N06 ,Dn4
 .byte   W06
 .byte   Gn4
 .byte   W06
 .byte   VOL , 86*song22_mvl/mxv
 .byte   N36 ,Fs4
 .byte   W18
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 86*song22_mvl/mxv
 .byte   N06 ,Dn4
 .byte   W06
 .byte   Fs4
 .byte   W06
@  #06 @006   ----------------------------------------
 .byte   TIE ,Gs4
 .byte   W48
 .byte   W84
@  #06 @007   ----------------------------------------
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 54*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 35*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 13*song22_mvl/mxv
 .byte   W12
 .byte   EOT
 .byte   VOL , 0*song22_mvl/mxv
 .byte   W24
@  #06 @008   ----------------------------------------
 .byte   VOICE , 15
 .byte   VOL , 89*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   N03 ,Bn2 ,v072
 .byte   W03
 .byte   Dn3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   Dn3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   Dn5
 .byte   W03
@  #06 @009   ----------------------------------------
 .byte   N96 ,En5
 .byte   W96
@  #06 @010   ----------------------------------------
 .byte   PAN , c_v-42
 .byte   N36 ,En4 ,v064
 .byte   W36
 .byte   N06 ,An3
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   N36 ,Dn4
 .byte   W36
 .byte   N06 ,Gn3
 .byte   W06
 .byte   Dn4
 .byte   W06
@  #06 @011   ----------------------------------------
 .byte   N36
 .byte   W36
 .byte   N06 ,Fs3
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   N24
 .byte   W24
 .byte   N12 ,En4
 .byte   W12
 .byte   N06 ,Cs4
 .byte   W06
 .byte   En4
 .byte   W06
@  #06 @012   ----------------------------------------
 .byte   Cs4
 .byte   W12
 .byte   N03 ,En3
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W12
 .byte   N03
 .byte   W12
 .byte   N21
 .byte   W24
@  #06 @013   ----------------------------------------
 .byte   N03
 .byte   W12
 .byte   N03
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06 ,Fs3
 .byte   W06
 .byte   Gn3
 .byte   W06
@  #06 @014   ----------------------------------------
 .byte   VOICE , 15
 .byte   VOL , 74*song22_mvl/mxv
 .byte   N24 ,An3
 .byte   W24
 .byte   N12 ,En3
 .byte   W12
 .byte   An3
 .byte   W12
 .byte   N24 ,Gn3
 .byte   W24
 .byte   N12 ,An3
 .byte   W12
 .byte   Gn3
 .byte   W12
@  #06 @015   ----------------------------------------
 .byte   N24 ,Bn3
 .byte   W24
 .byte   An3
 .byte   W24
 .byte   N12 ,Gn3
 .byte   W12
 .byte   Fs3
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   Dn3
 .byte   W12
@  #06 @016   ----------------------------------------
 .byte   N06 ,Cs3 ,v072
 .byte   W06
 .byte   Dn3
 .byte   W06
 .byte   En3
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   N12 ,En3 ,v064
 .byte   W12
 .byte   N06 ,Cs3
 .byte   W12
 .byte   N18 ,An3
 .byte   W18
 .byte   N03 ,Gs3 ,v072
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   N24 ,Cs3 ,v064
 .byte   W24
@  #06 @017   ----------------------------------------
 .byte   En3
 .byte   W24
 .byte   N12 ,Dn3
 .byte   W12
 .byte   N06 ,Cs3
 .byte   W12
 .byte   N12 ,En3
 .byte   W12
 .byte   Fs3
 .byte   W12
 .byte   N06 ,Gn3 ,v072
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Gn3 ,v064
 .byte   W06
 .byte   Fs3 ,v072
 .byte   W06
@  #06 @018   ----------------------------------------
 .byte   N24 ,En3 ,v064
 .byte   W24
 .byte   N06 ,An3
 .byte   W06
 .byte   Gs3 ,v072
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   Gs3 ,v064
 .byte   W06
 .byte   N24 ,An3
 .byte   W24
 .byte   N12 ,Bn3
 .byte   W12
 .byte   An3
 .byte   W12
@  #06 @019   ----------------------------------------
 .byte   Bn3
 .byte   W12
 .byte   N06 ,Cs4 ,v072
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   Cs4 ,v064
 .byte   W06
 .byte   Bn3 ,v072
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Gs3
 .byte   W06
 .byte   N12 ,Gn3 ,v064
 .byte   W12
 .byte   An3
 .byte   W12
 .byte   N06 ,Gn3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Gn3
 .byte   W06
 .byte   Dn3
 .byte   W06
@  #06 @020   ----------------------------------------
 .byte   Cs3 ,v072
 .byte   W06
 .byte   En3
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   Gs3
 .byte   W06
 .byte   N12 ,An3 ,v064
 .byte   W12
 .byte   N06 ,En3
 .byte   W12
 .byte   N24 ,An3
 .byte   W24
 .byte   N12 ,Cs4
 .byte   W12
 .byte   N06 ,Bn3
 .byte   W06
 .byte   As3
 .byte   W06
@  #06 @021   ----------------------------------------
 .byte   N24 ,En3
 .byte   W24
 .byte   N12 ,Dn3
 .byte   W12
 .byte   N06 ,Cs3
 .byte   W12
 .byte   N12 ,En3
 .byte   W12
 .byte   Fs3
 .byte   W12
 .byte   Gn3
 .byte   W12
 .byte   Fs3
 .byte   W12
@  #06 @022   ----------------------------------------
 .byte   N24 ,Gn3
 .byte   W24
 .byte   N12 ,Dn3
 .byte   W12
 .byte   N06 ,Gn3
 .byte   W12
 .byte   N12 ,Bn3
 .byte   W12
 .byte   An3
 .byte   W12
 .byte   N06 ,Gn3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Gn3
 .byte   W06
 .byte   Fs3
 .byte   W06
@  #06 @023   ----------------------------------------
Label_01056D6A:
 .byte   N24 ,Dn3 ,v064
 .byte   W24
 .byte   N12 ,En3
 .byte   W12
 .byte   Fs3
 .byte   W12
 .byte   Gn3
 .byte   W12
 .byte   Fs3
 .byte   W12
 .byte   N06 ,En3
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   En3
 .byte   W06
 .byte   Dn3
 .byte   W06
 .byte   PEND 
@  #06 @024   ----------------------------------------
 .byte   N36 ,En3
 .byte   W36
 .byte   N12 ,An3
 .byte   W12
 .byte   N24 ,Gn3
 .byte   W24
 .byte   N06 ,En3
 .byte   W06
 .byte   Dn3
 .byte   W06
 .byte   Cs3
 .byte   W06
 .byte   En3
 .byte   W06
@  #06 @025   ----------------------------------------
 .byte   N24 ,Gn3
 .byte   W24
 .byte   An3
 .byte   W24
 .byte   Bn3
 .byte   W24
 .byte   N06 ,An3
 .byte   W06
 .byte   Gn3
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   An3
 .byte   W06
@  #06 @026   ----------------------------------------
 .byte   N24 ,Gn3
 .byte   W24
 .byte   N12 ,Dn3
 .byte   W12
 .byte   N06 ,Gn3
 .byte   W12
 .byte   N12 ,Bn3
 .byte   W12
 .byte   Cs4
 .byte   W12
 .byte   N06 ,Bn3
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   Gs3
 .byte   W06
@  #06 @027   ----------------------------------------
 .byte   PATT
  .word Label_01056D6A
@  #06 @028   ----------------------------------------
 .byte   N36 ,An3 ,v064
 .byte   W36
 .byte   N12 ,Bn3
 .byte   W12
 .byte   N24 ,An3
 .byte   W24
 .byte   Gs3
 .byte   W24
@  #06 @029   ----------------------------------------
 .byte   An3
 .byte   W24
 .byte   Bn3
 .byte   W24
 .byte   Cs4
 .byte   W24
 .byte   N06 ,En4
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   En4
 .byte   W06
@  #06 @030   ----------------------------------------
Label_01056DDA:
 .byte   N12 ,Bn3 ,v064
 .byte   W12
 .byte   An3
 .byte   W12
 .byte   Gn3
 .byte   W12
 .byte   Fs3
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   Fs3
 .byte   W12
 .byte   Gn3
 .byte   W12
 .byte   An3
 .byte   W12
 .byte   PEND 
@  #06 @031   ----------------------------------------
 .byte   N36 ,Gn3
 .byte   W36
 .byte   N06 ,Fs3
 .byte   W06
 .byte   Fn3
 .byte   W06
 .byte   N48 ,En3
 .byte   W48
@  #06 @032   ----------------------------------------
 .byte   VOICE , 15
 .byte   N12 ,En3 ,v068
 .byte   W18
 .byte   N06 ,Cs3
 .byte   W06
 .byte   N12 ,En3
 .byte   W18
 .byte   N06 ,An3
 .byte   W06
 .byte   N24 ,Gn3
 .byte   W24
 .byte   En3
 .byte   W24
@  #06 @033   ----------------------------------------
 .byte   N18 ,En4
 .byte   W18
 .byte   N03 ,Ds4
 .byte   W03
 .byte   Dn4
 .byte   W03
 .byte   N24 ,Cs4
 .byte   W24
 .byte   N18 ,Gn3
 .byte   W18
 .byte   N03 ,Fs3
 .byte   W03
 .byte   Fn3
 .byte   W03
 .byte   N24 ,En3
 .byte   W24
@  #06 @034   ----------------------------------------
Label_01056E22:
 .byte   N36 ,An3 ,v068
 .byte   W36
 .byte   N06 ,En3
 .byte   W12
 .byte   N12 ,An3
 .byte   W12
 .byte   N24 ,Cs4
 .byte   W24
 .byte   N06 ,Bn3
 .byte   W06
 .byte   As3
 .byte   W06
 .byte   PEND 
@  #06 @035   ----------------------------------------
Label_01056E35:
 .byte   N36 ,En3 ,v072
 .byte   W36
 .byte   N06 ,Cs3
 .byte   W12
 .byte   N48 ,An3
 .byte   W48
 .byte   PEND 
@  #06 @036   ----------------------------------------
 .byte   N06 ,En3 ,v068
 .byte   W06
 .byte   Dn3 ,v064
 .byte   W06
 .byte   Cs3
 .byte   W06
 .byte   Dn3 ,v068
 .byte   W06
 .byte   En3
 .byte   W12
 .byte   En3 ,v064
 .byte   W06
 .byte   An3 ,v068
 .byte   W06
 .byte   N24 ,Gn3
 .byte   W24
 .byte   En3
 .byte   W24
@  #06 @037   ----------------------------------------
 .byte   N18 ,An3
 .byte   W18
 .byte   N03 ,Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   N24 ,En3
 .byte   W24
 .byte   N18 ,Cs4
 .byte   W18
 .byte   N03
 .byte   W03
 .byte   Cn4
 .byte   W03
 .byte   N24 ,Bn3
 .byte   W24
@  #06 @038   ----------------------------------------
 .byte   PATT
  .word Label_01056E22
@  #06 @039   ----------------------------------------
 .byte   PATT
  .word Label_01056E35
@  #06 @040   ----------------------------------------
 .byte   VOICE , 15
 .byte   N36 ,Bn3 ,v064
 .byte   W36
 .byte   N12 ,Gn3
 .byte   W12
 .byte   N48 ,Dn4
 .byte   W48
@  #06 @041   ----------------------------------------
 .byte   N36 ,Bn2 ,v052
 .byte   W36
 .byte   N06 ,Gn2
 .byte   W12
 .byte   N48 ,Dn3
 .byte   W48
@  #06 @042   ----------------------------------------
 .byte   VOICE , 1
 .byte   W96
@  #06 @043   ----------------------------------------
 .byte   Cn2
 .byte W00 @ added 
 .byte W00
 @.byte   PAN , c_v-51
 @.byte   N06 ,An4 ,v036
 .byte   W06
 .byte   Bn4
 .byte   W06
 .byte   An4
 .byte   W06
 .byte   Gs4
 .byte   W06
 .byte   Fs4
 .byte   W06
 .byte   Gs4
 .byte   W06
 .byte   Fs4
 .byte   W06
 .byte   En4
 .byte   W06
 .byte   N12 ,Dn4
 .byte   W12
 .byte   Cs4
 .byte   W12
 .byte   Bn3
 .byte   W12
 .byte   N06 ,An3
 .byte   W06
 .byte   Gs3
 .byte   W06
@  #06 @044   ----------------------------------------
 .byte   VOICE , 15
 .byte   N36 ,Gn3 ,v032
 .byte   W32
 .byte   W01
 .byte   N15 ,Dn3
 .byte   W15
 .byte   N48 ,Bn3
 .byte   W24
 .byte   VOL , 67*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W04
@  #06 @045   ----------------------------------------
 .byte   VOL , 74*song22_mvl/mxv
 .byte   N36 ,Dn4
 .byte   W36
 .byte   N12 ,Bn3
 .byte   W12
 .byte   N48 ,Gn4
 .byte   W24
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 54*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 53*song22_mvl/mxv
 .byte   W04
@  #06 @046   ----------------------------------------
 .byte   VOL , 74*song22_mvl/mxv
 .byte   N36 ,An3 ,v056
 .byte   W36
 .byte   N06 ,Bn3
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   N18 ,Bn3
 .byte   W18
 .byte   N03 ,As3
 .byte   W03
 .byte   An3
 .byte   W03
 .byte   N09 ,Gs3
 .byte   W12
 .byte   N06 ,Bn3
 .byte   W06
 .byte   Dn4
 .byte   W06
@  #06 @047   ----------------------------------------
 .byte   N36 ,Cs4
 .byte   W36
 .byte   N06 ,Cn4
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   N24 ,An3
 .byte   W24
 .byte   En3
 .byte   W24
@  #06 @048   ----------------------------------------
 .byte   PATT
  .word Label_01056DDA
@  #06 @049   ----------------------------------------
 .byte   N24 ,En3 ,v064
 .byte   W24
 .byte   Dn3 ,v072
 .byte   W24
 .byte   Cn3 ,v064
 .byte   W24
 .byte   Bn2
 .byte   W24
@  #06 @050   ----------------------------------------
 .byte   PAN , c_v+6
 .byte   N06 ,En3 ,v084
 .byte   W24
 .byte   N15 ,Dn3
 .byte   W24
 .byte   N06 ,En3
 .byte   W24
 .byte   N24 ,Bn2
 .byte   W24
@  #06 @051   ----------------------------------------
Label_01056F32:
 .byte   W12
 .byte   N06 ,En3 ,v084
 .byte   W24
 .byte   N12 ,Dn3
 .byte   W24
 .byte   N06 ,En3
 .byte   W24
 .byte   N12 ,Bn2
 .byte   W12
 .byte   PEND 
@  #06 @052   ----------------------------------------
Label_01056F41:
 .byte   N06 ,En3 ,v084
 .byte   W24
 .byte   N15 ,Dn3
 .byte   W24
 .byte   N06 ,En3
 .byte   W24
 .byte   N24 ,Bn2
 .byte   W24
 .byte   PEND 
@  #06 @053   ----------------------------------------
 .byte   PATT
  .word Label_01056F32
@  #06 @054   ----------------------------------------
 .byte   PATT
  .word Label_01056F41
@  #06 @055   ----------------------------------------
 .byte   PATT
  .word Label_01056F32
@  #06 @056   ----------------------------------------
 .byte   PATT
  .word Label_01056F41
@  #06 @057   ----------------------------------------
 .byte   PATT
  .word Label_01056F32
@  #06 @058   ----------------------------------------
 .byte   PATT
  .word Label_01056F41
@  #06 @059   ----------------------------------------
 .byte   PATT
  .word Label_01056F32
@  #06 @060   ----------------------------------------
 .byte   PAN , c_v+21
 .byte   N12 ,An4 ,v112
 .byte   W72
 .byte   N06 ,Cn4
 .byte   W06
 .byte   Bn3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Cn4
 .byte   W06
@  #06 @061   ----------------------------------------
 .byte   N12 ,An4 ,v104
 .byte   W72
 .byte   N06 ,Dn4 ,v112
 .byte   W06
 .byte   Cn4
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Dn4
 .byte   W06
@  #06 @062   ----------------------------------------
 .byte   N12 ,An4
 .byte   W72
 .byte   N06 ,En4
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   Cn4
 .byte   W06
 .byte   Bn3
 .byte   W06
@  #06 @063   ----------------------------------------
 .byte   W96
@  #06 @064   ----------------------------------------
 .byte   PAN , c_v+32
 .byte   W96
@  #06 @065   ----------------------------------------
 .byte   W96
@  #06 @066   ----------------------------------------
 .byte   PAN , c_v-34
 .byte   N12 ,Cn2 ,v064
 .byte   W12
 .byte   N06 ,Gn2
 .byte   W06
 .byte   Gn2 ,v032
 .byte   W06
 .byte   En3 ,v064
 .byte   W06
 .byte   En3 ,v028
 .byte   W06
 .byte   N12 ,Gn2 ,v064
 .byte   W12
 .byte   N06 ,Dn3
 .byte   W06
 .byte   Dn3 ,v032
 .byte   W06
 .byte   Gn2 ,v064
 .byte   W06
 .byte   Gn2 ,v032
 .byte   W06
 .byte   En3 ,v064
 .byte   W06
 .byte   En3 ,v032
 .byte   W06
 .byte   N12 ,Gn2 ,v064
 .byte   W12
@  #06 @067   ----------------------------------------
 .byte   Cn2
 .byte   W12
 .byte   N06 ,Gn2
 .byte   W06
 .byte   Gn2 ,v032
 .byte   W06
 .byte   En3 ,v064
 .byte   W06
 .byte   En3 ,v032
 .byte   W06
 .byte   N12 ,Gn2 ,v064
 .byte   W12
 .byte   N06 ,Dn3
 .byte   W06
 .byte   Dn3 ,v032
 .byte   W06
 .byte   Gn2 ,v064
 .byte   W06
 .byte   Gn2 ,v028
 .byte   W06
 .byte   En3 ,v064
 .byte   W06
 .byte   En3 ,v032
 .byte   W06
 .byte   N12 ,Gn2 ,v064
 .byte   W12
@  #06 @068   ----------------------------------------
 .byte   Dn2
 .byte   W12
 .byte   N06 ,An2
 .byte   W06
 .byte   An2 ,v032
 .byte   W06
 .byte   Fn3 ,v064
 .byte   W06
 .byte   Fn3 ,v032
 .byte   W06
 .byte   N12 ,An2 ,v064
 .byte   W12
 .byte   N06 ,En3
 .byte   W06
 .byte   En3 ,v032
 .byte   W06
 .byte   An2 ,v064
 .byte   W06
 .byte   An2 ,v032
 .byte   W06
 .byte   Fn3 ,v064
 .byte   W06
 .byte   Fn3 ,v032
 .byte   W06
 .byte   N12 ,An2 ,v064
 .byte   W12
@  #06 @069   ----------------------------------------
 .byte   Dn2
 .byte   W12
 .byte   N06 ,An2
 .byte   W06
 .byte   An2 ,v032
 .byte   W06
 .byte   Fn3 ,v064
 .byte   W06
 .byte   Fn3 ,v032
 .byte   W06
 .byte   N12 ,An2 ,v064
 .byte   W12
 .byte   Cs2
 .byte   W12
 .byte   N06 ,An2
 .byte   W06
 .byte   An2 ,v032
 .byte   W06
 .byte   En3 ,v064
 .byte   W06
 .byte   En3 ,v032
 .byte   W06
 .byte   N12 ,An2 ,v064
 .byte   W12
@  #06 @070   ----------------------------------------
 .byte   Gn1
 .byte   W12
 .byte   N06 ,Dn2
 .byte   W06
 .byte   Dn2 ,v032
 .byte   W06
 .byte   Bn2 ,v064
 .byte   W06
 .byte   Bn2 ,v032
 .byte   W06
 .byte   N12 ,Dn2 ,v064
 .byte   W12
 .byte   N06 ,An2
 .byte   W06
 .byte   An2 ,v032
 .byte   W06
 .byte   Dn2 ,v064
 .byte   W06
 .byte   Dn2 ,v032
 .byte   W06
 .byte   Bn2 ,v064
 .byte   W06
 .byte   Bn2 ,v032
 .byte   W06
 .byte   N12 ,Dn2 ,v064
 .byte   W12
@  #06 @071   ----------------------------------------
 .byte   Gn1
 .byte   W12
 .byte   N06 ,Dn2
 .byte   W06
 .byte   Dn2 ,v032
 .byte   W06
 .byte   Bn2 ,v064
 .byte   W06
 .byte   Bn2 ,v032
 .byte   W06
 .byte   N12 ,Dn2 ,v064
 .byte   W12
 .byte   N06 ,An2
 .byte   W06
 .byte   An2 ,v028
 .byte   W06
 .byte   Dn2 ,v064
 .byte   W06
 .byte   Dn2 ,v032
 .byte   W06
 .byte   Bn2 ,v064
 .byte   W06
 .byte   Bn2 ,v032
 .byte   W06
 .byte   N12 ,Dn2 ,v064
 .byte   W12
@  #06 @072   ----------------------------------------
 .byte   Cn2
 .byte   W12
 .byte   N06 ,Gn2
 .byte   W06
 .byte   Gn2 ,v028
 .byte   W06
 .byte   En3 ,v064
 .byte   W06
 .byte   En3 ,v032
 .byte   W06
 .byte   N12 ,Gn2 ,v064
 .byte   W12
 .byte   N06 ,Dn3
 .byte   W06
 .byte   Dn3 ,v032
 .byte   W06
 .byte   Gn2 ,v064
 .byte   W06
 .byte   Gn2 ,v032
 .byte   W06
 .byte   En3 ,v064
 .byte   W06
 .byte   En3 ,v032
 .byte   W06
 .byte   N12 ,Gn2 ,v064
 .byte   W12
@  #06 @073   ----------------------------------------
 .byte   VOL , 75*song22_mvl/mxv
 .byte   N48 ,Cn2
 .byte   W48
 .byte   N24 ,Bn1
 .byte   W24
 .byte   As1
 .byte   W24
@  #06 @074   ----------------------------------------
 .byte   N12 ,Fn1
 .byte   W12
 .byte   Cn2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   Dn3
 .byte   W12
 .byte   Cn3
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   An2
 .byte   W12
@  #06 @075   ----------------------------------------
 .byte   Fn1
 .byte   W12
 .byte   Bn1
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Fn2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   Dn3
 .byte   W12
 .byte   Bn2
 .byte   W12
@  #06 @076   ----------------------------------------
 .byte   En1
 .byte   W12
 .byte   Bn1
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Fs2
 .byte   W12
@  #06 @077   ----------------------------------------
 .byte   En1
 .byte   W12
 .byte   Bn1
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   En1
 .byte   W12
 .byte   Bn1
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Fs2
 .byte   W12
@  #06 @078   ----------------------------------------
 .byte   Dn1
 .byte   W12
 .byte   An1
 .byte   W12
 .byte   Fn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Fn2
 .byte   W12
 .byte   En2
 .byte   W12
@  #06 @079   ----------------------------------------
 .byte   Dn1
 .byte   W12
 .byte   An1
 .byte   W12
 .byte   Fn2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Fn2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   Gn2
 .byte   W12
@  #06 @080   ----------------------------------------
 .byte   Cn1
 .byte   W12
 .byte   Gn1
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   N48 ,En2
 .byte   W48
 .byte   N12 ,Dn2
 .byte   W12
@  #06 @081   ----------------------------------------
 .byte   Cn1
 .byte   W12
 .byte   Gn1
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   N48 ,En2
 .byte   W48
 .byte   N12 ,Fn2
 .byte   W12
@  #06 @082   ----------------------------------------
 .byte   Gn2
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   Bn1
 .byte   W12
 .byte   An1
 .byte   W12
 .byte   Gn1
 .byte   W12
 .byte   Dn1
 .byte   W12
 .byte   En1
 .byte   W12
 .byte   Gs1
 .byte   W12
@  #06 @083   ----------------------------------------
 .byte   An1
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   Cs3
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   Dn3
 .byte   W12
 .byte   An3
 .byte   W12
 .byte   Gs3
 .byte   W12
@  #06 @084   ----------------------------------------
 .byte   VOL , 22*song22_mvl/mxv
 .byte   N96 ,An3
 .byte   W02
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 32*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 72*song22_mvl/mxv
 .byte   W40
@  #06 @085   ----------------------------------------
 .byte   N12 ,Bn3 ,v036
 .byte   W12
 .byte   An3 ,v044
 .byte   W12
 .byte   Gn3 ,v048
 .byte   W12
 .byte   Fs3
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   Fs3
 .byte   W12
 .byte   Gn3
 .byte   W12
 .byte   An3
 .byte   W12
@  #06 @086   ----------------------------------------
 .byte   VOL , 35*song22_mvl/mxv
 .byte   PAN , c_v-10
 .byte   N48 ,Gn3 ,v052
 .byte   W02
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W05
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 35*song22_mvl/mxv
 .byte   N48 ,Fs3 ,v056
 .byte   W02
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W05
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W12
@  #06 @087   ----------------------------------------
 .byte   VOL , 35*song22_mvl/mxv
 .byte   N48 ,En3 ,v048
 .byte   W02
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W05
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W12
 .byte   VOL , 35*song22_mvl/mxv
 .byte   N48 ,Dn3 ,v052
 .byte   W02
 .byte   VOL , 36*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W05
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 70*song22_mvl/mxv
 .byte   W12
@  #06 @088   ----------------------------------------
 .byte   PAN , c_v+0
 .byte   N96 ,En3 ,v064
 .byte   W03
 .byte   VOL , 27*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W07
 .byte   VOL , 31*song22_mvl/mxv
 .byte   W08
 .byte   VOL , 32*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 35*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 39*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 42*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 47*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 55*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 58*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 66*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W28
@  #06 @089   ----------------------------------------
 .byte   VOL , 36*song22_mvl/mxv
 .byte   N48 ,Dn3
 .byte   W02
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 52*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W32
 .byte   W02
 .byte   N36 ,Gn3
 .byte   W36
 .byte   N06 ,Fs3
 .byte   W06
 .byte   Fn3
 .byte   W06
@  #06 @090   ----------------------------------------
 .byte   VOL , 27*song22_mvl/mxv
 .byte   N48 ,En3
 .byte   W02
 .byte   VOL , 29*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 34*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 43*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 48*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 54*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 61*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W12
 .byte   PAN , c_v-7
 .byte   N36
 .byte   W24
 .byte   PAN , c_v-20
 .byte   W12
 .byte   N06 ,Ds3
 .byte   W06
 .byte   Dn3
 .byte   W06
@  #06 @091   ----------------------------------------
 .byte   VOL , 31*song22_mvl/mxv
 .byte   PAN , c_v-32
 .byte   N96 ,Cs3
 .byte   W02
 .byte   VOL , 38*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 41*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 45*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 54*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 59*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 63*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W72
@  #06 @092   ----------------------------------------
 .byte   VOL , 43*song22_mvl/mxv
 .byte   N96 ,Bn2
 .byte   W02
 .byte   VOL , 44*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 47*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 60*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 64*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 65*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 69*song22_mvl/mxv
 .byte   W64
@  #06 @093   ----------------------------------------
 .byte   N48 ,Gn2
 .byte   W48
 .byte   N36 ,Dn3
 .byte   W36
 .byte   N06 ,Bn2
 .byte   W06
 .byte   Dn3
 .byte   W06
@  #06 @094   ----------------------------------------
 .byte   N48 ,Cs3
 .byte   W48
 .byte   N36 ,En3
 .byte   W36
 .byte   N06 ,Cs3
 .byte   W06
 .byte   En3
 .byte   W06
@  #06 @095   ----------------------------------------
 .byte   N96 ,An3
 .byte   W96
@  #06 @096   ----------------------------------------
 .byte   N36 ,Gn3
 .byte   W36
 .byte   N24 ,Dn3
 .byte   W24
 .byte   N12 ,Gn3
 .byte   W12
 .byte   N24 ,Bn3
 .byte   W24
@  #06 @097   ----------------------------------------
 .byte   N48 ,Gn3
 .byte   W48
 .byte   N24 ,Fs3
 .byte   W24
 .byte   Gs3
 .byte   W24
@  #06 @098   ----------------------------------------
 .byte   N48 ,An3
 .byte   W48
 .byte   Fs3
 .byte   W48
@  #06 @099   ----------------------------------------
 .byte   En3
 .byte   W48
 .byte   Cs3
 .byte   W48
@  #06 @100   ----------------------------------------
 .byte   Dn3
 .byte   W48
 .byte   Cs3
 .byte   W48
@  #06 @101   ----------------------------------------
 .byte   Bn2
 .byte   W48
 .byte   Dn3
 .byte   W48
@  #06 @102   ----------------------------------------
 .byte   En3
 .byte   W48
 .byte   Dn3
 .byte   W48
@  #06 @103   ----------------------------------------
 .byte   Fs3
 .byte   W48
 .byte   En3
 .byte   W48
@  #06 @104   ----------------------------------------
 .byte   Dn3
 .byte   W48
 .byte   En3
 .byte   W48
@  #06 @105   ----------------------------------------
 .byte   Dn3
 .byte   W48
 .byte   Cn3
 .byte   W48
@  #06 @106   ----------------------------------------
 .byte   Gn3
 .byte   W48
 .byte   Fn3
 .byte   W48
@  #06 @107   ----------------------------------------
 .byte   En3
 .byte   W48
 .byte   Dn3
 .byte   W48
@  #06 @108   ----------------------------------------
 .byte   N36 ,Cs3
 .byte   W36
 .byte   N36
 .byte   W36
 .byte   N24 ,Dn3
 .byte   W24
@  #06 @109   ----------------------------------------
 .byte   N48 ,En3
 .byte   W48
 .byte   N36 ,Gn3
 .byte   W36
 .byte   N06 ,Fs3
 .byte   W06
 .byte   Fn3
 .byte   W06
@  #06 @110   ----------------------------------------
 .byte   N72 ,En3
 .byte   W72
 .byte   N24 ,Dn3
 .byte   W24
@  #06 @111   ----------------------------------------
 .byte   N96 ,Cs3
 .byte   W96
@  #06 @112   ----------------------------------------
 .byte   N36 ,Bn2
 .byte   W36
 .byte   N06 ,Dn3 ,v088
 .byte   W12
 .byte   N48 ,Gn3
 .byte   W48
@  #06 @113   ----------------------------------------
 .byte   N36 ,Dn3
 .byte   W36
 .byte   N06 ,Gn3
 .byte   W12
 .byte   N36 ,Bn3
 .byte   W36
 .byte   N06 ,As3
 .byte   W06
 .byte   An3
 .byte   W06
@  #06 @114   ----------------------------------------
 .byte   N24 ,En3 ,v064
 .byte   W24
 .byte   Dn3
 .byte   W24
 .byte   Cs3
 .byte   W24
 .byte   Dn3
 .byte   W24
@  #06 @115   ----------------------------------------
 .byte   Cs3
 .byte   W24
 .byte   N24
 .byte   W24
 .byte   En3
 .byte   W48
@  #06 @116   ----------------------------------------
 .byte   VOICE , 10
 .byte   N36 ,Dn3
 .byte   W36
 .byte   N06 ,Bn2
 .byte   W12
 .byte   N24 ,Gn3
 .byte   W24
 .byte   Fs3
 .byte   W24
@  #06 @117   ----------------------------------------
 .byte   Dn3
 .byte   W24
 .byte   Gn3
 .byte   W24
 .byte   An3
 .byte   W24
 .byte   Bn3
 .byte   W24
@  #06 @118   ----------------------------------------
 .byte   VOL , 45*song22_mvl/mxv
 .byte   TIE ,Cs4 ,v072
 .byte   W24
 .byte   VOL , 51*song22_mvl/mxv
 .byte   W24
 .byte   VOL , 56*song22_mvl/mxv
 .byte   W24
 .byte   VOL , 62*song22_mvl/mxv
 .byte   W24
@  #06 @119   ----------------------------------------
 .byte   VOL , 68*song22_mvl/mxv
 .byte   W24
 .byte   VOL , 74*song22_mvl/mxv
 .byte   W24
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W24
 .byte   VOL , 88*song22_mvl/mxv
 .byte   W24
@  #06 @120   ----------------------------------------
 .byte   EOT
 .byte   VOL , 88*song22_mvl/mxv
 .byte   N06 ,An3
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N09
 .byte   W48
 .byte   FINE

@**************** Track 7 (Midi-Chn.6) ****************@

song22_007:
@  #07 @000   ----------------------------------------
 .byte   KEYSH , song22_key+0
 .byte   VOICE , 27
 .byte   LFOS 44
 .byte   BENDR, 12
 .byte   VOL , 90*song22_mvl/mxv
 .byte   BEND , c_v+0
 .byte   W96
@  #07 @001   ----------------------------------------
 .byte   W96
@  #07 @002   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   N03 ,En3 ,v012
 .byte   W03
 .byte   Bn2
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   PAN , c_v+63
 .byte   N03 ,En5
 .byte   W03
 .byte   Bn4
 .byte   W03
 .byte   Gs4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   PAN , c_v-64
 .byte   N03 ,Gs4
 .byte   W03
 .byte   Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Bn2
 .byte   W03
 .byte   PAN , c_v+63
 .byte   N03 ,Fs4
 .byte   W03
 .byte   En4
 .byte   W03
 .byte   Bn3
 .byte   W03
 .byte   Gs3
 .byte   W03
 .byte   Fs3
 .byte   W03
 .byte   En3
 .byte   W03
 .byte   Bn2
 .byte   W03
 .byte   Gs2
 .byte   W03
@  #07 @003   ----------------------------------------
 .byte   BEND , c_v+0
 .byte   W96
@  #07 @004   ----------------------------------------
 .byte   W48
 .byte   W96
@  #07 @005   ----------------------------------------
 .byte   W96
@  #07 @006   ----------------------------------------
 .byte   W96
@  #07 @007   ----------------------------------------
 .byte   W96
@  #07 @008   ----------------------------------------
 .byte   W96
@  #07 @009   ----------------------------------------
 .byte   W96
@  #07 @010   ----------------------------------------
 .byte   VOICE , 43
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N36 ,An3 ,v064
 .byte   W36
 .byte   N06 ,En3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   N36 ,Bn3
 .byte   W36
 .byte   N06 ,En3
 .byte   W06
 .byte   Bn3
 .byte   W06
@  #07 @011   ----------------------------------------
 .byte   N36 ,Dn4
 .byte   W36
 .byte   N06 ,Bn3
 .byte   W06
 .byte   Dn4
 .byte   W06
 .byte   N24 ,Fs4
 .byte   W24
 .byte   N12 ,Gs4
 .byte   W12
 .byte   N06 ,En4
 .byte   W06
 .byte   Gs4
 .byte   W06
@  #07 @012   ----------------------------------------
 .byte   VOL , 76*song22_mvl/mxv
 .byte   N12 ,An4
 .byte   W12
 .byte   An3
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N21
 .byte   W24
@  #07 @013   ----------------------------------------
 .byte   N06
 .byte   W12
 .byte   N12
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W12
 .byte   N12
 .byte   W36
@  #07 @014   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N12 ,En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,En2
 .byte   W12
 .byte   An2
 .byte   W12
@  #07 @015   ----------------------------------------
 .byte   Dn2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Gn2
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,Dn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Gn2
 .byte   W12
@  #07 @016   ----------------------------------------
 .byte   En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,En2
 .byte   W12
 .byte   N06 ,An2
 .byte   W12
 .byte   N12 ,En2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   An2
 .byte   W12
@  #07 @017   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   N12 ,En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   Fs2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,Gn2
 .byte   W12
 .byte   Fs2
 .byte   W12
@  #07 @018   ----------------------------------------
Label_0105748F:
 .byte   N12 ,En2 ,v064
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
 .byte   PEND 
@  #07 @019   ----------------------------------------
 .byte   Dn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,Dn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Gn2
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   Gn2
 .byte   W12
@  #07 @020   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   N12 ,En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,En2
 .byte   W12
 .byte   An2
 .byte   W12
@  #07 @021   ----------------------------------------
 .byte   PATT
  .word Label_0105748F
@  #07 @022   ----------------------------------------
 .byte   N12 ,Gn2 ,v064
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Bn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
@  #07 @023   ----------------------------------------
Label_010574F7:
 .byte   PAN , c_v-64
 .byte   N12 ,Gn2 ,v064
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Bn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   PEND 
@  #07 @024   ----------------------------------------
 .byte   An2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Cs3
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   Cs3
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,An2
 .byte   W12
 .byte   Cs3
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Cs3
 .byte   W12
@  #07 @025   ----------------------------------------
 .byte   An2
 .byte   W12
 .byte   Cs3
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,An2
 .byte   W12
 .byte   Cs3
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Cs3
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   An2
 .byte   W12
@  #07 @026   ----------------------------------------
 .byte   PATT
  .word Label_010574F7
@  #07 @027   ----------------------------------------
 .byte   N12 ,Gn2 ,v064
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Bn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Bn2
 .byte   W12
@  #07 @028   ----------------------------------------
 .byte   An2
 .byte   W12
 .byte   Cs3
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,An2
 .byte   W12
 .byte   Cs3
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Cs3
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   Cs3
 .byte   W12
@  #07 @029   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   N12 ,An2
 .byte   W12
 .byte   Cs3
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Cs3
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   Cs3
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,An2
 .byte   W12
 .byte   Cs3
 .byte   W12
@  #07 @030   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   N24 ,Gn2
 .byte   W24
 .byte   An2
 .byte   W24
 .byte   PAN , c_v+63
 .byte   N24 ,Bn2
 .byte   W24
 .byte   Dn3
 .byte   W24
@  #07 @031   ----------------------------------------
 .byte   N12 ,En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   An2
 .byte   W12
@  #07 @032   ----------------------------------------
 .byte   VOICE , 43
 .byte   VOL , 75*song22_mvl/mxv
 .byte   N06 ,En2 ,v072
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   An2 ,v064
 .byte   W06
 .byte   Cs3
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   En2
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   En2
 .byte   W12
 .byte   N24 ,Cs3
 .byte   W24
@  #07 @033   ----------------------------------------
Label_010575D1:
 .byte   N06 ,Gn2 ,v072
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Gn2
 .byte   W06
 .byte   Bn2
 .byte   W06
 .byte   Dn3
 .byte   W12
 .byte   Fs3
 .byte   W12
 .byte   Gn2
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Gn2
 .byte   W06
 .byte   Bn2
 .byte   W06
 .byte   N12 ,Fs3
 .byte   W12
 .byte   N06 ,Dn3
 .byte   W06
 .byte   Bn2
 .byte   W06
 .byte   PEND 
@  #07 @034   ----------------------------------------
Label_010575F0:
 .byte   N06 ,En2 ,v072
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   An2
 .byte   W06
 .byte   Cs3
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   En2
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   An2
 .byte   W06
 .byte   N12 ,Cs3
 .byte   W12
 .byte   N06 ,Bn2
 .byte   W06
 .byte   An2
 .byte   W06
 .byte   PEND 
@  #07 @035   ----------------------------------------
 .byte   En2
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   An2
 .byte   W06
 .byte   An3
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   N06
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   An2
 .byte   W06
 .byte   Cs3
 .byte   W06
 .byte   An2
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   An2
 .byte   W06
 .byte   Cs3
 .byte   W06
@  #07 @036   ----------------------------------------
 .byte   En2
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   An2 ,v064
 .byte   W06
 .byte   Cs3
 .byte   W12
 .byte   En3
 .byte   W12
 .byte   En2
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   En2
 .byte   W12
 .byte   N24 ,Cs3
 .byte   W24
@  #07 @037   ----------------------------------------
 .byte   PATT
  .word Label_010575D1
@  #07 @038   ----------------------------------------
 .byte   PATT
  .word Label_010575F0
@  #07 @039   ----------------------------------------
 .byte   N08 ,En2 ,v072
 .byte   W08
 .byte   Cs2
 .byte   W08
 .byte   En2
 .byte   W08
 .byte   An2
 .byte   W08
 .byte   En2
 .byte   W08
 .byte   An2
 .byte   W08
 .byte   N36 ,En3
 .byte   W36
 .byte   N06 ,Dn3 ,v052
 .byte   W06
 .byte   Cs3
 .byte   W06
@  #07 @040   ----------------------------------------
 .byte   W96
@  #07 @041   ----------------------------------------
 .byte   VOL , 90*song22_mvl/mxv
 .byte   W96
@  #07 @042   ----------------------------------------
 .byte   W96
@  #07 @043   ----------------------------------------
 .byte   W96
@  #07 @044   ----------------------------------------
 .byte   W96
@  #07 @045   ----------------------------------------
 .byte   W96
@  #07 @046   ----------------------------------------
 .byte   W96
@  #07 @047   ----------------------------------------
 .byte   W96
@  #07 @048   ----------------------------------------
 .byte   W96
@  #07 @049   ----------------------------------------
 .byte   W96
@  #07 @050   ----------------------------------------
 .byte   VOICE , 44
 .byte   PAN , c_v+63
 .byte   VOL , 25*song22_mvl/mxv
 .byte   N06 ,An1 ,v127
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v-64
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
 .byte   VOL , 36*song22_mvl/mxv
 .byte   N06 ,An1
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v+63
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
@  #07 @051   ----------------------------------------
 .byte   VOL , 43*song22_mvl/mxv
 .byte   N06 ,An1
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v-64
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
 .byte   VOL , 49*song22_mvl/mxv
 .byte   N06 ,An1
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v+63
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   Dn2
 .byte   W06
 .byte   Ds2
 .byte   W06
@  #07 @052   ----------------------------------------
Label_010576C5:
 .byte   N06 ,An1 ,v127
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v-64
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
 .byte   An1
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v+63
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
 .byte   PEND 
@  #07 @053   ----------------------------------------
 .byte   PATT
  .word Label_010576C5
@  #07 @054   ----------------------------------------
 .byte   PATT
  .word Label_010576C5
@  #07 @055   ----------------------------------------
 .byte   VOL , 56*song22_mvl/mxv
 .byte   N06 ,An1 ,v127
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v-64
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
 .byte   VOL , 68*song22_mvl/mxv
 .byte   N06 ,An1
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v+63
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   Dn2
 .byte   W06
 .byte   Ds2
 .byte   W06
@  #07 @056   ----------------------------------------
 .byte   VOL , 49*song22_mvl/mxv
 .byte   N06 ,An1
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v-64
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
 .byte   An1
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v+63
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
@  #07 @057   ----------------------------------------
 .byte   PATT
  .word Label_010576C5
@  #07 @058   ----------------------------------------
 .byte   VOL , 55*song22_mvl/mxv
 .byte   N06 ,An1 ,v127
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v-64
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
 .byte   VOL , 63*song22_mvl/mxv
 .byte   N06 ,An1
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v+63
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
@  #07 @059   ----------------------------------------
 .byte   VOL , 67*song22_mvl/mxv
 .byte   N06 ,An1
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v-64
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W12
 .byte   Ds2
 .byte   W06
 .byte   VOL , 75*song22_mvl/mxv
 .byte   N06 ,An1
 .byte   W06
 .byte   Gs1
 .byte   W06
 .byte   En2
 .byte   W06
 .byte   Ds2
 .byte   W06
 .byte   PAN , c_v+63
 .byte   N06 ,Cn2
 .byte   W06
 .byte   Cs2
 .byte   W06
 .byte   Dn2
 .byte   W06
 .byte   Ds2
 .byte   W06
@  #07 @060   ----------------------------------------
 .byte   VOL , 50*song22_mvl/mxv
 .byte   W96
@  #07 @061   ----------------------------------------
 .byte   W96
@  #07 @062   ----------------------------------------
 .byte   W96
@  #07 @063   ----------------------------------------
 .byte   W96
@  #07 @064   ----------------------------------------
 .byte   W96
@  #07 @065   ----------------------------------------
 .byte   W96
@  #07 @066   ----------------------------------------
 .byte   W96
@  #07 @067   ----------------------------------------
 .byte   W96
@  #07 @068   ----------------------------------------
 .byte   W96
@  #07 @069   ----------------------------------------
 .byte   W96
@  #07 @070   ----------------------------------------
 .byte   W96
@  #07 @071   ----------------------------------------
 .byte   W96
@  #07 @072   ----------------------------------------
 .byte   W92
 .byte   W01
 .byte   BEND , c_v+1
 .byte   W03
@  #07 @073   ----------------------------------------
 .byte   VOL , 28*song22_mvl/mxv
 .byte   PAN , c_v+0
 .byte   W24
 .byte   N24 ,Cn4 ,v072
 .byte   W24
 .byte   Dn4
 .byte   W24
 .byte   En4
 .byte   W24
@  #07 @074   ----------------------------------------
 .byte   VOL , 9*song22_mvl/mxv
 .byte   N72 ,An4
 .byte   W02
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 28*song22_mvl/mxv
 .byte   W56
 .byte   W02
 .byte   N24 ,Fn4
 .byte   W24
@  #07 @075   ----------------------------------------
 .byte   N36 ,Cn5
 .byte   W36
 .byte   N09 ,Bn4
 .byte   W09
 .byte   N03 ,Ds5
 .byte   W03
 .byte   N12 ,Dn5
 .byte   W12
 .byte   Cn5
 .byte   W12
 .byte   Bn4
 .byte   W12
 .byte   N09 ,An4
 .byte   W09
 .byte   N03 ,As4
 .byte   W03
@  #07 @076   ----------------------------------------
 .byte   N24 ,An4
 .byte   W24
 .byte   VOL , 9*song22_mvl/mxv
 .byte   N60 ,Gn4
 .byte   W02
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 28*song22_mvl/mxv
 .byte   W44
 .byte   W02
 .byte   N12 ,En4
 .byte   W12
@  #07 @077   ----------------------------------------
 .byte   VOL , 9*song22_mvl/mxv
 .byte   N72 ,Gn4
 .byte   W02
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 28*song22_mvl/mxv
 .byte   W56
 .byte   W02
 .byte   N24 ,Fs4
 .byte   W24
@  #07 @078   ----------------------------------------
 .byte   VOL , 9*song22_mvl/mxv
 .byte   N72 ,Fn4
 .byte   W02
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 28*song22_mvl/mxv
 .byte   W56
 .byte   W02
 .byte   N12 ,En4
 .byte   W12
 .byte   Fn4
 .byte   W12
@  #07 @079   ----------------------------------------
 .byte   N24 ,Dn4
 .byte   W24
 .byte   Cn4
 .byte   W24
 .byte   Bn3
 .byte   W24
 .byte   Dn4
 .byte   W24
@  #07 @080   ----------------------------------------
 .byte   N12 ,En4
 .byte   W12
 .byte   Gn3
 .byte   W12
 .byte   VOL , 9*song22_mvl/mxv
 .byte   N60 ,En4
 .byte   W02
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 28*song22_mvl/mxv
 .byte   W44
 .byte   W02
 .byte   N12 ,Fn4
 .byte   W12
@  #07 @081   ----------------------------------------
 .byte   VOL , 9*song22_mvl/mxv
 .byte   TIE ,Gn4
 .byte   W05
 .byte   VOL , 9*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 10*song22_mvl/mxv
 .byte   W06
 .byte   VOL , 11*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 13*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 15*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 17*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 18*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 19*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 20*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 22*song22_mvl/mxv
 .byte   W05
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 28*song22_mvl/mxv
 .byte   W36
@  #07 @082   ----------------------------------------
 .byte   W48
 .byte   VOL , 26*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 24*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 23*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 21*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 20*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 19*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 17*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 17*song22_mvl/mxv
 .byte   W04
 .byte   VOL , 14*song22_mvl/mxv
 .byte   W02
 .byte   VOL , 11*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 9*song22_mvl/mxv
 .byte   W03
 .byte   VOL , 9*song22_mvl/mxv
 .byte   W16
@  #07 @083   ----------------------------------------
 .byte   EOT
 .byte   W96
@  #07 @084   ----------------------------------------
 .byte   W96
@  #07 @085   ----------------------------------------
 .byte   W96
@  #07 @086   ----------------------------------------
 .byte   VOL , 49*song22_mvl/mxv
 .byte   PAN , c_v+63
 .byte   W96
@  #07 @087   ----------------------------------------
 .byte   W96
@  #07 @088   ----------------------------------------
 .byte   W96
@  #07 @089   ----------------------------------------
 .byte   W96
@  #07 @090   ----------------------------------------
 .byte   W96
@  #07 @091   ----------------------------------------
 .byte   W96
@  #07 @092   ----------------------------------------
Label_01057898:
 .byte   PAN , c_v-64
 .byte   W36
 .byte   PAN , c_v+63
 .byte   W36
 .byte   PAN , c_v-64
 .byte   W24
 .byte   PEND 
@  #07 @093   ----------------------------------------
Label_010578A0:
 .byte   W12
 .byte   PAN , c_v+63
 .byte   W36
 .byte   PAN , c_v-64
 .byte   W36
 .byte   PAN , c_v+63
 .byte   W12
 .byte   PEND 
@  #07 @094   ----------------------------------------
Label_010578A9:
 .byte   W24
 .byte   PAN , c_v-64
 .byte   W36
 .byte   PAN , c_v+63
 .byte   W36
 .byte   PEND 
@  #07 @095   ----------------------------------------
 .byte   CnM2
 .byte   VOL , 49*song22_mvl/mxv
 .byte   W36
 .byte   PAN , c_v+63
 .byte   W36
 .byte   VOICE , 43
 .byte   PAN , c_v-64
 .byte   W18
 .byte   N06 ,Cs4 ,v080
 .byte   W06
@  #07 @096   ----------------------------------------
 .byte   N03 ,Dn4
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   PAN , c_v+63
 .byte   N06
 .byte   W36
 .byte   PAN , c_v-64
 .byte   N06
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   Dn4
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Fs4
 .byte   W12
@  #07 @097   ----------------------------------------
 .byte   N06 ,Dn4
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   PAN , c_v-64
 .byte   W24
 .byte   N06
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   PAN , c_v+63
 .byte   N06 ,Dn4
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Gn4
 .byte   W12
@  #07 @098   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   N03 ,En4
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W24
 .byte   PAN , c_v+63
 .byte   N09 ,Bn3
 .byte   W12
 .byte   N06 ,En4
 .byte   W06
 .byte   N03 ,Ds4
 .byte   W06
 .byte   N06 ,En4
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12
 .byte   W12
 .byte   Ds4
 .byte   W12
@  #07 @099   ----------------------------------------
 .byte   N06 ,En4
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N06
 .byte   W36
 .byte   Bn3
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   PAN , c_v+63
 .byte   W12
@  #07 @100   ----------------------------------------
 .byte   PATT
  .word Label_010578A9
@  #07 @101   ----------------------------------------
 .byte   PATT
  .word Label_01057898
@  #07 @102   ----------------------------------------
 .byte   PATT
  .word Label_010578A0
@  #07 @103   ----------------------------------------
 .byte   PATT
  .word Label_010578A9
@  #07 @104   ----------------------------------------
 .byte   PATT
  .word Label_01057898
@  #07 @105   ----------------------------------------
 .byte   N12 ,Fn2 ,v076
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Fn2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,En2
 .byte   W12
 .byte   Dn2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Fn2
 .byte   W12
@  #07 @106   ----------------------------------------
 .byte   Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Bn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
@  #07 @107   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   N12 ,Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,Bn2
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,Gn2
 .byte   W12
 .byte   Bn2
 .byte   W12
@  #07 @108   ----------------------------------------
Label_0105797B:
 .byte   PAN , c_v-64
 .byte   N24 ,En2 ,v076
 .byte   W24
 .byte   An2
 .byte   W24
 .byte   PAN , c_v+63
 .byte   N24 ,En2
 .byte   W24
 .byte   An2
 .byte   W24
 .byte   PEND 
@  #07 @109   ----------------------------------------
 .byte   PATT
  .word Label_0105797B
@  #07 @110   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   N12 ,En2 ,v076
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,En2
 .byte   W12
 .byte   An2
 .byte   W12
@  #07 @111   ----------------------------------------
 .byte   En2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N12 ,En2
 .byte   W12
 .byte   An2
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N12 ,An2
 .byte   W12
@  #07 @112   ----------------------------------------
 .byte   N36 ,Dn3
 .byte   W36
 .byte   PAN , c_v-64
 .byte   N03 ,Gn3
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N48 ,Bn3
 .byte   W48
@  #07 @113   ----------------------------------------
 .byte   N36 ,Gn3
 .byte   W36
 .byte   PAN , c_v+63
 .byte   N03 ,Bn3
 .byte   W12
 .byte   N36 ,Dn4
 .byte   W36
 .byte   N06 ,Cs4
 .byte   W03
 .byte   PAN , c_v-64
 .byte   W03
 .byte   N06 ,Bn3
 .byte   W06
@  #07 @114   ----------------------------------------
 .byte   N48 ,An3
 .byte   W48
 .byte   N36 ,Bn2
 .byte   W36
 .byte   PAN , c_v+63
 .byte   N06 ,An2
 .byte   W06
 .byte   Gn2
 .byte   W06
@  #07 @115   ----------------------------------------
 .byte   N48 ,An2
 .byte   W48
 .byte   PAN , c_v-64
 .byte   N24 ,Cs3
 .byte   W24
 .byte   W03
 .byte   En3
 .byte   W21
@  #07 @116   ----------------------------------------
 .byte   PAN , c_v+63
 .byte   N36 ,Bn2
 .byte   W36
 .byte   PAN , c_v-64
 .byte   N03 ,Dn3
 .byte   W12
 .byte   N24 ,Gn3
 .byte   W24
 .byte   PAN , c_v+63
 .byte   N24 ,Bn3
 .byte   W24
@  #07 @117   ----------------------------------------
 .byte   Dn3
 .byte   W36
 .byte   PAN , c_v-64
 .byte   N03 ,Gn3
 .byte   W12
 .byte   N12 ,An3
 .byte   W12
 .byte   Bn3
 .byte   W12
 .byte   Cs4
 .byte   W12
 .byte   Dn4
 .byte   W12
@  #07 @118   ----------------------------------------
 .byte   N06 ,An2
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   PAN , c_v-64
 .byte   W12
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W24
@  #07 @119   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   N06 ,An2 ,v084
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   PAN , c_v+63
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   PAN , c_v-64
 .byte   N06
 .byte   W24
@  #07 @120   ----------------------------------------
 .byte   N06
 .byte   W12
 .byte   PAN , c_v+63
 .byte   N06
 .byte   W24
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   PAN , c_v-64
 .byte   N09
 .byte   W48
 .byte   FINE

@**************** Track 8 (Midi-Chn.7) ****************@

song22_008:
@  #08 @000   ----------------------------------------
 .byte   KEYSH , song22_key+0
 .byte   VOICE , 36
 .byte   VOL , 56*song22_mvl/mxv
 .byte   LFOS 44
 .byte   BENDR, 12
 .byte   PAN , c_v-64
 .byte   W96
@  #08 @001   ----------------------------------------
 .byte   W96
@  #08 @002   ----------------------------------------
 .byte   W96
@  #08 @003   ----------------------------------------
 .byte   W96
@  #08 @004   ----------------------------------------
 .byte   W48
 .byte   W96
@  #08 @005   ----------------------------------------
 .byte   W96
@  #08 @006   ----------------------------------------
 .byte   W96
@  #08 @007   ----------------------------------------
 .byte   W96
@  #08 @008   ----------------------------------------
 .byte   W96
@  #08 @009   ----------------------------------------
 .byte   W96
@  #08 @010   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   N36 ,Cs4 ,v064
 .byte   W36
 .byte   N06 ,An3
 .byte   W06
 .byte   Cs4
 .byte   W54
@  #08 @011   ----------------------------------------
 .byte   W96
@  #08 @012   ----------------------------------------
 .byte   N12 ,An2 ,v072
 .byte   W12
 .byte   N21 ,An1
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   N06 ,En1
 .byte   W12
 .byte   N12 ,Gs1
 .byte   W12
@  #08 @013   ----------------------------------------
 .byte   N09 ,An1
 .byte   W12
 .byte   N21
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Gn1
 .byte   W12
 .byte   Fs1
 .byte   W12
@  #08 @014   ----------------------------------------
 .byte   VOICE , 36
 .byte   PAN , c_v+0
 .byte   VOL , 58*song22_mvl/mxv
 .byte   N12 ,An1 ,v120
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W36
@  #08 @015   ----------------------------------------
Label_01057AAD:
 .byte   N12 ,Gn1 ,v120
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N24
 .byte   W24
 .byte   N12 ,Gs1
 .byte   W12
 .byte   PEND 
@  #08 @016   ----------------------------------------
 .byte   An1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W36
@  #08 @017   ----------------------------------------
Label_01057ABF:
 .byte   N12 ,An1 ,v120
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
 .byte   En2
 .byte   W12
 .byte   En1
 .byte   W12
 .byte   PEND 
@  #08 @018   ----------------------------------------
Label_01057ACC:
 .byte   N12 ,An1 ,v120
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W24
 .byte   Gs1
 .byte   W12
 .byte   PEND 
@  #08 @019   ----------------------------------------
 .byte   PATT
  .word Label_01057AAD
@  #08 @020   ----------------------------------------
 .byte   PATT
  .word Label_01057ACC
@  #08 @021   ----------------------------------------
 .byte   PATT
  .word Label_01057ABF
@  #08 @022   ----------------------------------------
Label_01057AE6:
 .byte   N12 ,Gn1 ,v120
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
 .byte   Gn2
 .byte   W12
 .byte   Bn1
 .byte   W12
 .byte   PEND 
@  #08 @023   ----------------------------------------
 .byte   Gn1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Gs1
 .byte   W12
@  #08 @024   ----------------------------------------
 .byte   An1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
 .byte   En1
 .byte   W12
 .byte   Gs1
 .byte   W12
@  #08 @025   ----------------------------------------
 .byte   An1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   En1
 .byte   W24
 .byte   N12
 .byte   W12
@  #08 @026   ----------------------------------------
 .byte   PATT
  .word Label_01057ABF
@  #08 @027   ----------------------------------------
 .byte   PATT
  .word Label_01057AE6
@  #08 @028   ----------------------------------------
 .byte   N12 ,En1 ,v120
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
 .byte   Cs2
 .byte   W12
 .byte   Bn1
 .byte   W12
@  #08 @029   ----------------------------------------
 .byte   An1
 .byte   W36
 .byte   N12
 .byte   W24
 .byte   N12
 .byte   W12
 .byte   N12
 .byte   W12
 .byte   Gs1
 .byte   W12
@  #08 @030   ----------------------------------------
 .byte   N24 ,Gn1
 .byte   W24
 .byte   An1
 .byte   W24
 .byte   Bn1
 .byte   W24
 .byte   Dn2
 .byte   W24
@  #08 @031   ----------------------------------------
 .byte   W96
@  #08 @032   ----------------------------------------
 .byte   VOICE , 45
 .byte   PAN , c_v-64
 .byte   VOL , 42*song22_mvl/mxv
 .byte   N06 ,En4
 .byte   W12
 .byte   N12 ,En3
 .byte   W48
 .byte   Cs3
 .byte   W12
 .byte   N06 ,Gn3
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   Gn3
 .byte   W06
 .byte   Bn3
 .byte   W06
@  #08 @033   ----------------------------------------
Label_01057B50:
 .byte   N06 ,Dn4 ,v120
 .byte   W12
 .byte   N12 ,Dn3
 .byte   W48
 .byte   Bn3
 .byte   W12
 .byte   N03 ,Dn4
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06 ,Bn3
 .byte   W06
 .byte   Gn3
 .byte   W06
 .byte   PEND 
@  #08 @034   ----------------------------------------
Label_01057B64:
 .byte   N06 ,An3 ,v120
 .byte   W12
 .byte   N12 ,Cs3
 .byte   W84
 .byte   PEND 
@  #08 @035   ----------------------------------------
 .byte   N06 ,An3
 .byte   W12
 .byte   En3
 .byte   W06
 .byte   An3
 .byte   W06
 .byte   Cs4
 .byte   W12
 .byte   An3
 .byte   W06
 .byte   Cs4
 .byte   W06
 .byte   N03 ,An4
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W06
@  #08 @036   ----------------------------------------
 .byte   En4
 .byte   W12
 .byte   N12 ,En3
 .byte   W24
 .byte   N12
 .byte   W24
 .byte   Cs3
 .byte   W12
 .byte   N06 ,Gn3
 .byte   W06
 .byte   Fs3
 .byte   W06
 .byte   Gn3
 .byte   W06
 .byte   Bn3
 .byte   W06
@  #08 @037   ----------------------------------------
 .byte   PATT
  .word Label_01057B50
@  #08 @038   ----------------------------------------
 .byte   PATT
  .word Label_01057B64
@  #08 @039   ----------------------------------------
 .byte   N08 ,Cs3 ,v120
 .byte   W08
 .byte   An2
 .byte   W08
 .byte   Cs3
 .byte   W08
 .byte   En3
 .byte   W08
 .byte   Cs3
 .byte   W08
 .byte   En3
 .byte   W08
 .byte   N36 ,An3
 .byte   W36
 .byte   N06 ,Gs3 ,v052
 .byte   W06
 .byte   Gn3
 .byte   W06
@  #08 @040   ----------------------------------------
 .byte   W96
@  #08 @041   ----------------------------------------
 .byte   W96
@  #08 @042   ----------------------------------------
 .byte   W96
@  #08 @043   ----------------------------------------
 .byte   W96
@  #08 @044   ----------------------------------------
 .byte   W96
@  #08 @045   ----------------------------------------
 .byte   W96
@  #08 @046   ----------------------------------------
 .byte   W96
@  #08 @047   ----------------------------------------
 .byte   W96
@  #08 @048   ----------------------------------------
 .byte   W96
@  #08 @049   ----------------------------------------
 .byte   W96
@  #08 @050   ----------------------------------------
 .byte   W96
@  #08 @051   ----------------------------------------
 .byte   VOICE , 45
 .byte   PAN , c_v+0
 .byte   W96
@  #08 @052   ----------------------------------------
 .byte   N24 ,An3 ,v084
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,En4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Ds4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Gn4
 .byte   W06
 .byte   MOD 6
 .byte   W18
@  #08 @053   ----------------------------------------
 .byte   MOD 0
 .byte   N24 ,Fs4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Cs4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Cn4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,En4
 .byte   W06
 .byte   MOD 6
 .byte   W18
@  #08 @054   ----------------------------------------
 .byte   MOD 0
 .byte   N24 ,Ds4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,An3
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Gs3
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Dn4
 .byte   W06
 .byte   MOD 6
 .byte   W18
@  #08 @055   ----------------------------------------
 .byte   MOD 0
 .byte   N24 ,Cs4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,An3
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Bn3
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Gs3
 .byte   W06
 .byte   MOD 6
 .byte   W18
@  #08 @056   ----------------------------------------
 .byte   MOD 0
 .byte   N24 ,An4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,En5
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Ds5
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Gn5
 .byte   W06
 .byte   MOD 6
 .byte   W18
@  #08 @057   ----------------------------------------
 .byte   MOD 0
 .byte   N24 ,Fs5
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Cs5
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Cn5
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,En5
 .byte   W06
 .byte   MOD 6
 .byte   W18
@  #08 @058   ----------------------------------------
 .byte   MOD 0
 .byte   N24 ,Ds5
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,An4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Gs4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Dn5
 .byte   W06
 .byte   MOD 6
 .byte   W18
@  #08 @059   ----------------------------------------
 .byte   MOD 0
 .byte   N24 ,Cs5
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,An4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Bn4
 .byte   W06
 .byte   MOD 6
 .byte   W18
 .byte   MOD 0
 .byte   N24 ,Gs4
 .byte   W06
 .byte   MOD 6
 .byte   W18
@  #08 @060   ----------------------------------------
 .byte   MOD 0
 .byte   W96
@  #08 @061   ----------------------------------------
 .byte   W96
@  #08 @062   ----------------------------------------
 .byte   W96
@  #08 @063   ----------------------------------------
 .byte   W96
@  #08 @064   ----------------------------------------
 .byte   W96
@  #08 @065   ----------------------------------------
 .byte   W96
@  #08 @066   ----------------------------------------
 .byte   W96
@  #08 @067   ----------------------------------------
 .byte   W96
@  #08 @068   ----------------------------------------
 .byte   W96
@  #08 @069   ----------------------------------------
 .byte   W96
@  #08 @070   ----------------------------------------
 .byte   W96
@  #08 @071   ----------------------------------------
 .byte   W96
@  #08 @072   ----------------------------------------
 .byte   W96
@  #08 @073   ----------------------------------------
 .byte   W96
@  #08 @074   ----------------------------------------
 .byte   W96
@  #08 @075   ----------------------------------------
 .byte   W96
@  #08 @076   ----------------------------------------
 .byte   W96
@  #08 @077   ----------------------------------------
 .byte   W96
@  #08 @078   ----------------------------------------
 .byte   W96
@  #08 @079   ----------------------------------------
 .byte   W96
@  #08 @080   ----------------------------------------
 .byte   W96
@  #08 @081   ----------------------------------------
 .byte   W96
@  #08 @082   ----------------------------------------
 .byte   W96
@  #08 @083   ----------------------------------------
 .byte   W96
@  #08 @084   ----------------------------------------
 .byte   W96
@  #08 @085   ----------------------------------------
 .byte   W96
@  #08 @086   ----------------------------------------
 .byte   W96
@  #08 @087   ----------------------------------------
 .byte   W96
@  #08 @088   ----------------------------------------
 .byte   W96
@  #08 @089   ----------------------------------------
 .byte   W96
@  #08 @090   ----------------------------------------
 .byte   W96
@  #08 @091   ----------------------------------------
 .byte   W96
@  #08 @092   ----------------------------------------
 .byte   W96
@  #08 @093   ----------------------------------------
 .byte   W96
@  #08 @094   ----------------------------------------
 .byte   W96
@  #08 @095   ----------------------------------------
 .byte   W96
@  #08 @096   ----------------------------------------
 .byte   W96
@  #08 @097   ----------------------------------------
 .byte   W96
@  #08 @098   ----------------------------------------
 .byte   W96
@  #08 @099   ----------------------------------------
 .byte   W96
@  #08 @100   ----------------------------------------
 .byte   W96
@  #08 @101   ----------------------------------------
 .byte   W96
@  #08 @102   ----------------------------------------
 .byte   W96
@  #08 @103   ----------------------------------------
 .byte   W96
@  #08 @104   ----------------------------------------
 .byte   W96
@  #08 @105   ----------------------------------------
 .byte   W96
@  #08 @106   ----------------------------------------
 .byte   W96
@  #08 @107   ----------------------------------------
 .byte   W96
@  #08 @108   ----------------------------------------
 .byte   W96
@  #08 @109   ----------------------------------------
 .byte   W96
@  #08 @110   ----------------------------------------
 .byte   W96
@  #08 @111   ----------------------------------------
 .byte   W96
@  #08 @112   ----------------------------------------
 .byte   W96
@  #08 @113   ----------------------------------------
 .byte   W96
@  #08 @114   ----------------------------------------
 .byte   PAN , c_v-64
 .byte   W96
@  #08 @115   ----------------------------------------
 .byte   VOICE , 45
 .byte   VOL , 90*song22_mvl/mxv
 .byte   N03 ,An3 ,v064
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N06
 .byte   W24
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W18
 .byte   Bn3
 .byte   W06
 .byte   N24 ,Dn4
 .byte   W24
@  #08 @116   ----------------------------------------
 .byte   BEND , c_v+1
 .byte   N36 ,Gn3 ,v040
 .byte   W36
 .byte   N03 ,Bn3
 .byte   W12
 .byte   N48 ,Dn4
 .byte   W48
@  #08 @117   ----------------------------------------
 .byte   N36 ,Bn3
 .byte   W36
 .byte   N03 ,Dn4
 .byte   W12
 .byte   N48 ,Gn4
 .byte   W48
@  #08 @118   ----------------------------------------
 .byte   N96 ,An4
 .byte   W96
@  #08 @119   ----------------------------------------
 .byte   BEND , c_v+0
 .byte   N96 ,An4 ,v064
 .byte   W96
@  #08 @120   ----------------------------------------
 .byte   BEND , c_v+0
 .byte   W96
 .byte   FINE

@**************** Track 9 (Midi-Chn.8) ****************@

song22_009:
@  #09 @000   ----------------------------------------
 .byte   KEYSH , song22_key+0
 .byte   VOICE , 46
 .byte   VOL , 77*song22_mvl/mxv
 .byte   W96
@  #09 @001   ----------------------------------------
 .byte   W96
@  #09 @002   ----------------------------------------
 .byte   W96
@  #09 @003   ----------------------------------------
 .byte   W96
@  #09 @004   ----------------------------------------
 .byte   W48
 .byte   W96
@  #09 @005   ----------------------------------------
 .byte   W96
@  #09 @006   ----------------------------------------
 .byte   W96
@  #09 @007   ----------------------------------------
 .byte   W96
@  #09 @008   ----------------------------------------
 .byte   W96
@  #09 @009   ----------------------------------------
 .byte   W96
@  #09 @010   ----------------------------------------
 .byte   W96
@  #09 @011   ----------------------------------------
 .byte   W96
@  #09 @012   ----------------------------------------
 .byte   VOL , 79*song22_mvl/mxv
 .byte   W12
 .byte   N21 ,Dn1 ,v112
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N09
 .byte   W12
 .byte   N09
 .byte   W12
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v056
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @013   ----------------------------------------
 .byte   N09 ,Dn1 ,v112
 .byte   W12
 .byte   N21
 .byte   W24
 .byte   N03
 .byte   W06
 .byte   N03
 .byte   W06
 .byte   N09
 .byte   W12
 .byte   N09
 .byte   W12
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v056
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @014   ----------------------------------------
Label_01057D6B:
 .byte   N06 ,Dn1 ,v120
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N03 ,Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   PEND 
@  #09 @015   ----------------------------------------
Label_01057D8D:
 .byte   N06 ,Dn1 ,v120
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W06
 .byte   Dn1 ,v080
 .byte   W06
 .byte   Dn1 ,v120
 .byte   W06
 .byte   Dn1 ,v080
 .byte   W06
 .byte   Dn1 ,v120
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   PEND 
@  #09 @016   ----------------------------------------
 .byte   PATT
  .word Label_01057D6B
@  #09 @017   ----------------------------------------
 .byte   PATT
  .word Label_01057D6B
@  #09 @018   ----------------------------------------
 .byte   PATT
  .word Label_01057D6B
@  #09 @019   ----------------------------------------
 .byte   PATT
  .word Label_01057D8D
@  #09 @020   ----------------------------------------
 .byte   N06 ,Dn1 ,v120
 .byte   W06
 .byte   Dn1 ,v080
 .byte   W06
 .byte   Dn1 ,v120
 .byte   W24
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N03 ,Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @021   ----------------------------------------
 .byte   PATT
  .word Label_01057D6B
@  #09 @022   ----------------------------------------
 .byte   N03 ,Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v120
 .byte   W06
 .byte   N03 ,Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v120
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N03 ,Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W06
@  #09 @023   ----------------------------------------
Label_01057E2B:
 .byte   N06 ,Dn1 ,v120
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W06
 .byte   Dn1 ,v080
 .byte   W06
 .byte   Dn1 ,v120
 .byte   W06
 .byte   Dn1 ,v080
 .byte   W06
 .byte   PEND 
@  #09 @024   ----------------------------------------
Label_01057E45:
 .byte   N03 ,Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v120
 .byte   W24
 .byte   N06
 .byte   W06
 .byte   Dn1 ,v080
 .byte   W06
 .byte   Dn1 ,v120
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   PEND 
@  #09 @025   ----------------------------------------
 .byte   Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v120
 .byte   W18
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N03 ,Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @026   ----------------------------------------
 .byte   Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v120
 .byte   W12
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N03 ,Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W06
@  #09 @027   ----------------------------------------
 .byte   PATT
  .word Label_01057E2B
@  #09 @028   ----------------------------------------
 .byte   PATT
  .word Label_01057E45
@  #09 @029   ----------------------------------------
 .byte   N03 ,Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v120
 .byte   W12
 .byte   N03 ,Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v120
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N06
 .byte   W12
 .byte   N03 ,Dn1 ,v116
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @030   ----------------------------------------
 .byte   N48 ,Cs2 ,v120
 .byte   W48
 .byte   An2
 .byte   W48
@  #09 @031   ----------------------------------------
 .byte   En2
 .byte   W96
@  #09 @032   ----------------------------------------
 .byte   W96
@  #09 @033   ----------------------------------------
 .byte   W96
@  #09 @034   ----------------------------------------
 .byte   W96
@  #09 @035   ----------------------------------------
 .byte   W96
@  #09 @036   ----------------------------------------
 .byte   W96
@  #09 @037   ----------------------------------------
 .byte   W96
@  #09 @038   ----------------------------------------
 .byte   W96
@  #09 @039   ----------------------------------------
 .byte   W96
@  #09 @040   ----------------------------------------
 .byte   W96
@  #09 @041   ----------------------------------------
 .byte   W96
@  #09 @042   ----------------------------------------
 .byte   W96
@  #09 @043   ----------------------------------------
 .byte   W96
@  #09 @044   ----------------------------------------
 .byte   W96
@  #09 @045   ----------------------------------------
 .byte   W96
@  #09 @046   ----------------------------------------
 .byte   W96
@  #09 @047   ----------------------------------------
 .byte   W96
@  #09 @048   ----------------------------------------
 .byte   N06 ,Dn1 ,v100
 .byte   W12
 .byte   N06
 .byte   W36
 .byte   N06
 .byte   W12
 .byte   N06
 .byte   W36
@  #09 @049   ----------------------------------------
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v060
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v064
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v100
 .byte   W12
 .byte   N06
 .byte   W36
@  #09 @050   ----------------------------------------
 .byte   N12 ,Dn1 ,v112
 .byte   W12
 .byte   Dn1 ,v048
 .byte   W12
 .byte   Dn1 ,v104
 .byte   W12
 .byte   N06 ,Dn1 ,v048
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N12 ,Dn1 ,v096
 .byte   W12
 .byte   Dn1 ,v048
 .byte   W12
 .byte   Dn1 ,v060
 .byte   W12
 .byte   N03 ,Dn1 ,v112
 .byte   W03
 .byte   Dn1 ,v048
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @051   ----------------------------------------
 .byte   VOL , 83*song22_mvl/mxv
 .byte   N12 ,Dn1 ,v112
 .byte   W12
 .byte   N03 ,Dn1 ,v096
 .byte   W03
 .byte   Dn1 ,v036
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v048
 .byte   W06
 .byte   Dn1 ,v104
 .byte   W06
 .byte   Dn1 ,v040
 .byte   W06
 .byte   Dn1 ,v112
 .byte   W06
 .byte   Dn1 ,v096
 .byte   W06
 .byte   N03 ,Dn1 ,v072
 .byte   W03
 .byte   Dn1 ,v028
 .byte   W03
 .byte   Dn1 ,v072
 .byte   W03
 .byte   Dn1 ,v032
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N12 ,Dn1 ,v112
 .byte   W12
 .byte   N06
 .byte   W06
 .byte   Dn1 ,v088
 .byte   W06
@  #09 @052   ----------------------------------------
 .byte   VOL , 87*song22_mvl/mxv
 .byte   N12 ,Dn1 ,v112
 .byte   W12
 .byte   Dn1 ,v048
 .byte   W12
 .byte   Dn1 ,v112
 .byte   W12
 .byte   N06 ,Dn1 ,v048
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N12 ,Dn1 ,v108
 .byte   W12
 .byte   Dn1 ,v048
 .byte   W12
 .byte   Dn1 ,v112
 .byte   W12
 .byte   N03 ,Dn1 ,v100
 .byte   W03
 .byte   Dn1 ,v048
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @053   ----------------------------------------
 .byte   N12 ,Dn1 ,v100
 .byte   W12
 .byte   Dn1 ,v048
 .byte   W12
 .byte   Dn1 ,v092
 .byte   W12
 .byte   N06 ,Dn1 ,v048
 .byte   W06
 .byte   Dn1 ,v096
 .byte   W06
 .byte   Dn1 ,v052
 .byte   W06
 .byte   Dn1 ,v120
 .byte   W06
 .byte   Dn1 ,v052
 .byte   W06
 .byte   Dn1 ,v112
 .byte   W06
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v032
 .byte   W03
 .byte   Dn1 ,v092
 .byte   W03
 .byte   Dn1 ,v032
 .byte   W03
 .byte   Dn1 ,v064
 .byte   W03
 .byte   Dn1 ,v068
 .byte   W03
 .byte   Dn1 ,v088
 .byte   W03
 .byte   Dn1 ,v092
 .byte   W03
@  #09 @054   ----------------------------------------
 .byte   N12 ,Dn1 ,v108
 .byte   W12
 .byte   Dn1 ,v048
 .byte   W12
 .byte   Dn1 ,v108
 .byte   W12
 .byte   N06 ,Dn1 ,v048
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N12 ,Dn1 ,v104
 .byte   W12
 .byte   Dn1 ,v048
 .byte   W12
 .byte   Dn1 ,v060
 .byte   W12
 .byte   N03 ,Dn1 ,v112
 .byte   W03
 .byte   Dn1 ,v048
 .byte   W03
 .byte   Dn1 ,v104
 .byte   W03
 .byte   Dn1 ,v048
 .byte   W03
@  #09 @055   ----------------------------------------
Label_01058039:
 .byte   N12 ,Dn1 ,v112
 .byte   W12
 .byte   N06 ,Dn1 ,v108
 .byte   W06
 .byte   Dn1 ,v104
 .byte   W06
 .byte   Dn1 ,v048
 .byte   W06
 .byte   Dn1 ,v108
 .byte   W06
 .byte   Dn1 ,v048
 .byte   W06
 .byte   Dn1 ,v108
 .byte   W06
 .byte   N12 ,Dn1 ,v064
 .byte   W12
 .byte   N06 ,Dn1 ,v048
 .byte   W06
 .byte   Dn1 ,v052
 .byte   W06
 .byte   N12 ,Dn1 ,v112
 .byte   W12
 .byte   N06
 .byte   W06
 .byte   Dn1 ,v048
 .byte   W06
 .byte   PEND 
@  #09 @056   ----------------------------------------
Label_01058065:
 .byte   N12 ,Dn1 ,v104
 .byte   W12
 .byte   N03 ,Dn1 ,v048
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N12 ,Dn1 ,v088
 .byte   W12
 .byte   N03 ,Dn1 ,v048
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N12 ,Dn1 ,v100
 .byte   W12
 .byte   N03 ,Dn1 ,v048
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N12 ,Dn1 ,v124
 .byte   W12
 .byte   N06 ,Dn1 ,v112
 .byte   W06
 .byte   Dn1 ,v064
 .byte   W06
 .byte   PEND 
@  #09 @057   ----------------------------------------
 .byte   N12 ,Dn1 ,v112
 .byte   W12
 .byte   Dn1 ,v048
 .byte   W12
 .byte   Dn1 ,v112
 .byte   W12
 .byte   N06 ,Dn1 ,v048
 .byte   W06
 .byte   N06
 .byte   W06
 .byte   N12 ,Dn1 ,v112
 .byte   W12
 .byte   Dn1 ,v048
 .byte   W12
 .byte   Dn1 ,v060
 .byte   W12
 .byte   N03 ,Dn1 ,v112
 .byte   W03
 .byte   Dn1 ,v048
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @058   ----------------------------------------
 .byte   PATT
  .word Label_01058039
@  #09 @059   ----------------------------------------
 .byte   PATT
  .word Label_01058065
@  #09 @060   ----------------------------------------
 .byte   VOL , 79*song22_mvl/mxv
 .byte   N48 ,An2 ,v120
 .byte   W96
@  #09 @061   ----------------------------------------
 .byte   En2
 .byte   W96
@  #09 @062   ----------------------------------------
 .byte   Gn2
 .byte   W96
@  #09 @063   ----------------------------------------
 .byte   W96
@  #09 @064   ----------------------------------------
 .byte   W96
@  #09 @065   ----------------------------------------
 .byte   W96
@  #09 @066   ----------------------------------------
 .byte   W96
@  #09 @067   ----------------------------------------
 .byte   W96
@  #09 @068   ----------------------------------------
 .byte   W96
@  #09 @069   ----------------------------------------
 .byte   W96
@  #09 @070   ----------------------------------------
 .byte   W96
@  #09 @071   ----------------------------------------
 .byte   W96
@  #09 @072   ----------------------------------------
 .byte   W96
@  #09 @073   ----------------------------------------
 .byte   W96
@  #09 @074   ----------------------------------------
 .byte   W96
@  #09 @075   ----------------------------------------
 .byte   W96
@  #09 @076   ----------------------------------------
 .byte   W96
@  #09 @077   ----------------------------------------
 .byte   W96
@  #09 @078   ----------------------------------------
 .byte   W96
@  #09 @079   ----------------------------------------
 .byte   W96
@  #09 @080   ----------------------------------------
 .byte   W96
@  #09 @081   ----------------------------------------
 .byte   W96
@  #09 @082   ----------------------------------------
 .byte   W96
@  #09 @083   ----------------------------------------
 .byte   W96
@  #09 @084   ----------------------------------------
 .byte   W96
@  #09 @085   ----------------------------------------
 .byte   W96
@  #09 @086   ----------------------------------------
 .byte   W96
@  #09 @087   ----------------------------------------
 .byte   W96
@  #09 @088   ----------------------------------------
 .byte   W96
@  #09 @089   ----------------------------------------
 .byte   W96
@  #09 @090   ----------------------------------------
 .byte   W96
@  #09 @091   ----------------------------------------
 .byte   W96
@  #09 @092   ----------------------------------------
 .byte   W96
@  #09 @093   ----------------------------------------
 .byte   W96
@  #09 @094   ----------------------------------------
 .byte   W96
@  #09 @095   ----------------------------------------
 .byte   N06 ,Dn1 ,v112
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N03 ,Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v120
 .byte   W12
 .byte   Dn1 ,v116
 .byte   W12
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @096   ----------------------------------------
 .byte   N06 ,Dn1 ,v108
 .byte   W06
 .byte   Dn1 ,v096
 .byte   W06
 .byte   Dn1 ,v108
 .byte   W24
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v104
 .byte   W12
 .byte   Dn1 ,v112
 .byte   W12
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @097   ----------------------------------------
 .byte   N06 ,Dn1 ,v112
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N03 ,Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v112
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N03 ,Dn1 ,v104
 .byte   W03
 .byte   Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @098   ----------------------------------------
 .byte   N06 ,Dn1 ,v112
 .byte   W06
 .byte   Dn1 ,v108
 .byte   W06
 .byte   Dn1 ,v112
 .byte   W24
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v112
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @099   ----------------------------------------
 .byte   N06 ,Dn1 ,v112
 .byte   W12
 .byte   N06
 .byte   W24
 .byte   N03 ,Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v112
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N03
 .byte   W03
 .byte   Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @100   ----------------------------------------
 .byte   W96
@  #09 @101   ----------------------------------------
 .byte   W96
@  #09 @102   ----------------------------------------
 .byte   W96
@  #09 @103   ----------------------------------------
 .byte   W96
@  #09 @104   ----------------------------------------
 .byte   W96
@  #09 @105   ----------------------------------------
 .byte   N48 ,An2 ,v080
 .byte   W48
 .byte   Cs2
 .byte   W48
@  #09 @106   ----------------------------------------
 .byte   W96
@  #09 @107   ----------------------------------------
 .byte   W96
@  #09 @108   ----------------------------------------
 .byte   W96
@  #09 @109   ----------------------------------------
 .byte   W96
@  #09 @110   ----------------------------------------
 .byte   N06 ,Dn1 ,v112
 .byte   W06
 .byte   Dn1 ,v080
 .byte   W06
 .byte   Dn1 ,v112
 .byte   W24
 .byte   N03 ,Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N06 ,Dn1 ,v112
 .byte   W12
 .byte   N06
 .byte   W12
 .byte   N03 ,Dn1 ,v104
 .byte   W03
 .byte   Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @111   ----------------------------------------
 .byte   N06 ,Dn1 ,v112
 .byte   W12
 .byte   N06
 .byte   W18
 .byte   Dn1 ,v104
 .byte   W12
 .byte   Dn1 ,v080
 .byte   W06
 .byte   Dn1 ,v112
 .byte   W06
 .byte   Dn1 ,v080
 .byte   W06
 .byte   Dn1 ,v112
 .byte   W12
 .byte   N03 ,Dn1 ,v104
 .byte   W03
 .byte   Dn1 ,v076
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
 .byte   N03
 .byte   W03
@  #09 @112   ----------------------------------------
 .byte   N48 ,Cs2 ,v120
 .byte   W96
@  #09 @113   ----------------------------------------
 .byte   An2
 .byte   W96
@  #09 @114   ----------------------------------------
 .byte   W96
@  #09 @115   ----------------------------------------
 .byte   W96
@  #09 @116   ----------------------------------------
 .byte   An2 ,v080
 .byte   W96
@  #09 @117   ----------------------------------------
 .byte   Cs2
 .byte   W96
@  #09 @118   ----------------------------------------
 .byte   W96
@  #09 @119   ----------------------------------------
 .byte   W96
@  #09 @120   ----------------------------------------
 .byte   W96
 .byte   FINE

@******************************************************@
	.align	2

song22:
	.byte	9	@ NumTrks
	.byte	0	@ NumBlks
	.byte	song22_pri	@ Priority
	.byte	song22_rev	@ Reverb.
    
	.word	song22_grp
    
	.word	song22_001
	.word	song22_002
	.word	song22_003
	.word	song22_004 @ broken 
	.word	song22_005
	.word	song22_006 @ broken 
	.word	song22_007
	.word	song22_008
	.word	song22_009

	.end
