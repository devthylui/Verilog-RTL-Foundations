module exercise3_1(x, y, out1, out2, out3);
	input x, y;
	output out1, out2, out3;
	
	buf U1(out1, x);
	nand U2(out2, x, y);
	xnor U3(out3, x, y);
	
	
endmodule

module tbEx3_1;
	wire w1, w2, w3;
	reg x1, y1;
	reg monBuff, monNand, monXnor;
	
	exercise3_1 start3_1(x1, y1, w1, w2, w3);

	initial begin
		monBuff = 1; monNand = 0; monXnor = 0;

		x1=1'b0;y1=1'b0;
		$display("Truth table for buf: ");
		$display("x\tout");

		if(monBuff == 1)
			$monitor("%b\t%b",x1, w1);

		#2 x1=1'b0;
		#2 x1=1'b1;
		#2 x1=1'bx;
		#2 x1=1'bz;
		#2 $display("\n");
		#2 monBuff = 0; monNand = 1;

		x1=1'b0;y1=1'b0;
		$display("Truth table for nand: ");
		$display("x\ty\tout");

		if(monNand == 1)
			$monitor("%b\t%b\t%b",x1,y1,w2);
		#2 x1=1'b0; y1=1'b0;
		#2 x1=1'b0; y1=1'b1;
		#2 x1=1'b0; y1=1'bx;
		#2 x1=1'b0; y1=1'bz;
		
		#2 x1=1'b1; y1=1'b0;
		#2 x1=1'b1; y1=1'b1;
		#2 x1=1'b1; y1=1'bx;
		#2 x1=1'b1; y1=1'bz;

		#2 x1=1'bx; y1=1'b0;
		#2 x1=1'bx; y1=1'b1;
		#2 x1=1'bx; y1=1'bx;
		#2 x1=1'bx; y1=1'bz;
		
		#2 x1=1'bz; y1=1'b0;
		#2 x1=1'bz; y1=1'b1;
		#2 x1=1'bz; y1=1'bx;
		#2 x1=1'bz; y1=1'bz;
		#2 $display("\n");
		#2 monNand = 0; monXnor = 1;

		x1=1'b0;y1=1'b0;
		$display("Truth table for xnor: ");
		$display("x\ty\tout");

		if(monXnor == 1)
			$monitor("%b\t%b\t%b",x1,y1,w3);
		#2 x1=1'b0; y1=1'b0;
		#2 x1=1'b0; y1=1'b1;
		#2 x1=1'b0; y1=1'bx;
		#2 x1=1'b0; y1=1'bz;
		
		#2 x1=1'b1; y1=1'b0;
		#2 x1=1'b1; y1=1'b1;
		#2 x1=1'b1; y1=1'bx;
		#2 x1=1'b1; y1=1'bz;
		
		#2 x1=1'bx; y1=1'b0;
		#2 x1=1'bx; y1=1'b1;
		#2 x1=1'bx; y1=1'bx;
		#2 x1=1'bx; y1=1'bz;
		
		#2 x1=1'bz; y1=1'b0;
		#2 x1=1'bz; y1=1'b1;
		#2 x1=1'bz; y1=1'bx;
		#2 x1=1'bz; y1=1'bz;
		#2 $display("\n");

		#18 $finish;
	end
endmodule
