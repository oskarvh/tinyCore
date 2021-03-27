/*
*
* Copyright (c) 2021-2022 smikkelsen@hotmail.se
*
*
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
* 
*/

// SEB CPU 
module tinycore_top # (
	parameter ADDR_SZ = 8,
	parameter DATA_SZ = 8
	) 
	(
		
	input  wire clk,
	input  wire reset_n,
	input  wire [DATA_SZ-1:0] data_i,
	output wire [DATA_SZ-1:0] data_o,	
	output wire [ADDR_SZ-1:0] addr,
	output wire we
);	
	
	reg state;      // Keep track of fetch/execute state
	
	reg [ADDR_SZ-1:0] pc;      // Program counter
	reg [DATA_SZ-1:0] r[15:0]; // 15 general purpose registers

// TopSM like? Then we use 2 steps: fetch and execute. I suggest we try to pipeline this 
// This will require 2 ports ram
	


// FETCH: Fetch RAM(PC) insturction
integer i;
always @ (posedge clk or negedge reset_n) 
	begin
		if (reset_n == 0)
			begin
				state <= 1'b0;
				pc <= 1'b0;
				for (i = 0; i < 15; i=i+1) r[i] <= 0;
			end // if
		
		else // clk
			begin
				pc <= 1;
			end
	end // always


// EXECUTE: 
	// Execute instruction
	
	// Update PC


endmodule

