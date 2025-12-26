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
  
        
//************ Test Bench Code *********************/

module jkff_test;
   reg j,k,rst, clk;
   wire q,qb;
  
  jkff s1 (j,k,rst,clk,q,qb);
  
  always #5 clk=~clk;
  
  initial
    begin
     clk=0;  rst=1;
      #10 rst=0;
    #10 j=1; k=0;
    #10 j=0; k=0;
    #10 j=0; k=1;
    #10 j=1; k=1;
    #10 j=1; k=0;
      
    #20 $finish;
    end
  initial
    $monitor($time, "  rst=%b....Clk=%b....J=%b...K=%b....q=%b....qb=%b",rst,clk,j,k,q,qb);
  
  initial
    begin
    $dumpfile("kathir.vcd");
      $dumpvars(0,jkff_test);
    end
endmodule
  
      