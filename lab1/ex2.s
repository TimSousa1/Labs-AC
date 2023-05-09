.data
a:    .word 3
b:    .word 4
c:    .word 5
d:    .word -1
y:    .zero 4

.text
# a * b
    lw    t0, a
    lw    t1, b
    mul    t2, t0, t1
# b + c
    lw    t0, c
    lw    t1, d
    add    t1, t0, t1
# (a * b) / (c + d)
    div    t0, t2, t1

    la    t3, y
    sw    t0, 0(t3)
# printing to the console
    mv    a0, t0
    li    a7, 1
    ecall
