.data
a: .word 2
b: .word 1
c: .word 0

.text

    lw    t1, a
    lw    t2, b
    lw    t0, c

    blt    t2, t1, do

    div    t0, t1, t2
    j    after

do:    mul   t0, t1, t1

after:
    la    t1, c
    sw    t0, 0(t1)

    li     a7, 1
    mv    a0, t0

    ecall
