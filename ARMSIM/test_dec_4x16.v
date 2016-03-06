module test_dec_4x16;
reg  [3:0] I;
wire [15: 0] Y; //Las salidas deben ser tipo wire
reg enable;

parameter sim_time = 1000;
decoder_4x16 dec (Y, I, enable);
initial #sim_time $finish; // Especifica cuando termina simulación

initial begin
I = 2'b00; //Genera las combinaciones de las entradas
repeat (16) #16 I=I+1'b1; //cada 10 unidades de tiempo
end

always @(I)
begin
if(I === 4'b1111) begin
enable = ~enable;
end
end

initial begin
enable = 1'b1; //Genera las combinaciones de las entradas
$display ("En  I                Y"); //imprime header
$monitor ("%b    %b    %b", enable, I, Y); //imprime las señales
end

endmodule