// Full Adder design using Verilog 
// EDA PLAYGROUND LINK : https://www.edaplayground.com/x/HXkq ( Gate level Description )
//                       https://www.edaplayground.com/x/deaF


/****************** Design Code **********************/

module full_adder(a,b,cin,carry,sum);
  input a,b,cin;
  output sum,carry;
  
  assign sum=a^b^cin;
  assign carry=(a&b) | (b&cin) | (a&cin);
  
endmodule

/********************** TestBench ******************/


module full_adder_test;
  reg a,b,cin;
  wire sum,carry;
  
  full_adder uut(a,b,cin,carry,sum);
  
  initial 
    begin 
      
     #0 a=0; b=0; cin=0; 
      
      #10 a=0; b=1; cin=1;
      
      #10 a=1; b=1; cin=1;
      
      
      $finish;
      
    end
  
  initial 
    begin 
      $monitor($time," a=%b b=%b cin=%b sum=%b carry=%b", a, b, cin, sum, carry);
    end
  
  initial 
    begin
      $dumpfile("kathir.vcd");
      $dumpvars(0,full_adder_test);
    end 
  
endmodule 