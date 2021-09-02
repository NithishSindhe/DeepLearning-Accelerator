
/*
//TESTBENCH FOR TMMU 
module dlau_tb();

parameter width = 16;
parameter tile = 32;
reg [width-1:0] weights [tile-1:0];
reg [width-1:0] a [tile-1:0];
reg [width-1:0] b [tile-1:0];
wire [width-1:0] out;
reg clk;
int i;



reg [width-1:0] input_data [tile-1:0];
reg ram_enable;

tmmu h1(weights,a,b,out,clk,input_data,ram_enable);

initial clk = 0;

always #5clk=~clk;

initial begin
   #5;
   weights[0] <= 16'b0011110000000000;//1
   weights[1] <= 16'b0100000000000000;//2
   weights[2] <= 16'b0100001000000000;//3
   weights[3] <= 16'b0100010000000000;//4

   a[0] <= 16'b0100000000000000;//2
   a[1] <= 16'b0100001000000000;//3
   a[2] <= 16'b0100000000000000;//2
   a[3] <= 16'b0100001000000000;//3

   for(i=4;i<tile;i=i+1)
   begin
       weights[i] = 16'b0011110000000000;
       a[i] = 16'b0011110000000000;
   end
   #500;
   $display("%0d",out);
end

initial begin
    #100;
    ram_enable = 1;
    #1 $display("writing into bram");
    begin
      input_data[0] <= weights[0];
      input_data[1] <= weights[1];
      input_data[2] <= weights[2];
      input_data[3] <= weights[3];
      input_data[4] <= weights[4];
      input_data[5] <= weights[5];
      input_data[6] <= weights[6];
      input_data[7] <= weights[7];
      input_data[8] <= weights[8];
      input_data[9] <= weights[9];
      input_data[10] <= weights[10];
      input_data[11] <= weights[11];
      input_data[12] <= weights[12];
      input_data[13] <= weights[13];
      input_data[14] <= weights[14];
      input_data[15] <= weights[15];
      input_data[16] <= weights[16];
      input_data[17] <= weights[17];
      input_data[18] <= weights[18];
      input_data[19] <= weights[19];
      input_data[20] <= weights[20];
      input_data[21] <= weights[21];
      input_data[22] <= weights[22];
      input_data[23] <= weights[23];
      input_data[24] <= weights[24];
      input_data[25] <= weights[25];
      input_data[26] <= weights[26];
      input_data[27] <= weights[27];
      input_data[28] <= weights[28];
      input_data[29] <= weights[29];
      input_data[30] <= weights[30];
      input_data[31] <= weights[31];
      @(posedge clk);
    end
/*    
    begin

    input_data[0] <= 16'b0100000000000000;//2
    input_data[1] <= 16'b0100001000000000;//3
    input_data[2] <= 16'b0100000000000000;//2
    input_data[3] <= 16'b0100001000000000;//3
    input_data[4] <= 16'b0011110000000000;
    input_data[5] <= 16'b0011110000000000;
    input_data[6] <= 16'b0011110000000000;
    input_data[7] <= 16'b0011110000000000;
    input_data[8] <= 16'b0011110000000000;
    input_data[9] <= 16'b0011110000000000;
    input_data[10] <= 16'b0011110000000000;
    input_data[11] <= 16'b0011110000000000;
    input_data[12] <= 16'b0011110000000000;
    input_data[13] <= 16'b0011110000000000;
    input_data[14] <= 16'b0011110000000000;
    input_data[15] <= 16'b0011110000000000;
    input_data[16] <= 16'b0011110000000000;
    input_data[17] <= 16'b0011110000000000;
    input_data[18] <= 16'b0011110000000000;
    input_data[19] <= 16'b0011110000000000;
    input_data[20] <= 16'b0011110000000000;
    input_data[21] <= 16'b0011110000000000;
    input_data[22] <= 16'b0011110000000000;
    input_data[23] <= 16'b0011110000000000;
    input_data[24] <= 16'b0011110000000000;
    input_data[25] <= 16'b0011110000000000;
    input_data[26] <= 16'b0011110000000000;
    input_data[27] <= 16'b0011110000000000;
    input_data[28] <= 16'b0011110000000000;
    input_data[29] <= 16'b0011110000000000;
    input_data[30] <= 16'b0011110000000000;
    input_data[31] <= 16'b0011110000000000;
    @(posedge clk);
    
    end
    // *
    #1;
    ram_enable = 0;
    #2000 $finish;
end

initial begin
    $monitor("time = %d,out = %16b",$time,out);
    #1000;
    $display("expected output = 54 = 0 10100 1011000000, out = %16b",out);
end

endmodule
*/

