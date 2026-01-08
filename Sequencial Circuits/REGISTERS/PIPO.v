//Designing a Parallel In Parallel Out (PIPO) Register using D Flip-Flops
// EDA PLAYGROUND LINK : https://edaplayground.com/x/RBzj

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

//Design code for 4-bit Parallel In Parallel Out (PIPO) Register

module pipo(pin,pout,clk,rst,S_L);
  input clk,rst,S_L;
  input [3:0] pin;
  output [3:0] pout;
  wire [3:0] q;
  wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9;
  
  dff d0 (.d(pin[3]), .clk(clk), .rst(rst), .q(q[0]));
  dff d1 (.d(w3),     .clk(clk), .rst(rst), .q(q[1]));
  dff d2 (.d(w6),     .clk(clk), .rst(rst), .q(q[2]));
  dff d3 (.d(w9),     .clk(clk), .rst(rst), .q(q[3]));
  
  assign w0 = ~S_L;
  
  assign w1 = w0 & q[0];
  assign w2 = S_L & pin[2];
  assign w3 = w1 | w2;
  
  assign w4 = w0 & q[1];
  assign w5 = S_L & pin[1];
  assign w6 = w4 | w5;

  assign w7 = w0 & q[2];
  assign w8 = S_L & pin[3];
  assign w9 = w7 | w8;
  
    
  assign pout=q;
endmodule