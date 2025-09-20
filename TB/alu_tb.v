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

  initial begin
    // basic sanity test
    a = 8'd10; b = 8'd5; sel = 3'b001; // add
    #10;
    $display("Time=%0t out=%0d", $time, out);
    $finish;
  end
endmodule

`default_nettype wire
