module exercise1_3(var1,x_4,x_1,x_2,x_3);

	output var1, x_4;
	input x_1, x_2, x_3;
	xor EOR1(x_4,x_1,x_2,x_3);
	xor EOR2(var1,x_1,x_2,x_3,x_4);

endmodule

module testbenchExercise1_3;

	reg x_1, x_2, x_3;
	wire var1, x_4;

	exercise1_3 tb1(var1,x_4,x_1,x_2,x_3);

	initial begin
		x_1=1'b0; x_2=1'b0; x_3=1'b0;
		$display("Simulating output for Exercise1_3");
		$display("ps\tx_1\tx_2\tx_3\tx_4\tvar1");
		$monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,x_1,x_2,x_3,x_4,var1);

		#1 x_1=1'b0; x_2=1'b0; x_3=1'b1;
		#1 x_1=1'b0; x_2=1'b1; x_3=1'b0;
		#1 x_1=1'b0; x_2=1'b1; x_3=1'b1;
		#1 x_1=1'b1; x_2=1'b0; x_3=1'b0;
		#1 x_1=1'b1; x_2=1'b0; x_3=1'b1;
		#1 x_1=1'b1; x_2=1'b1; x_3=1'b0;
		#1 x_1=1'b1; x_2=1'b1; x_3=1'b1;
		#3 $finish;
	end

endmodule

