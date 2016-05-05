///////////
//Data Path
///////////
module data_path
(
	output reg [31:0] IR_Out,
	output reg MFC,
	output reg [3:0] Flags,
	input CLK,
	MFA, RW_RAM, SALU, RF_RW, SSAB,
	SSOP, SMA, STA, MAR_EN, SR_EN,
	MDR_EN, IR_EN, SHT_EN, ISE_EN,
	SGN_EN, CLR,
	input [1:0] DSS, WRA, SRA, SRB,  SISE, SALUB,
	input [3:0] ALUA
);

wire [31:0] aluOut,
outA,
outB,
branchExtension,
shifterOperand,
immSignExtOut,
mdrOut,
irOut,
signExtension1Out,
signExtension1In,
memDataOut,
SR_Flags_In,
SR_Flags_Out,
shifterOut,
aluBin;
wire [3:0]
addressAin,
addressBin,
writeAddressIn,
A;
wire [31:0] marOut;
wire [4:0] shifterAmountShift;
wire tempMFC;
wire [1:0] DataSize;

always @ (*)
begin
	IR_Out <= irOut;
	Flags <= SR_Flags_Out[3:0];
	MFC <= tempMFC;
end

register_32_bits  instructionRegister (irOut, memDataOut, IR_EN, CLR, CLK);

register_32_bits memoryDataRegister (mdrOut, signExtension1Out, MDR_EN, CLR, CLK );

sign_extension signExtension1 (signExtension1Out, signExtension1In, DataSize, SGN_EN);

mux_2x1 signExtension1Mux  (signExtension1In, SMA, aluOut, memDataOut);

register_32_bits memoryAddressRegister (marOut, aluOut, MAR_EN, CLR,CLK);

register_32_bits statusRegister (SR_Flags_Out, SR_Flags_In, SR_EN, CLR, CLK);

alu_arm alu (aluOut, SR_Flags_In[3],  SR_Flags_In[2],  SR_Flags_In[1], SR_Flags_In[0], A, outA, aluBin, SR_Flags );

mux_2x1_4 saluIn (A, SALU, ALUA, irOut[24:21]);

mux_4x1 muxAluBIn (aluBin, SALUB, mdrOut, 32'h00000004, branchExtension, shifterOut);

branch_ext branchExtension1 (branchExtension, irOut[23:0]);

shifter shifter1 (shifterOut, SR_Flags_In[4], shifterOperand, shifterAmountShift, SR_Flags_Out[4], SHT_EN, STA, irOut[6:5]);

mux_2x1 shifterInMux (shifterOperand, SSOP, immSignExtOut, outB);

amount_selector amountSelector ( shifterAmountShift, SSAB, irOut );

immediate_sign_extension immediateSignExtension (immSignExtOut, irOut, ISE_EN, SISE);

mux_4x1_4 writeAddressMux (writeAddressIn, WRA, irOut[15:12],4'hf, 4'he,irOut[19:16]);

mux_4x1_4 addressA (addressAin, SRA, irOut[19:16],4'hf, 4'he,irOut[15:12]);

mux_4x1_4 addressB (addressBin, SRB, irOut[19:16],4'hf, irOut[15:12],irOut[3:0]);

register_file registerFile ( outA, outB, writeAddressIn, addressAin, addressBin, aluOut, RF_RW, CLR, CLK);

ram_256 ram (memDataOut, tempMFC, MFA, RW_RAM, marOut[7:0], mdrOut, DataSize);

data_size_selector dss(DataSize, irOut, DSS);

endmodule
