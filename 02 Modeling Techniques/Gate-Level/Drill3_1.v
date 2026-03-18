module drill3_1(V, W, X, Y, Z, out1);

	input V, W, X, Y, Z;
	output out1;
	wire Vnot, Wnot, Xnot, Ynot, Znot, or1, or2, or3;
	
	not U1(Vnot, V), U2(Wnot, W), U3(Xnot, X);
	not Ur(Ynot, Y), U5(Znot, Z);
	and U7(or1, Vnot, Wnot, Znot), U8(or2, W, Ynot, Z);
	and U9(or3, V, X, Z);
	or U6(out1, or1, or2, or3);

endmodule

module tbDrill3_1;
	wire w1;
	reg x1, x2, x3, x4, x5;
	
	drill3_1 test2_1(x1, x2, x3, x4, x5, w1);
	initial begin
		x1=1'b0; x2=1'b0; x3=1'b0; x4=1'b0; x5=1'b0;
		#100 $finish;
	end
	
	initial begin
		#2 $display(x1,x2,x3,x4,x5," ",w1);
		#2 x1=1'b0; x2=1'b0; x3=1'b0; x4=1'b1; x5=1'b0; //2
		#2 $display(x1,x2,x3,x4,x5," ",w1);
		#2 x1=1'b0; x2=1'b0; x3=1'b1; x4=1'b0; x5=1'b0; //4
		#2 $display(x1,x2,x3,x4,x5," ",w1);
		#2 x1=1'b0; x2=1'b0; x3=1'b1; x4=1'b1; x5=1'b0; //6
		#2 $display(x1,x2,x3,x4,x5," ",w1);
		#2 x1=1'b0; x2=1'b1; x3=1'b0; x4=1'b0; x5=1'b1; //9
		#2 $display(x1,x2,x3,x4,x5," ",w1);
		#2 x1=1'b0; x2=1'b1; x3=1'b1; x4=1'b0; x5=1'b1; //13
		#2 $display(x1,x2,x3,x4,x5," ",w1);
		#2 x1=1'b1; x2=1'b0; x3=1'b1; x4=1'b0; x5=1'b1; //21
		#2 $display(x1,x2,x3,x4,x5," ",w1);
	end
endmodule
