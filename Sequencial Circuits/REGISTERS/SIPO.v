//Designing a Serial In Parallel Out Shift Register (SIPO) using D Flip-Flops
// EDA PLAYGROUND LINK : https://edaplayground.com/x/h4tg

/************ Design Code *********************/

//Design code for D Flip-Flop

module dff (d,clk,rst,q,qb);
  input d,clk,rst;
  output reg q;
  output qb;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
       q<=0;
      else
        q<=d;
    end
  assign qb=~q;
endmodule

//Design code for SIPO Shift Register using D Flip-Flops

`include "dff.sv"
module sipo(sin,sout,clk,rst);
  input sin,clk,rst;
  
  output  [3:0] sout;
  wire[3:0]q;
  
  dff d0 (.d(sin), .clk(clk), .rst(rst), .q(q[0]));
  dff d1 (.d(q[0]), .clk(clk), .rst(rst), .q(q[1]));
  dff d2 (.d(q[1]), .clk(clk), .rst(rst), .q(q[2]));
  dff d3 (.d(q[2]), .clk(clk), .rst(rst), .q(q[3]));
  
  assign sout=q;
endmodule

//Design code for SIPO Shift Register using Behavioral Modeling

module sipo(sin,pout,clk,rst);
  input sin,clk,rst;
  
  output [3:0]pout;
  reg [3:0]q;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        q<=4'b0000;
      else
        q<={q[2],q[1],q[0],sin};
    end
  
  assign sout=q[3];
endmodule


//************ Testbench Code *********************/

module sipo_test;
   reg sin,clk,rst;
  wire [3:0] sout;
  
  sipo uut(sin,sout,clk,rst);
   always #5 clk= ~clk;
  
  initial
    begin
      rst=1; clk = 0;
      #10 rst=0;
      #20 sin=1;
      #20 sin=0;
      #20 sin=1;
      
      #50 $finish;
      
    end
  
  initial
    begin
      $monitor($time,  "   rst=%b---clk=%b---sin=%b---sout=%b",rst,clk,sin,sout);
    end
  initial
    begin
      $dumpfile("kathir.vcd");
      $dumpvars(0,sipo_test);
    end
endmodule
  