// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.
// written by Kunle Bakare https://github.com/BSKHQ

// Put your code here.
(RESET_COUNTER)
	@SCREEN
	D=A
	@counter
	M=D
(LOOP)
	@KBD
	D=M
	@FILL_SCREEN
	D;JGT // if a key is pressed, fill screen
	@CLEAR_SCREEN
	D;JEQ // if no key is pressed, clear screen
	@LOOP
	0;JMP
	
(FILL_SCREEN)
	@CHECK_COUNTER_GREATER
	0;JMP
(FILL_SCREEN_CONT)
	@counter
	AD=M //store current SCREEN address in A (hence selecting) and D
	M=-1 //write -1 to current SCREEN word
	@counter
	M=D+1
	@LOOP
	0;JMP
	
(CLEAR_SCREEN)
	@CHECK_COUNTER_LESS
	0;JMP
(CLEAR_SCREEN_CONT)
	@counter
	AD=M //store current SCREEN address in A (hence selecting) and D
	M=0 //write 0 to current SCREEN word
	@counter
	M=D-1
	@LOOP
	0;JMP
	
(CHECK_COUNTER_LESS)
	@counter
	D=M
	@SCREEN
	D=D-A
	@RESET_COUNTER
	D;JLT //if counter is less than 16384, reset it
	@CLEAR_SCREEN_CONT
	D;JGE //else, continue clearing the screen
	
(CHECK_COUNTER_GREATER)
	@counter
	D=M
	@24575 //the last SCREEN word
	D=A-D
	@RESET_COUNTER_MAX
	D;JLT //if counter is GREATER than 24575, reset it 
	@FILL_SCREEN_CONT
	D;JGE //else, continue filling the screen
	
(RESET_COUNTER_MAX)
	@24575
	D=A
	@counter
	M=D
	@LOOP
	0;JMP
	
