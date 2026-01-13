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

//Design of 4-bit PIPO Register using behavioral Modeling

module pipo(pin,pout,clk,rst,S_L);
  input clk,rst,S_L;
  input [3:0] pin;
  output [3:0] pout;
  reg [3:0] q;
  
   always@(posedge clk or posedge rst)
    begin
      if(rst)
		q<=4'b0000;
      else 
        begin
          if(S_L==1)
            q<=pin;
          else if (S_L==0)
            q <= pin;
         else
         q<=4'bxxxx;
    end
    end  
    
  assign pout=q;
endmodule

//Testbench Code for 4-bit PIPO Register

module pipo_test;
reg clk,rst,S_L;
reg [3:0] pin;
  wire [3:0] pout;
  
  pipo uut(pin,pout,clk,rst,S_L);
  
  always #5 clk= ~clk;

   initial
    begin
      rst=1; clk = 0;
      #10 rst=0;
      
      #20 pin=4'b1011; S_L=1; 
      #10 S_L=0;
      
      #40 pin=4'b0100; S_L=1; 
      #10 S_L=0;
      
            
      #50 $finish;
      
    end
  
  initial
    begin
      $monitor($time,  "rst=%b---clk=%b---S/L=%b---pin=%b---sout=%b",rst, clk, S_L, pin, pout);
    end
  initial
    begin
      $dumpfile("Kathir.vcd");
      $dumpvars(0,pipo_test);
    end
endmodule
  