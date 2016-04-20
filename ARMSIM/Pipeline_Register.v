////////////////////
//Pipeline Register
///////////////////

//Verificar el clock

module PipelineRegister (output reg [44:0] out, input [44:0] pipein ,input clk);

always @(posedge clk)
	out <= pipein;
	
endmodule

