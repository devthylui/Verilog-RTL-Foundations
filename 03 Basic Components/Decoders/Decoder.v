module Decoder(switch, seg);
    
	input [3:0] switch;  
	output [6:0] seg;      

    	assign seg = (switch == 4'b0000) ? 7'b1111110 :  // 0
                 (switch == 4'b0001) ? 7'b0110000 :  // 1
                 (switch == 4'b0010) ? 7'b1101101 :  // 2
                 (switch == 4'b0011) ? 7'b1111001 :  // 3
                 (switch == 4'b0100) ? 7'b0110011 :  // 4
                 (switch == 4'b0101) ? 7'b1011011 :  // 5
                 (switch == 4'b0110) ? 7'b1011111 :  // 6
                 (switch == 4'b0111) ? 7'b1110000 :  // 7
                 (switch == 4'b1000) ? 7'b1111111 :  // 8
                 (switch == 4'b1001) ? 7'b1111011 :  // 9
                 (switch == 4'b1010) ? 7'b1110111 :  // A
                 (switch == 4'b1011) ? 7'b0011111 :  // b
                 (switch == 4'b1100) ? 7'b1001110 :  // C
                 (switch == 4'b1101) ? 7'b0111101 :  // d
                 (switch == 4'b1110) ? 7'b1001111 :  // E
                 (switch == 4'b1111) ? 7'b1000111 :  // F

                 7'b1111111;  // Default

endmodule

module DecoderTB();

    reg [3:0] in;
    wire [6:0] out;

    Decoder tb(in, out);

    initial begin
        $display("TIME\tIN\tOUT");
        $monitor("%0t\t%b\t%b", $time, in, out);

        in = 4'b0000;
        #2 in = 4'b0001;
        #2 in = 4'b0010;
        #2 in = 4'b0011;
        #2 in = 4'b0100;
        #2 in = 4'b0101;
        #2 in = 4'b0110;
        #2 in = 4'b0111;
        #2 in = 4'b1000;
        #2 in = 4'b1001;
        #2 in = 4'b1010;
        #2 in = 4'b1011;
        #2 in = 4'b1100;
        #2 in = 4'b1101;
        #2 in = 4'b1110;
        #2 in = 4'b1111;
        #2 $finish;

    end

endmodule

