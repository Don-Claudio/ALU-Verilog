`timescale 1ns/1ps
`default_nettype none

module alu_tb;
  localparam WIDTH = 8;

  reg  [WIDTH-1:0] a;
  reg  [WIDTH-1:0] b;
  reg  [2:0]       sel;
  wire [WIDTH:0]   out;

  // Instantiate parameterized ALU
  alu #(.WIDTH(WIDTH)) dut (
    .a(a),
    .b(b),
    .sel(sel),
    .out(out)
  );

  integer i;
  initial begin
    repeat (5) begin
      a = $urandom;   // Verilog system task: gives a 32-bit random value
      b = $urandom;
      for (i = 0; i < 8; i = i + 1) begin
        sel = i[2:0]; // still cycles through all ALU operations
        #10;
        $display("T=%0t a=%0d b=%0d sel=%0b out=%0d",$time, a, b, sel, out);
        $finish;
      end
    end

  end
endmodule

`default_nettype wire
