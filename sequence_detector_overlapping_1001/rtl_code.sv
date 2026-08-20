// Code your design here
module sequence_detector_1001_overlapping(
input logic clk, rst, din,
output logic dout 
    );
    parameter s0 = 2'd0;
    parameter s1 = 2'd1;
    parameter s2 = 2'd2;
    parameter s3 = 2'd3;
    reg [3:0] state = s0;
    always@(posedge clk)
    begin
    if(rst == 1'b1) 
    begin
    state<=s0;
    end
    else
    begin
  case (state)
  s0: begin
  if(din==1'b1)
  begin
  state <= s1;
  dout<= 1'b0;
  end
  else
  begin
  state <= s0;
  dout <= 0;
  end 
  end
  s1: begin
  if(din==1'b1)
  begin
  state <= s1;
  dout<= 1'b0;
  end
  else
  begin
  state <= s2;
  dout <= 0;
  end
  end
  s2: begin
  if(din==1'b1)
  begin
  state <= s1;
  dout<= 1'b0;
  end
  else
  begin
  state <= s3;
  dout <= 0;
  end
  end
  s3: begin
  if(din==1'b1)
  begin
  state <= s1;
  dout<= 1'b1;
  end
  else
  begin
  state <= s0;
  dout <= 0;
  end
  end
  default: state<=s0;
  endcase
    end
    end
endmodule
