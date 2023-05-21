.data
x1: .word 1
y1: .word 2
x2: .word 3
y2: .word 4

.text
lw    a0, x1
lw    a1, x2
lw    a2, y1
lw    a3, y2

jal dist_reg



# the a0 register holds the final value
dist_reg:
sub    t0, a0, a1
sub    t1, a2, a3

mul    t0, t0, t0
mul    t1, t1, t1
add    a0, t0, t1

ret

dist_stack:
addi    sp, sp, -24
# in RV64 each regidter occuppies 8 byteis
sd    ra, 24(sp)

# pushing the registers to the stack
# (passing the arguments)
sw    a0, 12(sp)
sw    a1, 8(sp)
sw    a2, 4(sp)
sw    a3, 0(sp)

# popping them back to the registers
# (getting the arguments)
lw    t3, 0(sp)
lw    t2, 4(sp)
lw    t1, 8(sp)
lw    t0, 12(sp)

# placing the pinter back in position
addi    sp, sp, 16

# actually running the function
sub    t0, t0, t1
sub    t1, t2, t3

mul    t0, t0, t0
mul    t1, t1, t1
add    t0, t0, t1

# placing the result on the stack
addi    sp, sp, -4
sw     t0, 0(sp)

# getting the saved registers back
lw    t0, 0(sp)
ld    ra, 4(sp)
# placing the pointer back in place
addi    sp, sp, 12
# return
ret

