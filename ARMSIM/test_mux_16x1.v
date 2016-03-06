module test_mux_16x1;

reg  [31: 0] I0; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I1; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I2; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I3; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I4; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I5; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I6; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I7; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I8; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I9; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I10; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I11; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I12; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I13; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I14; //Las entradas del módulo deben ser tipo reg
reg  [31: 0] I15; //Las entradas del módulo deben ser tipo reg
wire [31: 0] Y; //Las salidas deben ser tipo wire
reg [3:0] S;


parameter sim_time = 1000;

mux_16x1 mux2 (Y, S, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15);

initial #sim_time $finish; // Especifica cuando termina simulación
initial begin
I0= 32'h0;
I1= 32'h1;
I2= 32'h2;
I3= 32'h3;
I4= 32'h4;
I5= 32'h5;
I6= 32'h6;
I7= 32'h7;
I8= 32'h8;
I9= 32'h9;
I10= 32'hA;
I11= 32'hB;
I12= 32'hC;
I13= 32'hD;
I14= 32'hE;
I15= 32'hF;
S = 4'b0000;
repeat (16) #16 S=S+1'b1;
end
initial begin
$display (" S \t I15 \t I14 \t I13 \t I12 \t I11 \t I10 \t I9 \t I8 \t I7 \t I6 \t I5 \t I4 \t I3 \t I2 \t I1 \t I0 \t Y  "); //imprime header
$monitor (" %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h %h ", S, I15, I14, I13, I12, I11, I10, I9, I8, I7, I6, I15, I4, I3, I2, I1, I0 , Y); //imprime las señales
end
endmodule
