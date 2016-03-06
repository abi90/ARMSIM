//Register of 32 bits
//Solo se ejecuta el always cuando:
//CLK 0 -> 1
//CLR 1 -> 0

module register_32_bits (output reg [31:0] Q, input [31:0] D,
			 input LE, CLR, CLK);

always @ (posedge CLK, negedge CLR)

if (!CLR) 
  
    Q <= 32'h00000000; //Clear es active low, 0 = clear y 1 = no esta clear

else if (!LE && CLK == 1) 
         
    Q <= D;

endmodule 
