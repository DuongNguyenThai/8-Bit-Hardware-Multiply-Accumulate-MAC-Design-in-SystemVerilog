module FA (
    input logic A, B, Ci,
    output logic S, Co
);
    assign S = A ^ B ^ Ci;
    assign Co = (A & B) | (Ci & (A ^ B));
endmodule