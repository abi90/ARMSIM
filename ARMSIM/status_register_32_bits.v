/////////////////////
//Register of 32 bits
/////////////////////
module status_register_32_bits (output reg [31:0] Q, input [31:0] D, input LE, CLR, CLK);

always@(*)

if (!CLR) Q <= 32'h00000000; //Clear es active low, 0 = clear y 1 = no esta clear
else if (!LE && CLK) Q <= D;

endmodule
