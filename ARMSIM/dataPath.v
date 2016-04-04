module dataPath (output reg [43:0]dataPathOut, output [31:0] instructionRegisterOut, input dataPathIn[43:0] );

assign dataPathOut= dataPathIn;
wire [21] selector;
wire [4:0] lowEnable ;
wire [1:0] highEnable ;
reg [4:0] clear ;
reg [3:0] flags ;
reg	RF_RW ;
reg [4:0] RAM ;
reg CLK ;

assign selector[0:20] = dataPathIn[0:20];
assign lowEnable = dataPathIn[25:21];
assign highEnable = dataPathIn[27:26];
assign clear = dataPathIn[32:28];
assign flags = dataPathIn[36:33];
assign RF_RW = dataPathIn[37];
assign RAM  = dataPathIn[42:38];
assign CLK = dataPathIn[43];

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
SR_Flags,
aluFlagsOut,
shifterOut,
aluBin;
wire [3:0] 
addressAin,
addressBin,
writeAddressIn,
SALU;
wire [32:0] marOut;
wire [4:0] shifterAmountShift;


register_32_bits  instructionRegister (irOut, mdrOut,lowEnable[1], clear[0], CLK);

register_32_bits memoryDataRegister (mdrOut, signExtension1Out,lowEnable[1], clear[1], CLK );

signExtension signExtension1 (signExtension1Out, signExtension1In, selector[6:5],highEnable[0], CLK);

mux_2x1 signExtension1Mux  (signExtension1In, selector[7],aluOut, memDataOut);

register_32_bits memoryAddressRegister (marOut, aluOut, lowEnable[2], clear[2],CLK);

register_32_bits statusRegister (SR_Flags,aluFlagsOut, lowEnable[4], clear[4], CLK);

alu_arm alu (aluOut, aluFlagsOut[0],  aluFlagsOut[1],  aluFlagsOut[2], aluFlagsOut[3], SALU, outA,aluBin, SR_Flags );

mux_2x1_4 saluIn (SALU, selector[8], selector[20:17], irOut[24:21]);

mux_4x1 muxAluBIn (aluBin, selector[10:9], mdrOut, 32'h00000004, branchExtension, shifterOut);

Branch_Ext branchExtension1 (branchExtension, irOut[23:0]);

shifter shifter1 (shifterOut, aluFlagsOut[1], shifterOperand,shifterAmountShift, SR_Flags[1], lowEnable[4],selector[4], irOUT[6:5]);

mux_2x1 shifterInMux (shifterOperand, selector[0], immSignExtOut,outB);

amount_selector amountSelector ( shifterAmountShift, selector[3], irOut );

immediate_sign_extension immediateSignExtension (immSignExtOut, irOut, highEnable[1], selector[2:1]);

mux_4x1_4 writeAddressMux (writeAddressIn, selector[12:11], irOut[15:12],4'hf, 4'he,irOut[19:16]);

mux_4x1_4 addressA (addressAin, selector[14:13], irOut[19:16],4'hf, 4'he,irOut[15:12]);

mux_4x1_4 addressB (addressBin, selector[15:16], irOut[19:16],4'hf, irOut[15:12],irOut[3:0]);


register_file registerFile ( outA, outB, writeAddressIn, addressAin, addressBin, aluOut, RF_RW, clear[3], CLK);

ram_256 ram (memDataOut, dataPathOut[39], RAM[0], RAM[2], marOut[7:0], mdrOut, RAM[4:3]);

assign dataPathOut[36:33]= SR_Flags[3:0];
assign instructionRegisterOut =irOut;


endmodule