.data
res: .word 0

.text
    la    t0, res

    lw    t1, 0(t0)

    blt    zero, t1, set_positive
    li    t2, -1
    j    finish

set_positive:
    li    t2, 1

finish:
    sw    t2, 0(t0)
