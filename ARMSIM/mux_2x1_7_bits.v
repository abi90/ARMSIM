module mux_2x1_7_bits (output reg [6:0] Y, input S, input [6:0] I0, I1);
always @ (S, I0, I1)
case (S)
1'b0: Y<=I0;
1'b1: Y<=I1;
endcase
endmodule
