primitive T_FF(F, clk, T);

	input clk, T;
	output F;
	reg F;
	
	initial F=0;
	
	table
	// CLK T : F(STATE) : F(NEXT)
	(01) ? : x : 0 ;
	(01) 0 : 0 : 0 ;
	(01) 0 : 1 : 1 ;
	(01) 1 : 0 : 1 ;
	(01) 1 : 1 : 0 ;
	(10) ? : x : 0 ;
	(10) 0 : 0 : 0 ;
	(10) 0 : 1 : 1 ;
	(10) 1 : 0 : 0 ;
	(10) 1 : 1 : 1 ;
	endtable

endprimitive

module pri;

	reg x, clk;
	wire y;
	
	T_FF TF(y, clk, x);
	
	initial begin
		x=0; clk=0;
	end
	
	always #1 clk=!clk;
	
	initial begin
		x=0;
		#4 x=1;
		repeat(8)
		#8 x=~x;
	end
	
	initial begin
		$display("TIME\tClk\tT\tQ");
		$monitor("%0t\t%b\t%b\t%b",$time, clk, x, y);
		#16 $finish;
	end
endmodule
