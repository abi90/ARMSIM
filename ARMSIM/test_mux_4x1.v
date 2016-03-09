module test_mux_4x1;
reg  [31: 0] I0; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I1; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I2; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I3; //Las entradas del módulo deben ser tipo reg
wire [31: 0]  Y; //Las salidas deben ser tipo wire
reg [1:0] S;
parameter sim_time = 1000;
mux_4x1 mux1 (Y, S, I0, I1, I2, I3); // Instanciación del módulo
initial #sim_time $finish; // Especifica cuando termina simulación
initial begin

I0= 32'h0;
I1= 32'hFFFFFFFF;
I2= 32'hFFFF0000;
I3= 32'h0000FFFF;
S=1'b0;
repeat (3) #10 S=S+1'b1; //cada 10 unidades de tiempo
end
initial begin
$display (" S \t I3 \t I2 \t I1 \t I0 \t Y  "); //imprime header
$monitor (" %h %h %h %h %h %h", S, I3, I2, I1, I0, Y); //imprime las señales
end
endmodule
