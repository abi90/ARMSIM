//////////
//Shifter
/////////
module shifter(output reg [31:0] Out, output reg Cout, input [31:0] Operand, input [4:0] Amount, input CIn, EN, STA, input [1:0] IR);

reg [63:0] temp;

parameter LSL = 2'b00;
parameter LSR = 2'b01;
parameter ASR = 2'b10;
parameter ROR = 2'b11;

always @ (Amount, Operand, IR)
begin
	if (EN)
	begin

		if (STA)
		begin
				Cout = CIn;
				temp = {Operand, Operand} >> Amount;	//rotate right
				Out[31:0] = temp[31:0];
			end
		else
		begin
				case(IR)
					LSL:
					begin
						Cout = Operand[31];
						Out[31:0] = Operand[31:0] << Amount;	//Logical Shift Left
					end

					LSR:
					begin
						Cout = Operand[0];
						Out[31:0] = Operand[31:0] >> Amount;
					end

					ASR:
					begin
							Cout = CIn;
							Out[31:0]  = $signed(Operand[31:0]) >>> Amount;
					end

					ROR:
					begin
							Cout = CIn;
							temp = {Operand, Operand} >> Amount;	//rotate right
							Out[31:0] = temp[31:0];
					end
				endcase
		end
	end
	else 
	begin
		Out = Operand;
		Cout = CIn;
	end
end
endmodule