.data
tam:        .word 3
vect:       .word 7, 3, 4
res:        .word 0
.text
.global main
main:       push {lr}
            ldr r0, =vect          @ Cargamos direccion del vector en r0
            ldr r1, =tam          
            ldr r1, [r1]           @ Cargamos longitud del vector en r1
            ldr r4, =res           @ Cargamos la direccion de res en r4
            bl evencount            @ Invocamos funcion
            str r0, [r4]           @ Guardamos el resultado en res
            pop {pc}               @ Finalizamos el programa
           
iseven:     
            mov r1, r0              @r0 to r1 (direction of vector)
            mov r2, #1              @r2 = 1
            and r3, r2, r1          @ r3 = r2 ^ r1 (r2 and r1 must be 1 to be equal to 1)
            eor r0, r3, #1          @EXOR only true if different (r3 must be different to 1)
                                    @EORS {Rd,} Rn, Rm --// Rd destination // Rn First operator // Rm 2nd operator
            bx lr
 
evencount:
            mov r5, r1              @length of vector in r5
            mov r6, #0              @evencount = 0
            mov r7, r0              @r7 = r0 vector direction
            push {lr}

            loop:
                  cmp r5, #0
                  moveq r0, r6
                  popeq {pc}
                  @bxeq lr           @GO BACK TO MAIN!!!??


                  ldr r0, [r7], #4

                  bl iseven
                  @if r0 = 1 it's even -- evencount++
                  
                  cmp r0, #1
                  addeq r6, #1

                  sub r5, #1
                  b loop