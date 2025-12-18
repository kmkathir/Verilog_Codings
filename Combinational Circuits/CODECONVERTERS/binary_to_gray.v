//Designing 4 bit Binary to Gray code converter using Verilog
// EDA PLAYGROUND Link : https://www.edaplayground.com/x/XsyX 

/************ DESIGN CODE ************/

module binary_to_gray(B,G);
  input[3:0] B;
  output[3:0]G;
  
  assign G[3]=B[3];
  assign G[2]=B[3] ^ B[2];
  assign G[1]=B[2] ^ B[1];
  assign G[0]=B[1] ^ B[0];
  
endmodule
  
  /***8********* TESTBENCH CODE ************/

  module binary_to_gray_test;
  reg[3:0] B;
  wire[3:0]G;
  integer i;
  
  binary_to_gray uut (B,G);
  
  initial
    begin
      
      for(i=0; i<16; i=i+1)
        begin
        B=i;
      #10;
        end
    end
  initial
    $monitor($time, "   B=%b......G=%b", B, G);
  
  initial
    begin
      $dumpfile("prg.vcd");
      $dumpvars(0,binary_to_gray_test);
    end
  endmodule