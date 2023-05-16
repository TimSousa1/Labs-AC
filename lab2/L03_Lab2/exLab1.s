.data
v: .word -1, 1, 8
i: .half 1
j: .half 2

.text
la    t0, v
mv    t5, t0

lh    t6, j
li    t3, 4

# fetch V[j] and store it in t2
mul    t6, t6, t3
add     t0, t0, t6
lw    t2, 0(t0)

lh    t6, i
# fetch V[i] and store it in t1
mul    t6, t6, t3
add     t5, t5, t6
lw    t1, 0(t5)

bge    t1, t2, finish

mv    t4, t2 # aux = V[j]
sw    t1, 0(t0) # V[j] = V[i]
sw    t4, 0(t5) # V[i] = aux

finish:
nop
