module up_counter (clk, T, Q);
	input clk, T;
    	output [2:0] Q;

    	tff_posedge tff0 (clk, T, Q[0]);  
    	tff_posedge tff1 (~Q[0], T, Q[1]);  
    	tff_posedge tff2 (~Q[1], T, Q[2]);  

endmodule

module tff_posedge (clk, t, q); 
    input clk, t; 
    output reg q;

    initial q = 0;

    always @ (posedge clk) begin 
        if(t == 1) begin
            q <= ~q;
        end
    end
endmodule

module tb_up_counter;
	reg clk, T;
	wire [2:0] Q;

	up_counter tb(clk,T,Q);

	initial begin
		clk = 0; T = 0;
		$display("Time\tClk\tT\tQ");
		$monitor("%0t\t%b\t%b\t%b",$time,clk,T,Q);
	end
 	initial begin  	 	
		forever #1 clk=~clk; 
 	end 
 	initial begin 
 	 	#1 T = 1;
 	 	#14 $finish;  	
	end 
endmodule

