module AllBit(input [31:0]x, output zero, one);
	assign zero=~(|x);
	assign one=&x;
endmodule

module drill5_2;
	reg [31:0] inputX;
	wire outputZ, outputO;
	
	AllBit Abit(inputX, outputZ, outputO);
	initial fork
		$display("Time\tIn\t\tOut(1)\tOut(0)");
		$monitor("%0t\t%h\t\t%h\t%h",$time,inputX,outputO,outputZ);
		inputX=32'h0;
		#1 inputX=32'h12345678;
		#2 inputX=0;
		#3 inputX=32'hFFFFFFFF;
		#4 inputX=32;
		#4 $finish;
	join
endmodule
