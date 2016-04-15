////////////////////
//Pipeline Register
///////////////////

//Verificar el clock

module PipelineRegister (output reg [54:0] out, input [54:0] pipein ,input clk)

always @(posedge clk)
	out <= pipein;
	
endmodule
