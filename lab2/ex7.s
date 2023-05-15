.data
v: .word 1, 3, 9, -1, 4, 2, 6, -5, -2, 3, -9, 8, 3, 6, 1, -1, 0, 4, 3, 5
n: .word 20
lbound: .word 0
ubound: .word 5

result: .word 0, 0

.text
la    x10, v
lw    x11, n
lw    x12, lbound
lw    x13, ubound

stats:
mv x20,x0 # int x20 = 0
mv x21,x0 # int x21 = 0
ble x11,x0,stats_end # if N < 0, end
stats_next:
lw x14,0(x10) # x14 = x10[i]
blt x14,x12,stats_skip # if x14 < lbound, skip
bgt x14,x13,stats_skip # if x14 > ubound, skip
stats_update: # otherwise update
addi x20,x20,1 # x20 + 1
add x21,x21,x14 # x21 + x14
stats_skip:
addi x10,x10,4 # i++
addi x11,x11,-1 # N--
bne x11,x0,stats_next # if N != 0, next
stats_end:
mv x10,x20 # x10 = x20 -> num of times summed
mv x11,x21 # x11 = x21 -> final sum

la    t0, result
sw    x10, 0(t0) 
sw    x11, 4(t0)

jalr x0,ra,0 # keeps the program running forever 

# sums up all the values in a vector,
# as long as they're within set boundary

# the RISC-V convention isn't being followed.
# t0-t6 aren't being used, which are the
# registers for temporary values
