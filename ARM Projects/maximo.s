.data
dato1:  .word 2	@ Primer dato a comparar
dato2:  .word 5	@ Segundo dato a comparar
max:    .word 0 @ Variable para almacenar el maximo

.text
.global main			@ declaramos la etiqueta "main" como global para que pueda ser llamda desde fuera de este program (SO)
main:	ldr r0, =dato1	@ cargamos la direccion del primer dato en r0
		ldr r1, [r0]	@ cargamos el primer dato en r1 (direccion indicada por r0)
		ldr r0, =dato2	@ cargamos la direccion del segundo dato en r0
		ldr r2, [r0]	@ cargamos el segundo dato en r2 (direccion indicada por r0)
		cmp r1, r2		@ comparamos r1 y r2 sin almacnear resultado (solo flags)
		bgt mayorr1		@ saltamos a "mayorr1" si r1 es mayor (gt - greater than) que r2
mayorr2:				@ aqui llegamos si r1 no es mayor que r1
		mov r0, r2		@ llevamos a r0 el valor de r2 (el mayor)
		b fin			@ nos saltamos el codigo asociado a cuando r1 es mayor que r2
mayorr1:				@ aquil llegamos si r1 es mayor que r2
		mov r0, r1		@ llevamos a r0 el valor de r1 (el mayor)
fin:	
		ldr r3, =max	@ cargamos la direccion del resultado en r3
		str r0, [r3]	@ almacenamos el resultado (r0) en sum (direccion indicada por r3)
		bx lr			@ terminamos el programa (saltamos de vuelta al codigo que invoco "main")

