module jkff_negedge (clk, j, k, q); 
	input clk, j, k; 
	output reg q; 
	
	initial begin
		q = 0;
	end 
 
	always @ (negedge clk ) 
 		begin
 			if(j==0 && k==0)
 				begin q <= q; end
 			else if(j==0 && k==1)
				begin q <= 0; end
			else if(j==1 && k==0)
				begin q <= 1; end
			else if(j==1 && k==1) 
				begin q <= ~q; end
 		end
endmodule

module jkff_ne_tb;
	reg clk, j, k;
	wire q;

	jkff_negedge tb(clk,j,k,q);

	initial begin
		clk = 0; j = 0; k = 0;
		$display("Time\tClk\tJ\tK\tQ");
		$monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,j,k,q);
	end
 	initial begin  	 	
		forever #1 clk=~clk; 
 	end 
 	initial begin 
 	 	#2 k=1; 
 	 	#2 j=1; k=0;
 	 	#2 j=1; k=1;
		#4 j=0;
		#2 j=1; k=0;
		#2 j=0;
 	 	#2 $finish;  	
	end 
endmodule
