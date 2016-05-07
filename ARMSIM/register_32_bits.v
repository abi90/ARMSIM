/////////////////////
//Register of 32 bits
/////////////////////
module register_32_bits (output reg [31:0] Q, input [31:0] D, input LE, CLR, CLK);

always @ (negedge CLK, negedge CLR)
		if(!LE)
			Q = D; // Enable Sync. Only occurs when Clk is high
		else if(!CLR) // clear
			Q = 32'b0000000000000000000000000000000; // Clear Async
		else
			Q <= Q;

endmodule
