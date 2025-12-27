//Designing a T Flip Flop using JK Flip Flop
// EDA PLAYGROUND LINK : https://edaplayground.com/x/AgFB

/************ Design Code *********************/

`include "jkff.sv"
module Tff (T,clk,rst,q,qb);
  input T,clk,rst;
  output reg q;
  output qb;
  
  jkff j1 (.j(T), .k(T), .rst(rst), .clk(clk), .q(q), .qb(qb));
  
endmodule
  

    //******************** TestBench **********************/

    module Tff_test;
  reg T,clk,rst;
  wire q;
  wire qb;
  Tff d1 (T,clk,rst,q,qb);
  always #5 clk = ~clk;
  
  initial
   begin
     clk = 0; rst = 1;
     #10 rst = 0;
     #10 T = 1;  //20 T=1--Toggling strted
    
     #50 T = 0; //70---T=0--Toggling stopped---Now Nochnage state
     
     #30
     $finish;
   end
  initial
    $monitor($time, "  rst=%b...Clk=%b....T=%b....q=%b....qb=%b", rst, clk, T, q, qb);
 
  initial
    begin
    $dumpfile("prg.vcd");
      $dumpvars(0,Tff_test);
    end

endmodule 