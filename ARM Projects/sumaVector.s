.data
tam:	.word 8
datos:	.word 2, 4, 6, 8, -2, -4, -6, -7
res:	.word 0

.text
.global main
main:	ldr r0, =tam
		ldr r1, [r0]
		ldr r2, =datos
		mov r3, #0
loop:	cmp r1, #0
		beq salir
		ldr r4, [r2], #4
		add r3, r3, r4
		sub r1, #1
		b loop
salir:	ldr r0, =res
		str r3, [r0]
		bx lr

