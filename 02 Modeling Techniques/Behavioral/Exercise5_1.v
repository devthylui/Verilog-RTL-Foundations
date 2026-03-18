module t_flip_flop(clk, reset, t_in, t_out);
	input clk, reset, t_in;
	output t_out;
	reg t_out;

	always @ (negedge clk)
	begin
		if(reset == 1)
		begin
			t_out <= 0;
		end
		else if (t_in == 1)
		begin
			t_out <= ~t_out;
		end
		else
		begin
			t_out <= t_out;
		end
	end
endmodule

module circuit_tff(input clk, reset, x, output [2:0]t_out);
	wire clk1, clk2;
	t_flip_flop tff0(clk, reset, x, clk1);
	buf bf1(t_out[0], clk1);
	t_flip_flop tff1(clk1, reset, x, clk2);
	buf bf2(t_out[1], clk2);
	t_flip_flop tff2(clk2, reset, x, t_out[2]);

endmodule

module exercise5_1;
	reg clk, rst, t_in;
	wire [2:0] t_out;
	circuit_tff ctff(clk, rst, t_in, t_out);

	initial begin
		clk=0; rst=1; t_in=0;
		$monitor("clk = %b rst = %b ctr_state = %b%b", clk, rst, t_out, clk);
	end
	initial begin
		forever #1 clk = ~clk;
	end
	initial fork
		#1 rst = 0;
		#2 t_in = 1;
		#16 $finish;
	join
endmodule

