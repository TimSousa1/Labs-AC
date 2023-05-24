.data
x: .word 1, 2, 3, 4
y: .word 5, 6, 7, 8
n: .word 4

.text
la    t0, x
la    t1, y
lw    t2, n

li    x26, 1
li    x27, 2
li    t3, 3
li    t4, 4

addi    sp, sp, -24
sw    ra, 20(sp)
sw    t3, 16(sp)
sw    t4, 12(sp)
# args
sw    t0, 8(sp)
sw    t1, 4(sp)
sw    t2, 0(sp)

call    funsoma2

# storing the returned value on the t5 register
lw    t5, 0(sp)
addi    sp, sp, 4

lw    ra, 20(sp)
lw    t3, 16(sp)
lw    t4, 12(sp)
# args
lw    t0, 8(sp)
lw    t1, 4(sp)
lw    t2, 0(sp)

addi    sp, sp, 24

j finish

funsoma2:
lw    a0, 8(sp)
lw    a1, 4(sp)
lw    a2, 0(sp)

li    t0, 0 # sum = 0
li    t1, 0 # i = 0

mv    t2, a0
mv    t3, a1

loop:
bge    t1, a2, break
lw    t4, 0(t2)
lw    t5, 0(t3)

# saving important vars to the stack
addi    sp, sp, -24
sw    ra, 20(sp)
sw    a0, 16(sp) 
sw    a1, 12(sp)
sw    t0, 8(sp)
# args
sw    t4, 4(sp) 
sw    t5, 0(sp)

call    funsoma

# storing the returned value
lw    t4, 0(sp)
addi    sp, sp, 4
# getting vars back
lw    ra, 12(sp)
lw    a0, 8(sp) 
lw    a1, 4(sp)
lw    t0, 0(sp)
addi    sp, sp, 16

add    t0, t0, t4 # sum += result
addi    t1, t1, 1 # i++
addi    t2, t2, 4
addi    t3, t3, 4

j    loop
break:
addi    sp, sp, -4
sw    t0, 0(sp)
ret

funsoma:
lw    a0, 4(sp)
lw    a1, 0(sp)
addi    sp, sp, 8

slli    a1, a1, 1 # 2y
add    t0, a1, a0 # x + 2y

addi    sp, sp, -4
sw    t0, 0(sp)

ret

finish:
nop
