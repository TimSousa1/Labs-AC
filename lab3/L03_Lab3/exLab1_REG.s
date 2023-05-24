.text
li    a0, 5
li    a1, 6

li    x26, 1
li    x27, 2
li    x28, 3
li    x29, 4

addi    sp, sp, -4
sw    a0, 0(sp)

call    funsoma

mv    t0, a0

# get values back
lw    a0, 0(sp)
addi    sp, sp, 4

j finish

# returns value in a0
funsoma:
slli    t1, a1, 1 # 2y
add    a0, t1, a0 # x + 2y

ret

finish:
nop
