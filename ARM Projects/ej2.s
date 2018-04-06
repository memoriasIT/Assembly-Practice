.data
mytam:      .word 8
myvect:     .word 8,-3,4,-2,5,7,6,1
myres:      .word 0
 
.text
.global main
main:       push {lr}
            ldr r0, =myvect
            ldr r1, =mytam
            ldr r1, [r1]
            bl absmax
            ldr r1, =myres
            str r0, [r1]
            pop {lr}
            mov pc, lr
 
abs:        mov r1, #0
            cmp r0, r1
            sublt r0, r1, r0
            mov pc, lr
                 
absmax:
      push {lr}
      mov r3, r1 @tam
      mov r5, r0 @vector address
      mov r0, #0 @clean r0
      loop:
            cmp r3, #0 @goto main if done
            moveq r0, r4 @mov r4 to r0
            popeq {pc}

            ldr r0, [r5], #4 @load new char
            bl abs

            cmp r0, r4   @ r0 > r4
            movgt r4, r0 @ as it is greater we set r4 to r0

            sub r3, #1
            b loop