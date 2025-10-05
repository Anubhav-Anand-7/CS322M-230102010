module fourbitcomparator(
    input [3:0] x; //4 Bit
    input [3:0] y; //4 Bit
    output res; // output of 1 bit
    );
    res = (x==y)?1:0; // Conditional operator: assigns 1 to res if all 3 bits of x are equal to all 3 bits of y; otherwise, assigns 0.
endmodule 
