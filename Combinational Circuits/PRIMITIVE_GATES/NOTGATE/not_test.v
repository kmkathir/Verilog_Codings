module not_gate_test;
reg a;
wire y;

not_gate uut (a,y);

initial 
begin 
    a=0; 
    #10 a=1;

    #20 $finish;

end

initial 
$monitor($time,"  A=%b...Y=%b",a,y);


initial 
begin 
    $dumpfile("not_gate.vcd");
    $dumpvars(0,not_gate_test);
end

endmodule