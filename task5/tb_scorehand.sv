module tb_scorehand();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

    logic [3:0] card1, card2, card3, total;
	
	scorehand SCOREHAND (.*);
	
	initial begin
		card1 <= 3;
		card2 <= 5;
		card3 <= 0;
		#10
		assert(total == 8);
		#10;
		
		card1 <= 3;
		card2 <= 9;
		card3 <= 0;
		#10;
		assert(total == 2);
		#10;
		
		card1 <= 3;
		card2 <= 8;
		card3 <= 4;
		#10;
		assert(total == 5);
		#10;
		
		card1 <= 11;
		card2 <= 5;
		card3 <= 0;
		#10;
		assert(total == 5);
		#10;
		
		card1 <= 2;
		card2 <= 4;
		card3 <= 3;
		#10;
		assert(total == 9);
		#10;
		
		card1 <= 3;
		card2 <= 12;
		card3 <= 2;
		#10;
		assert(total == 5);
		#10;
		
		card1 <= 13;
		card2 <= 7;
		card3 <= 10;
		#10;
		assert(total == 7);
		#10;
		
		card1 <= 13;
		card2 <= 11;
		card3 <= 12;
		#10;
		assert(total == 0);
		#10;
		
		card1 <= 7;
		card2 <= 8;
		card3 <= 9;
		#10;
		assert(total == 4);
		#10;
		
		card1 <= 4;
		card2 <= 8;
		card3 <= 7;
		#10;
		assert(total == 9);
		#10;
		
		card1 <= 5;
		card2 <= 9;
		card3 <= 6;
		#10;
		assert(total == 0);
		#10;
		
		card1 <= 6;
		card2 <= 8;
		card3 <= 7;
		#10;
		assert(total == 1);
		#10;
		
		$display("finished");
		
	end
						
endmodule

