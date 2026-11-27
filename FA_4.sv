module FA_4 (
    input  logic [3:0] A, B,
    input  logic       Ci,
    output logic [3:0] S,
    output logic       Co
);
    logic [2:0] carry;
    FA bit0 (.A(A[0]), .B(B[0]), .Ci(Ci),       .S(S[0]), .Co(carry[0]));
    FA bit1 (.A(A[1]), .B(B[1]), .Ci(carry[0]), .S(S[1]), .Co(carry[1]));
    FA bit2 (.A(A[2]), .B(B[2]), .Ci(carry[1]), .S(S[2]), .Co(carry[2]));
    FA bit3 (.A(A[3]), .B(B[3]), .Ci(carry[2]), .S(S[3]), .Co(Co));
endmodule