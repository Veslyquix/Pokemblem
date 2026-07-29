.thumb 
.equ ProvokeUsability, ProvokeUsabilityList+4 
push {lr} 
mov r5, r5 @ noop 
mov r4, r4 @ noop 
ldr r3, ProvokeUsability 
mov lr, r3 
.short 0xF800 
mov r9, r9 @ noop 
pop {r3} 
bx r3 
.ltorg 
.align 4 
ProvokeUsabilityList:
