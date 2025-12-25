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