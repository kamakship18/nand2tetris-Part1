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

// Put your code here.


(RESET)     //clear the screen
@SCREEN
D = A       // base screen map address
@address
M = D       // initiate address = base address

(CHECK)     //check if keys have been pressed
@KBD
D = M
@BLACK      // if yes, goto black
D;JGT	
@WHITE      // if no, goto white
D;JEQ	

(BLACK)     // black screen
@whatToDo
M = -1	    // -1 = 111111111111111

@LOOP
0;JMP

(WHITE)     // white screen
@whatToDo
M = 0	

@LOOP
0;JMP

(LOOP)      // actual printing
@whatToDo	
D = M	     // whatToDo has -1 or 0

@address
A = M	    // using pointer to change M inside base address
M = D	

@address
D = M+1	  

@KBD
D = A-D	    // difference of current screen map address and keyboard map address

@address
M = M+1	        // update pixel address

@LOOP
D;JGT	     // end if difference is greater than 0

@RESET
0;JMP