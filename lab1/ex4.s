.data
a: .dword 3
b: .half -2
c: .byte -3
d: .zero 4

.text
    ld    t0, a

    lh    t1, b
    mul    t0, t0, t1

    lb    t1, c
    add    t0, t0, t1

    la    t1, d
    sw    t0, 0(t1)

    mv    a0, t0
    li    a7, 1
    ecall
