`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 07:48:16
// Design Name: 
// Module Name: random_number_hcf_calculator_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module random_number_hcf_calculator_tb();
reg clk=0;
wire out;
random_number_generator dut(clk,out);

always
#5 clk= ~clk;

initial
#100 $finish;
endmodule
