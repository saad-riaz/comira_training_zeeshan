module tb_fifo();

  parameter WIDTH = 32, DEPTH = 128;

  logic clk, rst;
  bit write, read;
  logic full, empty;
  logic [WIDTH-1:0] data_in, data_out;
  logic [WIDTH-1:0] q [$];
  // logic [WIDTH-1:0] data_rd;

  fifo #(WIDTH,DEPTH) dut(.clk(clk), .rst(rst), .write(write), .read(read), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

  initial
    clk = 1'b0;

  always clk = #5ns ~clk;

  initial begin
    rst = 1'b1; #3ns;
    rst = 1'b0;
  end

  task push_till_full();
    if (!rst && write && !full) begin
      q.push_back(data_in);
      $display("Input Data: %0d written to FIFO and Queue", data_in);
    end

    else if (full && q.size() >= DEPTH) begin
      $display("PASS: FIFO and Queue both overflowed");
    end
    
    /*else if (full && q.size() < DEPTH) begin
        $display("FAIL: Full signal not functional");
    end */
  endtask

  task pop_till_empty();
    logic [WIDTH-1:0] q_data;

    if (!rst && read && !empty) begin
      q_data <= q.pop_front();

      // Compare after one cycle delay if FIFO outputs data late
      if (data_out == q_data)
        $display("PASS: FIFO Data %0d == Queue Data %0d", data_out, q_data);

      else
        $display("FAIL: FIFO Data %0d != Queue Data %0d", data_out, q_data);
    end 

    else if (empty && q.size() == 0) begin
      $display("PASS: FIFO and Queue both underflowed");
    /*end else if (empty && q.size() > 0) begin
        $display("FAIL: Empty signal not functional");*/
    end
  endtask

  initial begin
    #5ns;
    // writing until full
    write = 1'b1; // #((DEPTH+1)*(10ns));

    repeat(DEPTH) begin
      data_in = $random;
      push_till_full(); #10ns;
    end

    write = 1'b0;

    // reading until empty
    read = 1'b1; // #((DEPTH+1)*(10ns));

    repeat(DEPTH) begin
      pop_till_empty(); #10ns;
    end

    read = 1'b0;

    #100ns;
    $stop;
  end

  initial begin
    forever begin
      @(posedge clk); begin
        push_till_full();
        pop_till_empty();
      end
    end
  end


endmodule
























