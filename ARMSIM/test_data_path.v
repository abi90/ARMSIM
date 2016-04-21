module test_data_path;
reg  [44: 0] I0; //Las entradas del módulo deben ser tipo reg
wire [4: 0] Y; //Las salidas deben ser tipo wire
//Memory Variables
reg [31:0] dat[0:255];
parameter WORD = 2'b10;
parameter WRITE = 1'b1;
parameter ENABLE = 1'b0;
reg [31:0] temp_data_in;
reg [7:0] temp_addr;
	wire [31:0] IR_Out;
	wire MFC; 
	wire [3:0] Flags;
	reg CLK, 
	MFA, 
	RW_RAM, 
	SALU, 
	RF_RW, 
	SSAB, 
	SSOP, 
	SMA, 
	STA, 
	MAR_EN, 
	SR_EN,
	MDR_EN, 
	IR_EN, 
	SHT_EN, 
	ISE_EN, 
	SGN_EN, 
	CLR;
	reg [1:0] DSS, WRA, SRA, SRB,  SISE, SALUB;
	reg [3:0] ALUA;	

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


initial $readmemb("test_data.txt", dat);

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
		#50;
		for(i=9'h000;i<9'h0FE;i=i+9'h004)
		begin
			$write ("WORD DATA at %d: %b", i, dp.ram.Mem[i[7:0]]);
	      	$write ("%b", dp.ram.Mem[i[7:0]+1]);
	      	$write ("%b", dp.ram.Mem[i[7:0]+2] ); 
	      	$display ("%b", dp.ram.Mem[i[7:0]+3]);
		end

//INITIAL STATE: RESET/CLR
	#50
	I0 <= 45'b000011_00000000111100010000000000000000_0000000; 
	$display("RESET... DONE\n");
	/*#10$display("Monitor content of Registers:\nIR= %b\nMDR= %b\nMUX= %b\nR0 = %h\nR1 = %h\nR2 = %h\nR3 = %h\nR4 = %h\nR5 = %h\nR6 = %h\nR7 = %h\nR8 = %h\nR9 = %h\nR10 = %h\nR11 = %h\nR12 = %h\nR13 = %h\nR14 = %h\nR15 = %h\n",
		dp.instructionRegister.Q,
		dp.memoryDataRegister.Q,
		dp.ram.DataOut,
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
		dp.registerFile.R15.Q);*/
//FETCH: LOAD PC TO MAR		
	#50
	I0 <= 45'b000011000101000111000000000001001111010000000; 
	$display("MAR<-PC\n");
	/*#10$display("Monitor content of Registers:\nIR= %b\nMDR= %b\nMUX= %b\nR0 = %h\nR1 = %h\nR2 = %h\nR3 = %h\nR4 = %h\nR5 = %h\nR6 = %h\nR7 = %h\nR8 = %h\nR9 = %h\nR10 = %h\nR11 = %h\nR12 = %h\nR13 = %h\nR14 = %h\nR15 = %h\n",
		dp.instructionRegister.Q,
		dp.memoryDataRegister.Q,
		dp.ram.DataOut,
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
		dp.registerFile.R15.Q);*/
//Read Instruction From RAM	
	#50
	I0 <= 45'b001101110000001111000010000000000000000000000;
	/*#10$display("Monitor content of Registers:\nIR= %b\nMDR= %b\nMUX= %b\nR0 = %h\nR1 = %h\nR2 = %h\nR3 = %h\nR4 = %h\nR5 = %h\nR6 = %h\nR7 = %h\nR8 = %h\nR9 = %h\nR10 = %h\nR11 = %h\nR12 = %h\nR13 = %h\nR14 = %h\nR15 = %h\n",
		dp.instructionRegister.Q,
		dp.memoryDataRegister.Q,
		dp.ram.DataOut,
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
		dp.registerFile.R15.Q);*/ 
//IR<-RAM_Data_Out	
	#50
	I0 <= 45'b000000000000101100000000000000000000000000000; 
	        //000000000000101100000000000000000000000000000
	#10$display("IR<- RAM_OUT... DONE\n");
	/*#10$display("Monitor content of Registers:\nIR= %b\nMDR= %b\nMUX= %b\nR0 = %h\nR1 = %h\nR2 = %h\nR3 = %h\nR4 = %h\nR5 = %h\nR6 = %h\nR7 = %h\nR8 = %h\nR9 = %h\nR10 = %h\nR11 = %h\nR12 = %h\nR13 = %h\nR14 = %h\nR15 = %h\n",
		dp.instructionRegister.Q,
		dp.memoryDataRegister.Q,
		dp.ram.DataOut,
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
		dp.registerFile.R15.Q);
*/
#50
I0<=45'b000010000000001111000000101000000101000000000;
end

initial 
	begin
		CLK = 0;
		#1 repeat (300) 
		begin
			#1 CLK = ~CLK;
		end
end

/*initial begin
	$display("Monitor content of Registers:\nIR= %b\nMDR= %b\nMUX= %b\nR0 = %h\nR1 = %h\nR2 = %h\nR3 = %h\nR4 = %h\nR5 = %h\nR6 = %h\nR7 = %h\nR8 = %h\nR9 = %h\nR10 = %h\nR11 = %h\nR12 = %h\nR13 = %h\nR14 = %h\nR15 = %h\n",
		dp.instructionRegister.Q,
		dp.memoryDataRegister.Q,
		dp.ram.DataOut,
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
		dp.registerFile.R15.Q);
end*/
initial begin
	$monitor("CLK=%b Monitor content of Registers:\nIR= %b\nMDR= %b\nMUX= %b\nMAR = %h",
		CLK,
		dp.memoryDataRegister.Q,
		//dp.instructionRegister.Q,
		//dp.mdrOut,
		dp.memoryDataRegister.D,
		dp.signExtension1In,
		dp.memoryDataRegister.LE
		//dp.signExtension1.
);
end
endmodule