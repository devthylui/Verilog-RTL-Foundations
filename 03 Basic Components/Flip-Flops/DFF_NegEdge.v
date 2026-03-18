module dff_negedge (clk, d, q); 
	input clk, d; 
	output reg q; 

	initial begin
		q = 0;
	end
 
	always @ (negedge clk ) 
		begin 
			q <= d; 
		end 
endmodule

module dff_ne_tb;
	reg clk, d;
	wire q;

	dff_negedge tb(clk,d,q);

	initial begin
		clk = 0; d = 0;
		$display("Time\tClk\tD\tQ");
		$monitor("%0t\t%b\t%b\t%b",$time,clk,d,q);
	end
 	initial begin  	 	
		forever #1 clk=~clk; 
 	end 
 	initial fork 
 	 	#2 d=1; 
 	 	#4 d=0; 
 	 	#6 d=1; 
 	 	#8 $finish;  	
	join 
endmodule
