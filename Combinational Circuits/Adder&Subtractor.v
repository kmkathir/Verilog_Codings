// Full adder as adder/subtractor of 4bit using structural modelling
//EDA PLAYGROUND LINK : https://www.edaplayground.com/x/RqsV 

/************ Design Code *********************/

`include "full_adder.sv"

module adder_subtractor_4bit(a,b,cin,res,cout);
  input [3:0]a,b;
  input cin;
  
  output[3:0] res;
  output cout;
  
  wire w0, w1,w2,w3,w4,w5,w6;
  
  // w0= b0 when cin =0  or (~b0) when cin is 1
  // w1= b1 when cin =0  or (~b1) when cin is 1
  // w2= b2 when cin =0  or (~b2) when cin is 1
  // w3= b3 when cin =0  or (~b3) when cin is 1
  
  xor x0(w0,b[0],cin);
  xor x1(w1,b[1],cin);
  xor x2(w2,b[2],cin);
  xor x3(w3,b[3],cin);
  
  full_adder f0 (a[0], w0, cin, res[0], w4);
  full_adder f1 (a[1], w1, w4,  res[1], w5);
  full_adder f2 (a[2], w2, w5,  res[2], w6);
  full_adder f3 (a[3], w3, w6,  res[3], cout);
endmodule


/******************** TestBench **********************/

module  adder_subtractor_4bit_test;
  reg [3:0]a,b;
  reg cin;
  
  wire[3:0] res;
  wire cout;
  
 adder_subtractor_4bit uut (a,b,cin,res,cout);
  
  //give the test cases
  initial
    begin
       a=4'b1101; b=4'b0110; cin=1'b0; //addition     res: 0011    1
  #10  a=4'b1101; b=4'b0110; cin=1'b1; //subtraction  res: 0111    1
  #10  a=4'b0100; b=4'b1001; cin=1'b0; //addition     res: 1101    0
  #10  a=4'b0100; b=4'b1001; cin=1'b1; //subtraction  res: 1011    0
    end
 
  initial
    $monitor($time, "   a=%b---b=%b---cin=%b---res=%b---cout=%b", a,b,cin,res,cout);
  
  initial
  begin
    $dumpfile("prg.vcd");
    $dumpvars(0, adder_subtractor_4bit_test);
  end
  
endmodule
 