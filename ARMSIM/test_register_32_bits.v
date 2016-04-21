module test_register_32_bits;
wire [31:0] Out;
reg [31:0] In;
reg EN,CLR,CLK;//Las entradas del módulo deben ser tipo reg

register_32_bits testReg(Out,In,EN,CLR,CLK);

initial begin
	#1 In =32'heeeeffff;
	EN <= 0;
	CLR <=1;
end
initial begin
	$monitor("In= %h\nOut=%h\nEN=%h\nCLR=%h\nCLK=%h\n",In,Out,EN,CLR,CLK);
end
initial begin
CLK <= 0;
repeat (5)
		begin
			#1 CLK <= ~CLK;
		end
end
endmodule