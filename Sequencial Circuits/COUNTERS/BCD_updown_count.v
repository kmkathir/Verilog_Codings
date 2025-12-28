//Design a 4-bit up-down BCD counter using behavioral modeling
// EDA PLAYGROUND LINK : https://edaplayground.com/x/QTQZ

/************ Design Code *********************/

module cntr_4bit(clk,rst,q,qb);
  input clk,rst;
  output reg [3:0]q;
  output [3:0] qb;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
       // q<=4'b0000; //up count 
      q<=4'b1001; //down count
      
      else
        begin
      /*   q<=q+1; //up count
          if(q==4'b1001)
         q<=0;*/
   
                     q<=q-1;
         			 if (q==4'b0000)
                     q<=4'b1001; 
        end
    
    end
  assign qb=~q;
endmodule


//******************** TestBench **********************/

module cntr_4bit_test;
  reg clk,rst;
  wire [3:0]q;
  wire [3:0] qb;