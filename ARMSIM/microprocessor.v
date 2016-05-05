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
//$monitor("%b %b %b %b %b %b %b",dp.shifterOut, dp.SR_Flags_In[4], dp.shifterOperand, dp.shifterAmountShift, dp.SR_Flags_Out[4], dp.SHT_EN, dp.STA, dp.irOUT[6:5]);
//$monitor("%h %b %h %b %b %b %b", dp.shifter1.Out, dp.shifter1.Cout, dp.shifter1.Operand, dp.shifter1.Amount, dp.shifter1.CIn, dp.shifter1.EN, dp.shifter1.STA,  dp.shifter1.IR);
//$monitor("%b", dp.instructionRegister.Q);
//$monitor("MAR: %d, Flags %b", dp.memoryAddressRegister.Q, Flags);
//$monitor("%d, %d, %b", dp.memoryAddressRegister.Q, cu.rom.index, Flags);
//$monitor("S:%d R1_Q= %d R11_Q= %d MAR:%d ", cu.rom.index, dp.registerFile.R1.Q, dp.registerFile.R11.Q,  dp.memoryAddressRegister.Q);//", dp.memoryAddressRegister.Q );
end

endmodule
