// Half adder at gate level

// HALF ADDER
module halfadder (S, C, x, y);
    input x, y;
    output S, C;
    xor (S, x, y);
    and (C, x, y);
endmodule

// Full adder at gate level
module fulladder (S, C, x, y, z);
    input x, y, z;
    output S, C;
    wire S1, D1, D2;
    halfadder HA1 (S1, D1, x, y);
    halfadder HA2 (S, D2, S1, z);
    or g1 (C, D2, D1);
endmodule

// 32-bit adder
module thirtytwo_bit_adder (S, C32, A, B, Cin);
    input [31:0] A, B;
    input Cin;
    output [31:0] S;
    output C32;
    wire [31:0] C;
    // First full adder with carry-in
    fulladder FA0 (S[0], C[0], A[0], B[0], Cin);
    
    // Generate the remaining full adders
    genvar i;
    generate
        for (i = 1; i < 32; i = i + 1) begin: adder_gen
            fulladder FA (S[i], C[i], A[i], B[i], C[i-1]);
        end
    endgenerate
    
    assign C32 = C[31]; // Final carry out
endmodule

