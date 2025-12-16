module exnor_gate_test;
reg a,b;
wire y;

exnor_gate uut (a,b,y);
    
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
    $dumpfile("exnor_gate.vcd");
    $dumpvars(0,exnor_gate_test);
end

endmodule