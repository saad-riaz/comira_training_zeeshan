module tb_top_single();

  logic clk, rst, enable;
  logic signal;
  logic [31:0] data_in;
  logic posedge_detection, negedge_detection, change_detection;
  logic pulse;
  logic [31:0] data_out;
  logic [31:0] q [$];

  top_single dut(.clk(clk), .rst(rst), .enable(enable), .signal(signal), .data_in(data_in), .posedge_detection(posedge_detection),
               .negedge_detection(negedge_detection), .change_detection(change_detection), .pulse(pulse), .data_out(data_out));

  initial
    clk = 1'b1;

  always clk = #0.05ns ~clk;

  initial begin
    rst = 1'b1; #0.1ns;
    rst = 1'b0;
  end

  task check_unit();

    if(!rst && posedge_detection == 1)
    $display("Posedge detected: PASS");

    if(!rst && negedge_detection == 1)
    $display("Negedge detected: PASS");

    if(!rst && change_detection == 1)
    $display("Change detected: PASS");

    if(!rst && pulse == 1'b1)
    $display("Pulse detected: PASS");

  endtask

  task automatic check_pipeline();

    if (!rst && q.size() > 4) begin
      logic [31:0] expected = q.pop_front();

      if (data_out !== expected) begin
        $display("Delay Pipeline: FAIL");
      end

      else begin
        $display("Delay Pipeline: PASS");
      end
    end

  endtask

  initial
    enable = 1'b1;

  initial begin
    #0.1ns;

    repeat(20) begin
      {signal, data_in} = $random;
      q.push_back(data_in);
      #0.1ns;
    end

    #20ns;
    $stop;
  end

  initial begin

    forever begin
      @(posedge clk); begin
        check_unit();
        check_pipeline();
      end
    end
  end


endmodule
