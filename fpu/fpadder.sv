module fpadder(clk,x,y,q);
input logic clk;
input logic[31:0] x,y;
output logic[31:0] q;

logic sres;
logic[7:0] eres,edif;
logic[22:0] mx,my;
logic[23:0] mres;

//always edif=ex-ey; edif>0->|x| > |y|; edif<0->|y| > |x|
always_ff@(posedge clk)begin
  edif=x[30:23]-y[30:23];
  mx=(edif>0)?x[22:0]:x[22:0]>>edif*-1;
  sres=(edif>0 && x[31])?1:0;
  mx=(x[31])?-1*mx:mx;
  my=(edif>0)?y[22:0]>>edif:y[22:0];
  my=(y[31])?-1*my:my;
  sres+=(edif>0 && x[31])?1:0;
  mres=mx+my;
  if(x[31]^y[31])begin
    eres=(edif>0)?x[30:23]:y[30:23];
    eres=(mres[23])?eres-1:eres;
    mres=(mres[23])?mres<<1:mres;
  end else begin
    eres=(edif>0)?x[30:23]:y[30:23];
    eres=(mres[23])?eres+1:eres;
    mres=(mres[23])?mres>>1:mres;
  end
  q[31]<=sres;
  q[30:23]<=eres;
  q[22:0]<=mres[22:0];
end
endmodule
