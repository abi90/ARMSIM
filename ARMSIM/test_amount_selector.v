module test_mux_2x1;
reg  [31: 0] I0; //Las entradas del módulo deben ser tipo reg
wire [4: 0] Y; //Las salidas deben ser tipo wire
reg S;
parameter sim_time = 100;
amount_selector sel (Y, S, I0); // Instanciación del módulo
initial #sim_time $finish; // Especifica cuando termina simulación
initial begin
I0= 32'hFFFFFFFF;
S=1'b0;
repeat (1) #10 S=S+1'b1; //cada 10 unidades de tiempo
end
initial begin
$display (" S I I1 I0 Y"); //imprime header
$monitor (" %b %b %b", S, I0, Y); //imprime las señales
end
endmodule
