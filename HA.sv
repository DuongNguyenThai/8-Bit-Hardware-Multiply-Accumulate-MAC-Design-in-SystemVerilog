module HA (
    input logic A, B, 
    output logic S, Co
);
    assign S = A ^ B;
    assign Co = A & B;
endmodule