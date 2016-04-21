////////////////////////
//Control Unit
///////////////////////


module control_unit
(
	output reg [1:0] DSS, WRA, SRA, SRB,  SISE, SALUB, 
	output reg [3:0] ALUA,	
	output reg MFA, RW_RAM, SALU, RF_RW, SSAB, 
	SSOP, SMA, STA, MAR_EN, SR_EN,
	MDR_EN, IR_EN, SHT_EN, ISE_EN, 
	SGN_EN, CLR,
	input [31:0] IR_Out, 
	input MFC, CLK, 
	input [2:0] Flags	
);

wire [44:0] PL, RomOut;
wire InvIn, Sts;
wire [2:0] Mout;
wire [6:0] EnOut, PsOut, IrOut, M8x1Out, IncrIn;
always@(*)
begin
	DSS = PL[];
	WRA = PL[];
	SRA = PL[];
	SRB = PL[]  
	SISE = PL[];
	SALUB = PL[];
	ALUA = PL[];	
	MFA = PL[]; 
	RW_RAM = PL[];
	SALU = PL[];
	RF_RW = PL[];
	SSAB = PL[];
	SSOP = PL[];
	SMA = PL[];
	STA = PL[];
	MAR_EN = PL[]; 
	SR_EN = PL[];
	MDR_EN = PL[]; 
	IR_EN = PL[];
	SHT_EN = PL[];
	ISE_EN = PL[]; 
	SGN_EN = PL[]; 
	CLR = PL[];
end




mux_4x1_cu mux4x1 ( InvIn, PL[1:0] , _MFC, Flags[0], Flags[1], Flags[2]);

inverter inv ( Sts, Invin, PL[2]);

next_state_add_sel nsas ( Mout[2:0], PL[5:3], Sts);

mux_8x1_7_bits mux8x1 ( M8x1Out, Mout[2:0], EnOut, 7'b0000000, PL[44:38], IrOut, PsOut,7'b0000000, 7'b0000000, 7'b0000000 );

encoder endc ( EnOut, IR_Out);

incrementor inc ( IncrIn, M8x1Out);

seven_bit_register PastStateRegister ( PsOut, M8x1Out, _CLK);

seven_bit_register IncrementalRegister ( IrOut, IncrIn, _CLK);

Microstore_ROM rm ( RomOut, M8x1Out);

PipelineRegister pipelineregister ( PL, RomOut, _CLK);

endmodule







