.thumb 
.equ ProvokeTest, ProvokeUsabilityList+4 
.global ProvokeCommandHook
.type ProvokeCommandHook, %function 
ProvokeCommandHook: 
push {lr} 
ldr   r0,[r0]
ldrb  r0,[r0]       @number of times to attack?
mul   r0,r1
ldr r3, ProvokeTest 
mov lr, r3 
.short 0xF800 
mov r9, r9 @ noop 
pop {r3} 
bx r3 
.ltorg 
.align 4 
ProvokeUsabilityList:
