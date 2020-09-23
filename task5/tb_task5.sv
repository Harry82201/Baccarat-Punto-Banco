module tb_task5();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 100,000 ticks (equivalent to "initial #100000 $finish();").

    logic CLOCK_50; 
	logic [3:0] KEY; 
	logic [9:0] LEDR;
    logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	
	task5 TASK5 (.*);
	
	initial begin
		CLOCK_50 = 1'b0;
		forever #5 CLOCK_50 = ~ CLOCK_50;
	end
	
	initial begin
		KEY[0] = 1'b0;
		forever #20 KEY[0] = ~ KEY[0];
	end
	
	initial begin
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#500;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#500;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#500;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#500;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#500;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#500;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#500;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#500;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#40;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#80;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#120;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#160;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#200;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#240;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#280;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#320;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#360;
		
		KEY[3] = 1'b0;
		#50;
		KEY[3] = 1'b1;
		#400;
		
		$display("finished");
		
	end
						
endmodule

