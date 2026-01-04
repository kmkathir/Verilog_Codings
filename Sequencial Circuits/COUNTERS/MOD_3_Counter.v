//Design of MOD 3 Counter using Behavioral Modeling in Verilog
// EDA PLAYGROUND LINK : https://edaplayground.com/x/Y57c

module mod3_cntr(clk,rst,q,qb);
  input clk,rst;
  output reg [3:0]q;
  output [3:0] qb;
  
