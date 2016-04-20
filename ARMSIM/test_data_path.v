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
	MFA, RW_RAM, SALU, RF_RW, SSAB, 
	SSOP, SMA, STA, MAR_EN, SR_EN,
	MDR_EN, IR_EN, SHT_EN, ISE_EN, 
	SGN_EN, CLR;
	reg [1:0] DSS, WRA, SRA, SRB,  SISE, SALUB;
	reg [3:0] ALUA;	

/*	
	MFA = I0[0];
	RW_RAM = I0[1];
	SALU = I0[2];
	RF_RW  = I0[3];
	SSAB  = I0[4];
	SSOP  = I0[5];
	SMA  = I0[6];
	STA  = I0[7];
	MAR_EN  = I0[8];
	SR_EN = I0[9];
	MDR_EN  = I0[10];
	IR_EN  = I0[11];
	SHT_EN  = I0[12];
	ISE_EN  = I0[13];
	SGN_EN  = I0[14];
	CLR = I0[15];
	DSS  = I0[17:16];
	WRA  = I0[19:18];
	SRA  = I0[21:20];
	SRB  = I0[23:22];
	SISE  = I0[25:24];
	SALUB  = I0[27:26];
	ALUA = I0[31:28];
*/
data_path dp
(
	IR_Out, 
	MFC, 
	Flags,
	CLK, 
	I0[38],
	I0[37],
	I0[36],
	I0[35],
	I0[34],
	I0[33],
	I0[32],
	I0[31],
	I0[30],
	I0[29],
	I0[28],
	I0[27],
	I0[26],
	I0[25],
	I0[24],
	I0[23],
	I0[22:21],
	I0[20:19],
	I0[18:17],
	I0[16:15],
	I0[14:13],
	I0[12:11],
	I0[10:7]	
);


initial $readmemb("test_data.txt", dat);

reg [8:0] i; // loop index

initial begin
//-------------------------------------------------------------------------------------------------------------------------------------	
//					FILL RAM MEMORY
//-------------------------------------------------------------------------------------------------------------------------------------	

	for(i=9'h000;i<9'h0FE;i=i+9'h004)

		begin
	  	
		  	MFA = ENABLE;
	      	temp_data_in[31:24] = dat[i[7:0]]; 
	      	temp_data_in[23:16] = dat[i[7:0]+1]; 
	      	temp_data_in[15:8] = dat[i[7:0]+2]; 
	      	temp_data_in[7:0] = dat[i[7:0]+3]; //setting up data
		  	//r_w = WRITE; 
		  	//dataType = WORD; 
		  	//dp.Mar.outR0 = i; //setting up control signals
			dp.ram.Mem[i[7:0]] = temp_data_in[31:24]; 
	      	dp.ram.Mem[i[7:0]+1]= temp_data_in[23:16]; 
	      	dp.ram.Mem[i[7:0]+2] = temp_data_in[15:8]; 
	      	dp.ram.Mem[i[7:0]+3] = temp_data_in[7:0];
		  	//$display("Data In: %b \nAddress: %b", dp.ram_256.ram_256[i], dp.ram_256.addr);
		  		//#40 $display ("Mem Data = %b", dp.ram_256.ram_256[8'b00010001]);
			#1 MFA = ~ENABLE;
	  	end 
		#50;
		for(i=9'h000;i<9'h0FE;i=i+9'h004)
		begin
			$write ("WORD DATA at %d: %b", i, dp.ram.Mem[i[7:0]]);
	      	$write ("%b", dp.ram.Mem[i[7:0]+1]);
	      	$write ("%b", dp.ram.Mem[i[7:0]+2] ); 
	      	$display ("%b", dp.ram.Mem[i[7:0]+3]);
		end

/*-------------------------------------------------------------------------------------------------------------------------------------	
			INITIAL STATE: RESET/CLR
--------------------------------------------------------------------------------------------------------------------------------------*/
	//Reset Instruction
	#50
	I0 <= 45'b000011_00000000111100010000000000000000_0000000; 

	#10 $display("RESET... DONE\n");

//-------------------------------------------------------------------------------------------------------------------------------------	
//								FETCH: LOAD PC TO MAR	
//-------------------------------------------------------------------------------------------------------------------------------------	
/*  7'b0000000: out=000011000000001111000100000000000000000000000;				
	7'b0000001: out=000011000101000111000000000001001111010000000;				
	7'b0000010: out=001101110000001111000010000000000000000000000;				
	7'b0000011: out=000000000000101100000000000000000000000000000;				
*/
	//Load PC -> MAR Instruction
	#50
	I0 <= 45'b000011000101000111000000000001001111010000000; 
	$display("MAR<-PC\n");
	
	#50
	I0 <= 45'b001101110000001111000010000000000000000000000; 

	#10 $display("MFC %b\n", MFC);
	#10 $display("RAM %b\n", dp.ram.DataOut);
	#50
	I0 <= 45'b000000000000101100000000000000000000000000000; 

	#50
	#10 $display("IR<- RAM_OUT... DONE I0= %b\n", I0);

end

initial 
	begin
		CLK = 0;
		#1 repeat (300) 
		begin
			#1 CLK = ~CLK;
		end
end

initial begin
	$monitor("Monitor content of Registers:\nIR= %b\nMDR= %b\nMUX= %b\nR0 = %h\nR1 = %h\nR2 = %h\nR3 = %h\nR4 = %h\nR5 = %h\nR6 = %h\nR7 = %h\nR8 = %h\nR9 = %h\nR10 = %h\nR11 = %h\nR12 = %h\nR13 = %h\nR14 = %h\nR15 = %h\n",
		dp.instructionRegister.D,
		dp.memoryDataRegister.D,
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
end
endmodule