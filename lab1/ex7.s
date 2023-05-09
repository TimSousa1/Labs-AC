.data
a: .dword 3
b: .half -2
c: .byte -3
d: .zero 4

.text

    lui    t3, a
    lui    t4, a
    lui    t5 a
    lui    t6, a

    lw    t2, b
    mul    t0, t1, t3

    lw    t1, c
    add    t0, t0, t1

    mv    a0, t0
    li    a7, 1
