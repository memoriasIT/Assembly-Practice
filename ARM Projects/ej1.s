.data
len:        .word 8
datos:      .word 8,-3,4,-7,9,-7,6,-1
res:        .word 0
 
.text
.global main
main:	ldr r1, =len
		ldr r1, [r1]
		
		ldr r2, =datos
maxmin:		
		@ r3 min r4 max
		ldr r0, [r2], #4
		mov r3, r0
		mov r4, r3
		
		loop:
		cmp r1, #0
		beq rango		@despues de iterar calcular rango
		
		ldr r0, [r2], #4 @sacar nuevos valores
		cmp r3, r0
		movlt r3, r0	@save new min
		
		cmp r4, r0
		movgt r4, r0	@save new max
			
		sub r1, #1
		b loop		
rango:
		@r0 = max - min
		ldr r0, =res
		sub r0, r4, r3
		bx lr