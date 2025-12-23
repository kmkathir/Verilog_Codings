//Design of a JK Flip-Flop using Verilog HDL
// EDA PLAYGROUND LINK : https://edaplayground.com/x/KRsE 

//************ Design Code *********************/

module jkff(j,k,rst,clk,q,qb);
  input j,k,rst, clk;
  output reg q;
 output qb;
  always@(posedge clk)
    begin
      if(rst)
        q<=1'bz;
      else 
        begin
          case({j,k})
            2'b00:q<=q;
            2'b01:q<=1'b0;
            2'b10:q<=1'b1;
            2'b11:q<=~q;
            default: q<=1'bx;
          endcase
        end
    end
    assign qb=~q;
endmodule
  
        