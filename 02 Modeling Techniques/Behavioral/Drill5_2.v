module mux_8_1 (output reg m_out, input [7:0]in_x, input[2:0] select); 
 	always@(in_x[0],in_x[1],in_x[2],in_x[3],in_x[4],in_x[5],in_x[6],in_x[7],select) 
 	case(select) 
 		3'b000: m_out=in_x[0];  
 		3'b001: m_out=in_x[1]; 
 		3'b010: m_out=in_x[2]; 
 		3'b011: m_out=in_x[3]; 
 		3'b100: m_out=in_x[4]; 
 		3'b101: m_out=in_x[5]; 
 		3'b110: m_out=in_x[6]; 
 		3'b111: m_out=in_x[7];  	
	endcase 
endmodule 
 
module drill5_2();  	
	reg [7:0] x;  	
	reg [2:0] select; 
 	wire m_out; 
 	 
	mux_8_1 MUX1(m_out, x, select);  

	initial begin 
 	  	select=2'b00; x=8'h4F;  	 	
		$strobe("Select Input Output"); 
 	 	$monitorb(select,"    ", x, "   ", m_out); 
 	 	#1 select=3'b000; 
 	 	#1 select=3'b001; 
 	 	#1 select=3'b010; 
 	 	#1 select=3'b011; 
 	 	#1 select=3'b100; 
 	 	#1 select=3'b101; 
 	 	#1 select=3'b110; 
 	 	#1 select=3'b111; 
	 	#1 $display("Changing value of input"); 
 	 	#1 x=8'h98; 
 	 	#1 select=3'b000; 
 	 	#1 select=3'b001; 
 	 	#1 select=3'b010; 
 	 	#1 select=3'b011; 
 	 	#1 select=3'b100; 
 	 	#1 select=3'b101; 
 	 	#1 select=3'b110; 
 	 	#1 select=3'b111;  	 
 	 	#100 $finish;  	
	end 
endmodule
