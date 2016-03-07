module test_ram_256;

reg  [31: 0] DataIn; //Las entradas del módulo deben ser tipo reg
reg [7:0] Address;
wire [31:0] DataOut;
wire MFC;
reg RW, Enable;
reg [1:0] DataSize;
parameter sim_time = 1000000000;
//module ram_256(output reg [31:0] DataOut, output reg MFC, input Enable, ReadWrite, input [7:0] Address, input [32:0] DataIn, input [1:0] wordSelector );
ram_256 ram_module (DataOut, MFC, Enable, RW, Address, DataIn, DataSize);
initial #sim_time $finish; // Especifica cuando termina simulación
initial begin
//Case ~Enable Write
#10 Enable = 1'b0;
#10 RW = 1'b0;
#10 Address = 8'h00;
#10 DataSize = 2'b00;
#10 DataIn = 32'hFFFFFFFF;
//Case ~Enable Read
#100 Enable = 1'b0;
#100 RW = 1'b1;
#100 Address = 8'h00;
#100 DataSize = 2'b00;
//Case Write Enable Byte
#1000 Enable = 1'b1;
#1000 RW = 1'b0;
#1000 Address = 8'h00;
#1000 DataSize = 2'b00;
#1000 DataIn = 32'hFFFFFF0B;
//Case Read Enable Byte
#10000 RW = 1'b1;
#10000 Address = 8'h00;
#10000 DataSize = 2'b00;
//Case Write Enable Half Word
#100000 RW = 1'b0;
#100000 Address = 8'hF0;
#100000 DataSize = 2'b01;
#100000 DataIn = 32'hABCDEF1A;
//Case Read Enable Half Word
#1000000 RW = 1'b1;
#1000000 Address = 8'hF0;
#1000000 DataSize = 2'b01;
//Case Write Enable Word
#10000000 RW = 1'b0;
#10000000 Address = 8'hFC;
#10000000 DataSize = 2'b10;
#10000000 DataIn = 32'hABCDEF1C;
//Case Read Enable Word
#100000000 RW = 1'b1;
#100000000 Address = 8'hFC;
#100000000 DataSize = 2'b10;
end
initial
begin
$display ("Enable RW\tAddress\t MFC\t DataSize\t DataIn\t DataOut"); //imprime header
$monitor ("%h\t%h\t%h\t%h\t%h\t%h\t%h", Enable, RW, Address,MFC, DataSize, DataIn, DataOut); //imprime las señales
end
endmodule

