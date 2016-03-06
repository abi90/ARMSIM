module decoder_4x16(output [15:0] Y, input [3:0] I, input enable);
and (Y[0], ~I[3], ~I[2], ~I[1], ~I[0],enable);
and (Y[1], ~I[3], ~I[2], ~I[1], I[0],enable);
and (Y[2], ~I[3], ~I[2], I[1], ~I[0],enable);
and (Y[3], ~I[3], ~I[2], I[1], I[0],enable);
and (Y[4], ~I[3], I[2], ~I[1], ~I[0],enable);
and (Y[5], ~I[3], I[2], ~I[1], I[0],enable);
and (Y[6], ~I[3], I[2], I[1], ~I[0],enable);
and (Y[7], ~I[3], I[2], I[1], I[0],enable);
and (Y[8], I[3], ~I[2], ~I[1], ~I[0],enable);
and (Y[9], I[3], ~I[2], ~I[1], I[0],enable);
and (Y[10],I[3], ~I[2], I[1], ~I[0],enable);
and (Y[11],I[3], ~I[2], I[1], I[0],enable);
and (Y[12],I[3], I[2], ~I[1], ~I[0],enable);
and (Y[13],I[3], I[2], ~I[1], I[0],enable);
and (Y[14],I[3], I[2], I[1], ~I[0],enable);
and (Y[15],I[3], I[2], I[1], I[0],enable);
endmodule