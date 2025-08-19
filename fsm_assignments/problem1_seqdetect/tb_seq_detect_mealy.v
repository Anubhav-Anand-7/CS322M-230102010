`timescale 1ns / 1ps

module tb_seq_detect_mealy(

    );
    reg clk, rst, din;
    wire y;

    // DUT instantiation
    seq_detect_mealy dut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .y(y)
    );
    
    // Clock generation: 100 MHz → 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;   // toggle every 5ns → 10ns period
    
    // Apply stimulus 
    reg [10:0] bitstream = 11'b11011011101;  // test input sequence
    integer i;
    initial begin
        rst = 0;    // Keep reset de-asserted (always 0)
        din = 0;    // Start din at 0 before first bit
        #10;    // Wait a little before driving data
        for (i = 10; i >= 0; i = i - 1) begin
            @(posedge clk);        // change din in the middle of the cycle
            din = bitstream[i];    // so it is stable at the next posedge
            $display("T=%0t | din=%b | y=%b", $time, din, y);
        end
        #50;
        $finish;
    end
        
endmodule
