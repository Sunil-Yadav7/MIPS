// 1-bit 2:1 MUX
module mux2x1_gate_level (a,b,sel,y);
    input a, b; // Data inputs(1 bit)
    input sel; // Select lines
    output y; // Output

    assign y = sel ? b:a; // Output from the OR gate
endmodule 

//5-bit 2:1 MUX
module mux2x1_5bit (a,b,sel,y);
    input[4:0] a, b; // Data inputs(5 bits)
    input sel; // Selection input
    output[4:0] y; // Output

    assign y = sel ? b:a; // Output from the OR gate
endmodule 

// 32-bit 2:1 MUX
module mux2x1_32bit (y, a, b, sel);
    input [31:0] a;
    input [31:0] b;
    input sel;
    output [31:0] y;

    // Gate-level implementation of the 32-bit multiplexer
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin: mux_gen
            mux2x1_gate_level mux_inst(.a(a[i]), .b(b[i]), .sel(sel), .y(y[i]));
        end
    endgenerate
endmodule