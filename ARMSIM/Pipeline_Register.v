////////////////////
//Pipeline Register
///////////////////

//Verificar el clock

<<<<<<< HEAD
module PipelineRegister (output reg [44:0] out, input [44:0] pipein ,input clk);
=======
module Pipeline_Register (output reg [54:0] out, input [54:0] pipein ,input clk);
>>>>>>> c143549b906508c4e4c0d897055bd9b35887be32

always @(posedge clk)
	out <= pipein;
	
endmodule

