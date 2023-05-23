.data
v: .word 1, 4, 2, 6
# algorithm:
# iterate through the vector,
# if something's swapped, reset
v_len: .word 3

.text
la    t4, v
lw    t6, v_len
li    t5, 0 # i = 0

j    loop

dj_kelly_with_the_best_music:
li    t3, 4
mul    t5, t5, t3
sub     t4, t4, t5

li    t5, 0 # i = 0

loop:
ble   t6, t5, another_one

# storing important vars on the stack
addi    sp, sp, -24
sw    t4, 16(sp)
sw    t5, 8(sp)
sw    t6, 0(sp)

# getting the arguments ready
lw    a0, 0(t4)
lw    a1, 4(t4)

call    sort2

# sort 2 returnal
lw    t0, 16(sp)
lw    t1, 8(sp)
lw    t2, 0(sp)

addi    sp, sp, 24

li    t3, 1

sw    t1, 0(t4)
sw    t0, 4(t4)
addi     t4, t4, 4
addi    t5, t5, 1 # i++

beq    t2, zero, loop_end

back:
j    loop


loop_end:
beq    t0, t1, back # if min = max, then continue looping
j    dj_kelly_with_the_best_music

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


another_one:
nop




# NOTE: the loop cant be looped v_len times 
# since it likely wont be in order by just looping once

# swapped has to be used to check if everything's
# in the right place
