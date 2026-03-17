`include "fpadder.sv"
module fpatb();
reg clk;
reg[31:0] x,y,q;
fpadder uut(.clk(clk), .x(x), .y(y), .q(q));
  initial begin
    clk=1'b0;
    x=32'b00111111111100000000000000000000;
    y=32'b00111111110100000000000000000000;
    //y=32'b10111111110100000000000000000000;
    #1 clk=1'b1;
    #1 $display("%b\n%b\n%b",x,y,q);
  end
endmodule
