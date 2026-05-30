`timescale 1ns/1ps
module ALU_tb;
  reg [7:0] A,B;
  reg [3:0] selection;
  wire [7:0] ALU_out;

  ALU uut(.A(A),.B(B),.sel(selection),.result(ALU_out));
  
  initial begin
    //Allows for waveform viewing
    $dumpfile("dump.vcd");
    $dumpvars(0, ALU_tb);
    
    //Test Addition
    A = 8'b00001111; //15 in decimal; arbitrarily used for testing  
    B = 8'b00000101; //5 in decimal 
    selection = 4'b0001; //1 in decimal: represents addition
    #10;
    $display("Addition: %b + %b = %b", A, B, ALU_out); //Should result in 20
    
    //Test Subtraction
    selection = 4'b0010;
    #10;
    $display("Subtraction: %b + %b = %b", A, B, ALU_out); //Should result in 10
    
    //Test Multiplication
    selection = 4'b0011;
    #10;
    $display("Multiplication: %b + %b = %b", A, B, ALU_out); //Should result in 75
    
    //Test A++
    selection = 4'b0100;
    #10;
    $display("A++: %b", A, ALU_out); //Should result in 16
    
    //Test A--
    selection = 4'b0101;
    #10;
    $display("A--: %b", A, ALU_out); //Should result in 14
    
    //Test left shift
    selection = 4'b0110;
    #10;
    $display("Left shift: %b", A, ALU_out); //Should result in b00011110, or 30
    
    //Test right shift
    selection = 4'b0111;
    #10;
    $display("Right shift: %b", A, ALU_out); //Should result in b00000111, or 7
    
    // Test Bitwise OR
    selection = 4'b1000;
    #10;
    $display("Bitwise OR: %b | %b = %b", A, B, ALU_out); //Should result in A

    // Test Bitwise AND
    selection = 4'b1001;
    #10;
    $display("Bitwise AND: %b & %b = %b", A, B, ALU_out); //Should result in B

    // Test Bitwise NOT
    selection = 4'b1010;
    #10;
    $display("Bitwise NOT: ~%b = %b", A, ALU_out); //Should result in ~A

    // Test Bitwise XOR
    selection = 4'b1011;
    #10;
    $display("Bitwise XOR: %b ^ %b = %b", A, B, ALU_out); //Should result in A ^ B 

    // Test Bitwise NOR
    selection = 4'b1100;
    #10;
    $display("Bitwise NOR: ~(%b | %b) = %b", A, B, ALU_out); //Should result in ~(A | B)

    // Test Bitwise NAND
    selection = 4'b1101;
    #10;
    $display("Bitwise NAND: ~(%b & %b) = %b", A, B, ALU_out); //Should result in ~(A & B)

    // Test Bitwise XNOR
    selection = 4'b1110;
    #10;
    $display("Bitwise XNOR: ~(%b ^ %b) = %b", A, B, ALU_out); //Should result in ~(A ^ B)

    // Test Preset (Force All High)
    selection = 4'b1111;
    #10;
    $display("Preset: Output = %b", ALU_out); //Should result in 11111111

    // Test Default / Catch-all (Testing an unused state)
    selection = 4'bxxxx; 
    #10;
    $display("Default Case: Output = %b", ALU_out); //Should result in xxxxxxxx

    // End simulation
    $finish;
  end
endmodule
    
    
