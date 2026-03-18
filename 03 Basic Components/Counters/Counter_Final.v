module Counter_Final(clk_in,T,ctrl,seg);
    input clk_in,T, ctrl;  
    output [6:0] seg; 
    wire clk_slow;

    clock_divider slow_clk(clk_in,clk_slow);

    counter coun(clk_slow,T,ctrl,seg);
endmodule

module counter (clk,T,ctrl,seg);
    input clk, T, ctrl;       
    output [6:0] seg;

	wire [2:0] Q, Q_up, Q_down;
	reg [2:0] Q_reg;
	 
    up_counter up (clk, T, Q_up);
    down_counter down (clk, T, Q_down);

    always @(posedge clk) begin
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
    	tff_posedge tff1 (~Q[0], T, Q[1]);  
    	tff_posedge tff2 (~Q[1], T, Q[2]);  

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

    initial q = 0;


    always @ (posedge clk) begin 
        if(t) begin
            q <= ~q;
        end
		  else begin
				q <= q;
			end
    end
endmodule

module clock_divider(clk_in,clk_out);

    input clk_in;       
    output reg clk_out;  
	 
    reg [31:0] counter;            

    initial begin
        counter = 0;
        clk_out = 0;
    end

	always @(posedge clk_in) begin
		counter <= counter + 1;
		 if (counter > 1000000) begin
			  counter <= 0;
			  clk_out <= ~clk_out;
		 end
	end
endmodule