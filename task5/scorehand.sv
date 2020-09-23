module scorehand(input [3:0] card1, input [3:0] card2, input [3:0] card3, output [3:0] total);

// The code describing scorehand will go here.  Remember this is a combinational
// block. The function is described in the handout.  Be sure to review the section
// on representing numbers in the lecture notes.

    logic [3:0] val_1, val_2, val_3, temp_total;
	logic [4:0] temp;
	
	assign val_1 = card1[3] ? ((card1[2] | card1[1]) ? 4'b0 : card1) : card1;
	assign val_2 = card2[3] ? ((card2[2] | card2[1]) ? 4'b0 : card2) : card2;
	assign val_3 = card3[3] ? ((card3[2] | card3[1]) ? 4'b0 : card3) : card3;
	
	assign temp = val_1 + val_2 + val_3;
	
	always_comb begin
		if(temp >= 5'b10100) temp_total = temp - 4'b10100;
		else if(temp >= 5'b01010) temp_total = temp - 4'b01010;
		else temp_total = temp;
	end
	
	assign total = temp_total;

endmodule

