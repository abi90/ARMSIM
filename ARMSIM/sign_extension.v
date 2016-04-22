///////////////////////
//Sign Extension Module
///////////////////////
module sign_extension 
(	
	output reg [31:0] Out, 
	input [31:0] In, 
	input [1:0] dataSize, 
	input E
);
// Out - Inata Output
// In- Inata at input
//Inata size determines the type of extension
// 00 - Byte
// 01 - Half word
// 10 - word
// 11 - double word
// E - Enable
// CLR - Clear
	parameter BYTE = 2'b00;
	parameter HALF = 2'b01;
	parameter WORIn = 2'b10;
always @ (*)

if (E) 
  case(dataSize)
				BYTE:
						if(In[7] === 1'b1)
						begin
						Out = 32'h000000FF & In;
						Out = 32'hFFFFFF00 | In;	
						end
						else 
						begin
						Out = 32'h000000FF & In;
						//In = 32'hFFFFFFF0 | In;	
						end
				HALF:
						if(In[15] === 1'b1)
						begin
						Out = 32'h0000FFFF & In;
						Out = 32'hFFFF0000 | In;	
						end
						else 
						begin
						Out = 32'h0000FFFF & In;
						//In = 32'hFFFFFFF0 | In;	
						end
				WORIn:
						if(In[31] === 1'b1)
						begin
						Out = 32'hFFFFFFFF & In;
						Out = 32'h80000000 | In;	
						end
						else 
						begin
						Out = 32'h000000FF & In;
						//In = 32'hFFFFFFF0 | In;	
						end
				default:
						Out<=32'h80000000 |In; 
	endcase
   

else if (!E) 
         
    Out <= In;

endmodule 
