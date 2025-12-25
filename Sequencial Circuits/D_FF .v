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
  
  //******************** TestBench **********************/

module dff_test;
  reg d,clk,rst;
  wire q;
  wire qb;
  dff d1 (d,clk,rst,q,qb);
  always #5 clk = ~clk;
  
  initial
   begin
     clk = 0; rst = 1;
     #10 rst = 0;
     #10 d = 1;
     #10 d = 0;
     #30 d = 1;
     #20 d = 0;
     #10
     $finish;
   end
  initial
    $monitor($time, "  rst=%b...Clk=%b....d=%b....q=%b....qb=%b", rst, clk, d, q, qb);
  initial
    begin
    $dumpfile("prg.vcd");
      $dumpvars(0,dff_test);
    end
endmodule 