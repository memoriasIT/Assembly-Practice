.data
tam:           .word 8
vect:          .word 64,25,9,23,56,77,87,100
res:           .word 0
.text
.global main
main:    push {lr}
         ldr r0, =vect          @ Cargamos direccion del vector en r0
         ldr r1, =tam          
         ldr r1, [r1]           @ Cargamos longitud del vector en r1
         ldr r4, =res           @ Cargamos la direccion de res en r4
         bl maxones             @ Invocamos funcion
         str r0, [r4]           @ Guardamos el resultado en res
         pop {pc}               @ Finalizamos el programa
        
ones:    mov r2, #0
         onesloop:
               and r3, r0, #1
               add r2, r2, r3
               lsrs r0, #1
               bne onesloop
               mov r0, r2
               bx lr
 
maxones:
   push {r5-r11, lr}
   mov r6, r1
   loop:
      cmp r1, #0
      moveq r0, r8
      popeq {r5-r11, pc}

      ldr r1, [r0]
      mov r0, r1
      bl ones

      cmp r7, r0
      movlt r7, r0
      movlt r8, r1

      add r5, #4
      ldr r0, =vect
      add r0, r5

      sub r6, #1
      b loop
