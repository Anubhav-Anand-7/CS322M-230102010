`timescale 1ns / 1ps

module fourbitcomparator_tb;
    // Testbench signals
    reg [3:0] x;
    reg [3:0] y;
    wire res;

    // Instantiate the DUT (Device Under Test)
    fourbitcomparator uut (
        .x(x),
        .y(y),
        .res(res)
    );

    // Test sequence
    initial begin
        $display("Time\t   x\t   y\t | res");
        $display("---------------------------");
        
        // Test several cases manually
        x = 4'b0000; y = 4'b0000; #10;
        $display("%0t\t %b\t %b\t |  %b", $time, x, y, res);

        x = 4'b0001; y = 4'b0010; #10;
        $display("%0t\t %b\t %b\t |  %b", $time, x, y, res);

        x = 4'b1010; y = 4'b1010; #10;
        $display("%0t\t %b\t %b\t |  %b", $time, x, y, res);

        x = 4'b1111; y = 4'b0111; #10;
        $display("%0t\t %b\t %b\t |  %b", $time, x, y, res);

        x = 4'b1100; y = 4'b1100; #10;
        $display("%0t\t %b\t %b\t |  %b", $time, x, y, res);

        $display("---------------------------");
        $finish;
    end
endmodule
