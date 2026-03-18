module RAM6116 (Cs_b, We_b, Oe_b, Address, IO);

	input Cs_b, We_b, Oe_b;
    	input [7:0] Address;
    	inout [7:0] IO;

    	reg [7:0] RAM [0:255];

   	assign IO = (Cs_b == 1'b1 || We_b == 1'b0 || Oe_b == 1'b1) ? 8'bzzzzzzzz : RAM[Address];

	always @(We_b, Cs_b) begin

    		@ (negedge We_b)
		if (Cs_b == 1'b0) begin
        		RAM[Address] <= IO;
    		end
	end

endmodule

module RAM6116_tb;

    	reg Cs_b, We_b, Oe_b;
    	reg [7:0] Address;
    	reg [7:0] DataIn;
    	wire [7:0] IO;

	RAM6116 dut (Cs_b, We_b, Oe_b, Address, IO);

    	assign IO = (!We_b && !Cs_b) ? DataIn : 8'bZZZZZZZZ;

    	initial begin
        	Cs_b = 1;  
        	We_b = 1;
        	Oe_b = 1;
        	Address = 8'b00000000;
        	DataIn = 8'b00000000;
	end

	initial begin
        	#1 Cs_b = 0;

        	#1 Address = 8'b00000000; DataIn = 8'b11110000; We_b = 0;
        	#1 We_b = 1;
        	#1 Address = 8'b00000001; DataIn = 8'b11110001; We_b = 0;
        	#1 We_b = 1;
        	#1 Address = 8'b00000010; DataIn = 8'b11110010; We_b = 0;
        	#1 We_b = 1;
        	#1 Address = 8'b00000011; DataIn = 8'b11110011; We_b = 0;
        	#1 We_b = 1;
        	#1 Address = 8'b00000100; DataIn = 8'b11110100; We_b = 0;
        	#1 We_b = 1;
        	#1 Address = 8'b00000101; DataIn = 8'b11110101; We_b = 0;
        	#1 We_b = 1;
        	#1 Address = 8'b00000110; DataIn = 8'b11110110; We_b = 0;
        	#1 We_b = 1;
        	#1 Address = 8'b00000111; DataIn = 8'b11110111; We_b = 0;
        	#1 We_b = 1;

        	#1 Oe_b = 0; 
		#1 Address = 8'b00000000;
        	#1 $display("The data at address %b is %b", Address, IO);
		#1 Address = 8'b00000001;
        	#1 $display("The data at address %b is %b", Address, IO);
        	#1 Address = 8'b00000010;
        	#1 $display("The data at address %b is %b", Address, IO);
        	#1 Address = 8'b00000011;
        	#1 $display("The data at address %b is %b", Address, IO);
        	#1 Address = 8'b00000100;
        	#1 $display("The data at address %b is %b", Address, IO);
        	#1 Address = 8'b00000101;
        	#1 $display("The data at address %b is %b", Address, IO);
        	#1 Address = 8'b00000110;
        	#1 $display("The data at address %b is %b", Address, IO);
        	#1 Address = 8'b00000111;
        	#1 $display("The data at address %b is %b", Address, IO);

        	#1 Oe_b = 1;
		#1 $display("The data at address %b is %b", Address, IO);

        	#1 $finish;
	end
endmodule
