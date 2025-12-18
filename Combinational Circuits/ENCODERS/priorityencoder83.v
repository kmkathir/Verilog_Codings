//Designing 8 to 3 Priority encoder using Verilog
// EDA PLAYGROUND Link : https://www.edaplayground.com/x/pWKY

/************ DESIGN CODE **************/

module encoder83(en,A,y);
  input en;
  input [7:0] A;
  output reg [2:0] y;
  
  always@(*)
    begin
      if(en)
        begin
            casex(A)
              8'b00000001 : y=3'b000;
              8'b0000001x : y=3'b001;
              8'b000001xx : y=3'b010;
              8'b00001xxx : y=3'b011;
              8'b0001xxxx : y=3'b100;
              8'b001xxxxx : y=3'b101;
              8'b01xxxxxx : y=3'b110;
              8'b1xxxxxxx : y=3'b111;
              default : y=3'bxxx;
            endcase
        end
      else 
        y=3'bzzz;
      
    end
              
          
endmodule
  

/************ TESTBENCH CODE ************/

module encoder83_test;
  reg en;
  reg [7:0] A;
  wire [2:0] Y;
  
  encoder83 uut (en, A,Y);
  
  initial
    begin
        en=0; 
    #20 en=1;
    #10 A=8'b00000001;
    #10 A=8'b00000010; 
    #10 A=8'b00000100;
    #10 A=8'b00001010;
    #10 A=8'b00010000;
    #10 A=8'b00100100;
    #10 A=8'b01000110;
    #10 A=8'b11010101;

      #20 $finish;
    end
  initial
    begin
      $monitor($time,"    A= %b......Y = %b",A,Y);
    end
  initial
    begin
      $dumpfile("prg.vcd");
      $dumpvars(0,encoder83_test);
      end
      
  
      endmodule
      
