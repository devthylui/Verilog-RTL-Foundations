
module Up_Counter_Test (clk, T, Q);
	input clk, T;
    	output [2:0] Q;

    	tff_posedge tff0 (clk, T, Q[0]);  
    	tff_negedge tff1 (Q[0], T, Q[1]);  
    	tff_negedge tff2 (Q[1], T, Q[2]);  

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

