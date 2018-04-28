.text
.global main
main:
	mov r0, #6
	bl fib
	bx lr

fib:
	cmp r0, #0
	beq salir
	cmp r0, #1
	beq exit1
	push {r4}
	mov r1, #0
	mov r2, #1
	sub r0, #1

loop:
	cmp r0, #0
	beq exit0
	add r4, r1, r2
	mov r1, r2
	mov r2, r4
	sub r0, #1
	b loop

exit1:
	mov r0, #1
	b salir

exit0:
	mov r0, r4
	pop {r4}

salir:
	bx lr
	.end