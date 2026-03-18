primitive NOT(F,A);

	input A;
	output F;

	table
		//A : F
		0 : 1;
		1 : 0;
	
	endtable

endprimitive

module tb_NOT();
	
	reg A;
	wire F;
	NOT(F,A);

	initial begin
		A = 1'b0;

		$display("Simulating NOT UDP Version.");
		$display("A\tF");
		$monitor("%b\t%b",A,F);

		#2	A = 1'b1;
		#2	$finish;
	end

endmodule
