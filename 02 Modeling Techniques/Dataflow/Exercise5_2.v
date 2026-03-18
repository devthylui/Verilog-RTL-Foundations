module decoder(x,y,z,w,e,d);
    input w, x, y, z, e;
    output [15:0] d;

    assign d[0] = (~x) & (~y) & (~z) & (~w) & e;
    assign d[1] = (~x) & (~y) & (~z) & w & e;
    assign d[2] = (~x) & (~y) & z & (~w) & e;
    assign d[3] = (~x) & (~y) & z & w & e;
    assign d[4] = (~x) & y & (~z) & (~w) & e;
    assign d[5] = (~x) & y & (~z) & w & e;
    assign d[6] = (~x) & y & z & (~w) & e;
    assign d[7] = (~x) & y & z & w & e;
    assign d[8] = x & (~y) & (~z) & (~w) & e;
    assign d[9] = x & (~y) & (~z) & w & e;
    assign d[10] = x & (~y) & z & (~w) & e;
    assign d[11] = x & (~y) & z & w & e;
    assign d[12] = x & y & (~z) & (~w) & e;
    assign d[13] = x & y & (~z) & w & e;
    assign d[14] = x & y & z & (~w) & e;
    assign d[15] = x & y & z & w & e;
endmodule

module exercise5_2();
    reg x0, y0, z0, w0, e0;
    wire [15:0] dd;

    decoder s(x0, y0, z0, w0, e0, dd);

    initial begin
        e0 = 0; x0 = 0; y0 = 1; z0 = 0; w0 = 1;
        $display("Time\te0\tx0\ty0\tz0\tw0\td[15:0]");
        #10 e0 = 1; $display("%0t\t%d\t%d\t%d\t%d\t%d\t%b", $time, e0, x0, y0, z0, w0, dd);
        #10 x0 = 0; y0 = 0; z0 = 0; w0 = 0; $display("%0t\t%d\t%d\t%d\t%d\t%d\t%b", $time, e0, x0, y0, z0, w0, dd);
        #10 x0 = 0; y0 = 0; z0 = 1; w0 = 1; $display("%0t\t%d\t%d\t%d\t%d\t%d\t%b", $time, e0, x0, y0, z0, w0, dd);
        #10 x0 = 0; y0 = 1; z0 = 0; w0 = 0; $display("%0t\t%d\t%d\t%d\t%d\t%d\t%b", $time, e0, x0, y0, z0, w0, dd);
        #10 e0 = 0; $display("%0t\t%d\t%d\t%d\t%d\t%d\t%b", $time, e0, x0, y0, z0, w0, dd);
        #10 $finish;
    end
endmodule

