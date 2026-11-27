module Mul_8 (
    input logic [7:0] A, B,
    output logic [15:0] M
);
    logic [7:0] P0, P1, P2, P3;
    logic [7:0] S0, S1, S2;
    logic [2:0] carry;
    Mul_4 m0 (.A(A[3:0]), .B(B[3:0]), .M(P0));
    Mul_4 m1 (.A(A[7:4]), .B(B[3:0]), .M(P1));
    Mul_4 m2 (.A(A[3:0]), .B(B[7:4]), .M(P2));
    Mul_4 m3 (.A(A[7:4]), .B(B[7:4]), .M(P3));
    assign M[3:0] = P0[3:0];
    FA_8 s0 (.A(S1), .B({3'b000, P0[7:4]}), .Ci(0), .S(S0), .Co(carry[0]));
    FA_8 s1 (.A(P1), .B(P2), .Ci(0), .S(S1), .Co(carry[1]));
    FA_8 s2 (.A(P3), .B({3'b000, carry[1] | carry[0], S0[7:4]}), .Ci(0), .S(S2), .Co(carry[2]));
    assign M[7:4] = S0[3:0];
    assign M[15:8] = S2;
endmodule