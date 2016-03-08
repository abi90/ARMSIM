//ICOM4215: ARQUI
//ALU_ARM

module alu_arm ( output reg [31:0] out, output NF, CF, ZF, VF, intput [3:0] A, input [31:0} da, db, input enbale, Cin);

always @(da,db,A)

case(A)
begin
	4'b0000:	//AND
			begin
			
			out = da & db;
			
			//carry = 1'b0;
			
			end
			
	4'b0001:	//OR
			begin
			
			out = da | db ;
			
			//carry = 1'b0;
			
			end
			
			
			
			
	
			



