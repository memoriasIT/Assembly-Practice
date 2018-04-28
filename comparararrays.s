.data
tam: .word 5
array1: .word 1, 2, 3, -4, 5
array2: .word -2, -4, 3, 2, 1

res: .word 0, 0, 0, 0, 0

.text
.global man
man:
	push {r4-r9}
	ldr r4, =array1
	ldr r5, =array2
	ldr r6, =res
	ldr r7, =tam
	ldr r7, [r7]

	loop:
		cmp r7, #0
		beq ext

		ldr r8, [r4], #4
		ldr r9, [r5], #4

		cmp r8, r9
		strle r8, [r6], #4

		cmp r9, r8
		strlt r9, [r6], #4

		sub r7, #1
		b loop

ext:
	pop {r4-r9}
	.end