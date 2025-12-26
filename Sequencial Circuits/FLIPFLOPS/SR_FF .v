//Design of a SR Flip-Flop using Verilog HDL
// EDA PLAYGROUND LINK : https://edaplayground.com/x/XBGN

//************ Design Code *********************/

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

//************ Test Bench Code *********************/

module srff_test;
   reg s,r,rst, clk;
   wire q,qb;
  
  srff s1 (s,r,rst,clk,q,qb);
  
  always #10 clk=~clk;
  
  initial
    begin
     clk=0;  rst=1;
      #10 rst=0;  
     
    #10 s=0; r=0;
    #10 s=0; r=1;
    #10 s=1; r=0;
    #10 s=1; r=0;
      
    #70 $finish;
    end
     initial
    $monitor($time, "  rst=%b....Clk=%b....S=%b...R=%b....q=%b....qb=%b",rst,clk,s,r,q,qb);
  
  initial
    begin
    $dumpfile("kathir.vcd");
      $dumpvars(0,srff_test);
    end
endmodule
  
      