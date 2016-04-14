//////////////
//Incrementor
/////////////

module incrementor(output reg [5:0] incout, input [5:0] incin)

initial incout = 6'b000000;

always @(*)

	incout = incin + 1'b1;
	
endmodule