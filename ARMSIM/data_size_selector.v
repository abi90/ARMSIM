////////////////////
//Data Size Selector
////////////////////
module data_size_selector(output reg [1:0] DataSize, input [31:0] IR, input [1:0] DSS);
	parameter WORD = 2'b10;
	wire [1:0] misc_sel_out, reg_sel_out;
	misc_sel misc(misc_sel_out, {IR[20],IR[6],IR[5]});
	reg_sel reg_sel(reg_sel_out, IR[22]);

	always@(*)
	begin
		case(DSS)
			2'b01: DataSize = misc_sel_out;
			2'b10: DataSize = reg_sel_out;
			default: DataSize =	WORD;
		endcase
	end
endmodule

module misc_sel(output reg [1:0] dataSize, input [2:0] LSH);
	parameter BYTE = 2'b00;
	parameter HALF = 2'b01;
	parameter DWORD = 2'b11;
	always@(*)
		begin
			case(LSH)
				3'b000: dataSize = 0;
				3'b001: dataSize = HALF;
				3'b010: dataSize = DWORD;
				3'b011: dataSize = DWORD;
				3'b100: dataSize = 0;
				3'b101: dataSize = HALF;
				3'b110: dataSize = BYTE;
				3'b111: dataSize = HALF;
				default: dataSize =0;
			endcase
	end
endmodule

module reg_sel(output reg [1:0] dataSize, input B);
	parameter BYTE = 2'b00;
	parameter WORD = 2'b10;
	always@(*)
	begin
		case(B)
			1'b0: dataSize = WORD; 
			1'b1: dataSize = BYTE;
			default: dataSize =0;
		endcase
	end
endmodule
