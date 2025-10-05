module comparator(
    input x; // 1 Bit Input
    input y; // 1 Bit Input
    output gt; // 1 Bit Output
    output eq; // 1 Bit Output
    output lt; // 1 Bit Output
    ); 
    gt = x&~y;     // gt is 1 when x is 1 and y is 0, i.e., x is greater than y
    eq = ~(x^y);   // eq is 1 when x and y are equal 
    lt = ~x&y;     // lt is 1 when x is 0 and y is 1, i.e., x is less than y
endmodule 
