module test_cu;
//Las entradas del módulo deben ser tipo reg
//Las salidas deben ser tipo wire
wire  [44: 0] I0; 
//Memory Variables
reg [31:0] dat[0:255];
parameter WORD = 2'b10;
parameter WRITE = 1'b1;
parameter ENABLE = 1'b0;
reg [31:0] temp_data_in;
reg [7:0] temp_addr;
	reg [31:0] IR_Out;
	reg [3:0] Flags;
	reg CLK, CLR, Reset;
	reg MFC;

control_unit cu (I0[38:7],IR_Out, MFC, CLK, Reset,Flags);

initial 
	begin
		CLK = 0;
		Reset<=0;
		MFC <=1;
		Flags <=4'h0;
		IR_Out <= 32'b11100010_00000001_00000000_00000000;
		#10 Reset =1;
		#1 repeat (300) 
		begin
			#1 CLK = ~CLK;
		end
end

initial begin
$display("I0[38:7]\tIR_Out\tMFC  CLK  Reset Flags");
$monitor("%b %b %h %h %h %h", I0[38:7],IR_Out, MFC, CLK, Reset,Flags);
end
endmodule