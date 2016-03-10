module test_ram_256;
	
	reg  [31: 0] DataIn; //Las entradas del módulo deben ser tipo reg
	reg [7:0] Address;
	wire [31:0] DataOut;
	wire MFC;
	reg RW, Enable;
	reg [1:0] DataSize;
	reg [2:0] counter;
	parameter sim_time = 15;
	
	ram_256 ram_module (DataOut, MFC, Enable, RW, Address, DataIn, DataSize);
	
	initial #sim_time $finish; // Especifica cuando termina simulación
	
	initial begin
	counter = 0;
	DataIn = 0;
	DataSize = 0;
	RW = 0;
	Enable = 0;
	repeat(8) #2 counter = counter + 1;
	end

	always@(counter)
	begin
		case(counter)
			3'd0:
			begin
				//Case ~Enable Write
				Enable = 1'b0;
				RW = 1'b0;
				Address = 8'h00;
				DataSize = 2'b00;
				DataIn = 32'hFFFFFFFF;					
			end
			3'd1:
			begin
				//Case ~Enable Read
				Enable = 1'b0;
				RW = 1'b1;
				Address = 8'h00;
				DataSize = 2'b00;
			end
			3'd2:
			begin
				//Case Write Enable Byte
				Enable = 1'b1;
				RW = 1'b0;
				Address = 8'h00;
				DataSize = 2'b00;
				DataIn = 32'hFFFFFF0B;
			end
			3'd3:
			begin
				//Case Read Enable Byte
				RW = 1'b1;
				Address = 8'h00;
				DataSize = 2'b00;
			end
			3'd4:
			begin
				//Case Write Enable Half Word
				RW = 1'b0;
				Address = 8'hF0;
				DataSize = 2'b01;
				DataIn = 32'hABCDEF1A;
			end
			3'd5:
			begin
				//Case Read Enable Half Word
				RW = 1'b1;
				Address = 8'hF0;
				DataSize = 2'b01;
			end
			3'd6:
			begin
				//Case Write Enable Word
				RW = 1'b0;
				Address = 8'hFC;
				DataSize = 2'b10;
				DataIn = 32'hABCDEF1C;
			end
			3'd7:
			begin
				//Case Read Enable Word
				RW = 1'b1;
				Address = 8'hFC;
				DataSize = 2'b10;
			end
		endcase
	end

	initial
	begin
	$display ("EN\tRW\tAddress MFC\tDSize\tDI\t\tDOut"); //imprime header
	$monitor ("%h\t%h\t%h\t%h\t%h\t%h\t%h", Enable, RW, Address,MFC, DataSize, DataIn, DataOut); //imprime las señales
	end

endmodule

