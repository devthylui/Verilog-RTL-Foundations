module tff_posedge (clk, t, q); 
	input clk, t; 
	output reg q;
 
	initial begin
		q = 0;
	end

	always @ (posedge clk ) 
		begin 
			if(t == 1)
				begin
					q <= ~q;
				end
			else
				begin
					q <= q;
				end
		end 
endmodule

module tff_pe_tb;
	reg clk, t;
	wire q;

	tff_posedge tb(clk,t,q);

	initial begin
		clk = 0; t = 0;
		$display("Time\tClk\tT\tQ");
		$monitor("%0t\t%b\t%b\t%b",$time,clk,t,q);
	end
 	initial begin  	 	
		forever #1 clk=~clk; 
 	end 
 	initial fork 
 	 	#2 t=1; 
 	 	#4 t=0; 
 	 	#6 t=1; 
 	 	#8 $finish;  	
	join 
endmodule
