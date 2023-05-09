.data
a: .word -3, -5, 2, -8
b: .word 0, 0, 0, 0

.text
    la    t0, a
    la    t1, b
    
    li    t4, 0
    li    t5, 3

check:
    lw    t2, 0(t0)

    blt    t5, t4, finish
    blt    t2, zero, negation

    sw    t2, 0(t1)
    addi    t1, t1, 4
    addi    t0, t0, 4
    
    addi    t4, t4, 1
    j check

negation:
    neg    t2, t2

    sw    t2, 0(t1)
    addi    t1, t1, 4
    addi    t0, t0, 4

    addi    t4, t4, 1
    j check

finish:
    li    a7, 10
    ecall

