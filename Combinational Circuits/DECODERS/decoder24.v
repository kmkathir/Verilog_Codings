//Designing 2 to 4 decoder using Verilog
// EDA PLAYGROUND Link : https://www.edaplayground.com/x/XxcS 

/************ DESIGN CODE Using Data flow & Structural Modelling ************/

module decoder24(a,b,d);
  input a,b;
  output [3:0]d;
  wire w1,w2;
  
  assign w1 = ~a;
  assign w2 = ~b;
  assign d[0] = a & b;
  assign d[1] = a & w1;
  assign d[2] = w1 & b;
  assign d[3] = a & b;
  
  /* 
  
  not n1(w1,a);
  not n2(w2,b);
  and a1(d[0],w1,w2);
  and a2(d[1],a,w2);
  and a3(d[2],w1,b);
  and a4(d[3],a,b);
  
  */
endmodule

/***********DESIGN CODE Using Behavioral Modelling ************/


module decoder24(a,b,en,y);
  input a,b,en;
  output reg [3:0]y;

  always@(*)
    begin
   if(en)
     begin
       if(a==0 && b==0 )
        y = 4'b0001;
       else if (a==0 && b==1)
        y = 4'b0010;
       else if ( a==1 && b==0)
        y = 4'b0100;
       else if ( a==1 && b==1)
        y = 4'b1000;
      else
        y=4'b0000;
    end
    else
      begin
         y=4'bzzzz;
      end
    end  
  
endmodule
  

/************ TESTBENCH CODE ************/

module decoder24_test;
  reg a,b;
  wire [3:0]d;
  
  decoder24 uut (a,b,d);
  
  initial 
    begin 
      
      a=0; b=0; 
      #10 a=0; b=1;
      
      #10 a=1; b=0;
      
      #10 a=1; b=1; 
      
    end 
  
  initial
    begin 
      $monitor($time,"  A=%b B=%b d[0]=%b d[1]=%b d[2]=%b d[3]=%b",a,b,d[0],d[1],d[2],d[3]);
    end
  
  initial 
    begin
      $dumpfile("prg.vcd");
      $dumpvars(0,decoder24_test);
      
    end 
endmodule