module JKFF(input clk, reset,J,K, output reg Q);
 	initial Q=0;
 	always @(posedge clk)
 	begin
 		if(reset ==1)
 		begin
 			Q<=0;
 		end	
 		else
 		begin
 			if(J==0&&K==0)
 			Q<=Q;
 			else
 			begin
 				if(J==1&&K==0)
 				Q<=1;
 				else
 					begin
 					if(J==1&&K==1)
 					Q<=~Q;
 					end
 				end
 			end
 		end
endmodule

module circuit_jkff(input clk, reset, X, Y, output F1, F2);
	//input clk, reset, X, Y;
	//output F1,F2;
	wire Xnot;
	wire [3:0] eor;
	wire J1, J2, K1, K2;
	wire A, B;

	not M1(Xnot,X);
	xor M2(eor[3],Y,F2), M3(eor[0],Y,F1);
	xnor M4(eor[2],Y,F2), M5(eor[1],Y,F1);
	and M6(J1,Xnot,eor[3]), M7(K1,Xnot, eor[2]), M8(J2,Xnot,eor[1]), M9(K2,Xnot,eor[0]);

	JKFF jkff1(clk, reset, J1,K1,A);
	JKFF jkff2(clk, reset, J2,K2,B);

	buf(F1,A);
	buf(F2,B);
	endmodule

module exercise5_2;
	reg clk, reset, J,K,A,B;
	wire F1, F2;
	circuit_jkff ckt1(clk, reset, A,B,F1,F2);

	initial begin
		clk=0; reset =0;
		$display("\t           T CLK  A B F1 F2");
	end

	initial begin
		$monitor ($time,,,"%b   %b %b %b  %b ",clk,A,B,F1,F2);
	end

	always #1 clk=!clk;

	initial begin
		A = 1'b0; B = 1'b0;
		#8 A = 1'b0; B = 1'b1;
		#8 A = 1'b1; B = 1'b0;
		#8 A = 1'b1; B = 1'b1;
		#8 $finish;
	end
endmodule
