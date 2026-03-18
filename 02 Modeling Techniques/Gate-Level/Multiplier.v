module multiplier(A,B,P);
	
	input[1:0] A,B;
	output[3:0] P;
	wire w1,w2,w3,w4;
	
	and U1(P[0],A[0],B[0]), U2(w1,A[1],B[0]), U3(w2,B[1],A[0]), U4(w3,B[1],A[1]), U6(w4,w1,w2), U8(P[3],w4,w3);
	xor U5(P[1],w1,w2), U7(P[2],w4,w3);

endmodule

module multTB();
	reg[1:0] A,B;
	wire[3:0] P;

	multiplier tb1(A,B,P);

	initial begin
		A=2'b00; B=2'b00;

		$display("Simulating multiplier");
		$display("A1A0\tB1B0\tP");
		$monitor("%b\t%b\t%d",A,B,P);

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
