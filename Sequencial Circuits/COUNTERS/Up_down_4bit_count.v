//Design a 4-bit up-down counter using behavioral modeling
// EDA PLAYGROUND LINK : https://edaplayground.com/x/Ryar 

/************ Design Code *********************/

module upcounter_4bit(clk,rst,q,qb);
  input clk,rst;
  output reg [3:0]q;
  output [3:0] qb;
  
  always@( posedge clk or posedge rst )
    begin 
      if(rst)
        q<=4'b0000;  //upcount
      // q<=4"b1111; //downcount
      else 
        q<=q+1;
      
      //q<=q-1;        //downcount
    end
  assign qb=~q;
endmodule

//******************** TestBench **********************/

module upcounter_4bit_test;
  reg clk,rst;
  wire [3:0]q;
  wire [3:0] qb;
  
  upcounter_4bit uut (clk,rst,q,qb);
  
  always #5 clk=~clk;
  initial 
    begin 
      clk =0; rst=1;
      
      #10 rst=0;
      
      #200 $finish;
      
    end 
  
  initial 
    $monitor($time,"       rst=%b...Clk=%b....q=%b....qb=%b", rst, clk, q, qb);
  
  initial
    begin
    $dumpfile("prg.vcd");
      $dumpvars(0,upcounter_4bit_test);
    end

endmodule 
      