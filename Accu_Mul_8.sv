module Accu_mul_8 (
    input logic [7:0] A, B,
    input logic clk, rst,
    output logic [15:0] en
);
    logic [15:0] M;
    Mul_8 multiplier (
        .A(A),
        .B(B),
        .M(M)
    );
    always_ff @(posedge clk) begin
        if (rst) 
            en <= 15'd0;
        else 
            en <= en + M;
    end
endmodule