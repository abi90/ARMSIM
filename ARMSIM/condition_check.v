/*
Condition Check:
0000 EQ Equal Z set
0001 NE Not equal Z clear
0010 CS/HS Carry set/unsigned higher or same C set
0011 CC/LO Carry clear/unsigned lower C clear
0100 MI Minus/negative N set
0101 PL Plus/positive or zero N clear
0110 VS Overflow V set
0111 VC No overflow V clear
1000 HI Unsigned higher C set and Z clear
1001 LS Unsigned lower or same C clear or Z set
1010 GE Signed greater than or equal N set and V set, or N clear and V clear (N == V)
1011 LT Signed less than N set and V clear, or N clear and V set (N != V)
1100 GT Signed greater than Z clear, and either N set and V set, or N clear and V clear (Z == 0,N == V)
1101 LE Signed less than or equal Z set, or N set and V clear, or N clear and V set (Z == 1 or N != V)
1110 AL Always (unconditional) -
1111 - See Condition code 0b1111 -
*/
module condition_check (output reg Out, input [3:0] Flags, input[31:0] IR);

reg C;
reg N;
reg V;
reg Z;

parameter EQ =4'b0000;
parameter NE =4'b0001;
parameter CS =4'b0010;
parameter CC =4'b0011;
parameter MI =4'b0100;
parameter PL =4'b0101;
parameter VS =4'b0110;
parameter VC =4'b0111;
parameter HI =4'b1000;
parameter LS =4'b1001;
parameter GE =4'b1010;
parameter LT =4'b1011;
parameter GT =4'b1100;
parameter LE =4'b1101;
parameter AL =4'b1110;

always@(IR[31:28],Flags)
begin
	 C = Flags[3];
	 N = Flags[2];
	 V = Flags[1];
	 Z = Flags[0];
	case(IR[31:28])
		EQ: // Z==1
		begin
			if(Z) Out =1;
			else Out = 0;
		end
		NE:	// Z==0
		begin
			if(!Z) Out =1;
			else Out = 0;
		end
		CS: // C==1
		begin
			if(C) Out =1;
			else Out = 0;
		end
		CC: // C==0
		begin
			if(!C) Out =1;
			else Out = 0;
		end
		MI: // N==1
		begin
			if(N) Out =1;
			else Out = 0;
		end
		PL: // N==0
		begin
			if(!N) Out =1;
			else Out = 0;
		end
		VS: // V==1
		begin
			if(V) Out =1;
			else Out = 0;
		end
		VC: // V==0
		begin
			if(!V) Out =1;
			else Out = 0;
		end
		HI: // C==1 && Z==0
		begin
			if(C && !Z) Out =1;
			else Out = 0;
		end
		LS: // C==0 && Z==1
		begin
			if(!C && Z) Out =1;
			else Out = 0;
		end
		GE: // N==V
		begin
			if(N==V) Out =1;
			else Out = 0;
		end
		LT: // N != V
		begin
			if(N!=V) Out =1;
			else Out = 0;
		end
		GT: // Z==0 && N==V
		begin
			if(!Z && N==V) Out =1;
			else Out = 0;
		end
		LE: // Z==1 OR N!= V
		begin
			if(Z || N!=V) Out =1;
			else Out = 0;
		end
		AL:	// ALWAYS
		begin
			Out = 1;
		end
	endcase
end

endmodule