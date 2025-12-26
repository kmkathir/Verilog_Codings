//Designing a T Flip Flop using Verilog HDL
// EDA PLAYGROUND LINK : https://edaplayground.com/x/jQRy 

/************ Design Code *********************/

module Tff (T,clk,rst,q,qb);
  input T,clk,rst;
  output reg q;
  output qb;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
       q<=0;
      else
        begin
        if(T==0)
          q<=q;
      else if (T==1)
          q<=~q;
      else
        q<=1'bx;  //put 0 for toggle understanding
        end
    end
  assign qb=~q; 
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
    $dumpfile("kathir.vcd");
      $dumpvars(0,Tff_test);
    end

endmodule 