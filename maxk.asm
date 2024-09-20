//this program finds the greater of two numbers R1, R2 and stores the answer in R0
    @R1
    D=M

    @R2
    D=D-M

    @R2GREATER
    D;JLT

    @R1GREATER
    D;JGT

(R2GREATER)
    @R2
    D=M

    @R0
    M=D
    
    @END
    0;JMP

(R1GREATER)
    @R1
    D=M

    @R0
    M=D

(END)
    @END
    0;JMP


