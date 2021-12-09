module seqdetea_tb;

    reg clk,clr,din;
    wire dout;

    parameter PERIOD = 40;
    seqdetea seqdetea_inst(
        .clk(clk),
        .clr(clr),
        .din(din),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever begin
            #(PERIOD/2) clk = 1;
            #(PERIOD/2) clk = 0;
        end
    end

    initial begin
        clr = 1;
        forever begin
            #50 clr = 0;
        end
    end

    initial begin //10001
        #50  din = 1;
        #40  din = 0;
        #120 din = 1;
    end

endmodule