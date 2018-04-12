.data
string: .asciz "a"
.text
main:	ldr a1, =string
		bl ucase
		bx lr
		
ucase:	push {r4}
loop:	ldrb r4, [r0]               @Load Register Byte (immediate) loads a byte from memory, zero-extends it, and writes the result to a register. 
		cmp r4, #0
		beq salir					
		cmp r4, #122
		subls r4, r4, #32			@ls unsigned lower or same
		cmp r4, #65
		addlt r4, r4, #32			@lt signed less than
		strb r4, [r0], #1			@store regsiter byte (offset)
		
		b loop
		
salir: pop {r4}	
bx lr