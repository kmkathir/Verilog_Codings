//Design of MOD 3 Counter using Behavioral Modeling in Verilog
// EDA PLAYGROUND LINK : https://edaplayground.com/x/Y57c

module mod3_cntr(clk,rst,q,qb);
  input clk,rst;
  output reg [3:0]q;
  output [3:0] qb;

always@(posedge clk or posedge rst)
    begin
      if(rst)
       // q<=4'b0000; //up count 
      q<=4'b0000; //down count
      
      else
        begin
         q<=q+1; //up count
          if(q==4'b0011)
         q<=4'b0000;
                   /*  q<=q-1;
         			 if (q==4'b0000)
                     q<=4'b1001; 
                               */
                               
        end
    
    end
  assign qb=~q;
endmodule


module mod3_cntr_test;
  reg clk,rst;
  wire [3:0]q;
  wire [3:0] qb;
  mod3_cntr uut (clk,rst,q,qb);