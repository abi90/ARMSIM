module mux_16x1 (output reg [31:0] Y, input [3:0]S, input [31:0] I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15);
	always @ (S, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15)
	case (S)
		4'b0000: Y=I0;
		4'b0001: Y=I1;
		4'b0010: Y=I2;
		4'b0011: Y=I3;
		4'b0100: Y=I4;
		4'b0101: Y=I5;
		4'b0110: Y=I6;
		4'b0111: Y=I7;
		4'b1000: Y=I8;
		4'b1001: Y=I9;
		4'b1010: Y=I10;
		4'b1011: Y=I11;
		4'b1100: Y=I12;
		4'b1101: Y=I13;
		4'b1110: Y=I14;
		4'b1111: Y=I15;
	endcase
endmodule
