/*
Para demostrar el proyecto necesitan conectar el procesador a una memoria RAM de al menos 256 bytes. 
Esta debe estar organizada Big Endian y debe proveer acceso tanto a bytes (8bits), halfwords (16 bits),
words(32 bits) y doublewords (64 bits). 
Es imprescindible que la memoria sea accedida de manera asincrónica mediante handshaking. 
No se puede presumir que la memoria va a responder dentro de un tiempo específico.
Ejemplo:
module ram128x32 (output reg [31:0] DataOut, input Enable, ReadWrite, 
				  input [6:0] Address, input [31:0]DataIn);
	reg [31:0] Mem[0:127]; //128 localizaciones de 32 bits
	always @ (Enable, ReadWrite)
	if (Enable)
		if (ReadWrite) DataOut = Mem[Address];
		else Mem[Address] = DataIn;
	else DataOut = 32'bz;
endmodule
*/
module ram_256
(
	output reg [31:0] DataOut, output reg MFC,
	input Enable, input ReadWrite, input [7:0] Address, 
	input [31:0] DataIn, input [1:0] DataSize 
);

	reg [7:0] Mem[0:255]; //256 localizaciones de 8 bits
	
	parameter BYTE = 2'b00;
	parameter HALF = 2'b01;
	parameter WORD = 2'b10;
	//parameter DWORD = 2'b11;
  
	always @ (Enable, ReadWrite, DataSize, DataIn)
	begin
		if(Enable)
		begin
			MFC = 1'b0;
				case(DataSize)
				BYTE:
						if(ReadWrite) DataOut[7:0] = Mem[Address]; 								
						else
						begin 
							Mem[Address] = DataIn[7:0];
						end
				HALF:
						if(ReadWrite)
							begin
								DataOut[15:8] = Mem[Address];
								DataOut[7:0] = Mem[Address+1];
							end
						else
							begin
								Mem[Address] = DataIn[15:8];
								Mem[Address + 1] = DataIn[7:0];		
							end
				WORD:
						if(ReadWrite)
							begin
								DataOut[31:24] = Mem[Address];
								DataOut[23:16] = Mem[Address+1];
								DataOut[15:8] = Mem[Address+2];
								DataOut[7:0] = Mem[Address+3];													
							end
						else
							begin
								Mem[Address] = DataIn[31:24];
								Mem[Address + 1] = DataIn[23:16];
								Mem[Address + 2] = DataIn[15:8];
								Mem[Address + 3] = DataIn[7:0];					
							end	
				default:
						if(ReadWrite) DataOut[7:0] = Mem[Address]; 
						else Mem[Address] = DataIn[7:0];
				endcase
			MFC = 1'b1;
		end
		//else DataOut = 32'bz;
	end
endmodule