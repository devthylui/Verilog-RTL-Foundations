module pos_d_flip_flop(clk,reset,d,q);
	input clk, reset,d;
	output q;
	reg q;
	initial begin
	q=0;
end
	always@(posedge clk)
	begin
		if(reset==1)
			begin
				q<=0;
			end
		else
			egin
				q<=d;
			end
	end
endmodule

module mux_4_1(output reg m_out, input IN0,IN1, IN2, IN3, input[1:0] select);
	always@(IN0, IN1, IN2, IN3, select)
	case(select)
		2'b00:m_out=IN0;
		2'b01:m_out=IN1;
		2'b10:m_out=IN2;
		2'b11:m_out=IN3;
	endcase
endmodule

module circuit_pos_d_ff(input clk, reset, input[3:0] U, input[1:0] sel, output T3, T2,T1,T0);
	wire A,B,C,D,O1,O2,O3,O4, zero1;
	buf (zero1,0);
	pos_d_flip_flop ff1(clk,reset,O1,A);
	pos_d_flip_flop ff2(clk,reset,O2,B);
	pos_d_flip_flop ff3(clk,reset,O3,C);
	pos_d_flip_flop ff4(clk,reset,O4,D);

	mux_4_1 mux1(O1,A,B,U[3],B,sel);
	mux_4_1 mux2(O2,B,C,U[2],C,sel);
	mux_4_1 mux3(O3,C,D,U[1],D,sel);
	mux_4_1 mux4(O4,D,zero1,U[0],zero1,sel);

	buf(T3,A);
	buf(T2,B);
	buf(T1,C);
	buf(T0,D);
endmodule

module exercise5_3();
	reg clk,reset;
	reg[3:0] U;
	reg[1:0] select;
	wire OUT3, OUT2,OUT1,OUT0;

	circuit_pos_d_ff circ(clk, reset, U, select, OUT0, OUT1,OUT2,OUT3);
	initial begin
		select=2'b00;
		U=8'hAF;
		reset=0;
		clk=0;
		$strobe("clk  sel    in     out");
		$monitorb(clk, "    ", select, "    ", U, "    ", OUT0, OUT1,OUT2,OUT3);
		#1 select=2'b01;
		#1 select=2'b01;
		#1 select=2'b10;
		#1 select=2'b10;
		#1 select=2'b11;
		#1 select=2'b11;
		#1 select=2'b00;
		#1 select=2'b01;
		#1 select=2'b10;
		#1 select=2'b01;
		#1 select=2'b10;
		#1 select=2'b11;
		#10 $finish;
	end
	initial begin
		forever #1 clk=~clk;
	end
endmodule
