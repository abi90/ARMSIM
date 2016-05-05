/////////
//Encoder
/////////
module encoder(output reg [6:0] encoder_OUT, input [31:0] irIN);

reg [31:0] tempIR_IN;

always @ (irIN)
begin

 	tempIR_IN = irIN;

	case (tempIR_IN[27:25])
		3'b000:
		begin
			//Data Processing Shift by Immediate Shifter Operand
			if (tempIR_IN[4]== 1'b0)
			begin 
					//CMP/CMN
					if((tempIR_IN[24:21]== 4'b1010) || (tempIR_IN[24:21]== 4'b1011)) encoder_OUT = 7'b1011110;
					else encoder_OUT = 7'b0101100;
			end
			else 
			begin
					case ({tempIR_IN[24],tempIR_IN[22:20],tempIR_IN[7],tempIR_IN[4]})
					//Signed Store Immediate Post Index
					6'b010011:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0000100;
					else encoder_OUT = 7'b0000110;
					end
					// Signed Store Immediate Pre-Index
					6'b111011:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0001000;
					else encoder_OUT = 7'b0001010;
					end
					//Signed Store Register Post Index
					6'b000011:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0001011;
					else encoder_OUT = 7'b0001101;
					end
					//Signed Store Register Pre-indexed
					6'b101011:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0001111;
					else encoder_OUT = 7'b0010001;
					end
					//Signed Store Register Offset
					6'b100011:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0010010;
					else encoder_OUT = 7'b0010011;
					end
					//Signed Store Immediate Offset
					6'b110011:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0010100;
					else encoder_OUT = 7'b0010101;
					end
					//Signed Load Immediate Post Index
					6'b010111:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0010110;
					else encoder_OUT = 7'b0011000;
					end
					//Signed Load Immediate Pre-Indexed
					6'b111111:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0011010;
					else encoder_OUT = 7'b0011100;
					end
					//Signed Load Register Post-Indexed
					6'b000111:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0011101;
					else encoder_OUT = 7'b0011111;
					end
					//Signed Load Register Pre-Indexed
					6'b101111:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0100001;
					else encoder_OUT = 7'b0100011;
					end
					//Signed Load Register Offset
					6'b100111:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0100100;
					else encoder_OUT = 7'b0100101;
					end
					//Signed Load Immediate Offset
					6'b110111:
					begin
						if(tempIR_IN[23]==0) encoder_OUT= 7'b0100110;
					else encoder_OUT = 7'b0100111;
					end
					endcase
			end
		end	
		3'b001: encoder_OUT = 7'b0101011; //43 = 32-bit Immediate Shifter Operand
		3'b010:
		begin
				case({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]})
				//Unsigned Load Immediate Offset
				3'b101:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b1001111;
					else encoder_OUT = 7'b1010000;
				end
				//Unsigned Load Immediate Pre-Indexed
				3'b111:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b1000011;
					else encoder_OUT = 7'b1000101;
				end
				//Unsigned Load Immediate Post-Indexed
				3'b001:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b0111111;
					else encoder_OUT = 7'b1000001;
				end
				//Unsigned Store Immediate Pre-Indexed
				3'b110:
				begin
						if(tempIR_IN[23]==0) encoder_OUT = 7'b0110001;
						else encoder_OUT = 7'b0110011;
				end
				//Unsigned Store Immediate Post Indexed
				3'b000:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b0101101;
					else encoder_OUT = 7'b0101111;
				end
				//Unsigned store Immediate offset
				3'b100:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b0111101;
					else encoder_OUT = 7'b0111110;
				end
				endcase
		end
		3'b011:
		begin
				case({tempIR_IN[24],tempIR_IN[21],tempIR_IN[20]})
				//Unsigned Load Register offset
				3'b101:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b1001101;
						else encoder_OUT = 7'b1001110;
				end
				//Unsigned Load Register Pre-Indexed
				3'b111:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b1001010;
						else encoder_OUT = 7'b1001100;
				end
				//Unsigned Load Register Post Indexed
				3'b001:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b1000110;
						else encoder_OUT = 7'b1001000;
				end
				//Unsigned Store Register Offset
				3'b100:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b0111011;
						else encoder_OUT = 7'b0111100;
				end
				//Unsigned Store Register Pre-Indexed
				3'b110:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b0111000;
						else encoder_OUT = 7'b0111010;
				end
				//Unsigned Store Register Post-Indexed
				3'b000:
				begin
					if(tempIR_IN[23]==0) encoder_OUT = 7'b0110100;
						else encoder_OUT = 7'b0110110;
				end
			endcase
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