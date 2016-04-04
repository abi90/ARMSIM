module amount_selector (output reg [5:0] Y, input S, input [32:0] IR);
	always @ (S, IR)
	if (S) Y = IR[11:7];
	else Y = {IR[11:8], 0};
endmodule