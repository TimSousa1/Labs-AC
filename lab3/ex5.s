.data
x: .word 2
y: .word 3

.text

# readying the args
lw    a0, x
lw    a1, y

addi    sp, sp, -8
sw    ra, 0(sp)
call    power

j    finish

# returns on a0
power:

beqz    a1, power_return_1 # if y == 0, ret 1
li    t0, 1
and    t0, a1, t0
beqz    t0, do

else:

addi     sp, sp, -24 
sw    ra, 16(sp)
sw     a0, 8(sp) 
sw     a1, 0(sp)

addi    a1, a1, -1

call    power

mv    t0, a0

lw    ra, 16(sp)
lw     a0, 8(sp) 
lw     a1, 0(sp)

addi    sp, sp, 24

mul    a0, t0, a0

ret


do:

mul    a0, a0, a0
srli    a1, a1, 1

addi    sp, sp, -24
sw    ra, 16(sp)
sw    a0, 8(sp)
sw    a1, 0(sp)

call power

mv    t0, a0

lw    ra, 16(sp)
lw    a0, 8(sp)
lw    a1, 0(sp)

addi    sp, sp, 24

mv    a0, t0
ret


power_return_1:
li    a0, 1
ret


finish:
nop
