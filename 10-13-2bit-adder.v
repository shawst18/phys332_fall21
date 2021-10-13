`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: lab6
//////////////////////////////////////////////////////////////////////////////////

// code is initially broken.  See attached photos for intended design

module addedx2bit(
    input [3:0] SW,
    output [2:0] LED
    );
    wire a1, a0, b1, b0;
    wire s1, s0, cout, c_out1;

    // global inputs
    assign a0 = SW[0];
    assign a1 = SW[1];
    assign b0 = SW[2];
    assign b1 = SW[3];

    // global outputs
    assign LED[0] = s0;
    assign LED[1] = s1;
    assign LED[2] = cout;

    fulladder a0(a0,b0,0, c_out1, s0);
    fulladder a1(a1,b1,c_out1, cout, s1);

endmodule 

module fulladder(
    input a,
    input b,
    input c_in,
    output c_out,
    output sum
    );
    assign c_out = (a&b)|(c_in&b)|(c_in&a);
    assign sum = (~a&~b&c_in)|(~a&b&~c_in)|(a&b&c_in)|(a&~b&~c_in);
endmodule
