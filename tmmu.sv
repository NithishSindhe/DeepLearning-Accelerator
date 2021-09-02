`timescale 1ns / 1ps

//module tmmu(weights,a,b,out,clk,input_data,ram_enable);
module tmmu(a,out,clk,input_data,ram_enable,reset);
parameter width = 16;
parameter tile = 32;

//input reg [width-1:0] weights [tile-1:0];
input reg [width-1:0] a [tile-1:0];
//input reg [width-1:0] b [tile-1:0];
output reg [width-1:0] out;
input bit clk;
input reg reset;

input reg [width-1:0] input_data [tile-1:0];
input ram_enable;

reg [width-1:0] s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16;
reg [width-1:0] ss1,ss2,ss3,ss4,ss5,ss6,ss7,ss8;
reg [width-1:0] f1,f2,f3,f4;
reg [width-1:0] ff1,ff2;

reg [width-1:0] r_data1;
reg [width-1:0] r_data2;
reg [width-1:0] r_data3;
reg [width-1:0] r_data4;
reg [width-1:0] r_data5;
reg [width-1:0] r_data6;

reg [width-1:0] r_data7;
reg [width-1:0] r_data8;
reg [width-1:0] r_data9;
reg [width-1:0] r_data10;
reg [width-1:0] r_data11;
reg [width-1:0] r_data12;

reg [width-1:0] r_data13;
reg [width-1:0] r_data14;
reg [width-1:0] r_data15;
reg [width-1:0] r_data16;
reg [width-1:0] r_data17;
reg [width-1:0] r_data18;

reg [width-1:0] r_data19;
reg [width-1:0] r_data20;
reg [width-1:0] r_data21;
reg [width-1:0] r_data22;
reg [width-1:0] r_data23;
reg [width-1:0] r_data24;

reg [width-1:0] r_data25;
reg [width-1:0] r_data26;
reg [width-1:0] r_data27;
reg [width-1:0] r_data28;
reg [width-1:0] r_data29;
reg [width-1:0] r_data30;

reg [width-1:0] r_data31;
reg [width-1:0] r_data32;


bram_module w0(clk,input_data[0],ram_enable,r_data1);
bram_module w1(clk,input_data[1],ram_enable,r_data2);
bram_module w2(clk,input_data[2],ram_enable,r_data3);
bram_module w3(clk,input_data[3],ram_enable,r_data4);
bram_module w4(clk,input_data[5],ram_enable,r_data5);
bram_module w5(clk,input_data[6],ram_enable,r_data6);

bram_module w6(clk,input_data[6],ram_enable,r_data7);
bram_module w7(clk,input_data[7],ram_enable,r_data8);
bram_module w8(clk,input_data[8],ram_enable,r_data9);
bram_module w9(clk,input_data[9],ram_enable,r_data10);
bram_module w10(clk,input_data[10],ram_enable,r_data11);
bram_module w11(clk,input_data[11],ram_enable,r_data12);

bram_module w12(clk,input_data[12],ram_enable,r_data13);
bram_module w13(clk,input_data[13],ram_enable,r_data14);
bram_module w14(clk,input_data[14],ram_enable,r_data15);
bram_module w15(clk,input_data[15],ram_enable,r_data16);
bram_module w16(clk,input_data[16],ram_enable,r_data17);
bram_module w17(clk,input_data[17],ram_enable,r_data18);

bram_module w18(clk,input_data[18],ram_enable,r_data19);
bram_module w19(clk,input_data[19],ram_enable,r_data20);
bram_module w20(clk,input_data[20],ram_enable,r_data21);
bram_module w21(clk,input_data[21],ram_enable,r_data22);
bram_module w22(clk,input_data[22],ram_enable,r_data23);
bram_module w23(clk,input_data[23],ram_enable,r_data24);

bram_module w24(clk,input_data[24],ram_enable,r_data25);
bram_module w25(clk,input_data[25],ram_enable,r_data26);
bram_module w26(clk,input_data[26],ram_enable,r_data27);
bram_module w27(clk,input_data[27],ram_enable,r_data28);
bram_module w28(clk,input_data[28],ram_enable,r_data29);
bram_module w29(clk,input_data[29],ram_enable,r_data30);

bram_module w30(clk,input_data[30],ram_enable,r_data31);
bram_module w31(clk,input_data[31],ram_enable,r_data32);


reg [width-1:0] temp [tile-1:0];

flomul c1(a[0],r_data1,temp[0],clk);
flomul c2(a[1],r_data2,temp[1],clk);
flomul c3(a[2],r_data3,temp[2],clk);
flomul c4(a[3],r_data4,temp[3],clk);
flomul c5(a[4],r_data5,temp[4],clk);
flomul c6(a[5],r_data6,temp[5],clk);
flomul c7(a[6],r_data7,temp[6],clk);
flomul c8(a[7],r_data8,temp[7],clk);
flomul c9(a[8],r_data9,temp[8],clk);
flomul c10(a[9],r_data10,temp[9],clk);
flomul c11(a[10],r_data11,temp[10],clk);
flomul c12(a[11],r_data12,temp[11],clk);
flomul c13(a[12],r_data13,temp[12],clk);
flomul c14(a[13],r_data14,temp[13],clk);
flomul c15(a[14],r_data15,temp[14],clk);
flomul c16(a[15],r_data16,temp[15],clk);
flomul c17(a[16],r_data17,temp[16],clk);
flomul c18(a[17],r_data18,temp[17],clk);
flomul c19(a[18],r_data19,temp[18],clk);
flomul c20(a[19],r_data20,temp[19],clk);
flomul c21(a[20],r_data21,temp[20],clk);
flomul c22(a[21],r_data22,temp[21],clk);
flomul c23(a[22],r_data23,temp[22],clk);
flomul c24(a[23],r_data24,temp[23],clk);
flomul c25(a[24],r_data25,temp[24],clk);
flomul c26(a[25],r_data26,temp[25],clk);
flomul c27(a[26],r_data27,temp[26],clk);
flomul c28(a[27],r_data28,temp[27],clk);
flomul c29(a[28],r_data29,temp[28],clk);
flomul c30(a[29],r_data30,temp[29],clk);
flomul c31(a[30],r_data31,temp[30],clk);
flomul c32(a[31],r_data32,temp[31],clk);

// adding these partial products

floadd ad1(temp[0],temp[1],s1,clk);
floadd ad2(temp[2],temp[3],s2,clk);
floadd ad3(temp[4],temp[5],s3,clk);
floadd ad4(temp[6],temp[7],s4,clk);
floadd ad5(temp[8],temp[9],s5,clk);
floadd ad6(temp[10],temp[11],s6,clk);
floadd ad7(temp[12],temp[13],s7,clk);
floadd ad8(temp[14],temp[15],s8,clk);
floadd ad9(temp[17],temp[16],s9,clk);
floadd ad10(temp[18],temp[19],s10,clk);
floadd ad11(temp[21],temp[20],s11,clk);
floadd ad12(temp[22],temp[23],s12,clk);
floadd ad13(temp[25],temp[24],s13,clk);
floadd ad14(temp[26],temp[27],s14,clk);
floadd ad15(temp[29],temp[28],s15,clk);
floadd ad16(temp[30],temp[31],s16,clk);

floadd ad17(s1,s2,ss1,clk);
floadd ad18(s3,s4,ss2,clk);
floadd ad19(s5,s6,ss3,clk);
floadd ad20(s8,s7,ss4,clk);
floadd ad21(s9,s10,ss5,clk);
floadd ad22(s12,s11,ss6,clk);
floadd ad23(s13,s14,ss7,clk);
floadd ad24(s16,s15,ss8,clk);

floadd ad25(ss1,ss2,f1,clk);
floadd ad26(ss4,ss3,f2,clk);
floadd ad27(ss6,ss5,f3,clk);
floadd ad28(ss7,ss8,f4,clk);

floadd ad29(f1,f2,ff1,clk);
floadd ad30(f4,f3,ff2,clk);

reg [width-1:0] final_out;

floadd ad31(ff1,ff2,final_out,clk);


always@(final_out) begin
    if(final_out | (final_out == 16'b0000000000000000)) begin
       // if(reset) begin
            out <= final_out;
          //  #2;
            //$display("final_out = %16b from tmmu, time = %0d,out = %16b",final_out,$time,out);
        //end
    end
end
reg [5:0]i;
always@(posedge clk) begin
    if(reset) begin
        for(i = 6'b000000;i<5'b100000;i = i+5'b000001) begin
            a[i] <= 16'b0000000000000000; 
        end
    end
end
endmodule
