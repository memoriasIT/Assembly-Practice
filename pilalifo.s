.text
.global main
main:
	mov r1, #5
	mov r2, #3
	add r3, r1, r2

	push {r1-r3}

	add r3, #10

	pop {r4-r6}


.end