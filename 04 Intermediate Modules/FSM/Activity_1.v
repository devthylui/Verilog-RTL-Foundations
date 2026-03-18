module Activity_1(clk,x,y,clk_led);
	input clk, x;
	output y, clk_led;
	wire clk_slow;

    	clock_divider slow_clk(clk,clk_slow);	
	state_dia main(clk_slow,x,y);
		
	assign clk_led = clk_slow;

endmodule

module state_dia(clk, x, y);
	input clk, x;
	output reg y;

	reg[2:0] state, next_state;
	
	initial begin
		y = 0;
		state = 3'b00;
		next_state = 3'b00;
	end
	
	always @(posedge clk) begin

		case(state)
			3'b000:	begin
				if(x) next_state = 3'b001;
				else next_state = 3'b000;
				y = 0;
			end

			3'b001:	begin
				if(x) next_state = 3'b000; 
				else next_state = 3'b010;
				y = 0;
			end

			3'b010:	begin
				if(x) next_state = 3'b001; 
				else next_state = 3'b011;
				y = 0;
			end

			3'b011:	begin
				if(x) next_state = 3'b100; 
				else next_state = 3'b000;
				y = 1;
			end
			
			3'b100:	begin
				if(x) next_state = 3'b001; 
				else next_state = 3'b010;
				y = ~x;
			end
			
		endcase

		state <= next_state;
	end

endmodule

module clock_divider(clk_in,clk_out);

    input clk_in;       
    output reg clk_out;  
	 
    reg [26:0] counter;            

    initial begin
        counter = 0;
        clk_out = 0;
    end

	always @(posedge clk_in) begin
		counter <= counter + 1;
		 if (counter > 50000000) begin
			  counter <= 0;
			  clk_out <= ~clk_out;
		 end
	end
endmodule

module activity_1_tb;
    reg clk, x;
    wire y;

    state_dia uut(clk, x, y);

    initial begin
        clk = 0; x = 0;
        forever #2 clk = ~clk;
    end

    initial begin
        $display("Time\tInput\tOutput");

        #1 x = 1;  #2 $display("%0t\t%b\t%b", $time, x, y);
        #2 x = 0;  #2 $display("%0t\t%b\t%b", $time, x, y);
        #2 x = 0;  #2 $display("%0t\t%b\t%b", $time, x, y);
        #2 x = 1;  #2 $display("%0t\t%b\t%b", $time, x, y);
        #2 x = 0;  #2 $display("%0t\t%b\t%b", $time, x, y);
        #2 x = 0;  #2 $display("%0t\t%b\t%b", $time, x, y);
        #2 x = 0;  #2 $display("%0t\t%b\t%b", $time, x, y);
        #2 x = 1;  #2 $display("%0t\t%b\t%b", $time, x, y);
        #2 x = 0;  #2 $display("%0t\t%b\t%b", $time, x, y);
        #2 x = 1;  #2 $display("%0t\t%b\t%b", $time, x, y);

        #1 $finish;
    end
endmodule
