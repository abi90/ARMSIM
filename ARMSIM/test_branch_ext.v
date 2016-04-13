/////////////////////////
//Branch Extender Tester
////////////////////////

module test_branch_ext;
  
  wire [31:0] out;
  
  reg [23:0] ofst;
  
  branch_ext branchExt(out, ofst);  

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
