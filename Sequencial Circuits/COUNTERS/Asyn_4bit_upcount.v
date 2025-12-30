//Design of Asynchronous 4-bit Up Counter using T Flip-Flops made from JK Flip-Flops
// EDA PLAYGROUND LINK : https://edaplayground.com/x/J9JF


/************ Design Code *********************/

////// cODE FOR jk FLIP FLOP ///////////

module jkff(j,k,rst,clk,q,qb);
  input j,k,rst, clk;
  output reg q;
   output qb;
  always@(negedge clk or posedge rst)
    begin
      if(rst)
        q<=1'b0;
      else 
        begin
          case({j,k})
            2'b00:q<=q;                  //No change
            2'b01:q<=1'b0;              //reset
            2'b10:q<=1'b1;             //Set
            2'b11:q<=~q;              //Toggle
            default: q<=1'b0;        //default
          endcase
        end
    end
    assign qb=~q;
endmodule

