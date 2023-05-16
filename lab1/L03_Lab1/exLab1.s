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
# a / w + z
    div    t0, x14, x13
    add    t0, t0, x12
# (a / w + z) /  w
    div    t0, t0, x13
# 4 / w + x
    li    t2, 4
    div   t1, t2, x13
    add    t1, x11, t1
# ((z + a / w) / w) * (x + 4 / w) * x
    mul     t0, t1, t0
    mul     t0, x11, t0
# storing result to y
    sw    t0, 0(x10)


