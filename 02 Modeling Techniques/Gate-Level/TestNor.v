module testNor(x, y, out);
	input x, y;
	output out;
	
	nor U3(out, x, y);
endmodule

module tbNor;
	wire w;
	reg x1, y1;

	testNor start3_1(x1,y1,w);

	initial begin
		x1=1'b0;y1=1'b0;
		$display("Truth table for nor: ");
		$display("x\ty\tout");
		$monitor("%b\t%b\t%b",x1,y1,w);

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
