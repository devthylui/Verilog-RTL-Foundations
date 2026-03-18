module ALU(S,A,B,F);
	
	input[1:0] 	S,A,B;
	output[3:0] 	F;
	
	//Enabler Wires
	wire[1:0] 	Snot;
	wire 		en01,en10,en11;
	//Demux Wires
	wire[1:0] 	add_A, add_B;
	wire[1:0] 	sub_A, sub_B;
	wire[1:0] 	mul_A, mul_B;
	//Adder Wires
	wire[2:0] 	Sum;
	wire[3:0] 	aw;
	//Subtractor Wires
	wire[2:0] 	Diff;
	wire[3:0] 	sw;
	//Multiplier Wires
	wire[3:0] 	Prod;
	wire[3:0] 	mw;
	//OR Output Wires
	wire[2:0] 	orF;

	//Enabler Gates
	not 	E1(Snot[1],S[1]), E2(Snot[0],S[0]);
	and 	E3(en01,S[0],Snot[1]), E4(en10,S[1],Snot[0]), E5(en11,S[1],S[0]);
	//Demux 01 Gates (Adder)
	and 	DM1(add_A[1],en01,A[1]), DM2(add_A[0],en01,A[0]), DM3(add_B[1],en01,B[1]), DM4(add_B[0],en01,B[0]);
	//Demux 10 Gates (Subtractor)
	and 	DM5(sub_A[1],en10,A[1]), DM6(sub_A[0],en10,A[0]), DM7(sub_B[1],en10,B[1]), DM8(sub_B[0],en10,B[0]);
	//Demux 11 Gates (Multiplier)
	and 	DM9(mul_A[1],en11,A[1]), DM10(mul_A[0],en11,A[0]), DM11(mul_B[1],en11,B[1]), DM12(mul_B[0],en11,B[0]);
	//Adder Circuit
	xor	A1(Sum[0],add_A[0],add_B[0]), A3(aw[1],add_A[1],add_B[1]), A4(Sum[1],aw[1],aw[0]);
	and	A2(aw[0],add_A[0],add_B[0]), A5(aw[2],add_A[1],add_B[1]), A6(aw[3],aw[1],aw[0]);
	or	A7(Sum[2],aw[2],aw[3]);
	//Subtractor Circuit
	xor	D1(Diff[0],sub_A[0],sub_B[0]), D3(sw[1],sub_A[1],sub_B[1]), D4(Diff[1],sw[1],sw[0]);
	and	D2(sw[0],~sub_A[0],sub_B[0]), D5(sw[2],~sub_A[1],sub_B[1]), D6(sw[3],sw[0],~sw[1]);
	or	D7(Diff[2],sw[2],sw[3]);
	//Multiplier Circuit
	and 	M1(Prod[0],mul_A[0],mul_B[0]), M2(mw[0],mul_A[1],mul_B[0]), M3(mw[1],mul_B[1],mul_A[0]), M4(mw[2],mul_B[1],mul_A[1]), M6(mw[3],mw[0],mw[1]), M8(Prod[3],mw[2],mw[3]);
	xor 	M5(Prod[1],mw[0],mw[1]), M7(Prod[2],mw[2],mw[3]);
	//OR Output
	or 	O1(orF[0],Sum[0],Diff[0],Prod[0]), O2(orF[1],Sum[1],Diff[1],Prod[1]), O3(orF[2],Sum[2],Diff[2],Prod[2]);
	//Inverter Output (Active-Low)
	not 	N1(F[0],orF[0]), N2(F[1],orF[1]), N3(F[2],orF[2]), N4(F[3],Prod[3]);

endmodule
