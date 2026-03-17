module mem(
  input clk, rwb,
  input[13:0] busaddr,
  inout[7:0] busdata
  );

  reg[7:0] data[16383:0];

  assign busdata=(rwb)?data[busaddr]:busdata;

  always@(posedge clk)begin
    if(!rwb)begin
      data[busaddr]=busdata;
    end
  end
  endmodule
