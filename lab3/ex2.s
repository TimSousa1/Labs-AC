.data
d1: .word -1, 3,7,-2, 4,1,5,9,1,-5
d2: .word 6,-3,2,-2,-3,2,1,0,4,-2
n: .word 10
i: .word 0

.text

li    a0, 3
li    a1, 4
la    a2, d1
la    a3, d2
lw    a4, n

# arguments on a0-a4
jal    find_nearest 


find_nearest:
add    sp, sp, -24

sd    ra, 24(sp)
sw    a0, 16(sp) 
sw    a1, 12(sp) 
sw    a2, 8(sp) 
sw    a3, 4(sp) 
sw    a4, 0(sp)

# get results from unknown "dist"
# function
lw     a2, 0(a2)
lw     a3, 0(a3)
# arguments on a0-a3
jal    dist 
# getting the return from dist
# and storing it
mv    t0, a0 # t0 = dmin

# getting everything back from the 
# stack
lw    a4, 0(sp)
lw    a3, 4(sp)
lw    a2, 8(sp)
lw    a1, 12(sp)
lw    a0, 16(sp) 

ld    ra, 24(sp)
add   sp, sp, 24
# # # # # # # # # # # # # # # # # 
li    t1, 1 # k = 1
loop:
bge    t1, a4, finish # k >= n, finish
ble    t0, zero, finish # dmin <= 0, finish

addi    a2, a2, 4
addi    a3, a3, 4



dist(a0, a1, k(a2), k(a3))





# assuming a0 holds the return value
dist:
# code
ret

finish:
nop
