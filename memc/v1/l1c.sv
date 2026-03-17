module l1c(
  input clk, rwb,
  input[13:0] busaddr,
  output e,
  inout[7:0] busdata
  );

  reg[135:0] data[7:0][1:0];

  wire[5:0] tag;
  wire[2:0] idx;
  wire ln;
  wire [3:0] off;

  assign tag=busaddr[13:8];
  assign idx=busaddr[7:5];
  assign ln=busaddr[4];
  assign off=busaddr[3:0];

  assign busdata=(rwb && tag==data[idx][ln][7:2] && data[idx][ln][0])?data[idx][ln][15+8*off-:8]:busdata;
  assign e=(tag==data[idx][ln][7:2] && data[idx][ln][0]);

  always@(posedge clk)begin
    if(!rwb)begin
      if(tag==data[idx][ln][7:2] && data[idx][ln][0])begin
        data[idx][ln][15+8*off-:8]=busdata;
      end
    end
  end
  endmodule
