module next_state_add_sel(output reg [1:0] M, input [2:0] ns, input sts);
	always @ (ns, sts)
	case(ns)
		3'b000: M = 2'b00;	//encoder
		3'b001: M = 2'b01;	//0
		3'b010: M = 2'b10;	//pipeline
		3'b011: M = 2'b11;	//incrementer
		3'b100: 
			case(sts)
				0: M = 2'b00;	//encoder
				1: M = 2'b10;	//pipeline
			endcase
		3'b101:
			case(sts)
				0: M = 2'b11;	//incrementer
				1: M = 2'b10;	//pipeline
			endcase
		3'b110:
			case(sts)
				0: M = 2'b11;	//incrementer
				1: M = 2'b00;	//encoder
			endcase
		3'b111: M = 2'b01;	//0
	endcase
endmodule