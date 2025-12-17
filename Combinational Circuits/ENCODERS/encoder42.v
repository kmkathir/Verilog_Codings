?/ Design of 4 to 2 Encoder using Verilog
// EDA PLAYGROUND Link : https://www.edaplayground.com/x/ZdH5 


/************ DESIGN CODE ************/

module encoder42(I0,I1,I2,I3,y1,y2);
  input I0,I1,I2,I3;
  output y1,y2;
  
  assign y1=I2 | I3;
  assign y2=I1 | I3;
  
endmodule

/************ TESTBENCH CODE ************/

module encoder42_test;
  reg I0,I1,I2,I3;
  wire y1,y2;
  
  encoder42 uut (I0,I1,I2,I3,y1,y2);
  
  initial 
    begin
      
      I3 = 0 ; I2 =0; I1 =0; I0 =1;
     #10 I3 = 0 ; I2 =0; I1 =1; I0 =0;
     #10 I3 = 0 ; I2 =1; I1 =0; I0 =0;
     #10 I3 = 1 ; I2 =0; I1 =0; I0 =0;
      $finish;
      
    end 
  
  initial
    $monitor($time,"   I3---%b\nI2---%b\nI1---%b\nI0---%b\ny1---%b\ny2---%b",I3,I3,I1,I0,y1,y2);
  
  initial
    begin
    $dumpfile("prg.vcd");
    $dumpvars(0,encoder42_test);
    end
  
endmodule