module test_mux_4x1_cu;
	reg   I0; //Las entradas del módulo deben ser tipo reg
	reg   I1; //Las entradas del módulo deben ser tipo reg
	reg   I2; //Las entradas del módulo deben ser tipo reg
	reg   I3; //Las entradas del módulo deben ser tipo reg
	wire   Y; //Las salidas deben ser tipo wire
	reg [1:0] S;
	parameter sim_time = 1000;
	mux_4x1_4_cu mux1 (Y, S, I0, I1, I2, I3); // Instanciación del módulo
	initial #sim_time $finish; // Especifica cuando termina simulación
	initial begin
	I0= 1'b1;
	I1= 1'b0;
	I2= 1'b1;
	I3= 1'b0;
	S=1'b0;
	repeat (3) #10 S=S+1'b1; //cada 10 unidades de tiempo
	end
	initial begin
	$display (" S \t I3 \t I2 \t I1 \t I0 \t Y  "); //imprime header
	$monitor (" %b %b %b %b %b %b", S, I3, I2, I1, I0, Y); //imprime las señales
	end
endmodule
