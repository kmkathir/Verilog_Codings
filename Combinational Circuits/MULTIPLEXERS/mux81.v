// Implementation of 8:1 mux using verilog 

/************** DESIGN CODE ***********/

module mux81 (a,sel0,sel1,sel2,y);
  input [7:0]a;
  input sel0,sel1,sel2;
  output y;
  
  assign y = sel2 ?
           ( sel1 ?
             ( sel0 ? a[7] : a[6] ) :
             ( sel0 ? a[5] : a[4] )
           ) :
           ( sel1 ?
             ( sel0 ? a[3] : a[2] ) :
             ( sel0 ? a[1] : a[0] )
           );
endmodule


/******************** TESTBENCH CODE **************/

module mux81_test;
  reg [7:0]a ;
  reg sel0,sel1,sel2;
  wire y;
  
  mux81 uut (a,sel0,sel1,sel2,y);
  
  initial 
    begin 
      
      a[0] =0 ;a[1] =1; a[2] =0; a[3] =1; a[4] =1; a[5] =1; a[6] =1; a[7] =1; 
      
      #0 sel2 = 0; sel1=0; sel0=0;
      
      #10 sel2 =0; sel1=0; sel0=1;
      
      #10 sel2 =1; sel1=1; sel0=0;
      
      #10 sel2=1; sel1=1; sel0=1;
      
     #10 $finish;
    end
  
  initial 
    begin 
      $monitor($time,"   a[0]=%b a[1]=%b a[2]=%b a[3]=%b a[4]=%b a[5]=%b a[6]=%b a[7]=%b sel2=%b sel1=%b sel0 =%b,y=%b  ",a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],sel2,sel1,sel0,y);
      
    end
  
  initial 
    begin 
      $dumpfile("kathir.vcd");
      $dumpvars(0,mux81_test);
    end 
  
endmodule
