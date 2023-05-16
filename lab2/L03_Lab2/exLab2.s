.data
n: .half 5
m: .half 6
f: .zero 24

.text
lh    t1, n
lh    t2, m
li    t3, 2

la    t0, f

# first elements
li    t4, 1
li    t5, 1

# storing the first elements
sw    t4, 0(t0)
sw    t5, 4(t0)
# moving the pointer forward
addi    t0, t0, 8

check:
bge    t3, t1, finish # if i >= n, finish

add    t6, t4, t5 # t6 = t4 + t5
mv    t5, t4 # t5 = t4
mv     t4, t6 # t4 = t6

sw    t6, 0(t0) # storing the sum in the array
addi    t0, t0, 4 # moving the pointer forward

addi     t3, t3, 1 # i++
j   check # looping

finish:
nop
