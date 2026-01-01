//Design of Asynchronous 4-bit Down Counter using T Flip-Flops made from JK Flip-Flops
// EDA PLAYGROUND LINK : https://edaplayground.com/x/NrNx 

/************ Design Code *********************/

/* write jk ff code and instantiate it to make t ff code and 
then use the below code to design 4 bit asyncronous down counter */

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

/************ Testbench Code *********************/

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
      
      #200 $finish;
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
  
  
  