module JK_flipflop(output A, input J, K, clk, reset);
	wire AofJK;
	assign AofJK=(J&~A)|(~K&A);
	D_flipflop JKf(A,AofJK,clk, reset);
endmodule

module D_flipflop(output reg B, input D, clk, reset);
	always@(posedge clk, negedge reset)
	begin
		if(~reset)
			B<=1'b0;
		else
			B<=D;
	end
endmodule

module drill5_3;
	reg J, K, clk, reset;
	wire Q;
	always #1 clk=~clk;
	
	JK_flipflop JKF(Q,J,K,clk,reset);
	
	initial clk=0;
	initial reset=0;
	initial J=0;
	initial K=0;
	initial $monitor("clk=%b reset=%b, J=%b, K=%b, Q=%b",clk,reset,J,K,Q);

	initial fork
		#28 $finish;
		#2 reset=1;
		#4 J=1;
		#8 K=1;
		#12 J=0;
		#16 K=0;
		#20 J=1;
		#24 J=0;
	join
endmodule
