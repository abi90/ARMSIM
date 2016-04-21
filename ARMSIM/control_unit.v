////////////////////////
//Control Unit
///////////////////////
module control_unit
(
	output [31:0] ControlSignals,
	input [31:0] IR_Out, 
	input MFC, CLK, Reset,
	input [2:0] Flags	
);

wire [44:0] PL, RomOut;
wire InvIn, Sts, condOut;
wire [2:0] Mout;
wire [6:0] EnOut, PsOut, IncRegOut, M8x1Out, IncrOut;

always@(*)
begin
	ControlSignals <= PL[38:7]
end

condition_check checker(condOut,Flags,IR_Out);

mux_4x1_cu mux4x1 (InvIn, PL[1:0] , MFC, condOut, 7'b0000000, 7'b0000000);

inverter inv (Sts, Invin, PL[42]);

next_state_add_sel nsas (Mout[2:0], PL[41:39], Sts);

encoder endc (EnOut, IR_Out);

mux_8x1_7_bits mux8x1 (M8x1Out, Mout[2:0], EnOut, 7'b0000000, PL[6:0], IncRegOut, PsOut,7'b0000000, 7'b0000000, 7'b0000000 );

incrementor inc (IncrOut, M8x1Out);

seven_bit_register PastStateRegister ( PsOut, M8x1Out, CLK);

seven_bit_register IncrementalRegister ( IncRegOut, IncrOut, CLK);

mux_2x1_7_bits mux_2x1(RomIN, Reset, 7'b0000000, M8x1Out);

Microstore_ROM rom (RomOut, RomIN);

PipelineRegister pipelineregister (PL, RomOut, CLK);

endmodule







