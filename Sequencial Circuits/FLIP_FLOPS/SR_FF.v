//Design of SR Flip-Flop using Verilog HDL
// EDA PLAYGROUND LINK : https://edaplayground.com/x/XBGN


/************ DESIGN CODE ************/

module srff(s,r,rst,clk,q,qb);
  input s,r,rst, clk;
  output reg q;
 output qb;
  always@(posedge clk)
    begin
      if(rst)
        q<=1'bz;
      else 
        begin
          case({s,r})
            2'b00:q<=q;
            2'b01:q<=1'b0;
            2'b10:q<=1'b1;
            2'b11:q<=1'bz;
            default: q<=1'bx;
          endcase
        end
    end
    assign qb=~q;
endmodule
  
        