module top_module(

            input a,

            input b,

            input c,

            input d,

            output out,

            output out_n   
); 
        wire o1 = a&b;
        wire o2 = c&d;

        assign out = o1|o2;
        assign out_n = ~(o1|o2);        
        assign out_n = ~(o1|o2);


endmodule
