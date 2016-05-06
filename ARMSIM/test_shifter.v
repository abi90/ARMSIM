module test_shifter;
reg [31:0] data;
wire [31:0] result;
reg [1:0] shift_SEL;
reg [4:0] shiftNumber;
reg enable; 
wire C_flag;
//      shifter1(Out, Cout, Operand, Amount, CIn, EN, STA,  IR);
shifter shifter1 (result, C_flag, data, shiftNumber, C_flag, enable, 0, shift_SEL);

initial #1000 $finish;

initial begin
	
	data = 32'd4294967285;
	shift_SEL = 2'b00;
	shiftNumber = 5'd2;
	enable = 1'b1;

	#5 shift_SEL = 2'b01;
	   shiftNumber = 5'd0;
	#10 shift_SEL = 2'b10;
	    shiftNumber = 5'd3;
	#15 shift_SEL = 2'b11;
	    shiftNumber = 5'd16;

	#20 enable = 1'b0;

	    shift_SEL = 2'b00;
	    shiftNumber = 5'd31;
	
end
initial begin

	$monitor("Enable %b\n Data %b\n Shift %b\n Shift Number %b \n Result %b \n\n", enable, data, shift_SEL, shiftNumber, result);

end

endmodule