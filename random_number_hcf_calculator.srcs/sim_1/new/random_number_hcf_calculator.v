`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 07:46:22
// Design Name: 
// Module Name: random_number_hcf_calculator
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
module three_invertor_ring_counter(input q1,output out);
wire q2;
not not1(q1,out);
not not2(q2,q1);
not not3(out,q2);
endmodule

module dFF(clk,rst,d,q);
input clk,rst,d;
output reg q;

always @(posedge clk)
    if(~rst)
        q=d;
    else
        q=1'b0;
                
endmodule

module random_number_generator(input clk,output out);
    reg invertor_input=1'b1;
    wire invertor_output_for_rst,invertor_output_for_d;

    three_invertor_ring_counter three_invertor_ring_counter1(invertor_input,invertor_output_for_rst);
    three_invertor_ring_counter three_invertor_ring_counter2(invertor_input,invertor_output_for_d);
    dFF dFF(clk,invertor_output_for_rst,invertor_output_for_d,out);  
endmodule


module random_number_hcf_calculator();
endmodule
