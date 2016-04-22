///////////////////
//Branch Extension
//////////////////
module branch_ext(output reg [31:0] out, input [23:0] ofst);

reg [25:0] tempofst;

always @ (*)
begin
	//Assigns tempofst the value of ofst
	tempofst=ofst;
	//Shifts tempofst by two bits
	tempofst=tempofst<<2;
	//Two's complement to output of branch extension
   out = $signed(tempofst);
end

endmodule
