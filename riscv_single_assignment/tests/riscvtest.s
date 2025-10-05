# riscvtest.s

# Test the RISC-V processor.  

# If successful, it should write the value 25 to address 100

#       RISC-V Assembly         Description               Address   Machine Code
main:   addi x2, x0, -1         # x2 = -1                  0         FFF00113   
        addi x3, x0, 0          # x3 = 0                   4         00000193
        andn x7, x3, x2         # x7 = -1 & ~0             8         0021838B
        addi x2, x0, 25         # x2 = 25                  C         01900113
        addi x3, x0, 15         # x3 = 15                 10         00F00193
        maxu x7, x3, x2         # x7 = maxu(x3, x2)       14         0221B38B
end:    sw   x7, 100(x0)        # mem[100] = 25           4C         06702223
done:   beq  x2, x2, done       # infinite loop           50         00210063
		
		