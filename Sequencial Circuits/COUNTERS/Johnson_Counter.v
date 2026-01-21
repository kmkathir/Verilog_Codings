//Designing a Johnson Counter using Verilog
// EDA PLAYGROUND LINK : https://www.edaplayground.com/x/USuE 

/************ Design Code *********************/

module john_cntr(Sout,clk,rst,q);
  input clk,rst;
  output reg [3:0]q;
  output Sout;
 
   always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 4'b0000;                 // reset state
    else
      q <= {q[2:0], ~q[3]};         // Johnson counter operation
  end

  assign Sout =q[3];
  
endmodule 