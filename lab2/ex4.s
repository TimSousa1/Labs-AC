.data
a: .word 6, -25, 14, 127, -31, 43, 17

.text
    la    t0, a
    lw    t1, 0(t0)

    li    t4, 7
    li    t5, 0


check:
    addi    t5, t5, 1
    addi    t0, t0, 4
    lw    t2, 0(t0)
    beq    t4, t5, finish
    blt    t2, t1, min

    j    check

min:
    mv t1, t2

    j    check


finish:
# NOTE: the max value is stored on the t1 register
nop
