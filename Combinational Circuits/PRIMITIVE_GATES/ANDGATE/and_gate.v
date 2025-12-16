// and_gate.v
module and_gate (
    input a,      // Input 1
    input b,      // Input 2
    output y      // Output
);
    assign y = a & b;  // AND operation
endmodule