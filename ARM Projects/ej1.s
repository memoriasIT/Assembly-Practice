.data
len:        .word 10
datos:      .word -35, -2, -3, -45, -3, -90, -4, -67, -32, -44
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
		cmp r1, #1
		beq rango		@despues de iterar calcular rango
		
		ldr r0, [r2], #4 @sacar nuevos valores
		cmp r3, r0
		movlt r3, r0	@save new max
		
		cmp r4, r0
		movgt r4, r0	@save new min
			
		sub r1, #1
		b loop		
rango:
		@r0 = max - min
		ldr r5, =res
		sub r0, r3, r4
		str r0, [r5]

		bx lr
