module seqdetea_tb;

    reg clk,clr,din;
    wire dout;

    parameter PERIOD = 40;
    seqdetea seqdetea_instance(
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
            #40 clr = 0;
            // #200 clr = 1;
        end
    end

    initial begin  //10001
        #40 din = 0; //s0
        #40 din = 0; //s0
        #40 din = 1; //s1
        #40 din = 1; //s1
        #40 din = 0; //s2
        #40 din = 1; //s1
        #40 din = 0; //s2
        #40 din = 0; //s3
        #40 din = 1; //s1
        #40 din = 0; //s2
        #40 din = 0; //s3
        #40 din = 0; //s4
        #40 din = 0; //s0
        #40 din = 1; //s1
        #40 din = 0; //s2
        #40 din = 0; //s3
        #40 din = 0; //s4
        #40 din = 1; //s5
        #40 din = 0; //s2
        #40 din = 0; //S3
        #40 din = 0; //s4
        #40 din = 1; //s5
        #40 din = 1; //s1
        #40 din = 0; //s2
        #40 din = 0; //S3
        #40 din = 0; //s4
        #40 din = 1; //s5
    end

endmodule