/*
//TESTBENCH FOR FIFO
module jFIFOTb;
  wire [7:0] DATAOUT;
  wire full, empty;
  reg clock, reset, wn, rn;
  reg [7:0] DATAIN;  
  
  jFIFO jfifo(DATAOUT, full, empty, clock, reset, wn, rn, DATAIN);
  
    
  //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end

  initial
  begin
    clock = 0; DATAIN = 8'd0;
    reset = 1; clock = 1; #5 ; clock = 0; #5;
    reset = 0;
    
    $display("Start testing");

    // First write some data into the queue
    wn = 1; rn = 0;
    DATAIN = 8'd100;
    clock = 1; #5 ; clock = 0; #5;
    DATAIN = 8'd150;
    clock = 1; #5 ; clock = 0; #5;
    DATAIN = 8'd200;
    clock = 1; #5 ; clock = 0; #5;
    DATAIN = 8'd40;
    clock = 1; #5 ; clock = 0; #5;
    DATAIN = 8'd70;
    clock = 1; #5 ; clock = 0; #5;
    DATAIN = 8'd65;
    clock = 1; #5 ; clock = 0; #5;
    DATAIN = 8'd15;
    clock = 1; #5 ; clock = 0; #5;
    
    // Now start reading and checking the values
    wn = 0; rn = 1;
    clock = 1; #5 ; clock = 0; #5;
    if ( DATAOUT === 8'd100 )
      $display("PASS %p ", DATAOUT);
    else
      $display("FAIL %p ", DATAOUT);

    clock = 1; #5 ; clock = 0; #5;
    if ( DATAOUT === 8'd150 )
      $display("PASS %p ", DATAOUT);
    else
      $display("FAIL %p ", DATAOUT);

    clock = 1; #5 ; clock = 0; #5;
    if ( DATAOUT === 8'd200 )
      $display("PASS %p ", DATAOUT);
    else
      $display("FAIL %p ", DATAOUT);

    clock = 1; #5 ; clock = 0; #5;
    if ( DATAOUT === 8'd40 )
      $display("PASS %p ", DATAOUT);
    else
      $display("FAIL %p ", DATAOUT);

    clock = 1; #5 ; clock = 0; #5;
    if ( DATAOUT === 8'd70 )
      $display("PASS %p ", DATAOUT);
    else
      $display("FAIL %p ", DATAOUT);

    clock = 1; #5 ; clock = 0; #5;
    if ( DATAOUT === 8'd65 )
      $display("PASS %p ", DATAOUT);
    else
      $display("FAIL %p ", DATAOUT);

    clock = 1; #5 ; clock = 0; #5;
    if ( DATAOUT === 8'd15 )
      $display("PASS %p ", DATAOUT);
    else
      $display("FAIL %p ", DATAOUT);

    clock = 1; #5 ; clock = 0; #5;
    if ( empty === 1 )
      $display("PASS %p ", empty);
    else
      $display("FAIL %p ", empty);
  end

endmodule
//*
*/

/*
//TESTBENCH FOR PSAU
module dlau_tb();

reg [15:0] fifo_out;
reg clk;
wire [15:0] psau_out;
reg reset;

//wire [15:0] temp;

psau p1(fifo_out,psau_out,clk,reset);

initial clk = 0;

always #5 clk=~clk;

initial begin

    @(posedge clk)
    reset = 1;

    @(posedge clk)
    reset = 0;

    fifo_out = 16'b0101010000000000;//64 in decimal
    @(posedge clk);

    fifo_out = 16'b0101001010101101;//53.4 in decimal
    @(posedge clk);

    fifo_out = 16'b0100110111100110;//23.6 in decimal
    @(posedge clk);

    fifo_out = 16'b0000000000000000;
    @(posedge clk);

    fifo_out = 16'b0000000000000000;
    @(posedge clk);

    fifo_out = 16'b0000000000000000;
    @(posedge clk);

    fifo_out = 16'b0000000000000000;
    @(posedge clk);

    fifo_out = 16'b0000000000000000;
    @(posedge clk);

    reset = 1;
    @(posedge clk);
  
    reset = 0;
    @(posedge clk);

  #10;
  $display("psau_out = %16b",psau_out);
  $display("expected output 0 10110 0001101000 = 141.0");
  #1000 $finish;
end

endmodule 
*/


