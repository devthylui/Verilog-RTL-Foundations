module exercise3_3(A1,A0,B1,B0,P3,P2,P1,P0);
	input A1,A0,B1,B0;
	output P3,P2,P1,P0;
	wire W1,W2,W3,W4;

	and U1(P0,A0,B0), U2(W1,A1,B0), U3(W2,A0,B1), U4(W3,A1,B1), U6(W4,W1,W2), U8(P3,W4,W3);
	xor U5(P1,W1,W2), U7(P2,W4,W3);
endmodule

module tbEx3_3;
	reg A1,A0,B1,B0;
	wire P3,P2,P1,P0;

	exercise3_3 multiplier(A1,A0,B1,B0,P3,P2,P1,P0);

	initial begin
		$display("Simulating a 2-bit Multiplier");
		$display("A1\tA0\tB1\tB0\tOutput");
		$monitor("%b\t%b\t%b\t%b\t\%b%b%b%b",A1,A0,B1,B0,P3,P2,P1,P0);

			A1=1'b0; A0=1'b0; B1=1'b0; B0=1'b0;
		#2	A1=1'b0; A0=1'b0; B1=1'b0; B0=1'b1;
		#2	A1=1'b0; A0=1'b0; B1=1'b1; B0=1'b0;
		#2	A1=1'b0; A0=1'b0; B1=1'b1; B0=1'b1;
		#2	A1=1'b0; A0=1'b1; B1=1'b0; B0=1'b0;
		#2	A1=1'b0; A0=1'b1; B1=1'b0; B0=1'b1;
		#2	A1=1'b0; A0=1'b1; B1=1'b1; B0=1'b0;
		#2	A1=1'b0; A0=1'b1; B1=1'b1; B0=1'b1;
		#2	A1=1'b1; A0=1'b0; B1=1'b0; B0=1'b0;
		#2	A1=1'b1; A0=1'b0; B1=1'b0; B0=1'b1;
		#2	A1=1'b1; A0=1'b0; B1=1'b1; B0=1'b0;
		#2	A1=1'b1; A0=1'b0; B1=1'b1; B0=1'b1;
		#2	A1=1'b1; A0=1'b1; B1=1'b0; B0=1'b0;
		#2	A1=1'b1; A0=1'b1; B1=1'b0; B0=1'b1;
		#2	A1=1'b1; A0=1'b1; B1=1'b1; B0=1'b0;
		#2	A1=1'b1; A0=1'b1; B1=1'b1; B0=1'b1;
		#10	$finish;		
	end

endmodule
