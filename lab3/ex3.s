.data
a: .word 3
b: .word 4

.text
lw     a0, a
lw     a1, b

call    sort2

lw    t0, 16(sp)
lw    t1, 8(sp)
lw    t2, 0(sp)

addi    sp, sp, 24

j    finish

sort2:

addi    sp, sp, -24
sw    ra, 16(sp)
sw    a0, 8(sp)
sw    a1, 0(sp)

call    min

mv    t0, a0

lw    a1, 0(sp)
lw    a0, 8(sp) 
lw    ra, 16(sp)

# not increasing stack pointer since 
# we'd need to store everything back
# which is unecessary since the args are
# the same

call    max

mv    t1, a0

lw    a1, 0(sp)
lw    a0, 8(sp) 
lw    ra, 16(sp)

addi    sp, sp, 24

slt    t2, a1, a0

addi    sp, sp, -24
sw    t0, 16(sp)
sw    t1, 8(sp)
sw    t2, 0(sp)

ret


min:
blt    a1, a0, min_b # b < a, min = b
ret # else min = a
min_b:
mv    a0, a1 # min = b
ret


max:
blt    a0, a1, max_b # a < b, max = b
ret
max_b:
mv    a0, a1
ret


finish:
nop
