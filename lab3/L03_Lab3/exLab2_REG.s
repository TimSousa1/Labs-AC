.data
x: .word 1, 2, 3, 4
y: .word 5, 6, 7, 8
n: .word 4

.text
la    a0, x
la    a1, y
lw    a2, n

li    x26, 1
li    x27, 2
li    t3, 3
li    t4, 4

call    funsoma2

mv    t5, a0

lw    a0, 0(sp)
addi    sp, sp, 4

j finish

funsoma2:
addi    sp, sp, -12
sw    a0, 8(sp)
sw    t3, 4(sp)
sw    t4, 0(sp)

li    t0, 0 # sum = 0
li    t1, 0 # i = 0

mv    t2, a0
mv    t3, a1

loop:
bge    t1, a2, break
lw    t4, 0(t2)
lw    t5, 0(t3)

addi    sp, sp, -4
sw    ra, 0(sp)
call    funsoma

# storing the returned value
mv    t4, a0
# getting vars back
lw    ra, 8(sp)
lw    a1, 4(sp)
lw    a0, 0(sp) 
addi    sp, sp, 12

add    t0, t0, t4 # sum += result
addi    t1, t1, 1 # i++
addi    t2, t2, 4
addi    t3, t3, 4

j    loop
break:
# getting important values back
lw    t3, 4(sp)
lw    t4, 0(sp)
addi    sp, sp, 8

mv    a0, t0
ret

funsoma:
# saving important vars to the stack
addi    sp, sp, -12
sw    a1, 8(sp)
sw    a0, 4(sp) 
sw    t1, 0(sp)

mv    a0, t4
mv    a1, t5

slli    t1, a1, 1 # 2y
add    a0, t1, a0 # x + 2y

# restoring values
lw    t1, 0(sp)
addi    sp, sp, 4
ret

finish:
nop
