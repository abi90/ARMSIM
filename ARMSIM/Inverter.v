///////////
//Inverter
//////////

module inverter(output reg out, input in, inv);
	always @ (in, inv)
	//Invierte el output al cumplir con la condición de invertir
	if(inv)	
		out = ~in;
	//Output se mantiene igual
	else
		out = in;
endmodule
