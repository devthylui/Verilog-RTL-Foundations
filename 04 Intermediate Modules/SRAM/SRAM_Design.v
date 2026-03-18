module SRAM_Design (OUT,CS,OE,WE,AD,IN);

	output [3:0] OUT;
	input CS,OE,WE;
	input[3:0] AD,IN;
	reg[3:0] mem[0:15];

	integer i;

	initial begin
		for(i = 0; i < 16; i = i +1)
			mem[i] = 4'b0000;
	end

	assign OUT = (CS == 1 | OE == 1 | WE == 0) ? 4'bZZZZ : mem[AD];

	always @(negedge WE) begin
		if(!CS) mem[AD] <= IN;
	end
endmodule

module SRAM_tb;
    reg CS, OE, WE;
    reg [3:0] AD, IN;
    wire [3:0] OUT;

    SRAM_Design U1 (OUT, CS, OE, WE, AD, IN);

    initial begin
        CS = 1;
        OE = 1;
        WE = 1;
        AD = 4'b0000;
        IN = 4'b0000;
    end

    initial begin
        #1 CS = 0;

        #1 AD = 4'b0000; IN = 4'b0000; WE = 0;
        #1 WE = 1;
        #1 AD = 4'b0001; IN = 4'b0001; WE = 0;
        #1 WE = 1;
        #1 AD = 4'b0010; IN = 4'b0010; WE = 0;
        #1 WE = 1;
        #1 AD = 4'b0011; IN = 4'b0011; WE = 0;
        #1 WE = 1;
        #1 AD = 4'b0100; IN = 4'b0100; WE = 0;
        #1 WE = 1;
        #1 AD = 4'b0101; IN = 4'b0101; WE = 0;
        #1 WE = 1;
        #1 AD = 4'b0110; IN = 4'b0110; WE = 0;
        #1 WE = 1;
        #1 AD = 4'b0111; IN = 4'b0111; WE = 0;
        #1 WE = 1;

        #1 OE = 0;
        
        #1 AD = 4'b0000;
        #1 $display("The data at address %b is %b", AD, OUT);
        
        #1 AD = 4'b0001;
        #1 $display("The data at address %b is %b", AD, OUT);
        
        #1 AD = 4'b0010;
        #1 $display("The data at address %b is %b", AD, OUT);
        
        #1 AD = 4'b0011;
        #1 $display("The data at address %b is %b", AD, OUT);
        
        #1 AD = 4'b0100;
        #1 $display("The data at address %b is %b", AD, OUT);
        
        #1 AD = 4'b0101;
        #1 $display("The data at address %b is %b", AD, OUT);
        
        #1 AD = 4'b0110;
        #1 $display("The data at address %b is %b", AD, OUT);
        
        #1 AD = 4'b0111;
        #1 $display("The data at address %b is %b", AD, OUT);

        #1 OE = 1;
        #1 $display("The data at AD %b is %b", AD, OUT);
        
        #1 $finish;
    end

endmodule