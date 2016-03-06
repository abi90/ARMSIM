module decoder_2x4(output [3:0] Y, input [1:0] I, input enable);
and (Y[0], ~I[1], ~I[0], enable);
and (Y[1], ~I[1], I[0], enable);
and (Y[2], I[1], ~I[0], enable);
and (Y[3], I[1], I[0], enable);
endmodule