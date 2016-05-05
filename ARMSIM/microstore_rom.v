/////////
//CU ROM
/////////
module microstore_rom (output reg[44:0] out, input [6:0] index);

always @(index)
	case(index)
7'b0000000: out=45'b000011000000000111000000000000000000000000000;				
7'b0000001: out=45'b000011000101000111000100000001001111010000000;				
7'b0000010: out=45'b001101110100001110000111000000000000000000010;				
7'b0000011: out=45'b000010000100101111000100000000000000001011100;				
7'b0000100: out=45'b000011000001000111000100000000001111010000000;				
7'b0000101: out=45'b000010000000001111010100110000101000101010001;				
7'b0000110: out=45'b000011000001000111000100000000001111010000000;				
7'b0000111: out=45'b000010000000001111010100110000101110001010001;				
7'b0001000: out=45'b000011000000001111000100000000000000000000000;				
7'b0001001: out=45'b000010000001000111000100000000001111011010001;				
7'b0001010: out=45'b000010000000001111010101100000101101000001001;				
7'b0001011: out=45'b000011000001000111000100000000001111010000000;				
7'b0001100: out=45'b000010000001001111000100000011001100101010001;				
7'b0001101: out=45'b000011000001000111000100000000001111010000000;				
7'b0001110: out=45'b000010000001001111000100000011001101001010001;				
7'b0001111: out=45'b000011000001001111000100000011001100100000000;				
7'b0010000: out=45'b000010000001000111000100000000001111011010001;				
7'b0010001: out=45'b000010000001001111000100000011001101000010000;				
7'b0010010: out=45'b000010000101001111000100000011001100101010001;				
7'b0010011: out=45'b000010000101001111000100000011001101001010001;				
7'b0010100: out=45'b000010000100000111000100000000101100101010001;				
7'b0010101: out=45'b000010000100000111000100000000101101001010001;				
7'b0010110: out=45'b000011000001000111000100000000001111010000000;				
7'b0010111: out=45'b000010000000001111010100110000101100001010011;				
7'b0011000: out=45'b000011000001000111000100000000001111010000000;				
7'b0011001: out=45'b000010000000001111010100110000101101001010011;				
7'b0011010: out=45'b000011000000001111010100110000101100100000000;				
7'b0011011: out=45'b000010000001000111000100000000001111011010011;				
7'b0011100: out=45'b000010000000001111010100110000101101000011011;				
7'b0011101: out=45'b000011000001000111000100000000001111010000000;				
7'b0011110: out=45'b000010000000001111000100000000000000001010011;				
7'b0011111: out=45'b000011000001001111000100000011001100100000000;				
7'b0100000: out=45'b000010000001000111000100000000001101011010011;				
7'b0100001: out=45'b000011000001001111000100000011001100100000000;				
7'b0100010: out=45'b000010000001000111000100000000001111011010011;				
7'b0100011: out=45'b000010000001001111000100000011001101000100010;				
7'b0100100: out=45'b000010000001001111000100000011001000101010100;				
7'b0100101: out=45'b000010000001001111000100000011001101001010100;				
7'b0100110: out=45'b000010000000000111000100000000101100101010100;				
7'b0100111: out=45'b000010000000000111000100000000101101001010100;				
7'b0101000: out=45'b000011000001001111000100100001001111010000000;				
7'b0101001: out=45'b000010000100001111000100010100001001001011011;				
7'b0101010: out=45'b000010000000001111000100010100001001001011011;				
7'b0101011: out=45'b000010001000011011100100000000001100001011011;				
7'b0101100: out=45'b000010001011001011100100000011001100001011011;				
7'b0101101: out=45'b000011000101000111000100000000001111010000000;				
7'b0101110: out=45'b000010000100001111000100110000101100101010110;				
7'b0101111: out=45'b000011000101000111000100000000001111010000000;				
7'b0110000: out=45'b000010000000001111000100110000011101001010110;				
7'b0110001: out=45'b000011000000001111000100110000011000100000000;				
7'b0110010: out=45'b000010000001000111000100000000001111011010110;				
7'b0110011: out=45'b000010000000001111000100110000101101000110010;				
7'b0110100: out=45'b000011000001000111000100000000001111010000000;				
7'b0110101: out=45'b000010000001001111000100110011001100101010110;				
7'b0110110: out=45'b000011000001000111000100000000001111010000000;				
7'b0110111: out=45'b000010000001001111000100110011001101001010110;				
7'b0111000: out=45'b000011000001001111000100110011001100100000000;				
7'b0111001: out=45'b000010000101000111000100000000001111011010110;				
7'b0111010: out=45'b000010000001001111000100110011001101000111001;				
7'b0111011: out=45'b000010000101000111000100000011001100101010110;				
7'b0111100: out=45'b000010000101000111000100000011001101001010110;				
7'b0111101: out=45'b000010000100000111000100000000011100101010110;				
7'b0111110: out=45'b000010000100000101000100000000011101001011101;				
7'b0111111: out=45'b000011000101000111000100000000001111010000000;				
7'b1000000: out=45'b000010000000001111000100110000011100101011000;				
7'b1000001: out=45'b000011000101000111000100000000001111010000000;				
7'b1000010: out=45'b000010000000001111000100110000011101001011000;				
7'b1000011: out=45'b000011000000001111000100110000011100100000000;				
7'b1000100: out=45'b000010000101000111000100000000001111011011000;				
7'b1000101: out=45'b000010000000001111000100110000011101001000100;				
7'b1000110: out=45'b000011000001000111000100000000001111011011000;				
7'b1000111: out=45'b000010000001001111000100110011001100101000111;				
7'b1001000: out=45'b000011000001000111000100000000001111010000000;				
7'b1001001: out=45'b000010000001001111000100110011001101001011000;				
7'b1001010: out=45'b000011000001001111000100110011001100100000000;				
7'b1001011: out=45'b000010000101000111000100000000001111011011000;				
7'b1001100: out=45'b000010000001001111000100110011001101001001011;				
7'b1001101: out=45'b000010000101000111000100000011001100101011000;				
7'b1001110: out=45'b000010000101000111000100000011001101001011000;				
7'b1001111: out=45'b000010000100001101000100000000011100101011000;				
7'b1010000: out=45'b000010000100000111000100000000011101001011000;				
7'b1010001: out=45'b000011000101101101001101000010001100000000000;				
7'b1010010: out=45'b000111100100001111000100000000000000001011011;				
7'b1010011: out=45'b000111100000001111000100000000000000001010100;				
7'b1010100: out=45'b000011000000101101001100000000000000000000000;				
7'b1010101: out=45'b000010000000001111000100000000000011101011011;				
7'b1010110: out=45'b000011000101001101000110000010001111010000000;				
7'b1010111: out=45'b000111100101001101000110000010001111011011011;				
7'b1011000: out=45'b000111110000101101000110000000000011011011001;				
7'b1011001: out=45'b000011000000101111000110000000000011010000000;				
7'b1011010: out=45'b000011000000101111000100000000000011010000000;				
7'b1011011: out=45'b000010000000000111000100010100000101000000001;				
7'b1011100: out=45'b011100000100001111000100000000000000001011011;				
7'b1011101: out=45'b000010000101001101000110000010001111011010110;				
7'b1011110: out=45'b000010001111001011100100000011001100001011011;																																								                                                                          																					
	endcase

endmodule
