`timescale 1ns / 1ps

module DLAU(a, input_data, ram_enable, psau_out, clk, reset_psau, reset_tmmu, fifo_out1, store_psau);

parameter width = 16;
parameter tile = 32;

input reg [width-1:0] a [tile-1:0];
input reg [width-1:0] input_data [tile-1:0];
input reg ram_enable;
output reg [15:0] psau_out;
input reg reset_tmmu;
input bit clk;
reg reset_fifo1;
input reg reset_psau;
reg full, empty;
reg wn1, rn1;
reg [15:0] fifo_in1;//output of tmmu goes to fifo
bit clk_F1;
input reg store_psau;

always@(fifo_in1) begin
    if((fifo_in1) | (fifo_in1 == 16'b0000000000000000)) begin//exclude xx... case 
        clk_F1 = ~clk_F1;
        wn1 = 1;    //enable writing into fifo
        rn1 = 0;    //disable reading from fifo
        //$display("enabled writing at time = %0d", $time);
    end
end

tmmu v1(a, fifo_in1, clk, input_data, ram_enable,reset_tmmu);//fifo in = tmmu out

output bit [15:0] fifo_out1;

FIFO F1(fifo_out1, full, empty, clk_F1, reset_fifo1, wn1, rn1, fifo_in1);

psau p1(fifo_out1, psau_out, clk, reset_psau);

always@(posedge clk) begin
    if(full) 
        $display("stack is full,time = %0d",$time);

    if(reset_psau) begin
        wn1 = 0;
        rn1 = 0;
        clk_F1 = ~clk_F1;//reset all psau values to 0 and assign to psau_out
    end
    if(store_psau) begin
        rn1 = 1;//enable reading
        wn1 = 0;//disable writing from fifo
        //$display("enabled reading at time = %0d ", $time);
        clk_F1 = ~clk_F1;
    end
end
/*
always@(fifo_out1) begin
    @(posedge clk) begin
    if(fifo_out1 | (fifo_out1 == 16'b0000000000000000)) begin
        rn1 = 1;//enable reading from fifo
        wn1 = 0;//disable writing from fifo
        clk_F1 = ~clk_F1;
        //$display("time from dlau = %0d", $time);
    end
    end
end
*/
//redundant code
/*
always@(fifo_in1) begin
    $display("fifo_in1 = %16b, time = %0d",fifo_in1, $time);
end

always@(fifo_out1) begin   
    $display("fifo _out = %16b at time = %0d, from dlau", fifo_out1,$time);
end
*/
endmodule

