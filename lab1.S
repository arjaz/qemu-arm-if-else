// a - b >= 0 ? (a + b) / c : (a - b) / c
.global lab1
.syntax unified
#define A #10
#define B #4
#define C #2
lab1:
    push {r0, r1, r2, r3, r4, lr}
    mov r2, A
    mov r3, B
    mov r4, C

    // r0 = a - b
    sub r0, r2, r3
    // r0 >= 0
    cmp r0, #0
    blt 1f

    // r2 = a + b
    add r2, r1
    bl 2f
1:
    // r2 = a - b
    sub r2, r1
2:
    // r1 = (a + b) / c — result
    udiv r1, r3, r4

    pop { r0, r1, r2,r3, r4, pc }
