.data
str: .string "funny"

.text

la    a0, str

call    strlen

j    finish

strlen:
li    t0, 0

loop:
lb    t1, 0(a0)
beqz   a0, strlen_return
addi   t0, t0, 1

addi    a0, a0, 1

j    loop

strlen_return:
mv    a0, t0
ret

finish:
nop
