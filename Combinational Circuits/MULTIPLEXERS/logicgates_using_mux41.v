// Design of Logic Gates using 4:1 Multiplexer
// EDA PLAYGROUND Link : https://www.edaplayground.com/x/cHE_


/*********** DESIGN CODE ************/ 

module mux4_1 (
    input I0, I1, I2, I3,
    input S1, S0,
    output Y
);
    assign Y = (S1==0 && S0==0) ? I0 :
               (S1==0 && S0==1) ? I1 :
               (S1==1 && S0==0) ? I2 :
                                 I3;
endmodule
module not_gate (
    input A, B,
    output Y
);
    mux4_1 m1 (1'b1, 1'b1, 1'b0, 1'b0, A, B, Y);
endmodule
module and_gate (
    input A, B,
    output Y
);
    mux4_1 m1 (1'b0, 1'b0, 1'b0, 1'b1, A, B, Y);
endmodule
module or_gate (
    input A, B,
    output Y
);
    mux4_1 m1 (1'b0, 1'b1, 1'b1, 1'b1, A, B, Y);
endmodule
module nand_gate (
    input A, B,
    output Y
);
    mux4_1 m1 (1'b1, 1'b1, 1'b1, 1'b0, A, B, Y);
endmodule
module xor_gate (
    input A, B,
    output Y
);
    mux4_1 m1 (1'b0, 1'b1, 1'b1, 1'b0, A, B, Y);
endmodule

module nor_gate (
    input A, B,
    output Y
);
    mux4_1 m1 (1'b1, 1'b0, 1'b0, 1'b0, A, B, Y);
endmodule
module xnor_gate (
    input A, B,
    output Y
);
    mux4_1 m1 (1'b1, 1'b0, 1'b0, 1'b1, A, B, Y);
endmodule


/**************** TESTBENCH CODE **********/

module logic_gates_4to1_test;

    reg A, B;
    wire NOT_Y, AND_Y, OR_Y, NAND_Y, NOR_Y, XOR_Y, XNOR_Y;

    not_gate  u1 (A, B, NOT_Y);
    and_gate  u2 (A, B, AND_Y);
    or_gate   u3 (A, B, OR_Y);
    nand_gate u4 (A, B, NAND_Y);
    nor_gate  u5 (A, B, NOR_Y);
    xor_gate  u6 (A, B, XOR_Y);
    xnor_gate u7 (A, B, XNOR_Y);

    initial
    begin
        #10 A = 0; B = 0;
        #10 A = 0; B = 1;
        #10 A = 1; B = 0;
        #10 A = 1; B = 1;

        #20 $finish;
    end

    initial
    begin
        $monitor($time,
        " A=%b..B=%b | NOT=%b..AND=%b..OR=%b..NAND=%b..NOR=%b..XOR=%b..XNOR=%b",
         A, B, NOT_Y, AND_Y, OR_Y, NAND_Y, NOR_Y, XOR_Y, XNOR_Y);
    end

    initial
    begin
        $dumpfile("kathir.vcd");
        $dumpvars(0, logic_gates_4to1_test);
    end

endmodule
