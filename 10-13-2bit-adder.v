`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// this is a 2bit + 2bit adder for Nexys4 DDR board 
// code is initially broken.  See attached photos for intended design

module example1(
    input [3:0] swt,
    output [2:0] led
    );
    wire a1, a0, b1, b0;
    wire s1, s0, cout, c_out1;
    
    // global inputs
    assign a0 = swt[0];
    assign a1 = swt[1];
    assign b0 = swt[2];
    assign b1 = swt[3];
    
    // global outputs
    assign led[0] = s0;
    assign led[1] = s1;
    assign led[2] = cout;
    
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
    assign sum = (~a&~b&c)|(~a&b&~c)|(a&b&c)|(a&~b&~c);
endmodule
