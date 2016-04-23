module test_microstore_rom;

reg [6:0] index; //Las entradas deben ser tipo reg
reg [6:0] counter;

wire [44:0] out; // Las salidas deben ser tipo wire

parameter sim_time = 15;

microstore_rom rom ( out, index);

initial #sim_time $finish; // Especifica cuando termina simulación

initial begin

counter = 0;

index = 0;

repeat(8) #2 counter = counter + 1;
end

always@(counter)
	begin
		case(counter)
			6'd0:
			begin
				index = counter;
			end
			6'd1:
			begin
				index = counter;
			end
			3'd2:
			begin
				index = counter;
			end
			6'd3:
			begin
				index = counter;
			end
			6'd4:
			begin
				index = counter;
			end
			6'd5:
			begin
				index = counter;
			end
			6'd6:
			begin
				index = counter;
			end
			6'd7:
			begin
				index = counter;
			end
		endcase
	end
	
	initial
	begin
	$display("\tIndex\t\tCase:");
	$monitor("\t%b\t\t%b",index, out);
	end
	
endmodule
	

