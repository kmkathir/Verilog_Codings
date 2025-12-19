//Designing a 1-bit comparator using Verilog HDL
// EDA PLAYGROUND LINK : https://www.edaplayground.com/x/fcfi

/************ Design Code *********************/

module bit1_comp (a,b,yg,yl,ye);
  input a,b;
  output reg yg,yl,ye;
  
  always@(*)
    begin 
      if(a>b)
        begin yg=1; yl=0; ye=0; end
      else if(a<b)
        begin yg=0; yl=1; ye=0; end
      else if(a==b)
        begin yg=0; yl=0; ye=1; end
      else
       begin yg=1'bx; yl=1'bx; ye=1'bx; end
  end
  
endmodule