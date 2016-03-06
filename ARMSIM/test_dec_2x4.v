module test_dec_2x4;
reg  [1:0] I;
wire [3: 0] Y; //Las salidas deben ser tipo wire
reg enable;

parameter sim_time = 100;
decoder_2x4 dec (Y, I, enable);
initial #sim_time $finish; // Especifica cuando termina simulación

initial begin
I = 2'b00; //Genera las combinaciones de las entradas
repeat (8) #8 I=I+1'b1; //cada 10 unidades de tiempo
end

always @(I)
begin
if(I === 2'b11) enable = ~enable;
end

initial begin
enable = 1'b0; //Genera las combinaciones de las entradas
$display ("En I[1] I[0] Y"); //imprime header
$monitor ("%b    %b    %b    %b", enable, I[1], I[0], Y); //imprime las señales
end

endmodule