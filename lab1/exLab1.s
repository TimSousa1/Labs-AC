.data
a: .word 10
z: .word 11
w: .word 2
x: .word 13
y: .word 0

.text
    la    x10, y
    lw    x11, x
    lw    x12, z
    lw    x13, w
    lw    x14, a

    div    t0, x14, x13
    add    t0, t0, x12

    div    t0, t0, x13

    li    t2, 4

    div   t1, t2, x13

    add    t1, x11, t1

    mul     t0, t1, t0
    mul     t0, x11, t0

    sw    t0, 0(x10)


