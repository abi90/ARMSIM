//Sign Extension Module
// Q - Data Output
// D- Data at input
//Data size determines the type of extension
// 00 - Byte
// 01 - Half word
// 10 - word
// 11 - double word
// E - Enable
// CLR - Clear
// CLK - Clock 

module signExtension 
(	output reg [31:0] Q, 
	input [31:0] D, 
	input [1:0] dataSize, 
	input E, CLR, CLK
	);
	parameter BYTE = 2'b00;
	parameter HALF = 2'b01;
	parameter WORD = 2'b10;
always @ (posedge CLK, negedge CLR)

if (!CLR && E) 
  case(dataSize)
				BYTE:
						if(D[7] === 1'b1)
						begin
						Q = 32'h000000FF & D;
						Q = 32'hFFFFFF00 | D;	
						end
						else 
						begin
						Q = 32'h000000FF & D;
						//D = 32'hFFFFFFF0 | D;	
						end
				HALF:
						if(D[15] === 1'b1)
						begin
						Q = 32'h0000FFFF & D;
						Q = 32'hFFFF0000 | D;	
						end
						else 
						begin
						Q = 32'h0000FFFF & D;
						//D = 32'hFFFFFFF0 | D;	
						end
				WORD:
						if(D[31] === 1'b1)
						begin
						Q = 32'hFFFFFFFF & D;
						Q = 32'h80000000 | D;	
						end
						else 
						begin
						Q = 32'h000000FF & D;
						//D = 32'hFFFFFFF0 | D;	
						end
				default:
						Q<=32'h80000000 |D; 
	endcase
   

else if (!E && CLK == 1) 
         
    Q <= D;

endmodule 
