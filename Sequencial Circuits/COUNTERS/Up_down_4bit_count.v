//Design a 4-bit up-down counter using behavioral modeling
// EDA PLAYGROUND LINK : https://edaplayground.com/x/Ryar 

/************ Design Code *********************/

module upcounter_4bit(clk,rst,q,qb);
  input clk,rst;
  output reg [3:0]q;
  output [3:0] qb;
  
  always@( posedge clk or posedge rst )
    begin 
      if(rst)
        q<=4'b0000;  //upcount
      // q<=4"b1111; //downcount
      else 
        q<=q+1;
      
      //q<=q-1;        //downcount
    end
  assign qb=~q;
endmodule