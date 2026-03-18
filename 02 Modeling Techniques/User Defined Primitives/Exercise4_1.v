primitive demuxF0(F,Y,S2,S1,S0);

	input Y,S2,S1,S0;
	output F;
	
	table
	//	Y	S[2]	S[1]	S[0]	:	F
		0	b	b	b	:	0;
		1	0	0	0	:	1;
		1	0	0	1	:	0;
		1	0	1	0	:	0;
		1	0	1	1	:	0;
		1	1	0	0	:	0;
		1	1	0	1	:	0;
		1	1	1	0	:	0;
		1	1	1	1	:	0;

	endtable
endprimitive

primitive demuxF1(F,Y,S2,S1,S0);

	input Y,S2,S1,S0;
	output F;
	
	table
	//	Y	S[2]	S[1]	S[0]	:	F
		0	b	b	b	:	0;
		1	0	0	0	:	0;
		1	0	0	1	:	1;
		1	0	1	0	:	0;
		1	0	1	1	:	0;
		1	1	0	0	:	0;
		1	1	0	1	:	0;
		1	1	1	0	:	0;
		1	1	1	1	:	0;

	endtable
endprimitive

primitive demuxF2(F,Y,S2,S1,S0);

	input Y,S2,S1,S0;
	output F;

	table
	//	Y	S[2]	S[1]	S[0]	:	F
		0	b	b	b	:	0;
		1	0	0	0	:	0;
		1	0	0	1	:	0;
		1	0	1	0	:	1;
		1	0	1	1	:	0;
		1	1	0	0	:	0;
		1	1	0	1	:	0;
		1	1	1	0	:	0;
		1	1	1	1	:	0;
	endtable
endprimitive

primitive demuxF3(F,Y,S2,S1,S0);

	input Y,S2,S1,S0;
	output F;
	
	table
	//	Y	S[2]	S[1]	S[0]	:	F
		0	b	b	b	:	0;
		1	0	0	0	:	0;
		1	0	0	1	:	0;
		1	0	1	0	:	0;
		1	0	1	1	:	1;
		1	1	0	0	:	0;
		1	1	0	1	:	0;
		1	1	1	0	:	0;
		1	1	1	1	:	0;

	endtable
endprimitive

primitive demuxF4(F,Y,S2,S1,S0);

	input Y,S2,S1,S0;
	output F;
	
	table
	//	Y	S[2]	S[1]	S[0]	:	F
		0	b	b	b	:	0;
		1	0	0	0	:	0;
		1	0	0	1	:	0;
		1	0	1	0	:	0;
		1	0	1	1	:	0;
		1	1	0	0	:	1;
		1	1	0	1	:	0;
		1	1	1	0	:	0;
		1	1	1	1	:	0;

	endtable
endprimitive

primitive demuxF5(F,Y,S2,S1,S0);

	input Y,S2,S1,S0;
	output F;
	
	table
	//	Y	S[2]	S[1]	S[0]	:	F
		0	b	b	b	:	0;
		1	0	0	0	:	0;
		1	0	0	1	:	0;
		1	0	1	0	:	0;
		1	0	1	1	:	0;
		1	1	0	0	:	0;
		1	1	0	1	:	1;
		1	1	1	0	:	0;
		1	1	1	1	:	0;

	endtable
endprimitive

primitive demuxF6(F,Y,S2,S1,S0);

	input Y,S2,S1,S0;
	output F;
	
	table
	//	Y	S[2]	S[1]	S[0]	:	F
		0	b	b	b	:	0;
		1	0	0	0	:	0;
		1	0	0	1	:	0;
		1	0	1	0	:	0;
		1	0	1	1	:	0;
		1	1	0	0	:	0;
		1	1	0	1	:	0;
		1	1	1	0	:	1;
		1	1	1	1	:	0;

	endtable
endprimitive

primitive demuxF7(F,Y,S2,S1,S0);

	input Y,S2,S1,S0;
	output F;
	
	table
	//	Y	S[2]	S[1]	S[0]	:	F
		0	b	b	b	:	0;
		1	0	0	0	:	0;
		1	0	0	1	:	0;
		1	0	1	0	:	0;
		1	0	1	1	:	0;
		1	1	0	0	:	0;
		1	1	0	1	:	0;
		1	1	1	0	:	0;
		1	1	1	1	:	1;

	endtable
endprimitive

module exercise4_1;
	reg Y; reg[2:0] S;
	wire[7:0] F;

	demuxF0(F[0],Y,S[2],S[1],S[0]);
	demuxF1(F[1],Y,S[2],S[1],S[0]);
	demuxF2(F[2],Y,S[2],S[1],S[0]);
	demuxF3(F[3],Y,S[2],S[1],S[0]);
	demuxF4(F[4],Y,S[2],S[1],S[0]);
	demuxF5(F[5],Y,S[2],S[1],S[0]);
	demuxF6(F[6],Y,S[2],S[1],S[0]);
	demuxF7(F[7],Y,S[2],S[1],S[0]);

	initial begin
		Y=1'b0; S=3'b000;
		$display("Simulating 8X1 Demultiplexer...");
		$display("Y\tS\tF0\tF1\tF2\tF3\tF4\tF5\tF6\tF7");
		$monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",Y,S,F[0],F[1],F[2],F[3],F[4],F[5],F[6],F[7]);
		
		#2 Y=1'b0; S=3'b001;
		#2 Y=1'b0; S=3'b010;
		#2 Y=1'b0; S=3'b011;
		#2 Y=1'b0; S=3'b100;
		#2 Y=1'b0; S=3'b101;
		#2 Y=1'b0; S=3'b110;
		#2 Y=1'b0; S=3'b111;
		#2 Y=1'b1; S=3'b000;
		#2 Y=1'b1; S=3'b001;
		#2 Y=1'b1; S=3'b010;
		#2 Y=1'b1; S=3'b011;
		#2 Y=1'b1; S=3'b100;
		#2 Y=1'b1; S=3'b101;
		#2 Y=1'b1; S=3'b110;
		#2 Y=1'b1; S=3'b111;                   
		#2 $finish;
	end

endmodule

