module csadd32(
        input    [31:0]a,
        input    [31:0]b,
        input          cin,
        output   [31:0]sum,
        output cout
);
        wire temp;
        add16 add16_instance1(.a(a[15:0]),.b(b[15:0]),.cin(cin),.sum(sum[15:0]),.cout(temp));
        add16 add16_instance2(.a(a[31:16]),.b(b[31:16]),.cin(cin),.sum(sum[31:16]),.cout(cout));

endmodule
 
module add16(   
        input   [15:0]a,
        input   [15:0]b,
        input         cin,
        output  [15:0]sum,
        output cout
);
        wire[2:0] c;
        add4 add4_instance1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.sum(sum[3:0]),.cout(c[0]));
        add4 add4_instance2(.a(a[7:4]),.b(b[7:4]),.cin(c[0]),.sum(sum[7:4]),.cout(c[1]));
        add4 add4_instance3(.a(a[11:8]),.b(b[11:8]),.cin(c[1]),.sum(sum[11:8]),.cout(c[2]));
        add4 add4_instance4(.a(a[15:12]),.b(b[15:12]),.cin(c[2]),.sum(sum[15:12]),.cout(cout));
endmodule
 
module add4(         
        input   [3:0]a,
        input   [3:0]b,
        input        cin,
        output  [3:0]sum,
        output  cout
);
        wire[2:0] c;
        add add_instance1(.a(a[0]),.b(b[0]),.cin(cin ),.sum(sum[0]),.cout(c[0]));
        add add_instance2(.a(a[1]),.b(b[1]),.cin(c[0]),.sum(sum[1]),.cout(c[1]));
        add add_instance3(.a(a[2]),.b(b[2]),.cin(c[1]),.sum(sum[2]),.cout(c[2]));
        add add_instance4(.a(a[3]),.b(b[3]),.cin(c[2]),.sum(sum[3]),.cout(cout));
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