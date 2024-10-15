// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm
// Multiplication code written by Kunle Bakare https://github.com/BSKHQ

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
// first check if R0 or R1 are zero
   @R0
   D=M
   @ZERO
   D;JEQ
   
   @R1
   D=M
   @ZERO
   D;JEQ
   
   @R2
   M=0 //zero the output
   
   // check for the bigger number
   @R0
   D=M              // D = first number
   @R1
   D=D-M            // D = first number - second number
   @FIRST_GREATER
   D;JGT            // if D>0 (first is greater) goto FIRST_GREATER
   @SECOND_GREATER
   D;JLT            // if D<0 (second is greater) goto SECOND_GREATER
   
(FIRST_GREATER)
   @R0             
   D=M
   @value
   M=D //store R0 in value
   @R1             
   D=M
   @multiplier
   M=D //store R1 in multiplier
   @ADD
   0;JMP //go and do the addition
(SECOND_GREATER)
   @R1             
   D=M
   @value
   M=D //store R1 in value
   @R0             
   D=M
   @multiplier
   M=D //store R0 in multiplier
   @ADD
   0;JMP //go and do the addition
   
(ADD) //add value instruction number of times
   @value
   D=M
   @R2
   MD=D+M //increments and stores answer in R0 output
   @multiplier
   MD=M-1
   @ADD
   D;JGT

(END) //End program
   @END
   0;JMP   
   
(ZERO)
   @R2
   M=0
   @END
   0;JMP
   
