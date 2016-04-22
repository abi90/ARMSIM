/////////
//Encoder
/////////
module encoder(output reg [6:0] encoder_OUT, input [31:0] irIN);

reg [31:0] tempIR_IN;

initial begin

assign tempIR_IN = irIN;

end

always @ (irIN)
begin
	case (tempIR_IN[27:25])
		3'b000:
		begin
			//Data Processing Shift by Immediate Shifter Operand
			if (tempIR_IN[4]== 1'b0) encoder_OUT = 7'b0101100;
			else 
			begin
				//Signed Store Immediate Post Index
				if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b010011)
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b0101101;
					else encoder_OUT = 7'b0101111;
				end
				else 
				begin
					// Signed Store Immediate Pre-Index
					if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b111011)
					begin
						if(tempIR_IN[23]==0) encoder_OUT = 7'b0110001;
						else encoder_OUT = 7'b0110011;
					end
					else
					begin
						//Signed Store Immediate Post Index
						if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b000011)
						begin
							if(tempIR_IN[23]==0) encoder_OUT = 7'b0110100;
							else encoder_OUT = 7'b0101111;
						end
						else
						begin
							//Signed Store Register Pre-indexed
							if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b101011)
							begin
								if(tempIR_IN[23]==0) encoder_OUT = 7'b0111000;
								else encoder_OUT = 7'b0111010;
							end
							else
							begin
								//Signed Store Register Offset
								if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b100011)
								begin
									if(tempIR_IN[23]==0) encoder_OUT = 7'b0111011;
									else encoder_OUT = 7'b0111100;
								end
								else
								begin
									//Signed Store Immediate Offset
									if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b110011)
									begin
										if(tempIR_IN[23]==0) encoder_OUT = 7'b0111101;
										else encoder_OUT = 7'b0111110;
									end
									else
									begin
										//Signed Store Immediate Post- Indexed
										if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b010111)
										begin
											if(tempIR_IN[23]==0) encoder_OUT = 7'b0111111;
											else encoder_OUT = 7'b0101111;
										end
										else
										begin
											//Signed Load Immediate Pre-Indexed
											if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b111111)
											begin
												if(tempIR_IN[23]==0) encoder_OUT = 7'b1000011;
												else encoder_OUT = 7'b1000101;
											end
											else
											begin
												//Signed Load Register Post-Indexed
												if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b000111)
												begin
													if(tempIR_IN[23]==0) encoder_OUT = 7'b1000110;
													else encoder_OUT = 7'b1001000;
												end
												else
												begin
													//Signed Load Register Pre-Indexed
													if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b101111)
													begin
														if(tempIR_IN[23]==0) encoder_OUT = 7'b1001010;
														else encoder_OUT = 7'b1000101;
													end
													else
													begin
														//Signed Load Register Offset
														if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b100111)
														begin
															if(tempIR_IN[23]==0) encoder_OUT = 7'b1001101;
															else encoder_OUT = 7'b1001100;
														end
														else
														begin
															//Signed Load Immediate Offset
															if ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]}==6'b110111)
															begin
																if(tempIR_IN[23]==0) encoder_OUT = 7'b1001111;
																else encoder_OUT = 7'b1010000;
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end	
		3'b001: encoder_OUT = 7'b0101011; //43 = 32-bit Immediate Shifter Operand
		3'b010:
		begin
			//Unsigned Load Immediate Offset
			if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b101)
			begin

				if(tempIR_IN[23]==0) encoder_OUT= 7'b0100110;
				else encoder_OUT = 7'b0100111;
			end
			else
			begin
				//Unsigned Load Immediate Pre-Indexed
				if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]}== 3'b111)
				begin

					if(tempIR_IN[23]==0) encoder_OUT= 7'b0011010;
					else encoder_OUT = 7'b0011100;
				end
				else
				begin
					//Unsigned Load Immediate Post-Indexed
					if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]}== 3'b001)
					begin

						if(tempIR_IN[23]==0) encoder_OUT= 7'b0010110;
						else encoder_OUT = 7'b0011000;
					end
					else
					begin
						//Unsigned Store Immediate Pre-Indexed
						if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]}== 3'b110)
						begin

							if(tempIR_IN[23]==0) encoder_OUT= 7'b0001000;
							else encoder_OUT = 7'b0001010
						end
						else
						begin
							//Unsigned Store Immediate Post Indexed
							if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]}== 3'b000)
							begin

								if(tempIR_IN[23]==0) encoder_OUT= 7'b0000100;
								else encoder_OUT = 7'b0000110;
							end
							else
							begin
								//Unsigned store Immediate offset
								if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]}== 3'b100)
								begin

									if(tempIR_IN[23]==0) encoder_OUT= 7'b0010100;
									else encoder_OUT = 7'b0010101;
								end
							end
						end
					end
				end
			end
		end
		3'b011:
		begin
			//Unsigned Load Register offset
			if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b101)
			begin
				if(tempIR_IN[23]==0) encoder_OUT= 7'b0100100;
				else encoder_OUT = 7'b0100101;
			end
			else
			begin
				//Unsigned Load Register Pre-Indexed
				if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b111)
				begin
					if(tempIR_IN[23]==0) encoder_OUT= 7'b0100001;
					else encoder_OUT = 7'b0100011;
				end
				else
				begin
					//Unsigned Load Register Post Indexed
					if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b001)
					begin 
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0011101;
						else encoder_OUT = 7'b0011111;
					end
					else
					begin
						//Unsigned Store Register Offset
						if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b110)
						begin 
							if(tempIR_IN[23]==0) encoder_OUT= 7'b0010010;
							else encoder_OUT = 7'b0010011;
						end
						else 
						begin
							//Unsigned Store Register Pre-Indexed
							if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b100)
							begin 
								if(tempIR_IN[23]==0) encoder_OUT= 7'b0001111;
								else encoder_OUT = 7'b0010001;
							end
							else
							begin
								//Unsigned Store Register Post Indexed
								if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b000)
								begin 
									if(tempIR_IN[23]==0) encoder_OUT= 7'b0001011;
									else encoder_OUT = 7'b0001101;
								end
							end
						end
					end
				end
			end
		end
		3'b101:
			begin
				//Branch & Link
				if (tempIR_IN[24]==1'b1) encoder_OUT= 7'b0101000;
				//Branch
				else encoder_OUT = 7'b0101010;
			end
		default: encoder_OUT = 7'b1011011;
	endcase

	begin 
		if (tempIR_IN == 31'h00000000) encoder_OUT=7'b0000000;
	end
end

endmodule
