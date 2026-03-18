`define pi 3.1416

module exercise2_3;

	real x, r, AnsrRem;
	
	initial begin
		r = 3;
		x = 4.0/3.0;
		AnsrRem = x*`pi*(r*r*r);

		$display("The volume of the cylinder is, %0f cubic units.",AnsrRem);
	end

endmodule

