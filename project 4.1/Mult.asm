// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.


    @mul
    M = 0   // set mul = 0
    @i
    M = 0   //set i = 0

    (LOOP)
    @R0     
    D = M
    @i
    D = M - D   // calculate difference between RAM[1] and i
    @STOP
    D;JEQ       // end if difference is > 0

    @R1
    D = M
    @mul
    M = M + D   // set mul = mul + RAM[1]

    @R1
    D = A
    @i
    M = M + D   // i++

    @LOOP
    0;JMP       // loop it 

    (STOP)
    @mul
    D = M
    @R2
    M = D       // RAM[2] = mul
    
    (END)
    @END
    0;JMP       // end program