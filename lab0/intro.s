# Declaracao de variaveis
.data
var1:    .word    153, 0b11, 0xf
var2:    .half    -1227, 3443,213,0x14,13
var3:    .byte    255, 128, 0, 1
table1:  .zero    16
str1:    .string    "Introducao ao RIPES"

# Codigo
.text
    la    x5,var1
    lw    x6,0(x5)
    addi  x7, x6, 1
    sw    x7, 0(x5)

    la    x10, str1
    li    x17, 4
    
    ecall 
    
loop:    
    j    loop
