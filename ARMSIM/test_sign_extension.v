module test_sign_extension;
	reg  [31: 0] D; 
	wire [31:0] Q;
	reg [1:0] dataSize;
	reg  E, CLK;

	parameter sim_time = 1000;

	signExtension sign_extension(Q, D, dataSize, E);

	initial #sim_time $finish; // Especifica cuando termina simulación
	initial 
	begin
		D<= 32'h0000FF03;
		CLK <= 1'b0;
		E<=1'b0;
		dataSize <= 2'b00;

		#10 repeat (80) #10
		begin
			#1 CLK <= ~CLK;
		end
	end

	initial
	begin
		#70 E=~E;
		#300 D<= 32'hF0E47492;
	end
	always @(CLK) 
	begin
		if(CLK)
		begin
			dataSize <= dataSize + 1'h1;
			
		end
		
	end

	initial begin
	    $display ("CLK E  dataSize  D \t \t \tQ"); //imprime header
	    $monitor ("%h    %h     %b      %b    \t %b   ", CLK, E,  dataSize, D, Q); //imprime las señales
	    
		
	end

endmodule
