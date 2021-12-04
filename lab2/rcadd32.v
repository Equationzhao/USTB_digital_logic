module rcadd32(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);
    wire [31:0]carry;
    add1 add1 (.a(a[0]) ,.b(b[0]) ,.cin(cin)      ,.sum(sum[0]) ,.cout(carry[0])) ;
    add1 add2 (.a(a[1]) ,.b(b[1]) ,.cin(carry[0]) ,.sum(sum[1]) ,.cout(carry[1])) ;
    add1 add3 (.a(a[2]) ,.b(b[2]) ,.cin(carry[1]) ,.sum(sum[2]) ,.cout(carry[2])) ;
    add1 add4 (.a(a[3]) ,.b(b[3]) ,.cin(carry[2]) ,.sum(sum[3]) ,.cout(carry[3])) ;
    add1 add5 (.a(a[4]) ,.b(b[4]) ,.cin(carry[3]) ,.sum(sum[4]) ,.cout(carry[4])) ;
    add1 add6 (.a(a[5]) ,.b(b[5]) ,.cin(carry[4]) ,.sum(sum[5]) ,.cout(carry[5])) ;
    add1 add7 (.a(a[6]) ,.b(b[6]) ,.cin(carry[5]) ,.sum(sum[6]) ,.cout(carry[6])) ;
    add1 add8 (.a(a[7]) ,.b(b[7]) ,.cin(carry[6]) ,.sum(sum[7]) ,.cout(carry[7])) ;
    add1 add9 (.a(a[8]) ,.b(b[8]) ,.cin(carry[7]) ,.sum(sum[8]) ,.cout(carry[8])) ;
    add1 add10(.a(a[9]) ,.b(b[9]) ,.cin(carry[8]) ,.sum(sum[9]) ,.cout(carry[9])) ;
    add1 add11(.a(a[10]),.b(b[10]),.cin(carry[9]) ,.sum(sum[10]),.cout(carry[10]));
    add1 add12(.a(a[11]),.b(b[11]),.cin(carry[10]),.sum(sum[11]),.cout(carry[11]));
    add1 add13(.a(a[12]),.b(b[12]),.cin(carry[11]),.sum(sum[12]),.cout(carry[12]));
    add1 add14(.a(a[13]),.b(b[13]),.cin(carry[12]),.sum(sum[13]),.cout(carry[13]));
    add1 add15(.a(a[14]),.b(b[14]),.cin(carry[13]),.sum(sum[14]),.cout(carry[14]));
    add1 add16(.a(a[15]),.b(b[15]),.cin(carry[14]),.sum(sum[15]),.cout(carry[15]));
    add1 add17(.a(a[16]),.b(b[16]),.cin(carry[15]),.sum(sum[16]),.cout(carry[16]));
    add1 add18(.a(a[17]),.b(b[17]),.cin(carry[16]),.sum(sum[17]),.cout(carry[17]));
    add1 add19(.a(a[18]),.b(b[18]),.cin(carry[17]),.sum(sum[18]),.cout(carry[18]));
    add1 add20(.a(a[19]),.b(b[19]),.cin(carry[18]),.sum(sum[19]),.cout(carry[19]));
    add1 add21(.a(a[20]),.b(b[20]),.cin(carry[19]),.sum(sum[20]),.cout(carry[20]));
    add1 add22(.a(a[21]),.b(b[21]),.cin(carry[20]),.sum(sum[21]),.cout(carry[21]));
    add1 add23(.a(a[22]),.b(b[22]),.cin(carry[21]),.sum(sum[22]),.cout(carry[22]));
    add1 add24(.a(a[23]),.b(b[23]),.cin(carry[22]),.sum(sum[23]),.cout(carry[23]));
    add1 add25(.a(a[24]),.b(b[24]),.cin(carry[23]),.sum(sum[24]),.cout(carry[24]));
    add1 add26(.a(a[25]),.b(b[25]),.cin(carry[24]),.sum(sum[25]),.cout(carry[25]));
    add1 add27(.a(a[26]),.b(b[26]),.cin(carry[25]),.sum(sum[26]),.cout(carry[26]));
    add1 add28(.a(a[27]),.b(b[27]),.cin(carry[26]),.sum(sum[27]),.cout(carry[27]));
    add1 add29(.a(a[28]),.b(b[28]),.cin(carry[27]),.sum(sum[28]),.cout(carry[28]));
    add1 add30(.a(a[29]),.b(b[29]),.cin(carry[28]),.sum(sum[29]),.cout(carry[29]));
    add1 add31(.a(a[30]),.b(b[30]),.cin(carry[29]),.sum(sum[30]),.cout(carry[30]));
    add1 add32(.a(a[31]),.b(b[31]),.cin(carry[30]),.sum(sum[31]),.cout(cout))     ;
endmodule