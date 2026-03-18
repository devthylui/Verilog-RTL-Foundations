module drill2_1;

	reg [7:0] a, b, c, d, e, f, g;
	reg signed [7:0] h;
	reg [55:0] i;
	reg [9:0] j;
	
	initial begin
		a=5'O37;
		b=3'D4;
		c=7'hx;
		d=8'hAF;
		e=10'b01;
		f=4'd10;
		g=32;
		h=-5;
		i="Testing";
		j=3.6E2;
		$write(" %s %o %b %b %h %b",i,a,b,c,d,e);
		$write(" %d %d %d %d",f,g,h,j);
	end

endmodule

