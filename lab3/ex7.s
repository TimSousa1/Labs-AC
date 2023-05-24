.data
needle: .string "cool"
text: .string "mancool"
needleLen: .word 4
textLen: .word 7

.text
la    a0, needle
la    a1, text
lw    a2, needleLen
lw    a3, textLen

addi    sp, sp, -32
sw    a0, 24(sp)
sw    a1, 16(sp)
sw    a2, 8(sp)
sw    a3, 0(sp)

call    findstr

# value returned from function
lw    t0, 0(sp)
lw    ra, 8(sp)
addi    sp, sp, 16

j    finish

findstr:
lw    a0, 24(sp)
lw    a1, 16(sp)
lw    a2, 8(sp)
lw    a3, 0(sp)

addi    sp, sp, 32


blt    a3, a2, findstr_1

li    t4, 1 # match = 1

li    t5, 0
mv    t0, a0
mv    t1, a1

loop:
bge   t5, a2, break # if i >= needLen, break

lb    t2, 0(t0)
lb    t3, 0(t1)

bne   t2, t3, do
else:
addi    t5, t5, 1 # i++
# moving pointers forward
addi    t0, t0, 1
addi    t1, t1, 1
j    loop

do:
li    t4, 0
j    break


break:
li    t0, 1
beq    t4, t0, findstr_0 # if match = 1, return 0

addi    t2, a1, 1
addi    t3, a3, -1

# storing important vars in the stack
addi    sp, sp, -48
sw    ra, 40(sp)
#sw    t1, 40(sp)
sw    a0, 32(sp)
sw    a1, 24(sp)
sw    a2, 16(sp)
sw    a3, 8(sp)
sw    t4, 0(sp)


# move sp back for args
addi    sp, sp, -32
sw    a0, 24(sp)
sw    t2, 16(sp)
sw    a2, 8(sp)
sw    t3, 0(sp)


call    findstr


lw    t1, 0(sp)
addi     sp, sp, 8

# getting return address and variables back
lw    ra, 40(sp)
#lw    t1, 40(sp)
lw    a0, 32(sp)
lw    a1, 24(sp)
lw    a2, 16(sp)
lw    a3, 8(sp)
lw    t4, 0(sp)

addi    sp, sp, 48

bltz    t1, findstr_i
addi    t1, t1, 1

# returns i
findstr_i:
addi    sp, sp, -8
sw    t1, 0(sp)
ret

# returns 0
findstr_0:
li    t0, 0

addi   sp, sp, -8
sw    t0, 0(sp)
ret

# returns 1
findstr_1:
li    t0, -1

addi   sp, sp, -8
sw    t0, 0(sp)
ret

findstr_end:
ret

finish:
nop

