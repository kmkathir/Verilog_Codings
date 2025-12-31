//Design of Asynchronous 4-bit Up Counter using T Flip-Flops made from JK Flip-Flops
// EDA PLAYGROUND LINK : https://edaplayground.com/x/J9JF


/************ Design Code *********************/

////// cODE FOR jk FLIP FLOP ///////////

module jkff(j,k,rst,clk,q,qb);
  input j,k,rst, clk;
  output reg q;
   output qb;
  always@(negedge clk or posedge rst)
    begin
      if(rst)
        q<=1'b0;
      else 
        begin
          case({j,k})
            2'b00:q<=q;                  //No change
            2'b01:q<=1'b0;              //reset
            2'b10:q<=1'b1;             //Set
            2'b11:q<=~q;              //Toggle
            default: q<=1'b0;        //default
          endcase
        end
    end
    assign qb=~q;
endmodule

////// CODE FOR T FLIP FLOP USING JK FLIP FLOP ///////////

`include "jkff.sv"
module Tff (T,clk,rst,q,qb);
  input T,clk,rst;
  output reg q;
  output qb;
  
  jkff j1 (.j(T), .k(T), .rst(rst), .clk(clk), .q(q), .qb(qb));
  
endmodule

////// CODE FOR 4 BIT ASYNCHRONOUS UP COUNTER USING T FLIP FLOPS ///////////

`include "tff.sv"
module cntr_4bit(clk,rst,q,qb);
  input clk,rst;
  output reg [3:0]q;
  output [3:0] qb;
 
Tff a0 (.T(1'b1), .clk(clk),  .rst(rst), .q(q[0]), .qb(qb[0]));
  Tff a1 (.T(1'b1), .clk(q[0]), .rst(rst), .q(q[1]), .qb(qb[1]));
  Tff a2 (.T(1'b1), .clk(q[1]), .rst(rst), .q(q[2]), .qb(qb[2]));
  Tff a3 (.T(1'b1), .clk(q[2]), .rst(rst), .q(q[3]), .qb(qb[3]));
  
  
    
endmodule


  ////// Testbench Code ///////////

  module cntr_4bit_test;
  reg clk,rst;
  wire [3:0]q;
  wire [3:0] qb;
  cntr_4bit uut (clk,rst,q,qb);
 always #5 clk=~clk;
  initial
    begin
      clk = 0; rst =1;
      #10 rst = 0;
      
      #600 $finish;
    end
  initial
    begin
      $monitor($time, "  rst=%b...Clk=%b....q=%b....qb=%b", rst, clk, q, qb);
    end
  initial
    begin
    $dumpfile("kathir.vcd");
     $dumpvars(0,cntr_4bit_test);
    end
endmodule
  
  
  