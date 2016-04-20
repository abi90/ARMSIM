module test_control_unit;

//Las entradas deben ser de tipo reg

	reg [31:0] IR_Out;
	reg MFC, CLK; 
	reg [2:0] Flags;
//Las salidas son tipo wire

	wire [1:0] DSS, WRA, SRA, SRB,  SISE, SALUB; 
	wire [3:0] ALUA;	
	wire MFA, RW_RAM, SALU, RF_RW, SSAB, 
	SSOP, SMA, STA, MAR_EN, SR_EN,
	MDR_EN, IR_EN, SHT_EN, ISE_EN, 
	SGN_EN, CLR;
	
control_unit cu (DSS, WRA, SRA, SRB, SISE, SALUB, ALUA, MFA, RW_RAM, SALU, RF_RW, SSAB, 
	SSOP, SMA, STA, MAR_EN, SR_EN,
	MDR_EN, IR_EN, SHT_EN, ISE_EN, 
	SGN_EN, CLR, IR_Out, MFC, CLK, Flags);

    

initial

begin
	
	#10IR_Out <= 32'b11100010000000010000000000000000;
	
	MFC <= 1'b1;
	
	CLK <= 1'b1;
	
	Flags[0] <= 1'b0;
	
	Flags[1]<= 1'b0;
	
	Flags[2]<= 1'b0;
	
end
	


	initial begin
	
	$display("DSSWRA\tSRA\tSRB\tSISE\tSALUB\tALUA\tMFA\tRW_RAM\tSALU\tRF_RW\tSSAB\tSSOP\tSMA\tSTA\tMAR_EN\tSR_EN\tMDR_EN\tIR_EN\tSHT_EN\tISE_EN\tSGN_EN\tCLR");

    $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",DSS, WRA, SRA, SRB, SISE, SALUB, ALUA, MFA, RW_RAM, SALU, RF_RW, SSAB,SSOP, SMA, STA, MAR_EN, SR_EN, MDR_EN, IR_EN, SHT_EN, ISE_EN, SGN_EN, CLR );

	end
	
endmodule
	
	
