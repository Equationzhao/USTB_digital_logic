module csadd32(
        input    [31:0]a,
        input    [31:0]b,
        input          cin,
        output   [31:0]sum,
        output cout
);
        

endmodule

module add(       
        input  a,
        input  b,
        input  cin,
        output sum,
        output cout
);
        wire s1,s2,c1,c2;
        add1 add1_instance1( .a(a),.b(b),.cin(0),.sum(s1),.cout(c1));
        add1 add1_instance2( .a(a),.b(b),.cin(1),.sum(s2),.cout(c2));
        assign sum=cin?s2:s1;   
        assign cout=cin?c2:c1;  
endmodule