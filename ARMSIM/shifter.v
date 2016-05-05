//////////
//Shifter
/////////
module shifter(output reg [31:0] Out, output reg Cout, input [31:0] Operand, input [4:0] Amount, input CIn, EN, STA, input [1:0] IR);
	
reg [31:0] tempNum;
reg [31:0] tempData;
reg [31:0] temp;
integer i;

parameter LSL = 2'b00;
parameter LSR = 2'b01;
parameter ASR = 2'b10;
parameter ROR = 2'b11;

always @ (*)
begin
	if (EN)
	begin
		tempNum = Amount;
		tempData = Operand;
		temp = Operand;

		if (STA)
		begin
				Cout <= CIn;
				Out = {Operand, Operand} >> Amount;	//rotate right
			end
		else
		begin
				case(IR)
					LSL:
					begin
						Cout = Operand[31];
						Out = Operand << Amount;	//Logical Shift Left
					end

					LSR:
					begin
						Cout = Operand[0];
						Out = Operand >> Amount;
					end

					ASR:
					begin
							Cout <= CIn;
							Out  = $signed(Operand) >>> Amount;
					end

					ROR:
					begin
							Cout <= CIn;
							Out = {Operand, Operand} >> Amount;	//rotate right
					end
				endcase
		end
	end
	else 
	begin
		Out <= Operand;
		Cout <= CIn;
	end
end
endmodule
