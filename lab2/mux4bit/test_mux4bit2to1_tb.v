module test_mux4bit2to1_tb();
    reg [3:0]A1;
    reg [3:0]A2;
    reg  s;
    wire a;
    wire [3:0]y;
    mux4bit2to1 t(.a(A1), .b(A2), .s(a), .y(y));
    assign a = s;
    initial
    begin
        A1 = 4'b1111;A2 = 4'b0000;s=0; #1000;
        A1 = 4'b1111;A2 = 4'b0000;s=1; #1000;
        A1 = 4'b0000;A2 = 4'b1111;s=0; #1000;
        A1 = 4'b0000;A2 = 4'b1111;s=1; #1000;
    end




endmodule