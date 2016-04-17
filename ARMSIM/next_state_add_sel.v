module next_state_add_sel(output reg [2:0] M, input [2:0] NS, input Sts);
	always @ (NS, Sts)
	case(NS)
		3'b000: M = 2'b00;		//Encoder
		3'b001: M = 2'b01;		//0
		3'b010: M = 2'b10;		//Pipeline
		3'b011: M = 2'b11;		//Incrementer
		3'b100: 
			case(Sts)
				0: M = 2'b000;	//Encoder
				1: M = 2'b010;	//Pipeline
			endcase
		3'b101:
			case(Sts)
				0: M = 2'b011;	//Incrementer
				1: M = 2'b010;	//Pipeline
			endcase
		3'b110:
			case(Sts)
				0: M = 2'b011;	//Incrementer
				1: M = 2'b000;	//Encoder
			endcase
		3'b111:
			case(Sts)
				0: M = 2'b100;	//Past State
				1: M = 2'b010;	//Pipeline
			endcase
	endcase
endmodule