////////////////////////
//4x1 MUX CU
////////////////////////
module mux_4x1_cu (output reg  Y, input [1:0]S, input I0, I1,I2, I3);
always @ (S, I0, I1, I2, I3)
	case (S)
		2'b00: Y=I0;
		2'b01: Y=I1;
		2'b10: Y=I2;
		2'b11: Y=I3;
	endcase
endmodule
