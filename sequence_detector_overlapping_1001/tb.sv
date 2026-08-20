class first;
 rand logic rst;
  rand logic din;

  constraint cntr{
    rst dist{1 := 5, 0:= 95};
    din dist {1:= 50, 0:= 50};
  }
endclass


module tb;
  logic clk = 0;
  logic rst;
  logic din;
  logic dout;
  event done;
  first f;
    int i = 0;
  sequence_detector_1001_overlapping dut (.clk(clk),
                                          .rst(rst), 
                                          .din(din),
                                          .dout(dout));
  always #5 clk = ~clk;
  
  initial begin
    f = new();
    for (i = 0; i<40; i++) begin
      f.randomize();
      rst = f.rst;
      din = f.din;
      @(posedge clk)
      #1;
      $display("time : %0t | din: %0d | rst: %0d | dout: %0d",$time,din,rst,dout);
    end
    ->done;
  end
  initial begin
    wait(done.triggered);
    $display("Simulation Completed.");
    $finish;
  end
endmodule
