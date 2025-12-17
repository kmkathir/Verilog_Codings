//Designing 2:1 Multiplexer using basic gates
//EDA PLAYGROUND Link : https://www.edaplayground.com/x/GGjZ

/************* DESIGN CODE ************/

module mux21_usinggates (a,b,s,y);
  input a,b,s;
  output y;
  wire w1,w2,w3 ;
  
  not n1 (w1,s);
  and a1 (w2,a,w1);
  and a2 (w3,b,s);
  or  o1 (y,w2,w3);
  
endmodule 

/**************** TESTBENCH CODE **********/

module mux21_usinggates_test;
  reg a,b,s;
  wire y;
  
mux21_usinggates uut(a,b,s,y);
  
  initial 
    begin 
      
      a=0; b=0; s=0;
      
      #10 a=0; b=1; s=1;
      
      #10 a=1; b=0; s=1;
      
      $finish;
    end 
  
  initial
    begin
      $monitor($time,"   a=%b; b=%b s=%b y=%b ",a,b,s,y );
      
    end
  
  initial 
    begin
      
      $dumpfile("kathir.vcd");
      $dumpvars(0,mux21_usinggates_test);
      
    end 
  
endmodule