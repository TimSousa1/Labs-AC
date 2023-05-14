.data
a: .word 4, -1

.text
la    t0, a

lw    t2, 0(t0) # A[i-1]
addi    t0, t0, 4 # i++
lw    t1, 0(t0) # A[i]

blt    t1, t2, do
j    finish

do:
mv     t6, t1 # tmp = A[i]
sw    t2, 0(t0) # A[i] = A[i-1]
sw    t6, -4(t0) # A[i-1] = tmp

finish:
nop
