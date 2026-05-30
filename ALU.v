module ALU (
  input [7:0] A, B, input [3:0] sel, output reg [7:0] result
);
  always @(*) begin
    case(sel)
      4'b0000: result =  8'b00000000; //Clear
      4'b0001: result = A + B; //Addition
      4'b0010: result = A - B; //Subtraction
      4'b0011: result = A*B; //Could be an error because creates a 16 bit vector
      4'b0100: result = A + 1;
      4'b0101: result = A - 1;
      4'b0110: result = A<<1; //Left shift
      4'b0111: result = A>>1; //Right shift
      4'b1000: result = A | B; //Or (bitwise)
      4'b1001: result = A & B; //And (bitwise)
      4'b1010: result = ~A; //NOT 
      4'b1011: result = A ^ B; //XOR
      4'b1100: result = ~(A | B); //NOR
      4'b1101: result = ~(A & B); //NAND
      4'b1110: result = ~(A ^ B); //XNOR
      4'b1111: result = 8'b11111111; //Preset
      default: result = 8'bXXXXXXXX; //Catch-all default
    endcase
  end
endmodule


