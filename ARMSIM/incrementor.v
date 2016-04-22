//////////////
//Incrementor
/////////////
module incrementor(output reg [6:0] incout, input [6:0] incin);

initial incout = 7'b0000000;

always @(*) incout = incin + 1'b1;
	
endmodule