// File: and_gate_tb.v
`timescale 1ns/1ps
module and_gate_tb;
    reg a, b;
    wire y;

    // Instantiate the AND gate
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Create a VCD file for GTKWave
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_gate_tb);
        
        // Test patterns
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $finish;
    end
endmodule