.data
res: .word 0

.text
    la    t0, res

    lw    t1, 0(t0)
# if (0 < res)
    blt    zero, t1, set_positive
# else res = -1
    li    t2, -1
    j    finish

# then res = 1
set_positive:
    li    t2, 1

finish:
# storing to res
    sw    t2, 0(t0)
