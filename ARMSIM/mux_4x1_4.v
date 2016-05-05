////////////////////
//MUX 4X1 of 4 bits
///////////////////
module mux_4x1_4 (output reg [3:0] Y, input [1:0]S, input [3:0] I0, I1,I2, I3);
always @ (S,I0, I1,I2, I3)
	case (S)
		2'b00: Y<=I0;
		2'b01: Y<=I1;
		2'b10: Y<=I2;
		2'b11: Y<=I3;
	endcase
endmodule
