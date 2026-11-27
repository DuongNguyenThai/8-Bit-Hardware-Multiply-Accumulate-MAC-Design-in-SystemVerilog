module Mul_4 (
    input logic [3:0] A, B,
    output logic [7:0] M
);
    logic [3:0][3:0] tich;
    logic [2:0][3:0] S;
    logic [2:0] C;
    genvar i, j;
    for (i = 0; i <= 3; i++) begin
        assign tich[i] = {4{B[i]}} & A;
    end
    FA_4 firstlayer (
        .A({tich[1]}),
        .B({1'b0, tich[0][3:1]}),
        .Ci(1'b0),
        .S(S[0]),
        .Co(C[0])
    );
    FA_4 secondlayer (
        .A({tich[2]}),
        .B({C[0], S[0][3:1]}),
        .Ci(0),
        .S(S[1]),
        .Co(C[1])
    );
    FA_4 thirdlayer (
        .A({tich[3]}),
        .B({C[1], S[1][3:1]}),
        .Ci(0),
        .S(S[2]),
        .Co(C[2])
    );
    assign M[0] = tich[0][0];
    assign M[1] = S[0][0];
    assign M[2] = S[1][0];
    assign M[7:3] = {C[2], S[2]};
endmodule