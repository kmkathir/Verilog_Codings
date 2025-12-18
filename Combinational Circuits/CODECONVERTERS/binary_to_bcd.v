//Designing 4 bit Binary to BCD converter using Verilog
// EDA PLAYGROUND Link : https://edaplayground.com/x/jkQZ 

/************ DESIGN CODE ************/

module binary_to_bcd ( input  [3:0] binary,  output reg [3:0] tens,  output reg [3:0] ones);
    always @(*) begin
        case (binary)
            4'd0:  {tens, ones} = {4'd0, 4'd0};
            4'd1:  {tens, ones} = {4'd0, 4'd1};
            4'd2:  {tens, ones} = {4'd0, 4'd2};
            4'd3:  {tens, ones} = {4'd0, 4'd3};
            4'd4:  {tens, ones} = {4'd0, 4'd4};
            4'd5:  {tens, ones} = {4'd0, 4'd5};
            4'd6:  {tens, ones} = {4'd0, 4'd6};
            4'd7:  {tens, ones} = {4'd0, 4'd7};
            4'd8:  {tens, ones} = {4'd0, 4'd8};
            4'd9:  {tens, ones} = {4'd0, 4'd9};
            4'd10: {tens, ones} = {4'd1, 4'd0};
            4'd11: {tens, ones} = {4'd1, 4'd1};
            4'd12: {tens, ones} = {4'd1, 4'd2};
            4'd13: {tens, ones} = {4'd1, 4'd3};
            4'd14: {tens, ones} = {4'd1, 4'd4};
            4'd15: {tens, ones} = {4'd1, 4'd5};
            default: {tens, ones} = {4'd0, 4'd0}; // fallback
        endcase
    end
endmodule
