//Designing SISO (Serial In Serial Out) Shift Register using D Flip-Flops
// EDA PLAYGROUND LINK : https://edaplayground.com/x/kjBW

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

//Design code for SISO Shift Register using D Flip-Flops

`include "dff.sv"
module siso(sin,sout,clk,rst);
  input sin,clk,rst;
  
  output  sout;
  wire[3:0]q;
  
  dff d0 (.d(sin), .clk(clk), .rst(rst), .q(q[0]));
  dff d1 (.d(q[0]), .clk(clk), .rst(rst), .q(q[1]));
  dff d2 (.d(q[1]), .clk(clk), .rst(rst), .q(q[2]));
  dff d3 (.d(q[2]), .clk(clk), .rst(rst), .q(q[3]));
  
  
  
  
  assign sout=q[3];
endmodule

//************ Testbench Code *********************/

module siso_test;
   reg sin,clk,rst;
   wire sout;
  
  siso uut(sin,sout,clk,rst);
  
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
      $monitor($time,  "rst=%b---clk=%b---sin=%b---sout=%b",rst,clk,sin,sout);
    end
initial
    begin
      $dumpfile("prg.vcd");
      $dumpvars(0,siso_test);
    end
endmodule
  