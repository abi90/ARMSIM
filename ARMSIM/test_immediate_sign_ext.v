module test_immediate_sign_ext;
	reg  [31:0] Instruction; //Las entradas del módulo deben ser tipo reg
	wire [31:0] DataOut;
	reg Enable;
	reg [1:0] Select;
	reg [2:0] counter;
	parameter sim_time = 15;
	
	immediate_sign_extension ext (DataOut, Instruction,  Enable, Select);
	
	initial #sim_time $finish; // Especifica cuando termina simulación
	
	initial begin
	counter = 0;
	Instruction = 32'b00000000000000000000111110001111;
	Enable = 0;
	repeat(8) #2 counter = counter + 1;
	end

	always@(counter)
	begin
		case(counter)
			3'd0:
			begin
				Select = 0;
			end
			3'd1:
			begin
				Select = 2'd1;
			end
			3'd2:
			begin
				Select = 2'd2;
			end
			3'd3:
			begin
				Select = 2'd3;
			end
			3'd4:
			begin
			    Enable = 1;
				Select = 0;
			end
			3'd5:
			begin
				Select = 2'd1;
			end
			3'd6:
			begin
				Select = 2'd2;
			end
			3'd7:
			begin
				Select = 2'd3;
			end
		endcase
	end

	initial
	begin
	$display ("Instruction, DataOut,  Enable, Select"); //imprime header
	$monitor ("%h\t%h\t%h\t%h", Instruction, DataOut,  Enable, Select); //imprime las señales
	end
endmodule