module adder(A,B,F);
	input[1:0] A,B;
	output[2:0] F;
	wire w1,w2,w3,w4,w5;

	xor	U1(F[0],A[0],B[0]), U3(w2,A[1],B[1]), U4(F[1],w2,w1);
	and	U2(w1,A[0],B[0]), U5(w3,A[1],B[1]), U6(w4,w2,w1);
	or	U7(F[2],w3,w4);

endmodule

module adderTB();
	reg[1:0] A,B;
	wire[2:0] F;

	adder tb(A,B,F);

	initial begin

		$display("Simulating Adder");
		$display("A1A0\tB1B0\tF");
		$monitor("%b\t%b\t%b",A,B,F);
		A=2'b00; B=2'b00;
		#2 B=2'b01;
		#2 B=2'b10;
		#2 B=2'b11;
		#2 A=2'b01; B=2'b00;
		#2 B=2'b01;
		#2 B=2'b10;
		#2 B=2'b11;
		#2 A=2'b10; B=2'b00;
		#2 B=2'b01;
		#2 B=2'b10;
		#2 B=2'b11;
		#2 A=2'b11; B=2'b00;
		#2 B=2'b01;
		#2 B=2'b10;
		#2 B=2'b11;
		#2 $finish;
	end

endmodule