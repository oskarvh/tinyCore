// Copyright (C) 2019  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

module tinycore_fpga_top
(
	LED1,
	LED2,
	LED3,
	LED4,
	LED5,
	LED6,
	LED7,
	LED8,
	CLK12M,
	BDBUS0,
	BDBUS1,
//	BDBUS2,
//	BDBUS3,
//	BDBUS4,
//	BDBUS5,
//	ADBUS4,
//	ADBUS7,
	SEN_SPC,
	SEN_CS,
	SEN_SDO,
	SEN_SDI,
	SEN_INT1,
	SEN_INT2,
	WE,
	RAS,
	DQM,
	DQ,
	CS,
	CLK,
	CKE,
	CAS,
	BA,
	A,
	USER_BTN,
//	PIO_01,
//	PIO_02,
//	PIO_03,
//	PIO_04,
//	PIO_05,
//	PIO_06,
//	PIO_07,
//	PIO_08,
//	D0,
//	D1,
//	D2,
//	D3,
//	D4,
//	D5,
//	D6,
//	D7,
//	D8,
//	D9,
//	D10,
//	D11,
//	D11_R,
//	D12,
//	D12_R,
//	D13,
//	D14,
//	AIN,
//	AIN0,
//	AIN1,
//	AIN2,
//	AIN3,
//	AIN4,
//	AIN5,
//	AIN6,
//	AIN7
);

// user leds
output			LED1;
output			LED2;
output			LED3;
output			LED4;
output			LED5;
output			LED6;
output			LED7;
output			LED8;

// FTDI - UART - Channel B
input			BDBUS0; //FPGA_RXD
output			BDBUS1; //FPGA_TXD
// input			BDBUS2; // RTS#
// output			BDBUS3; // CTS#
// input			BDBUS4; // DTR#
// output			BDBUS5; // DSR#
// FTDI - Channel A
// input			ADBUS4; // GPIOL0
// input			ADBUS7; // GPIOL3

// 3-axis accelerometer
output			SEN_CS;
output			SEN_SDI;
input			SEN_SDO;
output			SEN_SPC;
input			SEN_INT1;
input			SEN_INT2;

// user buttons
input			USER_BTN;

// sdram memory
input			CKE;
output			CLK;
input			CAS;
input			CS;
input			WE;
input			RAS;
output	[1:0]	DQM;
inout	[15:0]	DQ;
output	[1:0]	BA;
output	[11:0]	A;

// clock
input			CLK12M;

// Pin Header J6 I/O
// input/output			PIO_01;
// input/output			PIO_02;
// input/output			PIO_03;
// input/output			PIO_04;
// input/output			PIO_05;
// input/output			PIO_06;
// input/output			PIO_07;
// input/output			PIO_08;

// Pin Header J1 
// input/output			AIN0;
// input/output			AIN1;
// input/output			AIN2;
// input/output			AIN3;
// input/output			AIN4;
// input/output			AIN5;
// input/output			AIN6;
// input/output			AIN7;

// Pin Header J1/J2 I/O
// input/output			D0;
// input/output			D1;
// input/output			D2;
// input/output			D3;
// input/output			D4;
// input/output			D5;
// input/output			D6;
// input/output			D7;
// input/output			D8;
// input/output			D9;
// input/output			D10;
// input/output			D11;
// input/output			D11_R;
// input/output			D12;
// input/output			D12_R;
// input/output			D13;
// input/output			D14;


// RAM connections and parameters

	localparam RAM_ADDR_SZ = 8;
	localparam RAM_DATA_SZ = 8;
	localparam RAM_MEM_SZ =  2**10;

	wire	ram_clk;
	wire [RAM_ADDR_SZ-1:0] ram_add;
	wire [RAM_DATA_SZ-1:0] ram_data_i;
	wire [RAM_DATA_SZ-1:0] ram_data_o;
	wire  ram_we;


// CPU connections and parameters

	localparam CPU_ADDR_SZ = 8;
	localparam CPU_DATA_SZ = 8;
	localparam CPU_MEM_SZ =  2**10;

	wire                   cpu_clk;
	wire [CPU_ADDR_SZ-1:0] cpu_add;
	wire [CPU_DATA_SZ-1:0] cpu_data_i;
	wire [CPU_DATA_SZ-1:0] cpu_data_o;
	wire                   cpu_we;

	
// Interconnect 
// CLK
	assign RAM_CLK = CLK12M;
   assign CPU_CLK = CLK12M;
	
// ADDR
	assign ram_addr = cpu_addr;
	
// DATA
	assign cpu_data_i = ram_data_o;
   assign cpu_data_o = ram_data_i;	
	
// WE
	assign ram_we = cpu_we;
	
	ram #(.ADDR_SZ(RAM_ADDR_SZ),
			.DATA_SZ(RAM_DATA_SZ),
			.MEM_SZ(RAM_MEM_SZ)) 
			
	ram (
		.clk(ram_clk),
		.addr(ram_add),
		.data_i(ram_data_i),
		.data_o(ram_data_o),
		.we(ram_we)
		
		);
		
		
		
	tinycore_top #(.ADDR_SZ(CPU_ADDR_SZ),
			.DATA_SZ(CPU_ADDR_SZ)) 
	cpu (
		.clk(cpu_clk),
		.data_i(cpu_data_i),
		.data_o(cpu_data_o),
		.addr(cpu_addr),
		.we(cpu_we)
		
	);
		




endmodule
