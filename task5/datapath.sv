module datapath(input slow_clock, input fast_clock, input resetb,
                input load_pcard1, input load_pcard2, input load_pcard3,
                input load_dcard1, input load_dcard2, input load_dcard3,
                output [3:0] pcard3_out,
                output [3:0] pscore_out, output [3:0] dscore_out,
                output[6:0] HEX5, output[6:0] HEX4, output[6:0] HEX3,
                output[6:0] HEX2, output[6:0] HEX1, output[6:0] HEX0);
						
// The code describing your datapath will go here.  Your datapath 
// will hierarchically instantiate six card7seg blocks, two scorehand
// blocks, and a dealcard block.  The registers may either be instatiated
// or included as sequential always blocks directly in this file.
//
// Follow the block diagram in the Lab 1 handout closely as you write this code.

    logic [3:0] new_card;
	logic [3:0] pcard1_out, pcard2_out, dcard1_out, dcard2_out, dcard3_out;
	
	dealcard DealCard_INS(.clock(fast_clock), .resetb(resetb), .new_card(new_card));
	
	reg4 PCard1(.clk(slow_clock), .en(load_pcard1), .reset(resetb), .in(new_card), .out(pcard1_out));
	reg4 PCard2(.clk(slow_clock), .en(load_pcard2), .reset(resetb), .in(new_card), .out(pcard2_out));
	reg4 PCard3(.clk(slow_clock), .en(load_pcard3), .reset(resetb), .in(new_card), .out(pcard3_out));
	reg4 DCard1(.clk(slow_clock), .en(load_dcard1), .reset(resetb), .in(new_card), .out(dcard1_out));
	reg4 DCard2(.clk(slow_clock), .en(load_dcard2), .reset(resetb), .in(new_card), .out(dcard2_out));
	reg4 DCard3(.clk(slow_clock), .en(load_dcard3), .reset(resetb), .in(new_card), .out(dcard3_out));
	
	card7seg Card7Seg_INS0(.card(pcard1_out), .seg7(HEX0));
	card7seg Card7Seg_INS1(.card(pcard2_out), .seg7(HEX1));
	card7seg Card7Seg_INS2(.card(pcard3_out), .seg7(HEX2));
	card7seg Card7Seg_INS3(.card(dcard1_out), .seg7(HEX3));
	card7seg Card7Seg_INS4(.card(dcard2_out), .seg7(HEX4));
	card7seg Card7Seg_INS5(.card(dcard3_out), .seg7(HEX5));
	
	scorehand ScoreHand_INSP(.card1(pcard1_out), .card2(pcard2_out), .card3(pcard3_out), .total(pscore_out));
	scorehand ScoreHand_INSD(.card1(dcard1_out), .card2(dcard2_out), .card3(dcard3_out), .total(dscore_out));

endmodule

module reg4(input clk, input en, input reset,
				input [3:0] in, output logic [3:0] out);
	
	always_ff @(posedge clk or negedge reset) begin
		if(reset == 0)
			out <= 0;
		else
			if(en)
				out <= in;
			else
				out <= out;
	end
	
endmodule

