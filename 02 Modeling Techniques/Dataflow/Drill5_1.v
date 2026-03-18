module magcom (input [3:0] A, B, output lt, gt, eq);
	assign lt = (A < B);
	assign gt = (A > B);
	assign eq = (A == B);
endmodule

module drill5_1;
	reg [3:0] A, B;
	wire lt, gt, eq;
	magcom tb(A, B, lt, gt, eq);
	reg [255:0] string1, string2, string3;

	initial begin
		$display("A B\tA<B\tA>B\tA==B");
		A = 4'b0; B = 4'b0; #1;
		if (lt==1) string1="true"; else string1="false";
		if (gt==1) string2="true"; else string2="false";
		if (eq==1) string3="true"; else string3="false";
		$display("%0d %0d\t%0s\t%0s\t%0s", A, B, string1, string2, string3);
		#1 A = 4'd7; B = 4'd7; #1;
		if (lt==1) string1="true"; else string1="false";
		if (gt==1) string2="true"; else string2="false";
		if (eq==1) string3="true"; else string3="false";
		$display("%0d %0d\t%0s\t%0s\t%0s", A, B, string1, string2, string3);
		#3 A = 4'd4; B = 4'd6; #1;
		if (lt==1) string1="true"; else string1="false";
		if (gt==1) string2="true"; else string2="false";
		if (eq==1) string3="true"; else string3="false";
		$display("%0d %0d\t%0s\t%0s\t%0s", A, B, string1, string2, string3);
		#5 A = 4'd9; B = 4'd8; #1;
		if (lt==1) string1="true"; else string1="false";
		if (gt==1) string2="true"; else string2="false";
		if (eq==1) string3="true"; else string3="false";
		$display("%0d %0d\t%0s\t%0s\t%0s", A, B, string1, string2, string3);
		#7 A = 4'd10; B = 4'd1; #1;
		if (lt==1) string1="true"; else string1="false";
		if (gt==1) string2="true"; else string2="false";
		if (eq==1) string3="true"; else string3="false";
		$display("%0d %0d\t%0s\t%0s\t%0s", A, B, string1, string2, string3);
		#9 $finish;
	end
endmodule
