`timescale 1ns/1ps
`default_nettype none

module alu #(
  parameter integer WIDTH = 8
)(
  input  wire [WIDTH-1:0] a,
  input  wire [WIDTH-1:0] b,
  input  wire [2:0]       sel,
  output reg  [WIDTH:0]   out  // WIDTH+1 to hold add result
);

  always @(*) begin
    case (sel)
      3'b000: out = {{1{1'b0}}, a};               // pass-through A (extended)
      3'b001: out = a + b;                        // add
      3'b010: out = a - b;                        // subtract
      3'b011: out = (b != 0) ? (a / b) : {WIDTH+1{1'b0}}; // safe divide
      3'b100: out = (b != 0) ? (a % b) : {WIDTH+1{1'b0}}; // modulus
      3'b101: out = { {(WIDTH-1){1'b0}}, a << 1 }; // shift left (keeps WIDTH+1)
      3'b110: out = {1'b0, a >> 1};               // shift right
      3'b111: out = (a > b) ? {{(WIDTH){1'b0}}, 1'b1} : {WIDTH+1{1'b0}}; // compare
      default: out = {WIDTH+1{1'b0}};
    endcase
  end

endmodule

`default_nettype wire
