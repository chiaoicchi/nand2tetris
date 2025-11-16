// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

// pseudocode
//      prev_color = 1
//  CHECK_KEYBOARD:
//      if (KBD == 0) goto SET_WHITE
//      color = -1
//      goto FILL
//  SET_WHITE:
//      color = 0
//  CHECK_CHANGE:
//      if (color == prev_color) goto CHECK_KEYBOARD
//      prev_color = color
//  FILL:
//      addr = SCREEN
//      i = 0
//      prev_color = color
//  FILL_LOOP:
//      if (i >= 8192) goto CHECK_KEYBOARD
//      RAM[addr] = color
//      addr = addr + 1
//      i = i + 1
//      goto FILL_LOOP


@prev_color
M=1

(CHECK_KEYBOARD)
    @KBD
    D=M
    @SET_WHITE
    D;JEQ

    @color
    M=-1
    @CHECK_CHANGE
    0;JMP

(SET_WHITE)
    @color
    M=0

(CHECK_CHANGE)
    @color
    D=M
    @prev_color
    D=D-M
    @CHECK_KEYBOARD
    D;JEQ

    @color
    D=M
    @prev_color
    M=D

(FILL)
    @SCREEN
    D=A
    @addr
    M=D

    @i
    M=0

(FILL_LOOP)
    @i
    D=M
    @8192
    D=D-A
    @CHECK_KEYBOARD
    D;JGE

    @color
    D=M
    @addr
    A=M
    M=D

    @addr
    M=M+1

    @i
    M=M+1

    @FILL_LOOP
    0;JMP
