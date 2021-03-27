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
module tinycore_tb;	
	localparam DATA_SZ = 16;
	localparam ADDR_SZ = 16;
	localparam RAM_SZ = 2**10;
	
	localparam period = 20;
	
	
	reg clk;
	reg [DATA_SZ-1:0] ram_data_i;
	reg [ADDR_SZ-1:0] ram_addr;
	reg we;
	wire [DATA_SZ-1:0] ram_data_o;
	
	initial
		begin
			clk = 1'b1;
			#period;
			
			clk = 1'b0;
			#period;
		end
		
		always
			begin
				clk = 1'b1;
				#period;
			
				clk = 1'b0;
				#period;
			end
		
		//seb_mcu_top #()  seb_mcu_top ();
endmodule

