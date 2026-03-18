module exercise2_1;

	reg[7:0] a;
	real b;
	reg[159:0] hello, con;
	
	initial begin
		a=8'hFF;
		b=1764;
		hello="Hello";

		$display("Hexadecimal Value:%0h\nReal Number:%0e",a,b);
		$display("Backslash:\\\nPercent:%%\nNew tab:\tText after tab\nDouble quote:\"\"");
		$display("String:%0s",hello);

		if(a>b)
			con = "a is greater than b";
		else
			con = "b is greater than a";

		$display("Conditional:%0s",con);

	end

endmodule
