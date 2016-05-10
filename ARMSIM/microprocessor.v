module microprocessor;
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
	wire [31:0] IR_Out;
	wire [3:0] Flags;
	reg CLK, CLR, Reset;
	wire MFC;

control_unit cu (I0[38:7],IR_Out, MFC, CLK, Reset,Flags);

data_path dp
(
	IR_Out,
	MFC,
	Flags,
	CLK,
	I0[38],//MFA
	I0[37],//RW_RAM
	I0[36],//SALU
	I0[35],//RF_RW
	I0[34],//SSAB
	I0[33],//SSOP
	I0[32],//SMA
	I0[31],//STA
	I0[30],//MAR_EN
	I0[29],//SR_EN
	I0[28],//MDR_EN
	I0[27],//IR_EN
	I0[26],//SHT_EN
	I0[25],//ISE_EN
	I0[24],//SGN_EN
	I0[23],//CLR
	I0[22:21],//DSS
	I0[20:19],//WRA
	I0[18:17],//SRA
	I0[16:15],//SRB
	I0[14:13],//SISE
	I0[12:11],//SALUB
	I0[10:7]//ALUA
);


initial $readmemb("testcode_arm2.txt", dat);

reg [8:0] i; // loop index

initial begin
//	FILL RAM MEMORY
	for(i=9'h000;i<9'h0FE;i=i+9'h004)

		begin
	      	temp_data_in[31:24] = dat[i[7:0]];
	      	temp_data_in[23:16] = dat[i[7:0]+1];
	      	temp_data_in[15:8] = dat[i[7:0]+2];
	      	temp_data_in[7:0] = dat[i[7:0]+3];
			dp.ram.Mem[i[7:0]] = temp_data_in[31:24];
	      	dp.ram.Mem[i[7:0]+1]= temp_data_in[23:16];
	      	dp.ram.Mem[i[7:0]+2] = temp_data_in[15:8];
	      	dp.ram.Mem[i[7:0]+3] = temp_data_in[7:0];
	  	end
		#1490;
		for(i=9'h000;i<9'h0FE;i=i+9'h004)
		begin
			$write ("WORD at location %d: %b", i, dp.ram.Mem[i[7:0]]);
	      	$write ("%b", dp.ram.Mem[i[7:0]+1]);
	      	$write ("%b", dp.ram.Mem[i[7:0]+2] );
	      	$display ("%b", dp.ram.Mem[i[7:0]+3]);
		end
end

initial
	begin
		CLK = 1;
		Reset<=0;
		#5 Reset =1;
		#1 repeat (1500)
		begin
			#1 CLK = ~CLK;
		end
end

initial begin
//$display("State\t IR.Q\tMAR.Q\tCLK\tMFC ");
//$monitor("%d %d %h %h", cu.rom.index, dp.instructionRegister.Q, dp.memoryAddressRegister.Q,  dp.statusRegister.Q);
//$monitor("%d\t %b %d %d %d", cu.rom.index, dp.instructionRegister.Q, dp.instructionRegister.LE, CLK, I0[27] );
$monitor("MAR: %d", dp.memoryAddressRegister.Q);
//$monitor("%b %b %b %b  %b",dp.SHT_EN, dp.shifterOperand, dp.shifterOut,  dp.shifterAmountShift,  dp.STA, dp.irOut[6:5]);
//$monitor("%h %b %h %b %b %b %b", dp.shifter1.Out, dp.shifter1.Cout, dp.shifter1.Operand, dp.shifter1.Amount, dp.shifter1.CIn, dp.shifter1.EN, dp.shifter1.STA,  dp.shifter1.IR);
//$monitor("%b", dp.instructionRegister.Q);
//$monitor("MAR: %d, Flags %b", dp.memoryAddressRegister.Q, Flags);
//$monitor("%d, %d, %b", dp.memoryAddressRegister.Q, cu.rom.index, Flags);
//$monitor("S:%d R1_Q= %d R11_Q= %d MAR:%d ", cu.rom.index, dp.registerFile.R1.Q, dp.registerFile.R11.Q,  dp.memoryAddressRegister.Q);//", dp.memoryAddressRegister.Q );

end
/*always@(*)
begin
if(dp.SHT_EN & (dp.shifterAmountShift != 0))
begin
$display("\tPC\tState\tSHT_EN\tOp\tOut\tAmount\tSTA\tSType");
$display("\n%d|%d|%h|%h|%h|%d|%d|%h", dp.registerFile.R15.Q, cu.rom.index, dp.SHT_EN, dp.shifterOperand, dp.shifterOut,  dp.shifterAmountShift,  dp.STA, dp.irOut[6:5]);
end
end*/


/*initial begin
//$monitor("MAR: %d, Flags %b", dp.memoryAddressRegister.Q, Flags);
  $monitor("MAR: %d, Flags %b R00= %d\nR01= %d\nR02= %d\nR03= %d\nR04= %d\nR05= %d\nR06= %d\nR07= %d\nR08= %d\nR09= %d\nR10= %d\nR11= %d\nR12= %d\nR13= %d\nR14= %d\nR15= %d\n shifter op=%b == %b\n\nSSOP:%b SHO:%b IM:%b S:%d %b==%b %b %b \n",
	dp.memoryAddressRegister.Q, Flags,
	dp.registerFile.R0.Q,
	dp.registerFile.R1.Q,
	dp.registerFile.R2.Q,
	dp.registerFile.R3.Q,
	dp.registerFile.R4.Q,
	dp.registerFile.R5.Q,
	dp.registerFile.R6.Q,
	dp.registerFile.R7.Q,
	dp.registerFile.R8.Q,
	dp.registerFile.R9.Q,
	dp.registerFile.R10.Q,
	dp.registerFile.R11.Q,
	dp.registerFile.R12.Q,
	dp.registerFile.R13.Q,
	dp.registerFile.R14.Q,
	dp.registerFile.R15.Q,
	dp.addressBin,
	dp.irOut[3:0], dp.SSOP, dp.shifterOperand, dp.immSignExtOut, cu.rom.index, dp.SRB, I0[16:15], dp.irOut[19:16], dp.irOut[15:12], dp. irOut[3:0]
	);
//$display("\nSSOP:%b SHO:%b IM:%b S:%d %b==%b %b %b \n", dp.SSOP, dp.shifterOperand, dp.immSignExtOut, cu.rom.index, dp.SRB, I0[16:15], dp.irOut[19:16], dp.irOut[15:12], dp. irOut[3:0]);
end*/
/*always@(*) 
begin
	if(dp.registerFile.R15.Q == 112 )
	//$monitor(" INV:%d PL:%b CC=%b InvIn:%b MO:%b Sts:%b S:%d PC=%d R1_Q=%d R2_Q=%d Flags=%b ==%b%b%b%b", cu.inv.inv, cu.PL[41:39],cu.checker.Out, cu.InvIn, cu.Mout, cu.Sts, cu.rom.index,dp.registerFile.R15.Q, dp.registerFile.R1.Q, dp.registerFile.R2.Q, Flags, dp.alu.CF, dp.alu.NF, dp.alu.VF, dp.alu.ZF,);
$monitor("CLK:%b ALU:%d      S:%d           PC=%d                  R11_Q=%d               R12_Q=%d               Flags=%b ==%b%b%b%b", 
          CLK,   dp.alu.out, cu.rom.index , dp.registerFile.R15.Q, dp.registerFile.R1.Q, dp.registerFile.R11.Q, Flags, dp.alu.CF, dp.alu.NF, dp.alu.VF, dp.alu.ZF,);
end*/
endmodule
