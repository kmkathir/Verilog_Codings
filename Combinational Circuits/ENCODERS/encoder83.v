// Design of 8 to 3 Encoder using Verilog
// EDA PLAYGROUND Link : https://www.edaplayground.com/x/asnN

/************ DESIGN CODE ************/

module encoder83(A,Y);
  input [7:0] A;
  output [2:0] Y;
  
  assign Y[0] = A[1] + A[3] + A[5] + A[7];
  assign Y[1] = A[2] + A[3] + A[6] + A[7];
  assign Y[2] = A[4] + A[5] + A[6] + A[7];
  
endmodule
  
/************ TESTBENCH CODE ************/

module encoder83_test;
  reg [7:0] A;
  wire [2:0] Y;
  
  encoder83 uut (A,Y);
  
  initial
    begin
          A=8'b00000001; 
      #10 A=8'b00000010;
      
      #10 A=8'b00000100;
      
      #10 A=8'b00001000;
      
      #10 A=8'b00010000;
      
      #10 A=8'b00100000;
      
      #10 A=8'b01000000;
      
      #10 A=8'b10000000;
     
      
    end
  initial
    begin
      $monitor($time,"A = %b......Y= %b..",A,Y);
    end
  initial
    begin
      $dumpfile("prg.vcd");
      $dumpvars(0,encoder83_test);
      end
      
  
      endmodule
      
