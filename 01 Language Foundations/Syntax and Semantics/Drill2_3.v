`timescale 10 ns / 100 ps
`define SIZE 8
`define STOP $finish
`define REGME reg [8*31:0]
`ifdef TEST_1
	`include "../Module Instantation and Test Benches/drill1_1.v"
`else
	`include "../Module Instantation and Test Benches/drill1_2.v"
`endif

module tbDrill2_3;
	`REGME	regVar;

	reg A,B,bIn;
	wire diff,bOut;

	full_subtract fs(diff,bOut,A,B,bIn);
	
	initial begin
		$display("A\tB\tBorrowIn\t\tDifference\t\tBorrowOut\t\tTime(s)");
		$monitor("%b\t%b\t%b\t\t%b\t\t%b\t\t%0d", A, B, bIn, diff, bOut, $time);

		A = 1'b1; B = 1'b1; bIn = 1'b0;
		#1 A = 1'b1;
		#1 A = 1'b0; B = 1'b1;
		#1 A = 1'b1; B = 1'b0;
		#1 bIn = 1'b1;

		#10 `STOP;
	end
endmodule
