module exor_gate_test;
reg a,b;
wire y;

exor_gate uut (a,b,y);

initial 
begin 
    a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=0;
    #10 a=1; b=1;

    #10 $finish;

end

initial 
$monitor($time,"  A=%b....B=%b....Y=%b",a,b,y);


initial 
begin 
    $dumpfile("exor_gate.vcd");
    $dumpvars(0,exor_gate_test);
end

endmodule