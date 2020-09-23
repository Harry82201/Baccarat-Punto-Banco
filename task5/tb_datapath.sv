module tb_datapath();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

    logic slow_clock, fast_clock, resetb;
    logic load_pcard1, load_pcard2, load_pcard3;
    logic load_dcard1, load_dcard2, load_dcard3;
    logic [3:0] pcard3_out, pscore_out, dscore_out;
    logic [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	
	datapath DATAPATH (.*);
	
	initial begin
		slow_clock = 1'b0;
		forever #20 slow_clock = ~ slow_clock;
	end
	
	initial begin
		fast_clock = 1'b0;
		forever #5 fast_clock = ~ fast_clock;
	end
	
	initial begin
		resetb = 1'b0;
		#50;
		resetb = 1'b1;
		
		load_pcard1 = 1'b1;
		#40;
		load_pcard1 = 1'b0;
		#40
		load_dcard1 = 1'b1;
		#40;
		load_dcard1 = 1'b0;
		#40;
		load_pcard2 = 1'b1;
		#40;
		load_pcard2 = 1'b0;
		#40
		load_dcard2 = 1'b1;
		#40;
		load_dcard2 = 1'b0;
		#120;
		
		resetb = 1'b0;
		#50;
		resetb = 1'b1;
		
		load_pcard1 = 1'b1;
		#40;
		load_pcard1 = 1'b0;
		#40
		load_dcard1 = 1'b1;
		#40;
		load_dcard1 = 1'b0;
		#40;
		load_pcard2 = 1'b1;
		#40;
		load_pcard2 = 1'b0;
		#40
		load_dcard2 = 1'b1;
		#40;
		load_dcard2 = 1'b0;
		#40;
		load_pcard3 = 1'b1;
		#40;
		load_pcard3 = 1'b0;
		#120;
		
		resetb = 1'b0;
		#50;
		resetb = 1'b1;
		
		load_pcard1 = 1'b1;
		#40;
		load_pcard1 = 1'b0;
		#40
		load_dcard1 = 1'b1;
		#40;
		load_dcard1 = 1'b0;
		#40;
		load_pcard2 = 1'b1;
		#40;
		load_pcard2 = 1'b0;
		#40
		load_dcard2 = 1'b1;
		#40;
		load_dcard2 = 1'b0;
		#40;
		load_dcard3 = 1'b1;
		#40;
		load_dcard3 = 1'b0;
		#120;
	
		resetb = 1'b0;
		#50;
		resetb = 1'b1;
		
		load_pcard1 = 1'b1;
		#40;
		load_pcard1 = 1'b0;
		#40
		load_dcard1 = 1'b1;
		#40;
		load_dcard1 = 1'b0;
		#40;
		load_pcard2 = 1'b1;
		#40;
		load_pcard2 = 1'b0;
		#40
		load_dcard2 = 1'b1;
		#40;
		load_dcard2 = 1'b0;
		#40;
		load_pcard3 = 1'b1;
		#40;
		load_pcard3 = 1'b0;
		#40
		load_dcard3 = 1'b1;
		#40;
		load_dcard3 = 1'b0;
		#120;
	end
						
endmodule

