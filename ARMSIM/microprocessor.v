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
end

initial 
	begin
		CLK = 0;
		Reset<=0;
		#10 Reset =1;
		#1 repeat (300) 
		begin
			#1 CLK = ~CLK;
		end
end

initial begin
	$monitor("MAR: %b",I0);
end

endmodule