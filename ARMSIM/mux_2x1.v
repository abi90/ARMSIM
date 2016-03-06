module mux_2x1 (output reg [31:0] Y, input S, input [31:0] I0, I1);
always @ (S, I0, I1)
if (S) Y = I1;
else Y = I0;
endmodule