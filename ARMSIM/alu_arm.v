/////
//ALU
/////
module alu_arm (output reg [31:0] out, output reg  CF, NF, VF, ZF, input [3:0] A, input [31:0] da, db, input Cin);

	// parameter  AND = 4'b0000;
	// parameter   OR = 4'b0001;
	// parameter  EOR = 4'b0010;
	// parameter  BIC = 4'b0011;
	// parameter  CMP = 4'b0100;
	// parameter  CMN = 4'b0101;
	// parameter  TST = 4'b0110;
	// parameter  TEQ = 4'b0111;
	// parameter  MOV = 4'b1000;
	// parameter  MVN = 4'b1001;
	// parameter  ADD = 4'b1010;
	// parameter  ADC = 4'b1011;
	// parameter  SUB = 4'b1100;
	// parameter  SBC = 4'b1101;
	// parameter  RSB = 4'b1110;
	// parameter  RSC = 4'b1111;
	
	parameter  AND = 4'b0000;
	parameter  EOR = 4'b0001;
	parameter  SUB = 4'b0010;
	parameter  RSB = 4'b0011;
	parameter  ADD = 4'b0100;
	parameter  ADC = 4'b0101;
	parameter  SBC = 4'b0110;
	parameter  RSC = 4'b0111;
	parameter  TST = 4'b1000;
	parameter  TEQ = 4'b1001;
	parameter  CMP = 4'b1010;
	parameter  CMN = 4'b1011;
	parameter   OR = 4'b1100;
	parameter  MOV = 4'b1101;
	parameter  BIC = 4'b1110;
	parameter  MVN = 4'b1111;

	initial begin
	CF = 0;
	NF = 0;
	VF = 0;
	ZF = 0;
	end
	
	always @(da,db,A)
	begin
		case(A)
			AND:
			begin
				out = da & db;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
			end
			OR:
			begin
				out = da | db ;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
			end
			EOR:
				begin		
				out = da ^ db ;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
				end
			BIC: //Bit Clear
			begin
				out = da & ~db;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
			end
			CMP: // Compare
			begin
			    {CF, out} = da - db;
				CF = ~CF;
				//Update VF
				if((da[31] == 0 && db[31] == 1 && out[31] == 1) || (da[31] == 1 && db[31] == 0 && out[31] == 0))
					VF = 1;
				else
					VF = 0;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
			end
			CMN: //Compare negative
			begin
				{CF, out} = da + db;
					//Update VF
					if((da[31] == 0 && db[31] == 0 && out[31] == 1) || (da[31] == 1 && db[31] == 1 && out[31] == 0))
						VF = 1;
					else
						VF = 0;

					//Update ZF and NF
					if(out == 0) ZF = 1'b1;

					else ZF = 1'b0;

					NF = out [31];
			end
			TST:// Test
			begin
				out = da & db;
				CF = Cin;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
			end
			TEQ:// Test equal
			begin
				out = da ^ db;
				CF = Cin;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
			end
			MOV: //Move
			begin
				out = db;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];				
			end
			MVN:// Move negative
			begin
				out = ~db;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];	
			end
			ADD:
			begin
				{CF, out} = da + db;
				//Update VF
				if((da[31] == 0 && db[31] == 0 && out[31] == 1) || (da[31] == 1 && db[31] == 1 && out[31] == 0))
					VF = 1;
				else
					VF = 0;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
			end
			ADC:// Add with carry
			begin
				{CF, out} = da + db + Cin;
				//Update VF
				if((da[31] == 0 && db[31] == 0 && out[31] == 1) || (da[31] == 1 && db[31] == 1 && out[31] == 0))
					VF = 1;
				else
					VF = 0;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];					
			end
			SUB:// Subtract 
			begin
				{CF, out} = da - db;
				//Update VF
				if((da[31] == 0 && db[31] == 1 && out[31] == 1) || (da[31] == 1 && db[31] == 0 && out[31] == 0))
					VF = 1;
				else
					VF = 0;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
			end
			SBC:// Subtract with carry
			begin
				{CF, out} = da - db - ~Cin;
				CF = ~CF;
				//Update VF
				if((da[31] == 0 && db[31] == 1 && out[31] == 1) || (da[31] == 1 && db[31] == 0 && out[31] == 0))
					VF = 1;
				else
					VF = 0;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
			end
			RSB:// Reverse Subtract
			begin
				{CF, out} = db - da;
				//Update VF
				if((db[31] == 0 && da[31] == 1 && out[31] == 1) || (db[31] == 1 && da[31] == 0 && out[31] == 0))
					VF = 1;
				else
					VF = 0;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];
			end
			RSC:// Reverse Subtract with Carry
			begin
				{CF, out} = db - da - ~Cin;
				CF = ~CF;
				//Update VF
				if((db[31] == 0 && da[31] == 1 && out[31] == 1) || (db[31] == 1 && da[31] == 0 && out[31] == 0))
					VF = 1;
				else
					VF = 0;
				//Update ZF and NF
				if(out == 0) ZF = 1'b1;
				else ZF = 1'b0;
				NF = out [31];			
			end	
		endcase
	end
endmodule
	