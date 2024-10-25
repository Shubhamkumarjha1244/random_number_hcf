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

module random_number_generator(clk,done,out1,out2);
    input clk;
    output reg done=0;
    output reg [15:0] out1;
    output reg [15:0] out2;
    reg invertor_input=1'b1;
    wire invertor_output_for_rst,invertor_output_for_d,random_bit;
    integer i;
    three_invertor_ring_counter three_invertor_ring_counter1(invertor_input,invertor_output_for_rst);
    three_invertor_ring_counter three_invertor_ring_counter2(invertor_input,invertor_output_for_d);
    dFF dFF(clk,invertor_output_for_rst,invertor_output_for_d,random_bit);
    
    always @(posedge clk)
        for(i=0;i<32;i=i+1)
                if(i<16)
                    begin
                    out1<=out1<<1;
                    out1[0]<=random_bit;
                    end
            else 
                if(i>=16 & i<31)
                    begin
                    out2<=out2<<1;
                    out2[0]<=random_bit;
                    end
          
      always @(posedge clk)
        if(i==32)
            done=1;
      
              
endmodule

module HCF_calculator(clk,start,num1,num2,out);
    input clk,start;
    input[15:0] num1;
    input[15:0] num2;
    output reg [15:0] out;
    reg[15:0] num1_reg,num2_reg;


    begin
        initial @(posedge clk,start)
        begin
        num1_reg=num1;
        num2_reg=num2;
        end
        
        always @(posedge clk)
            if(start==1'b1 & num1_reg!=16'b0000000000000000 & num2_reg!=16'b0000000000000000 & num1_reg>num2_reg)
                    num1_reg=num1_reg%num2_reg;
            else 
                if(start==1'b1 & num1_reg!=16'b0000000000000000 & num2_reg!=16'b0000000000000000 & num2_reg>num1_reg)
                    num2_reg=num2_reg%num1_reg;
                
        always @(posedge clk)
                if(start==1'b1 & num1_reg==16'b0000000000000000)
                        out=num2_reg;
                else
                    if(start==1'b1 & num2_reg==16'b0000000000000000)
                        out=num1_reg;
                    
                    
                    
     end
    
endmodule



module random_number_hcf_calculator(clk,random_number_1,random_number_2,hcf);
    input clk;
    output reg [15:0] random_number_1,random_number_2,hcf;
    
    wire done;

    random_number_generator rng1(clk,done,random_number_1,random_number_2);
    HCF_calculator hcf_cal_1(clk,done,random_number_1,random_number_2,hcf);
    
    
        
    
    
endmodule
