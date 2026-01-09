//Designing a Parallel In Serial Out Shift Register (PISO) using Verilog
// EDA PLAYGROUND LINK : https://edaplayground.com/x/Ye3p 

//************ Design Code *********************/

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

//Design code for 4-bit Parallel In Serial Out (PISO) Register

`include "dff.sv"
module piso(pin,sout,clk,rst,S_L);
  input clk,rst,S_L;
  input [3:0] pin;
  output  sout;
  reg [3:0] q;
 
  always@(posedge clk or posedge rst)
    begin
      if(rst)
		q<=4'b0000;
      else if(S_L==1)
        q<=pin;
      else if (S_L==0)
          q <= q>>1;
      else
         q<=4'bxxxx;
    end
      
  assign sout=q[0];

endmodule

//Testbench Code for 4-bit PISO Register

module piso_test;
reg clk,rst,S_L;
reg [3:0] pin;
wire  sout;
  
  piso uut(pin,sout,clk,rst,S_L);
  
  always #5 clk= ~clk;
  
  