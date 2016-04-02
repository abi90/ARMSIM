module test_register_file;
	reg  [31: 0] I0; //Las entradas del módulo deben ser tipo reg
	reg [3:0] writeAddress, addressA, addressB;
	wire [31:0] A, B;
	reg RW, CLR, CLK;

	parameter sim_time = 300;

	register_file registerFile(A,B, writeAddress, addressA, addressB, I0, RW, CLR, CLK);

	initial #sim_time $finish; // Especifica cuando termina simulación
	initial 
	begin
		I0 = 32'hffffffff;
		CLK = 0;
		CLR = 0;
		#1 CLR = ~CLR;
		writeAddress = 4'hf;
		addressA = 4'hf;
		addressB = 4'hf;
		RW = 1'b1;
		repeat (127) 
		begin
			#1 CLK = ~CLK;
		end
	end

	always @(addressA) begin
	if(addressA === 4'h0) 
	begin 
		RW = ~RW;
		I0= 32'hffffffff;
	end
	end

	always @(CLK) 
	begin
		if(CLK)
		begin
			I0=I0+32'b1;
			addressA = addressA + 1'h1;
			addressB = addressA - 1'h1;
			writeAddress=addressA;
		end
	end

	initial begin
	    $display ("CLK RW  WAdds AddsA  AddsB  I0\t\t A\t   B "); //imprime header
	    $monitor ("%h    %h  %h     %h      %h      %h   %h  %h ", CLK, RW, writeAddress, addressA, addressB, I0, A, B); //imprime las señales
	    
		#130 $display ("Registers:"); 
	 	$display("R0 = %h ", registerFile.R0.Q);
		$display("R1 = %h ", registerFile.R1.Q);
		$display("R2 = %h ", registerFile.R2.Q);
		$display("R3 = %h ", registerFile.R3.Q);
		$display("R4 = %h ", registerFile.R4.Q);
		$display("R5 = %h ", registerFile.R5.Q);
		$display("R6 = %h ", registerFile.R6.Q);
		$display("R7 = %h ", registerFile.R7.Q);
		$display("R8 = %h ", registerFile.R8.Q);
		$display("R9 = %h ", registerFile.R9.Q);
		$display("R10= %h ", registerFile.R10.Q);
		$display("R11= %h ", registerFile.R11.Q);
		$display("R12= %h ", registerFile.R12.Q);
		$display("R13= %h ", registerFile.R13.Q);
		$display("R14= %h ", registerFile.R14.Q);
		$display("R15= %h ", registerFile.R15.Q);
	end
endmodule
