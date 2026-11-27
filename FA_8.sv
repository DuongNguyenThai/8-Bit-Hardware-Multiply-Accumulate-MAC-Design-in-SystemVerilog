module FA_8 (
    input  logic [7:0] A, B,
    input  logic       Ci,
    output logic [7:0] S,
    output logic       Co
);
    logic [6:0] carry;
    FA bit0 (.A(A[0]), .B(B[0]), .Ci(Ci),       .S(S[0]), .Co(carry[0]));
    FA bit1 (.A(A[1]), .B(B[1]), .Ci(carry[0]), .S(S[1]), .Co(carry[1]));
    FA bit2 (.A(A[2]), .B(B[2]), .Ci(carry[1]), .S(S[2]), .Co(carry[2]));
    FA bit3 (.A(A[3]), .B(B[3]), .Ci(carry[2]), .S(S[3]), .Co(carry[3]));
    FA bit4 (.A(A[4]), .B(B[4]), .Ci(carry[3]), .S(S[4]), .Co(carry[4]));
    FA bit5 (.A(A[5]), .B(B[5]), .Ci(carry[4]), .S(S[5]), .Co(carry[5]));
    FA bit6 (.A(A[6]), .B(B[6]), .Ci(carry[5]), .S(S[6]), .Co(carry[6]));
    FA bit7 (.A(A[7]), .B(B[7]), .Ci(carry[6]), .S(S[7]), .Co(Co));
endmodule