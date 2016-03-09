module test_alu_arm;

	wire [31:0] out;
	wire NF, CF, ZF, VF; 
	reg [3:0] A;
	reg [31:0] da, db;
	reg Cin;
	reg [24:0] string;

	parameter  AND = 4'b0000;
	parameter   OR = 4'b0001;
	parameter  EOR = 4'b0010;
	parameter  BIC = 4'b0011;
	parameter  CMP = 4'b0100;
	parameter  CMN = 4'b0101;
	parameter  TST = 4'b0110;
	parameter  TEQ = 4'b0111;
	parameter  MOV = 4'b1000;
	parameter  MVN = 4'b1001;
	parameter  ADD = 4'b1010;
	parameter  ADC = 4'b1011;
	parameter  SUB = 4'b1100;
	parameter  SBC = 4'b1101;
	parameter  RSB = 4'b1110;
	parameter  RSC = 4'b1111;

	parameter sim_time = 160;
	//module register_32_bits (output reg [31:0] Q, input [31:0] D,input LE, CLR, CLK);

	alu_arm alu(out, NF, CF, ZF, VF, A, da, db, Cin);

	initial #sim_time $finish; // Especifica cuando termina simulación


	initial begin
	A = 4'b0000;
	da = 32'hffffffff;
	db = 32'hf0000000;
	repeat (15) #10 A=A+1'b1;
	end

	always @(A)
	begin
			case(A)
				AND:
				begin
					string = "AND";
				end
				OR:
				begin
					string = "OR ";
				end
				EOR:
				begin
					string = "EOR";
				end
				BIC: //Bit Clear
				begin
					string = "BIC";
				end
				CMP: // Compare
				begin
					string = "CMP";
				end
				CMN: //Compare negative
				begin
					string = "CMN";
				end
				TST:// Test
				begin
					string = "TST";
				end
				TEQ:// Test equal
				begin
					string = "TEQ";
				end
				MOV: //Move
				begin
					string = "MOV";
				end
				MVN:// Move negative
				begin
					string = "MVN";
				end
				ADD:
				begin
					string = "ADD";
				end
				ADC:// Add with carry
				begin
					string = "ADC";
					Cin = 1;
				end
				SUB:// Subtract 
				begin
					string = "SUB";
				end
				SBC:// Subtract with carry
				begin
					string = "SBC";
				end
				RSB:// Reverse Subtract
				begin
					string = "RSB";
				end
				RSC:// Reverse Subtract with Carry
				begin
					string = "RSC";
				end
			endcase
	end

	initial begin
	$display ("INS  A da\tdb\t\tNF  CF  ZF  VF  Cin   out"); //imprime header
	$monitor ("%s %h %h\t%h\t%h   %h   %h   %h   %h     %h", string, A, da, db, NF, CF, ZF, VF, Cin, out); //imprime las señales
	end

endmodule
			
			
			
			
	
			



