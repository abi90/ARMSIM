module next_state_add_sel(output reg [2:0] M, input [2:0] NS, input Sts);
	always @ (NS, Sts)
	case(NS)
		3'b000: M = 3'b000;		//Encoder
		3'b001: M = 3'b001;		//0
		3'b010: M = 3'b010;		//Pipeline
		3'b011: M = 3'b011;		//Incrementer
		3'b100: 
			case(Sts)
				0: M = 3'b000;	//Encoder
				1: M = 3'b010;	//Pipeline
			endcase
		3'b101:
			case(Sts)
				0: M = 3'b011;	//Incrementer
				1: M = 3'b010;	//Pipeline
			endcase
		3'b110:
			case(Sts)
				0: M = 3'b011;	//Incrementer
				1: M = 3'b000;	//Encoder
			endcase
		3'b111:
			case(Sts)
				0: M = 3'b100;	//Past State
				1: M = 3'b010;	//Pipeline
			endcase
	endcase
endmodule