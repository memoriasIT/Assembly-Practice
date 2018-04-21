.text
.global main
main:
	add r0, #1

	@ N : Negativo (0 = > | 1 = <)
	cmp r0, #2 		@ 1 < 2 --> N: 1
	cmp r0, #0		@ 1 > 0	--> N: 0

	@ Z : Cero (1 = '0' | 0 != '0')
	cmp r0, #1		@ r0 - #1 = 0 --> Z: 1
	cmp r0, #-1		@ r0 - #-1 != 0 --> Z: 0
	cmp r0, #0		@ r0 - #0 != 0 --> Z: 0
	cmp r1, #0		@ r1 - #0 = 0 --> Z: 1

	@ C : Carry
	@ Sub (1 = no te llevas | 0 = te llevas)
	subs r2, r1, r1
	subs r2, r1, #1

	@ Add (1 = te llevas | 0 = no te llevas)
	adds r2, r1, #0
	adds r3, r0, r1

	@ V : Overflow
	mov r0,#0x40000000
    mov r1,#0x40000000
    adds r3,r1,r0