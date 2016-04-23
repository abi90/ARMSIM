module test_inv2;
wire out;
reg in, inv;
inverter Inverter (out,in,inv);
initial begin
	in <= 0;
	inv <= 0;
	#10 inv <= 1;
end
initial $monitor("%b %b %b", inv, in,out);
endmodule