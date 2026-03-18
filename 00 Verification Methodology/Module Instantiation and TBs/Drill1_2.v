module full_subtract(diff,borrowOut,a,b,borrowIn);

	output	diff, borrowOut;
	input	a,b,borrowIn;
	assign	{borrowOut, diff} = a - b - borrowIn;

endmodule

module testingFS();

	reg	a,b,borrowIn;
	wire	diff,borrowOut;
	full_subtract fs(diff,borrowOut,a,b,borrowIn);

	initial begin

		a=1'b1; b=1'b1; borrowIn=1'b0;

		$display("a\tb\tbIn\tdiff\tbOut\ttime(ps)");
		$monitor("%b\t%b\t%b\t%b\t%b\t%0t",a,b,borrowIn,diff,borrowOut,$time);

		#10	a=1'b1;
		#10	a=1'b0; b=1'b1;
		#10	a=1'b1; b=1'b0;
		#10	borrowIn=1'b1;
		#10	$finish;

	end

endmodule

