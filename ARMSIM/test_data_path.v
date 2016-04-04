module test_data_path;
reg  [31: 0] I0; //Las entradas del módulo deben ser tipo reg
wire [4: 0] Y; //Las salidas deben ser tipo wire

	reg MFA, RW_RAM;
	reg [1:0] DataSize;
	reg RF_CLR, RF_RW; 
	reg [1:0] WRA, SRA, SRB, SALU, SISE, SALUB;
	reg [3:0] ALUA;
	reg SSAB, SSOP, SMA, ISO, MAR_EN, SR_EN,
	SE2_EN,	MDR_EN, SHIFTER_EN, IR_EN, SE1_EN,
	SR_CLR,	MAR_CLR, MDR_CLR, IR_CLR;

	output reg [31:0] IR_Out;
	output reg MFC;
	output reg [3:0] SR_Flags;
	
data_path dp (IR_Out, MFC, SR_Flags, MFA, RW_RAM, DataSize,
	RF_CLR, RF_RW, WRA, SRA, SRB, SALU, SISE, SALUB, 
	ALUA, SSAB, SSOP, SMA, ISO, MAR_EN, SR_EN,
	SE2_EN,	MDR_EN, SHIFTER_EN, IR_EN, SE1_EN,
	SR_CLR,	MAR_CLR, MDR_CLR, IR_CLR);

endmodule
module data_path(
	output reg [31:0] IR_Out, 
	output reg MFC, 
	output reg [3:0] SR_Flags,
	input MFA, RW_RAM, 
	input [1:0] DataSize,
	input RF_CLR, RF_RW, 
	input [1:0] WRA, SRA, SRB, SALU, SISE, SALUB, 
	input [3:0] ALUA,	
	input SSAB, SSOP, SMA, ISO, MAR_EN, SR_EN,
	SE2_EN,	MDR_EN, SHIFTER_EN, IR_EN, SE1_EN,
	SR_CLR,	MAR_CLR, MDR_CLR, IR_CLR);
endmodule