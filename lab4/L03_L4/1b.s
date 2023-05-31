# 1. CONSIDERAR UM PROCESSADOR SEM FORWARDING (5-stage processor w/o forwarding or hazard detection)
#    1A. Identificar os hazards [2 pontos]
#    1B. Resolver com NOPs [1 ponto]
#    1C. Reordenar as instruções de forma a reduzir o numero de NOPs [1 ponto]
# 
# 2. CONSIDERAR UM PROCESSADOR COM FORWARDING
#    Comparar a estatística (IPC, racio instruções uteis/total) de 1B, 1C no processador original (5-stage processor w/o forwarding or hazard detection) e completo (5-stage processor) [1 ponto]


# Computer Architectures
# Lab: Pipelining

# The following program processes two arbitrarily sized one-dimensional
# vectors composed by N integer elements, in order to execute
# the following pseudo-code algorithm:

#    int a[N] = { ..... }
#    int b[N] = { ..... }
#    int N = /* Vectors Size */
#    int res1 = 0
#    int res2 = 1;
#    register int i = 0;
#
#    while (b[N-i-1] > 0 ) {
#        res1 += a[i] + b[N-i-1];
#        res2 *= b[N-i-1] + i;
#        i++;
#    }

.data
# IMPORTANT: do not change this section
a:    .word 1, 5, 9, 2, 3, 4, 2, 8, 7, 5, 3, 3
b:    .word 2, 2, -1, 6, 5, 2, 3, 4, 2, 4, 7, 5
res1:  .word 0
res2:  .word 1

.text
# NOTE: Upon start, the Global-Pointer (gp=x3) points to the beginning of .data section
addi x12, x3, 0 #x12 = a's left index # confllito de dados com o proximo addi

nop
nop

addi x13, x12, 92 #x13 = b's right index # conflito de dados com o proximo addi


nop
nop

addi x11, x13, 4 #x11 = &res1 confito de dados com o proximo addi

nop
nop

addi x14, x11, 4 #x14 = &res2 # conflito de dados com o lw x23, 0(x14)

lw x22, 0(x11) #x22 = res1
nop
lw x23, 0(x14) #x23 = res2
li x16, 0 #x16 = i

while:

    sub x18, x13, x16 #x18 = &b[N-i-1] /// conflito de dados com o proximo lw

nop
nop

    lw x18, 0(x18) #x18 = b[N-i-1] /// conflito de dados com o proximo blez
    
nop
nop

    blez x18, end #if !(b[N-i-1] > 0) exit loop /// conflito de controlo - flush necessario
    add x19, x12, x16 #x19 = &a[i] /// conflito de dados com o proximo lw
nop
nop
    lw x19, 0(x19) #x19 = a[i] /// conflito de dados com o proximo add

nop
nop
    add x19, x19, x18 #x19 = a[i] + b[N-i-1]
    srai x20,x16,2    #i/4 /// conflito de dados com o proximo add
nop
nop
    add x20, x18, x20 #x20 = b[N-i-1] + i
    
    add x22, x22, x19 #res1 += x19 # conflito de dados com o proximo mul
nop
nop
    mul x23, x23, x20 #res *= x20
    
    addi x16, x16, 4 #i++
    
    jal x0, while # conflito de controlo - flush necessario

end:
    sw x22, 0(x11)
    sw x23, 0(x14)
    
    
# Expected result: M[res1] = 79 = 4Fh
#                  M[res2] = 103219200 = 6270000h

