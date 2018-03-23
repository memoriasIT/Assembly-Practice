.text
.global main
main:   
		mov r0, #1      @fibonacci n = 4
		bl	fib        @ goto fib
		bx lr
		
fib:	
		cmp r0, #0      @ for acabado
		beq salir        @ exit
		push {r4}   
        mov r1, #0      @r1 num 1
        mov r2, #1      @r2 num 2
	loop:
			cmp r0, #0      @ for acabado
			beq exit        @ exit
			add r4, r1, r2
			mov r1, r2
			mov r2, r4
			sub r0, #1      @ for -1
			b loop          @ goto loop

exit:   mov r0, r4
        pop {r4}
       
salir:  bx lr
.end