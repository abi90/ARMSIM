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
	SR_CLR,	MAR_CLR, MDR_CLR, IR_CLR, CLK);

register_file reg_file();
branch_ext branch_ext();
immediate_sign_ext immediate_sign_ext();
amount_selector amount_selector();
shifter shifter();
alu_arm alu();
register_32_bits SR();
register_32_bits IR();
register_32_bits MDR();
register_32_bits MAR();
signExtension signExtension();
mux_4x1_4 write_address_mux
mux_4x1_4 address_A_Mux
mux_4x1_4 address_B_Mux
mux_2x1_4 alu_Op_Mux
mux_4x1 alu_B_Mux
mux_2x1 rf_imse_mux
mux_2x1 alu_ram_mux

endmodule