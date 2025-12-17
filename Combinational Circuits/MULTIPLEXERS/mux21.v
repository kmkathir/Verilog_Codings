// 2:1 mux implementation using verilog

/*********** DESIGN CODE *************/

module mux21(a,b,sel,y);
  input a,b,sel;
  output y;
  
  assign y=sel?b:a;
endmodule

/***************** TESTBENCH CODE ***************/


module mux21_test;
  reg a,b,sel;
  wire y;
  
  mux21 uut(a,b,sel,y);
  
  initial 
    begin 
      a=1; b=0; sel =0; //y=a---1
      
      #10 sel=1;  //y=b---0
      
      #10 a=0; b=1; //y=b---1
      
      #10 sel=0; //y=a---0
      
      #20 $finish;
    end
  
  initial 
    begin 
      $monitor($time,"   sel=%b ---a=%b----b=%b----y=%b",sel,a,b,y);
    end
  
  initial
    begin 
      $dumpfile("kathir".vcd");
      $dumpvars(0,mux21_test);
    end
  
endmodule
  
      
