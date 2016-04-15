module test_data_size_sel;
	parameter sim_time = 15;
	wire [1:0] DataSize;
	reg [31:0] IR;
	reg [1:0] DSS;
	reg [3:0] counter;
	data_size_selector dss (DataSize, IR, DSS);
	
	initial #sim_time $finish; // Especifica cuando termina simulación
	
	initial begin
	counter = 0;
	repeat(10) #2 counter = counter + 1;
	end

	always@(counter)
	begin
		case(counter)
			4'd0:
			begin
			IR<=32'b11100001111001100101101111011110;
			DSS<=2'b00;
			end
			4'd1:
			begin
			IR<=32'b1110010101010110010100000_0_0_10100;
			DSS<=2'b01;
			end
			4'd2:
			begin
			IR<=32'b11100001111001100101101111011110;
			DSS<=2'b01;
			end
			4'd3:
			begin
			IR<=32'b11100001111001100101101111011110;
			DSS<=2'b01;
			end
			4'd4:
			begin
			IR<=32'b11100001111001100101101111011110;
			DSS<=2'b01;
			end
			4'd5:
			begin
			IR<=32'b11100001111001100101101111011110;
			DSS<=2'b01;
			end
			4'd6:
			begin
			IR<=32'b11100001111001100101101111011110;
			DSS<=2'b11;
			end
			4'd7:
			begin
			IR<=32'b11100001111001100101101111011110;
			DSS<=2'b01;
			end
			4'd8:
			begin
			IR<=32'b11100001111001100101101111011110;
			DSS<=2'b01;
			end
			4'd9:
			begin
			IR<=32'b11100001111001100101101111011110;
			DSS<=2'b10;
			end
			default:
			begin
			IR<=32'b11100001111001100101101111011110;
			DSS<=2'b11;
			end
		endcase
	end

	initial
	begin
	$display ("IR\t\t\t\t\t\tDSS\tDataSize"); //imprime header
	$monitor ("%b\t%b\t%b", IR, DSS, DataSize); //imprime las señales
	end

endmodule