.data
a: .half 1, 2
b: .word -4, -2
c: .byte 2
res: .word 0

.text
    la    t0, a
    la    t1, b
    lb    t2, c
    la    t3, res

    lh    t4, 0(t0)
    lw    t5, 0(t1)

    mul    t4, t4, t5

    lh    t5, 2(t0)
    lw    t6, 4(t1)

    mul    t5, t5, t6

    sub    t4, t4, t5
    add    t4, t4, t2
    
    mv    a0, t4
    li    a7, 1
    ecall

    sw    t4, 0(t3)

