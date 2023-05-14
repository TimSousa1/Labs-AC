.data
a: .word 3, 5, 6, -3
n: .word 4

.text
la    t0, a
lw    t6, n
li    t5, 0

lw    t1, 0(t0)
check:
lw    t2, 4(t0)
addi    t5, t5, 1

beq    t5, t6, finish
add    t1, t1, t2
addi    t0, t0, 4

j    check

finish:
# NOTE: median value stored on the t1 register
div    t1, t1, t6
