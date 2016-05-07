/////////////////////
//Register of 32 bits
/////////////////////
module status_register_32_bits (output reg [31:0] Q, input [31:0] D, input LE, CLR, CLK);

initial	Q = 32'b0000000000000000000000000000000; // Start registers with 0
	always @ (negedge CLK, negedge CLR)
		if(!LE)
			Q <= D; // Enable Sync. Only occurs when Clk is high
		else if(!CLR) // clear
			Q <= 32'b0000000000000000000000000000000; // Clear Async
		else
			Q <= Q; // enable off. output what came out before
endmodule
