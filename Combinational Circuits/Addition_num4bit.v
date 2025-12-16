// Addition of two 4bit binary numbers 

//************** Design Code ************//

module full_adder(a,b,cin,carry,sum);
  input cin;
  input [3:0]a,b;
  output [3:0]sum;
  output carry;
  
  assign {carry,sum}=a+b+cin;
  
endmodule

//************** Testbench Code ************//

module full_adder_test;
  reg cin;
  reg [3:0]a,b;
  wire [3:0]sum;
  wire carry;
  
  full_adder uut(a,b,cin,carry,sum);
  
  initial 
    begin
      
      a=4'b0000; b=4'b0000; cin=0;
      #10 a=4'b0001; b=4'b1010; cin=0;
      #10 a=4'b0110; b=4'b1110; cin=1;
      #10 a=4'b1011; b=4'b1111; cin=1;

      #10 $finish;
      
    end
  
  initial
    begin
      $monitor($time,"    a=%b  b=%b  cin=%b | sum=%b  carry=%b",a,b,cin,sum,carry);
    end
  
  
  endmodule
