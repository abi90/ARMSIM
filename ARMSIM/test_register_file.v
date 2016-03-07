module test_register_file;

reg  [31: 0] I0; //Las entradas del módulo deben ser tipo reg
reg [3:0] addressA, addressB;
wire [31:0] A, B;
reg RW, CLR, CLK;

parameter sim_time = 10000;

register_file registerFile(A,B, addressA, addressB, I0, RW, CLR, CLK);

initial #sim_time $finish; // Especifica cuando termina simulación
initial begin
CLK = 0;
I0= 32'h0;
addressA = 4'b0000;
addressB = 4'b0000;
RW = 1'b0;
repeat (64) begin
#1 CLK = ~CLK;
#5 I0=I0+1'h1;
#5 addressA = addressA + 1'h1;
#5 addressB = addressB + 1'h1;
end
end

always @(addressA) begin
if(addressA === 4'h0) RW = ~RW;
end

initial begin
$display ("CLK\tRW\taddressA\taddressB\tI0\t\tA\t\tB"); //imprime header
$monitor ("%h\t%h\t%h\t\t%h\t\t%h\t%h\t%h", CLK, RW, addressA, addressB, I0, A, B); //imprime las señales
end
endmodule

