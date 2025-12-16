// Testbench beginner level 

module test;
  reg a;
  reg[3:0]b;
  reg c;
  reg[0:7]d;
  
  initial 
    begin
      a=1;
      b=4'b10110; // 4'hA 4'd10 4'o12
      c=0;
      d=8'b11100010; // 8'hE2 -->8'd226
      
      $display("a=%b", a);
      $display("c=%b", c);
      $display("b=%b", b);
      $display("d=%b", d);
      $display("b=%h", b);
      $display("d=%h", d);
      $display("b=%d", b);
      $display("d=%d", d);
      $display("b=%o", b);
      $display("d=%o", d);
      
    end
endmodule

/*********** Tesbench ***********/


module logic_gates_test;

  reg a, b;
  wire yo, y1, y2, y3, y4, y5, y6;

  // Instantiate DUT (Device Under Test)
  logic_gates dut (a,b,yo,y1,y2,y3,y4,y5,y6);
    

  initial
   begin
    
    // Apply test cases
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    #10 $finish;
    
  end

initial 
begin 
  $dumpfile("logic_gates.vcd");
    $dumpvars(0,logic_gates_test);
end

endmodule
