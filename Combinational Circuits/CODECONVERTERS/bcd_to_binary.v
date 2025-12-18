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
            
/************ TESTBENCH CODE ************/

module tb_bcd_to_binary;
    reg  [3:0] tens, ones;
    wire [3:0] binary;
    bcd_to_binary uut (.tens(tens), .ones(ones), .binary(binary) );
    initial begin
        $display("Tens | Ones | Binary");
        $display("--------------------");

        for (tens = 0; tens < 2; tens = tens + 1) begin
            for (ones = 0; ones < 10; ones = ones + 1) begin
                #5;
                if (binary <= 15)  // Only display valid 4-bit binary results
                    $display("  %d  |  %d  |  %2d", tens, ones, binary);
            end
        end
        $finish;
    end

endmodule



