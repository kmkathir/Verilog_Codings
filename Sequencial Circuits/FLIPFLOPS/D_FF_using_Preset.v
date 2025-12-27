//Designing a D Flip-Flop using Preset
// EDA PLAYGROUND LINK : https://edaplayground.com/x/fZuq 

/************ Design Code *********************/

module dff_pr (d,clk,rst,pr,q,qb);
  input d,clk,rst,pr;
  output reg q;
  output qb;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
       q<=0;
      else if (pr)
        q<=1;
      else 
        q<=d;
    end
  assign qb=~q;
endmodule
  
