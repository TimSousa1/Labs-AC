.data
a: .word 7, 9, 2, 3

.text
    la    t0, a
    lw    t1, 0(t0)

    li    t4, 2
    li    t5, 0


check:
    lw    t2, 4(t0)
    blt    t4, t5, finish
    blt    t1, t2, max
    addi     t0, t0, 4
    addi     t5, t5, 1
    j    check

max:
    mv t1, t2

    addi    t0, t0, 4
    addi    t5, t5, 1
    j    check


finish:
# NOTE: the max value is stored on the t1 register
nop
