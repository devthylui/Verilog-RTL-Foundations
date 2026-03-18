module exercise3_2(a, b, c, d, out);
	input a, b, c, d;
	output out;
	wire bNot;

	not U1(bNot, b);
	and U2(out, bNot, d);
endmodule

module tbEx3_2;
	wire w1;
	reg a,b,c,d;
	
	exercise3_2 start3_2(a,b,c,d,w1);
	
	initial begin
		$display("Simulating the output of the circuit");
		$display("A\tB\tC\tD\t\tF");
		$monitor("%b\t%b\t%b\t%b\t\t%b",a,b,c,d,w1);

			a=1'b0; b=1'b0; c=1'b0; d=1'b0;
		#2	a=1'b0; b=1'b0; c=1'b0; d=1'b1;
		#2	a=1'b0; b=1'b0; c=1'b1; d=1'b0;
		#2	a=1'b0; b=1'b0; c=1'b1; d=1'b1;
		#2	a=1'b0; b=1'b1; c=1'b0; d=1'b0;
		#2	a=1'b0; b=1'b1; c=1'b0; d=1'b1;
		#2	a=1'b0; b=1'b1; c=1'b1; d=1'b0;
		#2	a=1'b0; b=1'b1; c=1'b1; d=1'b1;
		#2	a=1'b1; b=1'b0; c=1'b0; d=1'b0;
		#2	a=1'b1; b=1'b0; c=1'b0; d=1'b1;
		#2	a=1'b1; b=1'b0; c=1'b1; d=1'b0;
		#2	a=1'b1; b=1'b0; c=1'b1; d=1'b1;
		#2	a=1'b1; b=1'b1; c=1'b0; d=1'b0;
		#2	a=1'b1; b=1'b1; c=1'b0; d=1'b1;
		#2	a=1'b1; b=1'b1; c=1'b1; d=1'b0;
		#2	a=1'b1; b=1'b1; c=1'b1; d=1'b1;
		#10	$finish;
	end
endmodule
