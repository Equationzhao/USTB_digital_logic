module top_tb();
//  test_bench of top
    initial begin
        rst = 1;
           
    end

    top top_instance(
        .clk(clk),
        .rst(rst),
        .led(led),
        .key(key)
    );

endmodule