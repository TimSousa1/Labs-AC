.text
li    a0, 5
li    a1, 6

li    x26, 1
li    x27, 2
li    x28, 3
li    x29, 4

addi    sp, sp, -20
sw    ra, 16(sp)
sw    t3, 12(sp)
sw    t4, 8(sp)
# readying args
sw    a0, 4(sp)
sw    a1, 0(sp)

call    funsoma
# getting result
lw    t0, 0(sp)
addi    sp, sp, 4

lw    ra, 16(sp)
lw    t3, 12(sp)
lw    t4, 8(sp)
lw    a0, 4(sp)
lw    a1, 0(sp)
addi    sp, sp, 20

j finish

funsoma:
lw    a0, 4(sp)
lw    a1, 0(sp)

slli    a1, a1, 1 # 2y
add    t0, a1, a0 # x + 2y

addi    sp, sp, -4
sw    t0, 0(sp)

ret

finish:
nop
