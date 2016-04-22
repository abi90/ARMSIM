module test_encoder2;
wire [6:0] encOut;
reg [31:0]I;
encoder ec(encOut, I);
initial 
begin
#10 I <= 32'b11100010_00000001_00000000_00000000;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b11100011_10000000_00010000_00101000;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b11100111_11010001_00100000_00000000;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b11100101_11010001_00110000_00000010;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b11100000_10000000_01010000_00000000;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b11100000_10000010_01010000_00000101;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b11100010_01010011_00110000_00000001;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b00011010_11111111_11111111_11111101;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b11100101_11000001_01010000_00000011;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b11101010_00000000_00000000_00000001;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b00001011_00000101_00000111_00000100;
#10 $display("I=%b Result=%b", I, encOut);
#10 I <= 32'b11101010_11111111_11111111_11111111;
#10 $display("I=%b Result=%b", I, encOut);
end																	
endmodule