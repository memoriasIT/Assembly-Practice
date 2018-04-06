.text
.global main
main:   push {r2}
        mov r0, #4      @cuadrado n = 4
        mov r2, #1      @ r2 = 1
        cmp r0, #1      @ if r0 > 1 then
        bgt cuad        @ goto cuad
        b exit          @ else exit
cuad:   cmp r0, #1      @ for acabado
        beq exit        @ exit
        mul r1, r0, r0  @ r1 = r0 * r0
        add r2, r1
        sub r0, #1      @ for -1
        b cuad          @ goto cuad

exit:   mov r0, r2
        pop {r2}
        bx lr
.end
