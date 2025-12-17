// 4:1 mux Implementation using verilog 

/************* DESIGN CODE ************/

module mux41 (a,b,c,d,sel0,sel1,y);
  input a,b,c,d,sel0,sel1;
  output y;
  
  assign y = sel1 ? (sel0 ? d : c) : (sel0 ? b : a);
  
endmodule


/**************** TESTBENCH CODE **********/

module mux41_test;
  reg a,b,c,d,sel0,sel1;
  wire y;
  
  mux41 uut (a,b,c,d,sel0,sel1,y);
  
  initial 
    begin 
      
      a=0; b=1; c=0; d=1;
      
      #0 sel1=0; sel0=0;
      
      #10  sel1=0; sel0=1;
      
      #10  sel1=1; sel0=0;
      
      #10  sel1=1; sel0=1;
      
      $finish;
    end
  
  initial 
    begin 
      $monitor($time,"   a=%b b=%b c=%b d=%b sel1=%b sel0=%b y=%b",a,b,c,d,sel1,sel0,y);
      
    end
  
  initial 
    begin 
      $dumpfile("kathir.vcd");
      $dumpvars(0,mux41_test);
    end 
  
endmodule
