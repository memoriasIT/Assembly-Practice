.text
.global main
main:   push {r3}
        mov r0, #6      @fibonacci n = 6
        mov r1, #0      @r1 num 1
        mov r2, #1      @r2 num 2
        cmp r0, #1      @ if r0 > 1 then
        bgt fib        @ goto fib
        b exit          @ else exit
fib:   cmp r0, #0      @ for acabado
        beq exit        @ exit
        add r3, r1, r2
        push {r3}
        mov r1, r2
        mov r2, r3
        sub r0, #1      @ for -1
        b fib          @ goto fib

exit:   mov r0, r3
        pop {r3}
        bx lr
.end
