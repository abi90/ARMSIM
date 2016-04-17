/*
	CU Incrementer Register and Past State Register
*/
module seven_bit_register(output reg [6:0] out, input [6:0] in ,input clk)
always @(posedge clk)
	out <= in;
endmodule