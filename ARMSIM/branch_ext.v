///////////////////
//Branch Extension
//////////////////
module branch_ext(output reg [31:0] out, input [23:0] ofst);

reg [31:0] tempofst;

always @ (ofst)
begin
   tempofst[23:0] = ofst;
   tempofst[31:24] = {8{ofst[23]}};
   tempofst = 32'd4 * tempofst;
   out =  tempofst;
end

endmodule
