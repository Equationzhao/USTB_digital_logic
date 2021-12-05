module top_module (
    input d, 
    input ena,
    output q
); 
    reg Q = 0;
    always@ (ena or d)begin
        if(ena)
           Q = d; 
    end 
    assign q = Q;
endmodule