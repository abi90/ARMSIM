module test_encoder;
wire [6:0] encOut;
reg [31:0]I;
encoder ec(encOut, I);
initial 
begin
	#10 I = 32'bxxxx01000x00xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0000100,encOut);																		
	#10 I = 32'bxxxx01001x00xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0000110,encOut);																		
	#10 I = 32'bxxxx01010x10xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0001000,encOut);																		
	#10 I = 32'bxxxx01011x10xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0001010,encOut);																		
	#10 I = 32'bxxxx01100x00xxxxxxxx00000000xxxx;
	$display("I=%b Expected=%b Result=%b", I,0001011,encOut);																		
	#10 I = 32'bxxxx01101x00xxxxxxxx00000000xxxx;
	$display("I=%b Expected=%b Result=%b", I,0001101,encOut);																		
	#10 I = 32'bxxxx01110x10xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0001111,encOut);																		
	#10 I = 32'bxxxx01111x10xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0010001,encOut);																		
	#10 I = 32'bxxxx01110x00xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0010010,encOut);																		
	#10 I = 32'bxxxx01111x00xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0010011,encOut);																		
	#10 I = 32'bxxxx01010x00xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0010100,encOut);																		
	#10 I = 32'bxxxx01011x00xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0010101,encOut);																		
	#10 I = 32'bxxxx01000x01xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0010110,encOut);																		
	#10 I = 32'bxxxx01001x01xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0011000,encOut);																		
	#10 I = 32'bxxxx01010x11xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0011010,encOut);																		
	#10 I = 32'bxxxx01011x11xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0011100,encOut);																		
	#10 I = 32'bxxxx01100x01xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0011101,encOut);																		
	#10 I = 32'bxxxx01101x01xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0011111,encOut);																		
	#10 I = 32'bxxxx01110x11xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0100001,encOut);																		
	#10 I = 32'bxxxx01111x11xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0100011,encOut);																		
	#10 I = 32'bxxxx01110x01xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0100100,encOut);																		
	#10 I = 32'bxxxx01111x01xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0100101,encOut);																		
	#10 I = 32'bxxxx01010x01xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0100110,encOut);																		
	#10 I = 32'bxxxx01011x01xxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0100111,encOut);																		
	#10 I = 32'bxxxx1011xxxxxxxx111xxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0101000,encOut);																		
	#10 I = 32'bxxxx1010xxxxxxxx111xxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0101010,encOut);																		
	#10 I = 32'bxxxx001xxxxxxxxxxxxxxxxxxxxxxxxx;
	$display("I=%b Expected=%b Result=%b", I,0101011,encOut);																		
	#10 I = 32'bxxxx000xxxxxxxxxxxxxxxxxxxx0xxxx;
	$display("I=%b Expected=%b Result=%b", I,0101100,encOut);																		
	#10 I = 32'bxxxx00000100xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0101101,encOut);																		
	#10 I = 32'bxxxx00001100xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0101111,encOut);																		
	#10 I = 32'bxxxx00010110xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0110001,encOut);																		
	#10 I = 32'bxxxx00011110xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0110011,encOut);																		
	#10 I = 32'bxxxx00000000xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0110100,encOut);																		
	#10 I = 32'bxxxx00001000xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0110110,encOut);																		
	#10 I = 32'bxxxx00010010xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0111000,encOut);																		
	#10 I = 32'bxxxx00011010xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0111010,encOut);																		
	#10 I = 32'bxxxx00010000xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0111011,encOut);																		
	#10 I = 32'bxxxx00011000xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0111100,encOut);																		
	#10 I = 32'bxxxx00010100xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0111101,encOut);																		
	#10 I = 32'bxxxx00011100xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0111110,encOut);																		
	#10 I = 32'bxxxx00000101xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,0111111,encOut);																		
	#10 I = 32'bxxxx00001101xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1000001,encOut);																		
	#10 I = 32'bxxxx00010111xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1000011,encOut);																		
	#10 I = 32'bxxxx00011111xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1000101,encOut);																		
	#10 I = 32'bxxxx00000001xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1000110,encOut);																		
	#10 I = 32'bxxxx00001001xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1001000,encOut);																		
	#10 I = 32'bxxxx00010011xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1001010,encOut);																		
	#10 I = 32'bxxxx00011011xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1001100,encOut);																		
	#10 I = 32'bxxxx00010001xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1001101,encOut);																		
	#10 I = 32'bxxxx00011001xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1001110,encOut);																		
	#10 I = 32'bxxxx00010101xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1001111,encOut);																		
	#10 I = 32'bxxxx00011101xxxxxxxxxxxx1xx1xxxx;
	$display("I=%b Expected=%b Result=%b", I,1010000,encOut);
end																	
endmodule