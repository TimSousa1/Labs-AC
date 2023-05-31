# The following program processes two arbitrarily sized one-dimensional
# vectors composed by N integer elements, in order to execute
# the following pseudo-code algorithm:
 
#    int a[N] = { ..... }
#    int b[N] = { ..... }
#    int x = 1;
#    int n = 0;
#    register int i = 0;
#    while (b[i]>0){
#        x *= a[i] + a[N-1-i];
#        n += (N-1-i) - i;
#        i ++;
#    }

# Data section
        .data
# IMPORTANT: do not change this section
a:		.word  1, 5, 6, 6, 7, 2, 5, 2, 3, 2, 3, 4
b:		.word  4, 3, 1, 7, 2, 4, 9, -3, 5, 8, 1, 9
x: 		.word  1
n:		.word  0   

# Program section
		.text
# NOTE: Upon start, the Global-Pointer (gp=x3) points to the beginning of .data section
		addi    x11, x3, 0			# x11 - a's left index

		lw      x14, 100(x3)		# x14 - n - index distance accumulator
		lw      x15, 96(x3)			# x15 - x

        nop
# conflict! tries to access x11 before it was written
 		addi    x13, x11, 48		# x13 - b's left index
 
        nop
        nop

		li      x16, 0				# x16 - i
# conflict! tries to access x13 before it was written       
		addi    x12, x13, -4		# x12 - a's right index
		
        nop
        nop
        nop

while:	add     x20, x13, x16		# x20 = &b[i]

		lw      x22, 0(x11)			# x22 = a[i]
		lw      x23, 0(x12)			# x23 = a[N-1-i]

        nop
# conflict! tries to access x20 before it was written      
		lw      x21, 0(x20)			# x21 = b[i]

        nop
		add     x22, x22, x23		# x22 = a[i] + a[N-1-i]
        nop

# conflict! tries to access x21 before it was written        
		blez    x21, end			    # if b[i] <= 0 end the loop

# conflict! tries to access x22 before it was written    
 		mul     x15, x15, x22		# x15 = x15*x22 (x *= a[i] + a[N-1-i])

		sub     x22, x12, x11		# x22 = 4*((N-1-i)-i)
        
        nop
        nop
        nop
# conflict! tries to access x22 before it was written        
		srai    x22, x22, 2			# x22 = x22/4

		addi    x16, x16, 4			# i++
		addi    x11, x11, 4
		addi    x12, x12, -4
        
		add     x14, x14, x22		# n += x22
		jal     x0, while


end:    li    a7, 10
        
        sw 		x14, 100(x3)		    # store n's final value
		sw 		x15, 96(x3)			# store x's final value	
        nop
# conflict! tries to access a7 before it was written       
		ecall


# Expected result: M[x] = 1270080 = 136140h
#                  M[n] = 35      = 23h

