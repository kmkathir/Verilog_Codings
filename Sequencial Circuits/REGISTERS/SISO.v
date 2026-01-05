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