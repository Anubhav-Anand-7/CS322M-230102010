`timescale 1ns / 1ps

module comparator_tb;
    // Testbench signals
    reg x;
    reg y;
    wire gt;
    wire eq;
    wire lt;

    // Instantiate the DUT (Device Under Test)
    comparator uut (
        .x(x),
        .y(y),
        .gt(gt),
        .eq(eq),
        .lt(lt)
    );

    // Test sequence
    initial begin
        $display("Time\t x y | gt eq lt");
        $display("----------------------");
        
        // Test all combinations of x and y
        x = 0; y = 0; #10;
        $display("%0t\t %b %b |  %b  %b  %b", $time, x, y, gt, eq, lt);

        x = 0; y = 1; #10;
        $display("%0t\t %b %b |  %b  %b  %b", $time, x, y, gt, eq, lt);

        x = 1; y = 0; #10;
        $display("%0t\t %b %b |  %b  %b  %b", $time, x, y, gt, eq, lt);

        x = 1; y = 1; #10;
        $display("%0t\t %b %b |  %b  %b  %b", $time, x, y, gt, eq, lt);

        $display("----------------------");
        $finish;
    end
endmodule
