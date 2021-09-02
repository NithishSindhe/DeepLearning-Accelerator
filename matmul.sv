`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2021 22:13:15
// Design Name: 
// Module Name: matmul
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


module matmul(mata,clk,reset,matb,matc);
parameter N=3;
parameter width=8;
input  reg[N*N*width-1:0]mata;
input  reg[N*N*width-1:0]matb;
input bit clk,reset;
output reg [N*N*width-1:0]matc;

int i,j,k;

  reg [width-1:0]arr1[N][N];
  reg [width-1:0]arr2[N][N];
  reg [width-1:0]arr3[N][N];
  assign arr1={<<8{mata}};
  assign arr2={<<8{matb}};
  assign arr3={<<8{matc}};
 
 
 always@(posedge clk)
 begin
 if(reset)
 begin
 mata=0;
 matb=0;
 matc=0;
 foreach(arr1[i,j])
 arr1[i][j]=0;
 foreach(arr2[i,j])
 arr3[i][j]=0;
  foreach(arr3[i,j])
 arr3[i][j]=0;
 end
 else if(!reset)
 begin
       $display("Displaying matrix A");
       foreach(arr1[i,j])
       
       $display("arr1[%0d][%0d]=%0d",i,j,arr1[i][j]);
       
       $display("Displaying matrix B");
       foreach(arr2[i,j])
      
       $display("arr2[%0d][%0d]=%0d",i,j,arr2[i][j]);
       
       for(i=0;i<N;i++)
       begin
        for(j=0;j<N;j++)
        begin
          for(k=0;k<N;k++)
          begin
            arr3[i][j]+=arr1[i][k]*arr2[k][j];
          end
        end
       end
        $display("Displaying output matrix ");
       foreach(arr3[i,j])
       $display("arr3[%0d][%0d]=%0d",i,j,arr3[i][j]);
       
   
  end
 
  end
  
  endmodule
