// or_gate_tb.v
`timescale 1ns/1ps
module or_gate_tb;

    reg a, b;
    wire y;

    // Instantiate the design (DUT)
    or_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Generate test patterns
    initial begin
        // Create a VCD file for GTKWave
        $dumpfile("or_gate.vcd");
        $dumpvars(0, or_gate_tb);

        // Test all input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish; // End simulation
    end

endmodule