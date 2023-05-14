.data 
a: .word 4, -1, 5, 3, -6, -6
n: .word 6

.text
la    t0, a
lw    t1, n
mv    t6, zero


li    a0, 1 # n_trocas = 1
first:
li    t5, 4 # size of an int

mul    t5, t6, t5 # size in bytes for t0 to go back
sub    t0, t0, t5 # going back to the start of t0

mv    t6, zero # the number of times t0 was incremented gets reset

beq    a0, zero, finish
mv    a0, zero # n_trocas = 0

li    t4, 1 # i = 1
second:
bge     t4, t1, first

lw    t2, 0(t0) # t2 = A[i-1]
addi     t0, t0, 4
addi    t6, t6, 1
lw    t3, 0(t0) # t3 = A[i]

bge     t3, t2, increment_i
mv    t5, t3 # tmp = A[i]
sw    t2, 0(t0) # A[i] = A[i-1]
sw    t5, -4(t0) # A[i-1] = tmp
addi    a0, a0, 1 # n_trocas++

increment_i:
addi    t4, t4, 1 # i++
j    second

finish:
nop
