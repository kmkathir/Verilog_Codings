//Designing 4 bit Asynchronous Up counter using T Flip-Flops made from JK Flip-Flops to BCD counter
// EDA PLAYGROUND LINK : https://edaplayground.com/x/ADAK 

/************ Design Code *********************/

/* write jk ff code and instantiate it to make t ff code and 
then use the below code to design 4 bit asyncronous down counter and convert it to BCD counter*/

`include "tff.sv"
module cntr_4bit(clk,reset,q,qb);
  input clk,reset;
  output reg [3:0]q;
  output [3:0] qb;
  wire rst_int;
  Tff a0 (.T(1'b1), .clk(clk),  .rst(rst_int), .q(q[0]), .qb(qb[0]));
  Tff a1 (.T(1'b1), .clk(q[0]), .rst(rst_int), .q(q[1]), .qb(qb[1]));
  Tff a2 (.T(1'b1), .clk(q[1]), .rst(rst_int), .q(q[2]), .qb(qb[2]));
  Tff a3 (.T(1'b1), .clk(q[2]), .rst(rst_int), .q(q[3]), .qb(qb[3]));
         
  assign rst_int = reset | ( q[1] & q[3]);
  
endmodule

//************ Testbench Code *********************/

module cntr_4bit_test;
  reg clk,reset;
  wire [3:0]q;
  wire [3:0] qb;
  cntr_4bit uut (clk,reset,q,qb);
  