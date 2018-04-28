.data
dividendo: .word 110
divisor: .word 25

resto: .word 0
cociente: .word 0

.text
.global main
main:
	ldr r0, =dividendo
	ldr r1, [r0]

	ldr r0, =divisor
	ldr r2, [r0]

	cmp r1, r2
	movlt r3, r1
	blt exit

	bucle:
		cmp r1, r2
		movlt r3, r1
		blt exit

		add r4, #1
		sub r1, r2
		b bucle

exit:
	ldr r0, =resto
	str r3, [r0]

	ldr r0, =cociente
	str r4, [r0]
	.end
