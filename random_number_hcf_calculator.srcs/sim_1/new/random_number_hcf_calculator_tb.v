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
wire[15:0] num1,num2,hcf ;
random_number_hcf_calculator dut(.clk(clk),.random_number_1(num1),.random_number_2(num2),.hcf(hcf));

always
#5 clk= ~clk;

initial
#1000 $finish;
endmodule
