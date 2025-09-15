.thumb 
.global ModuloFunc
.type ModuloFunc, %function 
ModuloFunc: 
cmp r1, #0 
bne ContinueMod 
mov r0, #0 
bx lr 
ContinueMod: 
swi 6
mov r0, r1
bx lr
.ltorg 
