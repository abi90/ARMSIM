/////////////////////////
//Branch Extender Tester
////////////////////////

module Branch_Ext_Tester();
  
  wire [31:0] out;
  
  reg [23:0] ofst;
  
  Branch_Ext BranchExt(out, ofst);  

  initial #500 $finish;

  initial

    begin

    ofst = 24'b110101010101010101010101;

    end
  
  initial 

  begin 

    $display("Offset: %b", ofst);

#5    $display("Final output: %b", out);

  end

endmodule
