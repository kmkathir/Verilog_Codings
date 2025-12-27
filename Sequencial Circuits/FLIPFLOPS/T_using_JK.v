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
  

  