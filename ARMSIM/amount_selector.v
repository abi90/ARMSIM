/////////////////
//Amount Selector
/////////////////
module amount_selector (output reg [4:0] Y, input S, input [31:0] IR);
	always @ (S, IR)
	if (S) Y = IR[11:7];
	else Y = {IR[11:8], 1'b0};
endmodule