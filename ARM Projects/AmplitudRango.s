@Escribe un programa en ensamblador ARM que dado un vector datos de números enteros y de longitud len escriba en res la amplitud del rango de los números almacenados en dicho vector. Es decir, debe escribir en res la diferencia entre el valor máximo y mínimo del vector (en el ejemplo, res = máximo(datos)-mínimo(datos) = 9 – (-7) = 16).
@Para probar el código podéis usar el vector  que aparece a continuación. No olvidéis que se trata de un ejemplo, y que el programa debería funcionar para cualquier tipo de vector (de cualquier tamaño y con distintos números enteros).
@El fichero con el programa debe llamarse ej1.s

.data
len:        .word 10
datos:      .word -35, -2, -3, -45, -3, -90, -4, -67, -32, -44
res:        .word 0
 
.text
.global main
main:	ldr r1, =len
		ldr r1, [r1]
		
		ldr r2, =datos
maxmin:		
		@ r3 min r4 max
		ldr r0, [r2], #4
		mov r3, r0
		mov r4, r3
		
		loop:
		cmp r1, #1
		beq rango		@despues de iterar calcular rango
		
		ldr r0, [r2], #4 @sacar nuevos valores
		cmp r3, r0
		movlt r3, r0	@save new max
		
		cmp r4, r0
		movgt r4, r0	@save new min
			
		sub r1, #1
		b loop		
rango:
		@r0 = max - min
		ldr r5, =res
		sub r0, r3, r4
		str r0, [r5]

		bx lr
