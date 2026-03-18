module d_flip_flop (clk, reset, d, q); 
	input clk, reset, d; 
	output q; 
	reg q; 
 
	always @ (posedge clk ) begin 
		if (reset == 1)  begin q <= 0; 
		end 
		else  begin q <= d; 
		end 
	end 
endmodule

module circuit_d_ff(input clk, reset, x, output y); 
 	wire OR1, OR2, AND1, AND2, AND3;  	wire A, B, Bnot; 
 	not (Bnot, B); 
 	d_flip_flop ff1(clk, reset, OR1, A);  	d_flip_flop ff2(clk, reset, OR2, B); 
 	and (AND1,A,x), (AND2,B,x), (AND3,Bnot,x), (AND4,A,B); 
 	or (OR1, AND1,AND2), (OR2,AND1,AND3);  	and (y,B,A); 
endmodule 
 
module drill5_1; 
 	reg clk, reset,d;  	wire q; 
 	circuit_d_ff cff(clk, reset, d, q); 
 	 	 
 	initial begin 
 	 	 	clk=0; reset=1; d=0; 
 	 	 	$monitor("clk=%b reset=%b d=%b q=%b",clk,reset,d,q); 
 	end 
 	initial begin  	 	forever #1 clk=~clk; 
 	end 
 	initial fork 
 	 	#1 reset=0; 
 	 	#2 d=1; 
 	 	#3 reset=1; 
 	 	#4 reset=0; 
 	 	#5 d=0; 
 	 	#8 d=1; 
 	 	#10 $finish;  	join 
endmodule
