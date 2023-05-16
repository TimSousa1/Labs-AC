addi    sp, sp, -12
sw    ra, 8(sp)
sw    x16, 4(sp)
sw    x17, 0(sp)

jal    transpose

lw    ra, 8(sp)
lw    x16, 4(sp)
lw    x17, 0(sp)
addi    sp, sp, 12

transpose:
nop
jalr    zero, ra, 0
