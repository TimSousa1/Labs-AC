# the corresponding temporary registers
# should get stored on the stack

.text
# storing the registers
addi    sp, sp, -16

sw    t3, 0(sp)
sw    t4, 4(sp)
sw    t5, 8(sp)
sw    t6, 12(sp)
# loading them back to the registers
lw    t3, 0(sp)
lw    t4, 4(sp)
lw    t5, 8(sp)
lw    t6, 12(sp)
