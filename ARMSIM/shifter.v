module shifter(output reg [31:0] Out, output reg Cout, input [31:0] Operand, input [4:0] Amount, input CIn, EN, STA, input [1:0] IR);
	
reg [31:0] tempNum;
reg [31:0] tempData;
reg [31:0] temp;
integer i;

parameter LSL = 2'b00;
parameter LSR = 2'b01;
parameter ASR = 2'b10;
parameter ROR = 2'b11;

always @ (Operand, posedge EN, IR, CIn)
begin
	if (!EN)
	begin
		assign tempNum = Amount;
		assign tempData = Operand;
		assign temp = Operand;

		if (STA)
		begin

			for(i = 0; i < tempNum; i = i+1)
				begin
					temp = tempData;
					tempData = tempData>>1;
					tempData = {temp[0], tempData[30:0]};
				end
			end
		else
		begin
				case(IR)
					LSL:
					begin
						for(i = 0; i < tempNum; i = i+1)
						begin
							Cout = tempData[31];
							tempData= tempData<<1;
						end
					end

					LSR:
					begin
						for(i = 0; i < tempNum; i = i+1)
						begin
							Cout = tempData[0];
							tempData= tempData>>1;
						end
					end

					ASR:
					begin
						for(i = 0; i < tempNum; i = i+1)
							begin
							tempData= tempData>>1;
							tempData = {Operand[31], tempData[30:0]};
							end
					end

					ROR:
					begin
						for(i = 0; i < tempNum; i = i+1)
							begin
							temp = tempData;
							tempData= tempData>>1;
							tempData = {temp[0], tempData[30:0]};
							end
					end
				endcase
		Out = tempData;
		end
	end

	else 
	begin
		Out = Operand;
		Cout = CIn;
	end
end
endmodule
