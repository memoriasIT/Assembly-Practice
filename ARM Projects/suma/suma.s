.data
dato1:  .word 2	@ Primer dato a comparar
dato2:  .word 5	@ Segundo dato a comparar
sum:    .word 0 @ Variable para almacenar la suma

.text
.global main			@ declaramos la etiqueta "main" como global para que pueda ser llamda desde fuera de este program (SO)
main:	ldr r0, =dato1	@ cargamos la direccion del primer dato en r0
		ldr r1, [r0]	@ cargamos el primer dato en r1 (direccion indicada por r0)
		ldr r0, =dato2	@ cargamos la direccion del segundo dato en r0
		ldr r2, [r0]	@ cargamos el segundo dato en r2 (direccion indicada por r0)
		add r0, r1, r2	@ sumamos los registros y el resultado va r0
		ldr r3, =sum	@ cargamos la direccion del resultado en r3
		str r0, [r3]	@ almacenamos el resultado (r0) en sum (direccion indicada por r3)
fin:	bx lr			@ terminamos el programa (saltamos de vuelta al codigo que invoco "main")

