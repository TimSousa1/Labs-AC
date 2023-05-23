.data
d1: .word -1, 3,7,-2, 4,1,5,9,1,-5
d2: .word 6,-3,2,-2,-3,2,1,0,4,-2
n: .word 10
i: .word 0

.text

# placing arguments in their respective 
# registers
li    a0, 3
li    a1, 4

la    a2, d1
la    a3, d2

lw    a4, n

# running the function
call    find_nearest

la    t0, i
sw    a0, 0(t0)

j    finish


find_nearest:
addi    sp, sp, -48
# storing vars on the stack
sw    a4, 0(sp)
sw    a3, 8(sp)
sw    a2, 16(sp)
sw    a1, 24(sp)
sw    a0, 32(sp)
sw    ra, 40(sp)
# preparing the arguments
lw    a2, 0(a2)
lw    a3, 0(a3)

call    dist

mv t0, a0 # t0 = dmin = dist(...)

# getting arguments back from the stack
lw    a4, 0(sp)
lw    a3, 8(sp)
lw    a2, 16(sp)
lw    a1, 24(sp)
lw    a0, 32(sp)
lw    ra, 40(sp)

addi    sp, sp, 48

# for loop
# (t0 -> dmin, t1, -> k)
# (a0-a4 -> args)

li    t5, 0 # t5 = index = 0
li    t1, 0 # k = 0

mv    t2, a2
mv    t3, a3

check:
addi    t1, t1, 1
bge    t1, a4, find_nearest_return # if k >= n, end loop
blez    t0, find_nearest_return # if dmin <= 0, end loop

# pointing to the next element
# and setting up copies of the pointer

addi    t2, t2, 4
addi    t3, t3, 4

# storing important vars in the stack
addi    sp, sp, -72
sw    t1, 0(sp)
sw    t0, 8(sp)
sw    a4, 16(sp)
sw    a3, 32(sp)
sw    a2, 40(sp)
sw    a1, 48(sp)
sw    a0, 56(sp)
sw    ra, 64(sp)

# readying the args
lw    a2, 0(t2)
lw    a3, 0(t3)

call    dist

mv    t4, a0 # t4 = d = dist(...)

# getting values back from the stack
lw    t1, 0(sp)
lw    t0, 8(sp)
lw    a4, 16(sp)
lw    a3, 32(sp)
lw    a2, 40(sp)
lw    a1, 48(sp)
lw    a0, 56(sp)
lw    ra, 64(sp)

addi    sp, sp, 72

bge    t4, t0, check # if d >= dmin, check
mv    t0, t4 # dmin = d
mv    t5, t1 #  index = k

j    check


find_nearest_return:
mv    a0, t5

ret


# return value stored in a0
dist:
sub    t0, a0, a2
sub    t1, a1, a3

mul    t0, t0, t0
mul    t1, t1, t1
add    a0, t0, t1

ret

finish:
nop

