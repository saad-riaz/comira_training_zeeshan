// Single Clock FIFO buffer 32wx128d

module fifo #(parameter WIDTH = 32, parameter DEPTH = 128)(
  input logic clk, rst,
  input bit read, write,
  input logic [WIDTH-1 : 0] data_in,
  output logic full, empty,
  output logic [WIDTH-1 : 0] data_out
);

  logic [WIDTH-1 : 0] buffer [DEPTH-1 : 0];
  logic [$clog2(DEPTH)-1 : 0] write_ptr, read_ptr;

  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      write_ptr <= 0;
      read_ptr <= 0;
      data_out <= 'bx;
    end

    else if(write && !read && !full) begin
      buffer[write_ptr] <= data_in;
      write_ptr <= write_ptr + 1;
    end

    else if(read && !write && !empty) begin
      data_out <= buffer[read_ptr];
      read_ptr <= read_ptr + 1;
    end

  end

  assign full = (write_ptr == (DEPTH-1));
  assign empty = (write_ptr == read_ptr);

endmodule
