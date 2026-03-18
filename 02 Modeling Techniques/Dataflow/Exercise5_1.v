module BitComparator(output A_GT_B, A_LT_B, input [7:0] A, B);
    assign A_GT_B = (A > B);
    assign A_LT_B = (A < B);
endmodule

module exercise5_1;
    reg [7:0] A, B;
    wire A_gt_b, A_lt_B;
    reg [255:0] string1;
    BitComparator test(A_gt_b, A_lt_B, A, B);
    
    initial begin
        A = 8'b00000000; B = 8'b00000000;
        $display("A \t\t\t\t B \t\t\t\t Remarks");

        #1 A = 8'b10000100; B = 8'b01110000;
        #5 if (A == B) string1 = "Equal"; else if (A_gt_b) string1 = "A is greater than B"; else if (A_lt_B) string1 = "A is less than B";
        $display("%b \t\t\t\t %b \t %s", A, B, string1);

        #1 A = 8'b11010001; B = 8'b11011111;
        #5 if (A == B) string1 = "Equal"; else if (A_gt_b) string1 = "A is greater than B"; else if (A_lt_B) string1 = "A is less than B";
        $display("%b \t\t\t\t %b \t %s", A, B, string1);

        #1 A = 8'b10010000; B = 8'b00000001;
        #5 if (A == B) string1 = "Equal"; else if (A_gt_b) string1 = "A is greater than B"; else if (A_lt_B) string1 = "A is less than B";
        $display("%b \t\t\t\t %b \t %s", A, B, string1);

        #1 A = 8'b11011000; B = 8'b01110001;
        #5 if (A == B) string1 = "Equal"; else if (A_gt_b) string1 = "A is greater than B"; else if (A_lt_B) string1 = "A is less than B";
        $display("%b \t\t\t\t %b \t %s", A, B, string1);

        #1 A = 8'b01011000; B = 8'b01110001;
        #5 if (A == B) string1 = "Equal"; else if (A_gt_b) string1 = "A is greater than B"; else if (A_lt_B) string1 = "A is less than B";
        $display("%b \t\t\t\t %b \t %s", A, B, string1);

        #10 $finish;
    end
endmodule

