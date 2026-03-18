primitive Majority3 ( Z, A, B, C );

	input A, B, C ;
	output Z ;

	table
	// A B C Z
	0 0 ? : 0 ;
	0 ? 0 : 0 ;
	? 0 0 : 0 ;
	1 1 ? : 1 ;
	1 ? 1 : 1 ;
	? 1 1 : 1 ;
	endtable

endprimitive

module testprimitive1;

	reg A, B, C;
	wire X;
	Majority3 (X,A,B,C);

	initial begin
		A=1'b0;B=1'b0;C=1'b0;
		$display("A\tB\tC\tX");
		$monitor("%b\t%b\t%b\t%b",A,B,C,X);
		#2 A=1'b0; B=1'b0; C=1'b0;
		#2 A=1'b0; B=1'b0; C=1'b1;
		#2 A=1'b0; B=1'b1; C=1'b0;
		#2 A=1'b0; B=1'b1; C=1'b1;
		#2 A=1'b1; B=1'b0; C=1'b0;
		#2 A=1'b1; B=1'b0; C=1'b1;
		#2 A=1'b1; B=1'b1; C=1'b0;
		#2 A=1'b1; B=1'b1; C=1'b1;
		#2 $finish;
	end

endmodule
