//Designing BCD to Binary converter using Verilog
// EDA PLAYGROUND Link : https://edaplayground.com/x/HTUy

/************ DESIGN CODE ************/


module bcd_to_binary (input  [3:0] tens, input  [3:0] ones, output reg [3:0] binary);
    always @(*) begin
        case ({tens, ones})  // Concatenate tens and ones to 8 bits
            8'b0000_0000: binary = 4'd0;
            8'b0000_0001: binary = 4'd1;
            8'b0000_0010: binary = 4'd2;
            8'b0000_0011: binary = 4'd3;
            8'b0000_0100: binary = 4'd4;
            8'b0000_0101: binary = 4'd5;
            8'b0000_0110: binary = 4'd6;
            8'b0000_0111: binary = 4'd7;

            8'b0000_1000: binary = 4'd8;
            8'b0000_1001: binary = 4'd9;
            8'b0001_0000: binary = 4'd10;
            8'b0001_0001: binary = 4'd11;
            8'b0001_0010: binary = 4'd12;
            8'b0001_0011: binary = 4'd13;
            8'b0001_0100: binary = 4'd14;
            8'b0001_0101: binary = 4'd15;
            default:      binary = 4'd0;  // default/fallback
        endcase
    end
endmodule
            
