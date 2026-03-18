module counter_control_seg (clk, T, ctrl, seg);
    input clk, T, ctrl;       
    output [6:0] seg;

	wire [2:0] Q;
    wire [2:0] Q_up;
    wire [2:0] Q_down;
    reg [2:0] Q_reg;

    
    up_counter up (clk, T, Q_up);
    down_counter down (clk, T, Q_down);

    always @(*) begin
        if (T) begin
            Q_reg = (ctrl) ? Q_up : Q_down;
        end
    end

	assign Q = Q_reg;

    assign seg = (Q == 3'b000) ? 7'b1111110 :  // 0
                 (Q == 3'b001) ? 7'b0110000 :  // 1
                 (Q == 3'b010) ? 7'b1101101 :  // 2
                 (Q == 3'b011) ? 7'b1111001 :  // 3
                 (Q == 3'b100) ? 7'b0110011 :  // 4
                 (Q == 3'b101) ? 7'b1011011 :  // 5
                 (Q == 3'b110) ? 7'b1011111 :  // 6
                 (Q == 3'b111) ? 7'b1110000 :  // 7
                 7'b1111111; 
endmodule


module up_counter (clk, T, Q);
	input clk, T;
    	output [2:0] Q;

    	tff_posedge tff0 (clk, T, Q[0]);  
    	tff_negedge tff1 (Q[0], T, Q[1]);  
    	tff_negedge tff2 (Q[1], T, Q[2]);  

endmodule

module down_counter(clk,T,Q);
	input clk, T;
	output [2:0] Q;

	tff_posedge tff0 (clk, T, Q[0]);
	tff_posedge tff1 (Q[0], T, Q[1]);
	tff_posedge tff2 (Q[1], T, Q[2]);	
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

module counter_tb_seg;
	reg clk, T, ctrl;
	wire [6:0] seg;

	counter_control_seg tb(clk,T,ctrl,seg);

	initial begin
		clk = 0; T = 0; ctrl = 1;
		$display("Time\tClk\tT\tCtrl\tQ\tSeg");
		$monitor("%0t\t%b\t%b\t%b\t%b",$time,clk,T,ctrl,seg);
	end
 	initial begin  	 	
		forever #1 clk=~clk; 
 	end 
 	initial begin 
 	 	#3 T = 0; ctrl = 1;
 	 	#2 ctrl = 0; 
 	 	#2 T = 1; 
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
