// Design of 16 to 1 Multiplexer using 2 to 1 Multiplexer
// EDA PLAYGROUND Link : https://www.edaplayground.com/x/a9Gh 


/************* DESIGN CODE ************/

module mux2_1 (
    input I0, I1,
    input S,
    output Y
);
    assign Y = S ? I1 : I0;
endmodule

module mux16_1 (
    input I0,  I1,  I2,  I3,
    input I4,  I5,  I6,  I7,
    input I8,  I9,  I10, I11,
    input I12, I13, I14, I15,
    input S3, S2, S1, S0,
    output Y
);

    wire w0, w1, w2, w3, w4, w5, w6, w7;
    wire w8, w9, w10, w11;
    wire w12, w13;

    mux2_1 m0 (I0,  I1,  S0, w0);
    mux2_1 m1 (I2,  I3,  S0, w1);
    mux2_1 m2 (I4,  I5,  S0, w2);
    mux2_1 m3 (I6,  I7,  S0, w3);
    mux2_1 m4 (I8,  I9,  S0, w4);
    mux2_1 m5 (I10, I11, S0, w5);
    mux2_1 m6 (I12, I13, S0, w6);
    mux2_1 m7 (I14, I15, S0, w7);
    mux2_1 m8  (w0,  w1,  S1, w8);
    mux2_1 m9  (w2,  w3,  S1, w9);
    mux2_1 m10 (w4,  w5,  S1, w10);
    mux2_1 m11 (w6,  w7,  S1, w11);
    mux2_1 m12 (w8,  w9,  S2, w12);
    mux2_1 m13 (w10, w11, S2, w13);
    mux2_1 m14 (w12, w13, S3, Y);

endmodule

/**************** TESTBENCH CODE **********/

module mux16_1_test;

    reg I0, I1, I2, I3;
    reg I4, I5, I6, I7;
    reg I8, I9, I10, I11;
    reg I12, I13, I14, I15;
    reg S3, S2, S1, S0;

    wire Y;

    mux16_1 uut (
        I0,  I1,  I2,  I3,
        I4,  I5,  I6,  I7,
        I8,  I9,  I10, I11,
        I12, I13, I14, I15,
        S3, S2, S1, S0,
        Y
    );

    initial
    begin
        
        I0=0;  I1=1;  I2=0;  I3=1;
        I4=1;  I5=0;  I6=1;  I7=0;
        I8=0;  I9=1;  I10=1; I11=0;
        I12=1; I13=0; I14=1; I15=1;
      
#10 S3=0; S2=0; S1=0; S0=0;  
#10 S3=0; S2=0; S1=0; S0=1;   
#10 S3=0; S2=0; S1=1; S0=0;   
#10 S3=0; S2=0; S1=1; S0=1;   
#10 S3=0; S2=1; S1=0; S0=0;   
#10 S3=0; S2=1; S1=0; S0=1;  
#10 S3=0; S2=1; S1=1; S0=0;   
#10 S3=0; S2=1; S1=1; S0=1;  
#10 S3=1; S2=0; S1=0; S0=0;   
#10 S3=1; S2=0; S1=0; S0=1;  
#10 S3=1; S2=0; S1=1; S0=0;   
#10 S3=1; S2=0; S1=1; S0=1;   
#10 S3=1; S2=1; S1=0; S0=0;   
#10 S3=1; S2=1; S1=0; S0=1;   
#10 S3=1; S2=1; S1=1; S0=0;   
#10 S3=1; S2=1; S1=1; S0=1;   

        #20 $finish;
    end

    initial
    begin
        $monitor($time,
        " S3=%b S2=%b S1=%b S0=%b | Y=%b",
          S3,  S2,  S1,  S0,   Y);
    end

    initial
    begin
        $dumpfile("mux16_1.vcd");
        $dumpvars(0, mux16_1_test);
    end

endmodule
