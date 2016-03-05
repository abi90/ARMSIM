module test_mux_2x1;
reg  [2:0] I;
reg  [31: 0] I0; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I1; //Las entradas del módulo deben ser tipo reg
wire [31: 0] Y; //Las salidas deben ser tipo wire
reg S;
parameter sim_time = 100;
mux_2x1 mux1 (Y, S, I0, I1); // Instanciación del módulo
initial #sim_time $finish; // Especifica cuando termina simulación
initial begin
I = 3'b000; //Genera las combinaciones de las entradas
I0= 32'h0;
I1= 32'hFFFFFFFF;
S=1'b0;
repeat (1) #10 S=S+1'b1; //cada 10 unidades de tiempo
end
initial begin
$display (" S I I1 I0 Y"); //imprime header
$monitor (" %b %b %b %b %b", S, I, I1, I0, Y); //imprime las señales
end
endmodule
