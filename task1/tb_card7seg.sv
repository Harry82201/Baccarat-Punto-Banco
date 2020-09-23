module tb_card7seg();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

logic [3:0] SW;
	logic [6:0] HEX0;
	
	card7seg dut(.*);
	
	initial begin
		SW = 4'b0000;
		#50;
		SW = 4'b0001;
		#50;
		SW = 4'b0010;
		#50;
		SW = 4'b0011;
		#50;
		SW = 4'b0100;
		#50;
		SW = 4'b0101;
		#50;
		SW = 4'b0110;
		#50;
		SW = 4'b0111;
		#50;
		SW = 4'b1000;
		#50;
		SW = 4'b1001;
		#50;
		SW = 4'b1010;
		#50;
		SW = 4'b1011;
		#50;
		SW = 4'b1100;
		#50;
		SW = 4'b1101;
		#50;
		SW = 4'b1110;
		#50;
		SW = 4'b1111;
		#50;
	end
						
endmodule

