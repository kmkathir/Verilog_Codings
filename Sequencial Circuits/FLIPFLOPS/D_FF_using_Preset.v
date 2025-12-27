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
  
//******************** TestBench **********************/

module dff_pr_test;
  reg d,clk,rst,pr;
  wire q;
  wire qb;
  dff_pr d1 (d,clk,rst,pr,q,qb);
  always #5 clk = ~clk;
  
  initial
   begin
     clk = 0; rst = 1;
     #10 rst = 0;
     #10 pr=1;
     #10 d = 0;
     
     #40 pr=0;
     #30 d = 1;
     #20 d = 0;
     
     #10 $finish;
   end
  initial
    $monitor($time, "  rst=%b...pr=%b....Clk=%b....d=%b....q=%b....qb=%b", rst,pr, clk, d, q, qb);
  initial
    begin
    $dumpfile("prg.vcd");
      $dumpvars(0,dff_pr_test);
    end
endmodule 