module Parallel_Communication (dataLedOut,dataTx,drdTx,drcRx,dataSwIn,dataRxIn,drcTx,drdRx,load_mode,clk);

	output reg[7:0] dataLedOut,dataTx;    
	output reg drdTx,drcRx;
	input[7:0] dataSwIn,dataRxIn;
	input[1:0] load_mode;
	input drdRx,drcTx,clk;

	reg[23:0] counter;
	reg[7:0] dataToCount;

	initial begin
		counter = 0;
		dataToCount = 0;
	end
	
	always @(posedge clk) begin
	
		case(load_mode)
		
			// Counter
			2'b00: begin
				
				counter <= counter + 1;
				
				if (counter > 16000000) begin
					dataToCount <= dataToCount + 1;
					dataLedOut <= dataToCount;
					counter <= 0;
				end
				
			end
			
			// Counter
			2'b01: begin
				
				counter <= counter + 1;
				
				if (counter > 16000000) begin
					dataToCount <= dataToCount + 1;
					dataLedOut <= dataToCount;
					counter <= 0;
				end
			
			end
			
			
			// TX Mode
			2'b10: begin
			
				dataLedOut <= 0;
				drcRx <= 0;
				drdTx <= 1;
				
				if(drdTx) begin
					dataTx <= dataSwIn;
				end
				
				if(drcTx) begin
					drdTx <= 0;
				end
				
			end
			
			// RX Mode
			2'b11: begin
				
				drdTx <= 0;
				
				if(drdRx == 1) begin
					dataLedOut <= dataRxIn;
					drcRx <= 1;
				end 
				
			end
			
		endcase
		
	end
	
endmodule
