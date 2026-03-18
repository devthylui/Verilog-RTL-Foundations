module exercise1_2(A,B,C,X);

	input A, B, C;
	output X;
	wire wire1, wire2, wire3;

	not NOT(wire2, A);
	xor EOR2(wire1, B, C);
	and AND2(wire3, wire1, A);
	nor NOR2(X, wire3, wire2);

endmodule

module testbenchExercise1_2;

	reg A, B, C;
	wire Z;
	exercise1_2 tb1(A, B, C, Z);

	initial begin
		$display("Simulating output for Exercise1_2");
		$display("ps\tA\tB\tC\tZ");

		#0	A = 1'b0; B = 1'b0; C = 1'b0;
		#0	$display("%0t\t%b\t%b\t%b\t%b", $time, A, B, C, Z);
		#2	A = 1'b0; B = 1'b0; C = 1'b1;
		#0	$display("%0t\t%b\t%b\t%b\t%b", $time, A, B, C, Z);
		#1	A = 1'b0; B = 1'b1; C = 1'b0;
		#0	$display("%0t\t%b\t%b\t%b\t%b", $time, A, B, C, Z);
		#1	A = 1'b0; B = 1'b1; C = 1'b1;
		#0	$display("%0t\t%b\t%b\t%b\t%b", $time, A, B, C, Z);
		#1	A = 1'b1; B = 1'b0; C = 1'b0;
		#0	$display("%0t\t%b\t%b\t%b\t%b", $time, A, B, C, Z);
		#1	A = 1'b1; B = 1'b0; C = 1'b1;
		#0	$display("%0t\t%b\t%b\t%b\t%b", $time, A, B, C, Z);
		#1	A = 1'b1; B = 1'b1; C = 1'b0;
		#0	$display("%0t\t%b\t%b\t%b\t%b", $time, A, B, C, Z);
		#1	A = 1'b1; B = 1'b1; C = 1'b1;
		#0	$display("%0t\t%b\t%b\t%b\t%b", $time, A, B, C, Z);
		#79992	$finish;
	end

endmodule

