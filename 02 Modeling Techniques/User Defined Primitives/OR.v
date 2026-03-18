primitive OR(F,A,B,C);

	input A, B, C;
	output F;

	table
		//A B C : F
		0 0 0 : 0;
		0 0 1 : 1;
		0 1 0 : 1;
		0 1 1 : 1;
		1 0 0 : 1;
		1 0 1 : 1;
		1 1 0 : 1;
		1 1 1 : 1;		
	endtable

endprimitive

module tb_OR();
	
	reg A, B, C;
	wire F;
	OR(F,A,B,C);

	initial begin
		A = 1'b0; B = 1'b0; C = 1'b0;

		$display("Simulating OR UDP Version.");
		$display("A\tB\tC\tF");
		$monitor("%b\t%b\t%b\t%b",A,B,C,F);

		#2	A = 1'b0; B = 1'b0; C = 1'b1;
		#2	A = 1'b0; B = 1'b1; C = 1'b0;
		#2	A = 1'b0; B = 1'b1; C = 1'b1;
		#2	A = 1'b1; B = 1'b0; C = 1'b0;
		#2	A = 1'b1; B = 1'b0; C = 1'b1;
		#2	A = 1'b1; B = 1'b1; C = 1'b0;
		#2	A = 1'b1; B = 1'b1; C = 1'b1;
		#2	$finish;
	end

endmodule
