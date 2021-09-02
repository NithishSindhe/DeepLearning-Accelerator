`timescale 1ns / 1ps
/*
module psau(fifo_out,psau_out,clk,reset);

    input bit reset;
    input bit clk;
    input [15:0] fifo_out;
    output reg [15:0] psau_out;

    bit [15:0] old_value;
    reg [15:0] temp;


    floadd pp1(old_value,fifo_out,temp,clk);

    //assign old_value = (reset)? 0:temp;

    always@(posedge clk) begin
        if(reset)
            psau_out <= temp;
            $display("temp = %16b,psau_out = %16b,reset = %0d",temp,psau_out,reset);
        if(!reset) begin
    //        $display("temp = %16b",temp);
            old_value <= temp;
        end
    end

endmodule
*/

module psau(fifo_out,psau_out,clk,reset);

input reset;
input bit clk;
input bit [15:0] fifo_out;
output reg [15:0] psau_out;

bit [15:0] fifo_set [7:0];

//wire [15:0] temp [0:3];
bit [15:0] temp [0:3];

floadd f1(fifo_set[0],fifo_set[1],temp[0],clk);
floadd f2(fifo_set[2],fifo_set[3],temp[1],clk);
floadd f3(fifo_set[4],fifo_set[5],temp[2],clk);
floadd f4(fifo_set[6],fifo_set[7],temp[3],clk);

//wire [15:0] temp1 [0:1];
bit [15:0] temp1 [0:1];

floadd f5(temp[0],temp[1],temp1[0],clk);
floadd f6(temp[2],temp[3],temp1[1],clk);

//reg [15:0] final_out;
bit [15:0] final_out;

floadd f7(temp1[0],temp1[1],final_out,clk);

reg [3:0] count,count_next;

always@((fifo_out) | (reset)) begin
    if((fifo_out) | (fifo_out == 16'b0000000000000000) | reset) begin
    if(reset) begin
        count = 4'b0000;
        //psau_out = final_out;
    end
    else
        if((count < 8) & (fifo_out != 16'b0000000000000000)) begin
            fifo_set[count] = fifo_out;
            count_next = count + 4'b0001;
            count = count_next;
        end
    end
end

//reduntant 

always@(final_out) begin
    if(final_out | (final_out == 16'b0000000000000000)) begin
        //$display("time at final_out = %0d",$time);
        psau_out = final_out;
    end
end
/*
always@(final_out) begin
    if(final_out | (final_out == 16'b0000000000000000)) begin
        if(reset) begin
            psau_out = final_out;
            $display("assigning final out to psau_out from psau, time = %0d",$time);
        end
        //$display("final_out = %16b from psau, time = %0d", final_out, $time);
    end
end
*/
endmodule



/*
module psau(fifo_out,psau_out,clk,reset);

input bit reset;
input bit clk;
input [15:0] fifo_out;
output reg [15:0] psau_out;

reg [3:0] count_next,count;

always@(posedge clk) begin
    if(reset) begin
        count <= 4'b0000;
        count_next <= 4'b0000; 
    end
    if(!reset) begin
        count_next = count + 4'b0001;
        count = count_next;  
        $display("count = %0d",count);
    end
end

endmodule
*/