//Design of MOD 5 Counter using structural Modeling in Verilog
// EDA PLAYGROUND LINK : https://edaplayground.com/x/Ntt4 

//************ Design Code *********************/

module mod5_cntr(clk,rst,q,qb);
  input clk,rst;
  output reg [3:0]q;
  output [3:0] qb;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
       // q<=4'b0000; //up count 
      q<=4'b0000; //down count
      
      else
        begin
         q<=q+1; //up count
          if(q==4'b0101)
         q<=4'b0000;
                   /*  q<=q-1;
         			 if (q==4'b0000)
                     q<=4'b1001; 
                               */
                               
        end
    
    end
  assign qb=~q;
endmodule

//************ Testbench Code *********************/

module mod5_cntr_test;
  reg clk,rst;
  wire [3:0]q;
  wire [3:0] qb;

  mod5_cntr uut (clk,rst,q,qb);
  
   always #5 clk=~clk;
  initial
    begin
      clk = 0; rst =1;
      #10 rst = 0;
      
      #100 $finish;
    end
    initial
    begin
      $monitor($time, "  rst=%b...Clk=%b....q=%b....qb=%b", rst, clk, q, qb);
    end
  initial
    begin
    $dumpfile("prg.vcd");
      $dumpvars(0,mod5_cntr_test);
    end
endmodule
  
  
  