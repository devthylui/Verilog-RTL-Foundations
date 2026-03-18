primitive Diff(D,A,B,Bin);

	input A,B,Bin;
	output D;

	table

	//	A	B	Bin	:	D
		0	0	0	:	0;
		0	0	1	:	1;
		0	1	0	:	1;
		0	1	1	:	0;
		1	0	0	:	1;
		1	0	1	:	0;
		1	1	0	:	0;
		1	1	1	:	1;

	endtable
endprimitive

primitive Bout(Bout,A,B,Bin);

	input A,B,Bin;
	output Bout;

	table

	//	A	B	Bin	:	Bout
		0	0	0	:	0;
		0	0	1	:	1;
		0	1	0	:	1;
		0	1	1	:	1;
		1	0	0	:	0;
		1	0	1	:	0;
		1	1	0	:	0;
		1	1	1	:	1;

	endtable
endprimitive

module exercise4_2;
	
	reg[2:0] X;
	wire[1:0] D;

	Diff(D[0],X[2],X[1],X[0]);
	Bout(D[1],X[2],X[1],X[0]);

	initial begin
		X=3'b000;
		$display("Simulating Binary Subtractor");
		$display("A\tB\tBin\tBout\tDiff");
		$monitor("%b\t%b\t%b\t%b\t%b",X[2],X[1],X[0],D[1],D[0]);

		#2 X=3'b001;
		#2 X=3'b010;
		#2 X=3'b011;
		#2 X=3'b100;		#2 X=3'b101;
		#2 X=3'b110;
		#2 X=3'b111;
		#2 $finish;
	end

endmodule