//TESTBENCH FOR DLAU

module dlau_tb();

parameter width = 16;
parameter tile = 32;

reg [width-1:0] a [tile-1:0];
reg [width-1:0] input_data [tile-1:0];
reg ram_enable;
reg clk;
reg [width-1:0] weights [tile-1:0];
wire [width-1:0] psau_out;
reg reset_tmmu;
bit [5:0] i;
reg reset_psau;
wire [15:0] fifo_out1;
reg store_psau;


DLAU DLAU_TEST(a, input_data, ram_enable, psau_out, clk, reset_psau, reset_tmmu, fifo_out1,store_psau);

initial clk = 0;

always #5clk=~clk;

initial begin
  //writing first set of nodes to tmmu
  #5;
  weights[0] <= 16'b0011110000000000;//1
  weights[1] <= 16'b0100000000000000;//2
  weights[2] <= 16'b0100001000000000;//3
  weights[3] <= 16'b0100010000000000;//4

  a[0] <= 16'b0100000000000000;//2
  a[1] <= 16'b0100001000000000;//3
  a[2] <= 16'b0100000000000000;//2
  a[3] <= 16'b0100001000000000;//3

  for(i=4;i<tile;i=i+1)
  begin
    weights[i] = 16'b0011110000000000;
    a[i] = 16'b0011110000000000;
  end
  
  ram_enable = 1;
  
  //writing FIRST set of weights to bram
  //#1 $display("writing into bram");
  for(i = 6'b000000; i < 6'b100000; i = i+6'b000001) begin
    input_data[i] <= weights[i];
    @(posedge clk);
  end
  ram_enable = 0;
  //extracting computed values from tmmu
  #50;
  reset_tmmu <= 0;
  @(posedge clk);

  reset_tmmu <= 1;
  @(posedge clk);
  
  reset_tmmu <= 0;
  @(posedge clk);

  //end of first set computation 

  //sending SECOND set of nodes to tmmu
  
  #5;
  weights[0] <= 16'b0011110000000001;//1.001
  weights[1] <= 16'b0100000000000001;//2.002
  weights[2] <= 16'b0100001000000001;//3.002
  weights[3] <= 16'b0100010000000001;//4.004

  a[0] <= 16'b0100000000000001;//2.002
  a[1] <= 16'b0100001000000001;//3.002
  a[2] <= 16'b0100000000000001;//2.002
  a[3] <= 16'b0100001000000001;//3.002

  for(i=4;i<tile;i=i+1)
  begin
    weights[i] = 16'b0011110000000001;
    a[i] = 16'b0011110000000001;
  end

  //writing second set of weights to bram
  ram_enable = 1;
  for(i = 6'b000000; i < 6'b100000; i = i+6'b000001) begin
    input_data[i] <= weights[i];
    @(posedge clk);
  end

  ram_enable = 0;
  
  #50;//allwoing some time for tmmu to compute

  @(posedge clk);
  reset_tmmu = 0;
  
  @(posedge clk);
  reset_tmmu = 1;
  
  @(posedge clk);
  reset_tmmu = 0;
  
  //end of writing second set of values to  bram in tmmu

  //start sending values to psau

  @(posedge clk);
  reset_psau = 0;
  
  @(posedge clk);//to reset psau 
  reset_psau = 1;
  
  @(posedge clk);
  reset_psau = 0;
  
  
//  #5; //allow time to reset

  store_psau = 1;// read values from fifo and send it to psau
  @(posedge clk);
  
  #50;

  @(posedge clk);//final reset on psau
  reset_psau = 1;
  
  @(posedge clk);
  reset_psau = 0;
  
/*
  @(posedge clk);
  reset_psau = 1;
  $display("time = %0d, reset = %0d", $time, reset_psau);

  @(posedge clk);
  reset_psau = 0;
  $display("time = %0d, reset = %0d", $time, reset_psau);
*/
//  $display("psau out = %16b, from testbench",psau_out);
//end
end

endmodule