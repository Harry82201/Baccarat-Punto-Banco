
`define Start 4'b0000
`define DealCard1 4'b0001
`define DealCard2 4'b0010
`define DealCard3 4'b0011
`define DealCard4 4'b0100
`define CheckCard5 4'b0101
`define DealCard5_P 4'b0110
`define DealCard5_D 4'b0111
`define CheckCard6 4'b1000
`define DealCard6_D 4'b1001
`define CheckWin 4'b1010
`define PWin 4'b1011
`define DWin 4'b1100
`define Tie 4'b1101

module statemachine(input slow_clock, input resetb,
                    input [3:0] dscore, input [3:0] pscore, input [3:0] pcard3,
                    output load_pcard1, output load_pcard2,output load_pcard3,
                    output load_dcard1, output load_dcard2, output load_dcard3,
                    output player_win_light, output dealer_win_light);

// The code describing your state machine will go here.  Remember that
// a state machine consists of next state logic, output logic, and the 
// registers that hold the state.  You will want to review your notes from
// CPEN 211 or equivalent if you have forgotten how to write a state machine.

    logic [3:0] state, next_state;
	logic load_pcard1_reg, load_pcard2_reg, load_pcard3_reg;
	logic load_dcard1_reg, load_dcard2_reg, load_dcard3_reg;
	logic player_win_light_reg, dealer_win_light_reg;
	
	always_ff @(posedge slow_clock or negedge resetb) begin
		if(resetb == 0) state <= `DealCard1;
		else state <= next_state;
	end
	
	always_comb begin
		case(state)
			`DealCard1: next_state = `DealCard2;
			`DealCard2: next_state = `DealCard3;
			`DealCard3: next_state = `DealCard4;
			`DealCard4: next_state = `CheckCard5;
			`CheckCard5: if((pscore == 8 & dscore == 8) | (pscore == 9 & dscore == 9)) next_state = `Tie;
						 else if(pscore == 9) next_state = `PWin;
						 else if(dscore == 9) next_state = `DWin;
						 else if(pscore == 8) next_state = `PWin;
						 else if(dscore == 8) next_state = `DWin;
						 else begin
							if(pscore >= 0 & pscore <= 5) next_state = `CheckCard6;
							else if(dscore >= 0 & dscore <= 5) next_state = `CheckWin;
							else begin
								if(pscore > dscore) next_state = `PWin;
								else if(pscore < dscore) next_state = `DWin;
								else next_state = `Tie;
							end
						 end
			`CheckCard6: if(dscore == 6 & (pcard3 == 6 | pcard3 == 7)) next_state = `CheckWin;
						 else if(dscore == 5 & (pcard3 == 4 | pcard3 == 5 | pcard3 == 6 | pcard3 == 7)) next_state = `CheckWin;
						 else if(dscore == 4 & (pcard3 == 2 | pcard3 == 3 | pcard3 == 4 | pcard3 == 5 | pcard3 == 6 | pcard3 == 7)) next_state = `CheckWin;
						 else if(dscore == 3 & pcard3 != 8) next_state = `CheckWin;
						 else if(dscore == 2 | dscore == 1 | dscore == 0) next_state = `CheckWin;
						 else begin
							if(pscore > dscore) next_state = `PWin;
							else if(pscore < dscore) next_state = `DWin;
							else next_state = `Tie;
						 end
			`CheckWin: if(pscore > dscore) next_state = `PWin;
					   else if(pscore < dscore) next_state = `DWin;
					   else next_state = `Tie;
			`PWin: next_state = `PWin;
			`DWin: next_state = `DWin;
			`Tie: next_state = `Tie;
			default: next_state = `DealCard1;
		endcase
	end
	
	always_comb begin
		case(state)
			`DealCard1: 	begin   load_pcard1_reg = 1; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0;
							end
			`DealCard2:		begin   load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 1; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0;
							end
			`DealCard3:		begin   load_pcard1_reg = 0; load_pcard2_reg = 1; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0;
							end
			`DealCard4:		begin   load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 1; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0;
							end
			`CheckCard5:	begin
								if((pscore == 8 & dscore == 8) | (pscore == 9 & dscore == 9)) begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0; 
								end
								else if(pscore == 9) begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0; 
								end
								else if(dscore == 9) begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0; 
								end
								else if(pscore == 8) begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0; 
								end
								else if(dscore == 8) begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0; 
								end
								else begin
									if(pscore >= 0 & pscore <= 5) begin
										load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 1;
										load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
										player_win_light_reg = 0; dealer_win_light_reg = 0; 
									end
									else if(dscore >= 0 & dscore <= 5) begin
										load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
										load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 1;
										player_win_light_reg = 0; dealer_win_light_reg = 0; 
									end
									else begin
										load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
										load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
										player_win_light_reg = 0; dealer_win_light_reg = 0;
									end
								end
							end
			`CheckCard6:	begin
								if(dscore == 6 & (pcard3 == 6 | pcard3 == 7)) begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 1;
									player_win_light_reg = 0; dealer_win_light_reg = 0;
								end
								else if(dscore == 5 & (pcard3 == 4 | pcard3 == 5 | 
									    pcard3 == 6 | pcard3 == 7)) begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 1;
									player_win_light_reg = 0; dealer_win_light_reg = 0;
								end
								else if(dscore == 4 & (pcard3 == 2 | pcard3 == 3 | pcard3 == 4 | 
																  pcard3 == 5 | pcard3 == 6 | pcard3 == 7)) begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 1;
									player_win_light_reg = 0; dealer_win_light_reg = 0;						  
								end
								else if(dscore == 3 & pcard3 != 8) begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 1;
									player_win_light_reg = 0; dealer_win_light_reg = 0;
								end
								else if(dscore == 2 | dscore == 1 | dscore == 0) begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 1;
									player_win_light_reg = 0; dealer_win_light_reg = 0;
								end
								else begin
									load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0;
								end
							end		
			
            `CheckWin:		begin   load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 0;
							end
			`PWin:			begin   load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 1; dealer_win_light_reg = 0;
							end
			`DWin:			begin   load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 0; dealer_win_light_reg = 1;
							end
			`Tie:			begin   load_pcard1_reg = 0; load_pcard2_reg = 0; load_pcard3_reg = 0;
									load_dcard1_reg = 0; load_dcard2_reg = 0; load_dcard3_reg = 0;
									player_win_light_reg = 1; dealer_win_light_reg = 1;
							end
			default:		begin   load_pcard1_reg = 1'bx; load_pcard2_reg = 1'bx; load_pcard3_reg = 1'bx;
									load_dcard1_reg = 1'bx; load_dcard2_reg = 1'bx; load_dcard3_reg = 1'bx;
									player_win_light_reg = 1'bx; dealer_win_light_reg = 1'bx;
							end
		endcase
	end
	
	assign load_pcard1 = load_pcard1_reg; 
	assign load_pcard2 = load_pcard2_reg; 
	assign load_pcard3 = load_pcard3_reg;
	assign load_dcard1 = load_dcard1_reg; 
	assign load_dcard2 = load_dcard2_reg; 
	assign load_dcard3 = load_dcard3_reg;
	assign player_win_light = player_win_light_reg; 
	assign dealer_win_light = dealer_win_light_reg;

endmodule

