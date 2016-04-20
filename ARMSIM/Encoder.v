//Encoder

module encoder (output reg [6:0] encoder_OUT, input [31:0] irIN);

reg [31:0] tempIR_IN;

initial begin

assign tempIR_IN = irIN;

end

always @ (irIN)
begin
	case (tempIR_IN[27:25])

		3'b000:

			begin
			
				if (tempIR_IN[4]== 1'b0)
					begin
						
						encoder_OUT = 7'b0101100;
					
					end
				else 
					begin
						
						if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b010011})
							begin
							
							encoder_OUT = 7'b0101101;
							
							end
						else 
							begin
							
							if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b111011})
								begin

								encoder_OUT = 7'b0110001;
								
								end
							else
								begin
									
									if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b000011})
										begin

										encoder_OUT = 7'b0110100;
										
										end
									else
										begin
											if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b101011})
											begin

											encoder_OUT = 7'b0111000;
								
											end
										
										else
										begin
											if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b100011})
											begin

											encoder_OUT = 7'b0111011;
								
											end
											else
											begin
												if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b110011})
												begin

												encoder_OUT = 7'b0111101;
									
												end
												else
													begin
														if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b010111})
														begin

														encoder_OUT = 7'b0111111;
											
														end
														else
														begin
															if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b111111})
															begin

															encoder_OUT = 7'b1000011;
											
															end
															else
															begin

																if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b000111})
																begin

																encoder_OUT = 7'b1000110;
											
																end
																else
																begin
																	if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b101111})
																	begin

																	encoder_OUT = 7'b1001010;
												
																	end
																	else
																	begin
																		if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b100111})
																		begin

																		encoder_OUT = 7'b1001101;
													
																		end
																		else
																		begin
																			if ({tempIR_IN[24],tempIR_IN[22:20],1'b1,1'b1}=={6'b110111})
																			begin

																			encoder_OUT = 7'b1001111;
														
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

		3'b001:

			encoder_OUT = 7'b0101011; //43 = 32-bit Immediate Shifter Operand

		3'b010:

			begin

				if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b101)
				begin
				encoder_OUT= 7'b0100110;
				end
				else
				begin
					if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]}== 3'b111)
					begin
					encoder_OUT= 7'b0011010;
					end
					else
					begin
						if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]}== 3'b001)
						begin
						encoder_OUT= 7'b0010110;
						end
						else
						begin
							if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]}== 3'b110)
							begin
							encoder_OUT= 7'b0001000;
							end
							else
							begin
								if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]}== 3'b000)
								begin
								encoder_OUT= 7'b0000100;
								end
								else
								begin
									if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]}== 3'b100)
									begin
									encoder_OUT= 7'b0010100;
									end
								end
							end
						end

					end
				end

			end

		3'b011:

			begin

			if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b101)
				begin
				encoder_OUT= 7'b0100100;
				end
				else
				begin
					if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b111)
					begin
					encoder_OUT= 7'b0100001;
					end
					else
					begin
						if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b001)
						begin
						encoder_OUT= 7'b0011101;
						end
						else
						begin
							if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b110)
							begin
							encoder_OUT= 7'b0010010;
							end
							else 
							begin
								if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b100)
								begin
								encoder_OUT= 7'b0001111;
								end
								else
								begin
									if ({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]} == 3'b000)
									begin
									encoder_OUT= 7'b0001011;
									end

								end
							end
						end
					end
				end

			end
		3'b101:

			begin

			if (tempIR_IN[24]==1'b1)
			encoder_OUT= 7'b0101000;
			else
			encoder_OUT= 7'b0101010;

			end

	endcase

	begin
	if (tempIR_IN == 31'h00000000)
		encoder_OUT=7'b0000000;
	end
end

endmodule
