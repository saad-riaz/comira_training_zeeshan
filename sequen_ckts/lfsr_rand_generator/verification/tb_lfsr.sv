module tb_lfsr();

  logic clk, rst;
  logic load_seed;
  logic [7:0] seed, rand_num;
  integer file;

  lfsr dut(.clk(clk), .rst(rst), .load_seed(load_seed), .seed(seed), .rand_num(rand_num));

  initial
    file = $fopen("/home/comira/Pictures/seq_circuits/lfsr_rand_generator/lfsr_output.txt", "w");

  initial
    clk = 1'b0;

  always clk = #5ns ~clk;

  initial begin
    rst = 1'b1; #3ns;
    rst = 1'b0;
  end

  initial begin
    #5ns;
    seed = 8'b0110_1010;

    load_seed = 1'b1; #10ns;
    load_seed = 1'b0;
  end

  task print_num();
    $fdisplay(file, "%0d", rand_num);
  endtask

  initial begin
    for (int j = 0; j < 10000; j++) begin
      @(posedge clk);
        print_num();
    end
    $stop;
  end

endmodule
