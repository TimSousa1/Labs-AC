.data
a: .zero 40

.text
li    t5, 0
li    t6, 11
la    t0, a

check:
addi    t5, t5, 1
beq    t5, t6, finish

mul    t4, t5, t5

sw    t4, 0(t0)
addi    t0, t0 ,4

j    check


finish:
nop


