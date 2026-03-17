`include "cmn.svh"
module memc(
	input logic[13:0] addr,
	input logic rwb,clk,
	input logic[7:0] din,
	output logic[7:0] dout
);

bit[7:0]data[16383:0];

always@(posedge clk) begin
	if(rwb)begin
		dout=data[addr];
	end else begin
		data[addr]=din;
		dout=8'bz;
	end
end

endmodule
