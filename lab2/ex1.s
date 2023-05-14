.data
x: .word 1
y: .zero 4

.text
    lw    t0, x
    bltz    t0, y_zero

    li    t2, 10
    bgt    t0, t2, y_two

    li    t1, 1
    j    finish

y_zero:
    li    t1, 0
    j    finish
y_two:
    li    t1, 2
    j    finish

finish:
    la    t0, y
    sw    t1, 0(t0)

