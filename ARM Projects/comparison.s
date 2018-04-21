.text
.global main
main:
	add r0, #1

	@ cmp A, B --> x = A - B
	cmp r1, r0
	
	subs r2, r0, r1

	@ cmn A, B --> x = A + B 
	cmn r1, r0

	adds r3, r1, r0

	@ teq A, B --> x = A eor B
	teq r1, r1
	teq r1, r0

	eors r4, r1, r1
	eors r5, r1, r0

.end