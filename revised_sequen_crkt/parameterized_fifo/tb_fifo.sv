// FIFO testing scenarios
// 1. Reset
// 2. Write Until Full
// 3. Read until empty
// 4. Random Read/Write
// 5. Read beyond empty
// 6. Write beyond full

module tb_fifo();

  parameter WIDTH = 32, DEPTH = 128;

  logic clk, rst;
  bit write, read;
  logic full, empty;
  logic [WIDTH-1:0] data_in, data_out;
  logic [WIDTH-1:0] q [$];
  // logic [WIDTH-1:0] data_rd;

  fifo #(WIDTH,DEPTH) dut(.clk(clk), .rst(rst), .write(write), .read(read), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

  // Reset Queue
  task q_reset();
    @(posedge clk) begin
      if(rst) begin
	      q.delete();

	    if(!full && empty)
	      $display("Queue and FIFO are both resetted");
	    else
	      $display("Queue is not properly resetted");
      end
    end
  endtask

  // Write until full
  task push_till_full();
    @(posedge clk) begin
      if(!rst && write && !full) begin
        data_in <= $random;
        q.push_back(data_in);
        $display("Input Data '%0d' written to FIFO and Queue", data_in);
      end
    end
  endtask

  // Read until empty
  task pop_till_empty();
    logic [WIDTH-1:0] q_data;

    @(posedge clk) begin
      if(!rst && read && !empty) begin
        q_data <= q.pop_front();

        if (data_out == q_data)
          $display("PASS: FIFO Data %0d == Queue Data %0d", data_out, q_data);

        else
          $display("FAIL: FIFO Data %0d != Queue Data %0d", data_out, q_data);
      end
    end
  endtask

  // Write beyond full
  task push_beyond_full();
    @(posedge clk) begin
      if(!rst && write) begin
	      data_in <= $random;

	      if(full && q.size() == DEPTH)
          $display("Queue size '%0d' is now same as FIFO DEPTH, further writes not possible", q.size());

      	else begin
	        q.push_back(data_in);
	        $display("Error! Data_in '%0d' is written even after FIFO full", data_in);
	      end
      end
    end
  endtask

  // Read beyond empty
  task pop_beyond_empty();
    logic [WIDTH-1 : 0] q_data;

    @(posedge clk) begin
      if(!rst && read) begin
	      q_data <= q.pop_front();

	      if(empty && q.size() == 0)
          $display("Queue data '%0d', because Queue size '%0d' and FIFO are now empty, further reads not possible", q_data, q.size());

	      else
	        $display("Error! Queue data '%0d', because of invalid queue operation", q_data);
      end
    end
  endtask

  // Random Read/Write till and beyond full and empty
  task rand_read_write(logic [1:0] op);
    case(op)
      2'b00 : begin
                $display("No Operation");
              end

      2'b01 : begin
                $display("Only Write operation");

                if(!full)
                  push_till_full();
                else
                  push_beyond_full();
              end

      2'b10 : begin
                $display("Only Read operation");

                if(!empty)
                  pop_till_empty();
                else
                  pop_beyond_empty();
              end

      2'b11 : begin
                $display("Combined Read and Write Operation");

                // Overlapping raed and write operations for parallelism using
                // fork-join
                fork
                  // Thread of write operation
                  begin
                    if (!full && !empty)
                      push_till_full();

                    else if (full && !empty)
                      push_beyond_full();

                    else if (!full && empty)
                      push_till_full();

                    else
                      push_beyond_full();
                  end

                  // Thread of read operation
                  begin
                    if (!full && !empty)
                      pop_till_empty();

                    else if (full && !empty)
                      pop_till_empty();

                    else if (!full && empty)
                      pop_beyond_empty();

                    else
                      pop_beyond_empty();
                  end
                join
              end
    endcase
  endtask

  initial
    clk = 1'b1;

  always clk = #5ns ~clk;

  initial begin
    // Reset operation check
    rst = '1;

    repeat(2) begin
      q_reset(); #10ns;
    end

    rst = '0;

   //////////////// Write operations ///////////////////

    write = 1'b1;

    // Until full check
    repeat(DEPTH) begin
      push_till_full(); #10ns;
    end

    // Beyond full check
    repeat(5) begin
      push_beyond_full(); #10ns;
    end
    
    write = 1'b0;

    ///////////////////////////////////////////////////


    /////////////// Read operations ///////////////////

    read = 1'b1;

    // Until empty check

    repeat(DEPTH) begin
      pop_till_empty(); #10ns;
    end

    // Beyond empty check
    repeat(5) begin
      pop_beyond_empty(); #10ns;
    end

    read = 1'b0;

    //////////////////////////////////////////////////

    rst = '1;

    repeat(2) begin
      q_reset(); #10ns;
    end

    rst = '0;

    ////////// Random Read/Write operations //////////

    repeat(30) begin
      @(posedge clk) begin
        {read, write} <= $urandom_range(0, 3);
        rand_read_write({read, write});
      end
    end

    /////////////////////////////////////////////////

    #10ns;
    $stop;
  end


endmodule
























