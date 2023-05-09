.data
a: .word    1, 2, 3, 4
b: .word    0

.text
# loading a to a register
    la    t3, a

    lw    t1, 0(t3)
    lw    t2, 4(t3)
    add    t0, t1, t2

    lw    t1, 8(t3)
    add    t0, t0, t1

    lw    t1, 12(t3)
    add    t0, t0, t1
    srai    t0, t0, 2

    lw    t1, b
    sw    t0, 0(t1)

    mv    a0, t0
    li    a7, 1
    ecall

