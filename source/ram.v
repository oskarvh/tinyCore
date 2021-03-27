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

// Butterfky for FFT module
module ram #(
	parameter ADDR_SZ = 8,
	parameter DATA_SZ = 8,
	parameter MEM_SZ =  2**10
	) (
	input wire clk,
	input wire [ADDR_SZ-1:0] addr,
	input wire [DATA_SZ-1:0] data_i,
	output wire [DATA_SZ-1:0] data_o,
	input wire we

	);	


	reg [DATA_SZ-1:0] ram[MEM_SZ-1:0];	
	reg [DATA_SZ-1:0] data_o_tmp;
	
	
	always @(posedge clk )
		begin
			if (we )
				begin
					ram[addr] <= data_i;
				end
		end

	assign data_o = data_o_tmp;
	
endmodule

