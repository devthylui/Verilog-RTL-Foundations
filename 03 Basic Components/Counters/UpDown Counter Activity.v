module counter_control (clk,T,ctrl,Q0,Q1,Q2);
    input clk, T, ctrl;       
    output Q0, Q1, Q2;

    wire Q0_up, Q1_up, Q2_up;
    wire Q0_down, Q1_down, Q2_down;

    up_counter up (clk,T,Q0_up,Q1_up,Q2_up);
    down_counter down (clk,T,Q0_down,Q1_down,Q2_down);

    assign Q0 = (ctrl) ? Q0_up : Q0_down;
    assign Q1 = (ctrl) ? Q1_up : Q1_down;
    assign Q2 = (ctrl) ? Q2_up : Q2_down;

endmodule

module up_counter (clk, T, Q0, Q1, Q2);
	input clk, T;
    	output Q0, Q1, Q2;

    	tff_posedge tff0 (clk, T, Q0);  
    	tff_negedge tff1 (Q0, T, Q1);  
    	tff_negedge tff2 (Q1, T, Q2);  

endmodule

module down_counter(clk,T,Q0,Q1,Q2);
	input clk, T;
	output Q0,Q1,Q2;

	tff_posedge tff0 (clk, T, Q0);
	tff_posedge tff1 (Q0, T, Q1);
	tff_posedge tff2 (Q1, T, Q2);	
endmodule

module tff_posedge (clk, t, q); 
    input clk, t; 
    output reg q;

    initial begin
        q = 0;
    end

    always @ (posedge clk) begin 
        if(t == 1) begin
            q <= ~q;
        end
    end
endmodule

module tff_negedge (clk, t, q); 
    input clk, t; 
    output reg q;

    initial begin
        q = 0;
    end

    always @ (negedge clk) begin 
        if(t == 1) begin
            q <= ~q;
        end
    end
endmodule



module counter_tb;
	reg clk, T,ctrl;
	wire Q0,Q1,Q2;

	counter_control tb(clk,T,ctrl,Q0,Q1,Q2);

	initial begin
		clk = 0; T = 0; ctrl = 1;
		$display("Time\tClk\tT\tCtrl\tQ");
		$monitor("%0t\t%b\t%b\t%b\t%b%b%b",$time,clk,T,ctrl,Q0,Q1,Q2);
	end
 	initial begin  	 	
		forever #1 clk=~clk; 
 	end 
 	initial begin 
 	 	#3 T = 0;
 	 	#2 T = 1;
 	 	#2 T = 1; ctrl = 1;
 	 	#2 T = 1; ctrl = 0;
 	 	#2 T = 1; ctrl = 1;
 	 	#2 T = 1; ctrl = 0;
 	 	#2 T = 1; ctrl = 1;
 	 	#2 T = 1; ctrl = 0;		
		#15 ctrl = 1;
		#15 ctrl = 0;
		#15 T = 0;
		#2 ctrl = 1;
		#2 ctrl = 0;
		#2 ctrl = 1;
		#2 ctrl = 0;
 	 	#5 $finish;  	
	end 
endmodule

