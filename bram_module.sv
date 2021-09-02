`timescale 1ns / 1ps

module bram_module(clk,input_data,ram_enable1,r_data);

	parameter tile = 32;
	parameter width = 16;
	
	output reg [width-1:0] r_data ;

	input bit clk;
	input [width-1:0] input_data; 
	input ram_enable1;

	always@(posedge clk)
	begin
		if(ram_enable1) begin
			r_data <= input_data;
		end
	end

endmodule

