// Design of 2:1 Multiplexer using bufif0 and bufif1
// EDA PLAYGROUND Link : https://www.edaplayground.com/x/mNhy

/************* DESIGN CODE ************/

module mux21_usingbuff (a,b,s,y);
  input a,b,s;
  output y;
  
  bufif0 b0 (y,a,s);
  bufif1 b1 (y,b,s);
  
endmodule

/**************** TESTBENCH CODE **********/

module mux21_usingbuff_test;
  reg a,b,s;
  wire y;
  
   mux21_usingbuff uut (a,b,s,y);
  
  initial 
    begin 
      
      a=0; b=1; s=0;
      
      #10 s=1;
      
      #10 a=1; b=0;
      
    end
  
  initial
    begin 
      $monitor($time,"a=%b b=%b s=%b y=%b",a,b,s,y);
    end
  
  initial 
    begin 
      $dumpfile("kathir.vcd");
      $dumpvars(0,mux21_usingbuff_test);
      
    end 
  
endmodule