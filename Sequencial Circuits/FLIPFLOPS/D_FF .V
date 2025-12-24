//Designing a D Flip Flop using Verilog HDL
// EDA PLAYGROUND LINK : https://edaplayground.com/x/eRgH

//************ Design Code *********************/

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
  