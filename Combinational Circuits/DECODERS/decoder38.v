//Designing 3 to 8 decoder using Verilog
// EDA PLAYGROUND Link : https://www.edaplayground.com/x/HRfT 


/************ DESIGN CODE ************/

module decoder38(a,b,c,en,y);
  input a,b,c, en;
  output reg [7:0]y;

  always@(*)
    begin
   if(en)
     begin
       if(a==0 && b==0 && c==0)
        y = 8'b00000001;
       else if (a==0 && b==0 && c==1)
        y = 8'b00000010;
       else if (a==0 && b==1 && c==0)
        y = 8'b00000100;
       else if (a==0 && b==1 && c==1)
        y = 8'b00001000;
       else if (a==1 && b==0 && c==0)
        y = 8'b00010000;
       else if (a==1 && b==0 && c==1)
        y = 8'b00100000;
       else if (a==1 && b==1 && c==0)
        y = 8'b01000000; 
       else if (a==1 && b==1 && c==1)
        y = 8'b10000000;
      else
        y=8'b00000000;
    end
    else
      begin
         y=8'bzzzzzzzz;
      end
    end  
  
endmodule
  
  /************ TESTBENCH CODE ************/

  module decoder38_test;
  reg a,b,c,en;
  wire [7:0]y;
  
  decoder38 uut (a,b,c,en,y);
  
  initial
    begin
      en=0;
      
      #20 en=1;
      
      #10  a = 0;b = 0; c=0;
      #10  a = 0;b = 0; c=1;
      #10  a = 0;b = 1; c=0;
      #10  a = 0;b = 1; c=1;
      #10  a = 1;b = 0; c=0;
      #10  a = 1;b = 0; c=1;
      #10  a = 1;b = 1; c=0;
      #10  a = 1;b = 1; c=1;
     
      #20 $finish;
    end
  initial
    begin
      $monitor($time,"     en=%b...A = %b....B = %b....C = %b....Y = %b",en,a,b,c,y[7:0]);
    end
  initial
    begin
      $dumpfile("prg.vcd");
      $dumpvars(0,decoder38_test);
    end
endmodule  