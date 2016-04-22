////////////////////
//Pipeline Register
///////////////////
module pipeline_register (output reg [44:0] out, input [44:0] pipein ,input clk);
always @(posedge clk) out <= pipein;
endmodule