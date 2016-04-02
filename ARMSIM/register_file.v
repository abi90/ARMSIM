module register_file(output [31:0] outA, outB, input [3:0] writeAddress, addressA, addressB, input [31:0] inputData, input RW, CLR, CLK);

	// outA, outB son las salidas de los MUX
	// writeAddress es la direccion donde se va a escribir
	// addressA es la direccion donde se va a leer para poner info en outA
	// addressB es la direccion donde se va a leer para poner info en outB
	// inputData es la informacion que se va a escribir
	// RW es la se~al que determina si vamos a leer=1/escribir=0
	// CLR es para borrar registro; clear=0/notClear=1
	// CLK	se~al positive edge triggered

	wire [15:0] registerEnable;


	wire [31:0] outR0, outR1, outR2, outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15, outR15Temp;
	wire [31:0] inputDataTemp;
	always @ (writeAddress, addressA, addressB, inputData, RW, CLR, CLK);

	//Determine registerEnable
	decoder_4x16 decoder (registerEnable, writeAddress, ~RW);

	//Write to Register Bank 
	register_32_bits R0  (outR0,  inputData, ~registerEnable[0],  CLR, CLK);
	register_32_bits R1  (outR1,  inputData, ~registerEnable[1],  CLR, CLK);
	register_32_bits R2  (outR2,  inputData, ~registerEnable[2],  CLR, CLK);
	register_32_bits R3  (outR3,  inputData, ~registerEnable[3],  CLR, CLK);
	register_32_bits R4  (outR4,  inputData, ~registerEnable[4],  CLR, CLK);
	register_32_bits R5  (outR5,  inputData, ~registerEnable[5],  CLR, CLK);
	register_32_bits R6  (outR6,  inputData, ~registerEnable[6],  CLR, CLK);
	register_32_bits R7  (outR7,  inputData, ~registerEnable[7],  CLR, CLK);
	register_32_bits R8  (outR8,  inputData, ~registerEnable[8],  CLR, CLK);
	register_32_bits R9  (outR9,  inputData, ~registerEnable[9],  CLR, CLK);
	register_32_bits R10 (outR10, inputData, ~registerEnable[10], CLR, CLK);
	register_32_bits R11 (outR11, inputData, ~registerEnable[11], CLR, CLK);
	register_32_bits R12 (outR12, inputData, ~registerEnable[12], CLR, CLK);
	register_32_bits R13 (outR13, inputData, ~registerEnable[13], CLR, CLK);
	register_32_bits R14 (outR14, inputData, ~registerEnable[14], CLR, CLK);
	

	//Making the two least significant bits 0 for PC register.
	assign inputDataTemp= inputData;
	assign inputDataTemp[0]=0;
	assign inputDataTemp[1]=0;
	register_32_bits R15 (outR15, inputDataTemp, ~registerEnable[15], CLR, CLK);
	assign outR15Temp= outR15+8;

	//Select outA/B
	mux_16x1 muxA (outA, addressA, outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12, outR13, outR14, outR15Temp);

	mux_16x1 muxB (outB, addressB, outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12, outR13, outR14, outR15Temp);

endmodule