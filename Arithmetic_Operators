//Verilog program to understand arithmetic operators

/*********** Design Code **************/

module arthemetic_operator(a,b,y1,y2,y3,y4,y5,y6);
  input [3:0]a,b;
  output [7:0]y1,y2,y3,y4,y5,y6;
  
  assign y1=a+b;
  assign y2=a-b;
  assign y3=a*b;
  assign y4=a/b;
  assign y5=a**b;
  assign y6=a%b;
  
endmodule

/************** Testbench Code ************/

module arithmetic_operator_test;
  reg [3:0]a,b;
  wire [7:0]y1,y2,y3,y4,y5,y6; //change input to reg and output to wire.
  //instantiation of DUT by order ...we have also time 
  arthemetic_operator uut(a,b,y1,y2,y3,y4,y5,y6); //uut is unit under test 
                                        // intantiation of DUT 
  
  //Generate the test cases 
  initial 
    begin 
      a=4'd10; b=4'd5;
      
      #10 a=4'd6; b=4'd2;                //some more testing
      
      #10 a=4'd15; b=4'd7;
      
      #10 a=4'd3; b =4'd9;
      
    end 
  //another initial 
  
  initial 
    begin 
      $monitor( $time,"The result of addition is %0d ----- The result of subtraction is %0d ----The result of multiplication is %0d -----The result of division is %0d ------ The result of exponent is %0d ---- The result of modulus is %0d ",y1,y2,y3,y4,y5,y6);
    
    end 
  
  initial //for waveform output
    begin
      $dumpfile("prg.vcd");
      $dumpvars(0,arithmetic_operator_test);
    end
  
endmodule
