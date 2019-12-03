-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "12/03/2019 10:41:44"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	spi_master_top IS
    PORT (
	i_CLK : IN std_logic;
	i_RST : IN std_logic;
	i_START : IN std_logic;
	i_MISO : IN std_logic;
	o_SS : OUT std_logic;
	o_MOSI : OUT std_logic;
	o_CLK : OUT std_logic
	);
END spi_master_top;

-- Design Ports Information
-- o_SS	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_MOSI	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CLK	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_MISO	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_CLK	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_RST	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_START	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF spi_master_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_CLK : std_logic;
SIGNAL ww_i_RST : std_logic;
SIGNAL ww_i_START : std_logic;
SIGNAL ww_i_MISO : std_logic;
SIGNAL ww_o_SS : std_logic;
SIGNAL ww_o_MOSI : std_logic;
SIGNAL ww_o_CLK : std_logic;
SIGNAL \i_RST~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \o_MOSI~output_o\ : std_logic;
SIGNAL \o_SS~output_o\ : std_logic;
SIGNAL \o_CLK~output_o\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~0_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~1_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~q\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|Selector4~0_combout\ : std_logic;
SIGNAL \i_RST~input_o\ : std_logic;
SIGNAL \i_RST~inputclkctrl_outclk\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI~q\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|w_PROXIMO_ESTADO~0_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI_LOOP~q\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|Selector5~0_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.WAIT_FOR_ACK~q\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|w_PROXIMO_ESTADO.NEXT_BYTE_SEL~0_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.NEXT_BYTE_SEL~q\ : std_logic;
SIGNAL \i_START~input_o\ : std_logic;
SIGNAL \i_MISO~input_o\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|Selector6~0_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.END_TX~q\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|Selector0~0_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT~q\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|Selector1~0_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_BYTE_SEL~q\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|Selector2~0_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~0_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~2_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~3_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~4_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~1_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_mux|o_Data~0_combout\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_mux|o_Data~1_combout\ : std_logic;
SIGNAL \i_CLK~input_o\ : std_logic;
SIGNAL \i_CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \u_FREQUENCY_DIVIDER|temporal~0_combout\ : std_logic;
SIGNAL \u_FREQUENCY_DIVIDER|temporal~q\ : std_logic;
SIGNAL \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_i_RST~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_i_MISO~input_o\ : std_logic;

BEGIN

ww_i_CLK <= i_CLK;
ww_i_RST <= i_RST;
ww_i_START <= i_START;
ww_i_MISO <= i_MISO;
o_SS <= ww_o_SS;
o_MOSI <= ww_o_MOSI;
o_CLK <= ww_o_CLK;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\i_RST~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_RST~input_o\);

\i_CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_CLK~input_o\);
\ALT_INV_i_RST~inputclkctrl_outclk\ <= NOT \i_RST~inputclkctrl_outclk\;
\ALT_INV_i_MISO~input_o\ <= NOT \i_MISO~input_o\;

-- Location: IOOBUF_X20_Y0_N9
\o_MOSI~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_SPI_MASTER_DATAPATH|u_mux|o_Data~0_combout\,
	oe => \u_SPI_MASTER_DATAPATH|u_mux|o_Data~1_combout\,
	devoe => ww_devoe,
	o => \o_MOSI~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\o_SS~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_i_MISO~input_o\,
	devoe => ww_devoe,
	o => \o_SS~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\o_CLK~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \u_FREQUENCY_DIVIDER|temporal~q\,
	devoe => ww_devoe,
	o => \o_CLK~output_o\);

-- Location: LCCOMB_X18_Y1_N8
\u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~0_combout\ = (\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\) # ((\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI~q\ & !\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\,
	datac => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI~q\,
	datad => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(3),
	combout => \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~0_combout\);

-- Location: LCCOMB_X18_Y1_N28
\u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~1_combout\ = !\u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~0_combout\,
	combout => \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~1_combout\);

-- Location: FF_X18_Y1_N29
\u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~q\);

-- Location: LCCOMB_X18_Y1_N14
\u_SPI_MASTER_CONTROL|Selector4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_CONTROL|Selector4~0_combout\ = (\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI_LOOP~q\ & !\u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI_LOOP~q\,
	datad => \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~q\,
	combout => \u_SPI_MASTER_CONTROL|Selector4~0_combout\);

-- Location: IOIBUF_X16_Y0_N22
\i_RST~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_RST,
	o => \i_RST~input_o\);

-- Location: CLKCTRL_G19
\i_RST~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_RST~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_RST~inputclkctrl_outclk\);

-- Location: FF_X18_Y1_N15
\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_CONTROL|Selector4~0_combout\,
	clrn => \ALT_INV_i_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI~q\);

-- Location: LCCOMB_X18_Y1_N30
\u_SPI_MASTER_CONTROL|w_PROXIMO_ESTADO~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_CONTROL|w_PROXIMO_ESTADO~0_combout\ = (\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\) # (\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\,
	datac => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI~q\,
	combout => \u_SPI_MASTER_CONTROL|w_PROXIMO_ESTADO~0_combout\);

-- Location: FF_X18_Y1_N31
\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI_LOOP\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_CONTROL|w_PROXIMO_ESTADO~0_combout\,
	clrn => \ALT_INV_i_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI_LOOP~q\);

-- Location: LCCOMB_X18_Y1_N22
\u_SPI_MASTER_CONTROL|Selector5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_CONTROL|Selector5~0_combout\ = (\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI_LOOP~q\ & \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI_LOOP~q\,
	datad => \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~q\,
	combout => \u_SPI_MASTER_CONTROL|Selector5~0_combout\);

-- Location: FF_X18_Y1_N23
\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.WAIT_FOR_ACK\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_CONTROL|Selector5~0_combout\,
	clrn => \ALT_INV_i_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.WAIT_FOR_ACK~q\);

-- Location: LCCOMB_X18_Y1_N20
\u_SPI_MASTER_CONTROL|w_PROXIMO_ESTADO.NEXT_BYTE_SEL~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_CONTROL|w_PROXIMO_ESTADO.NEXT_BYTE_SEL~0_combout\ = (!\i_MISO~input_o\ & \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.WAIT_FOR_ACK~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MISO~input_o\,
	datac => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.WAIT_FOR_ACK~q\,
	combout => \u_SPI_MASTER_CONTROL|w_PROXIMO_ESTADO.NEXT_BYTE_SEL~0_combout\);

-- Location: FF_X18_Y1_N21
\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.NEXT_BYTE_SEL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_CONTROL|w_PROXIMO_ESTADO.NEXT_BYTE_SEL~0_combout\,
	clrn => \ALT_INV_i_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.NEXT_BYTE_SEL~q\);

-- Location: IOIBUF_X20_Y0_N1
\i_START~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_START,
	o => \i_START~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\i_MISO~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_MISO,
	o => \i_MISO~input_o\);

-- Location: LCCOMB_X18_Y1_N0
\u_SPI_MASTER_CONTROL|Selector6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_CONTROL|Selector6~0_combout\ = (!\i_MISO~input_o\ & \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.NEXT_BYTE_SEL~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_MISO~input_o\,
	datad => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.NEXT_BYTE_SEL~q\,
	combout => \u_SPI_MASTER_CONTROL|Selector6~0_combout\);

-- Location: FF_X18_Y1_N1
\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.END_TX\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_CONTROL|Selector6~0_combout\,
	clrn => \ALT_INV_i_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.END_TX~q\);

-- Location: LCCOMB_X18_Y1_N26
\u_SPI_MASTER_CONTROL|Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_CONTROL|Selector0~0_combout\ = (!\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.END_TX~q\ & ((\i_START~input_o\) # (\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_START~input_o\,
	datac => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT~q\,
	datad => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.END_TX~q\,
	combout => \u_SPI_MASTER_CONTROL|Selector0~0_combout\);

-- Location: FF_X18_Y1_N27
\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_CONTROL|Selector0~0_combout\,
	clrn => \ALT_INV_i_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT~q\);

-- Location: LCCOMB_X18_Y1_N16
\u_SPI_MASTER_CONTROL|Selector1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_CONTROL|Selector1~0_combout\ = (\i_START~input_o\ & !\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_START~input_o\,
	datac => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT~q\,
	combout => \u_SPI_MASTER_CONTROL|Selector1~0_combout\);

-- Location: FF_X18_Y1_N17
\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_BYTE_SEL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_CONTROL|Selector1~0_combout\,
	clrn => \ALT_INV_i_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_BYTE_SEL~q\);

-- Location: LCCOMB_X18_Y1_N12
\u_SPI_MASTER_CONTROL|Selector2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_CONTROL|Selector2~0_combout\ = (\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_BYTE_SEL~q\) # ((\i_MISO~input_o\ & ((\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.NEXT_BYTE_SEL~q\) # (\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.WAIT_FOR_ACK~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_MISO~input_o\,
	datab => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.NEXT_BYTE_SEL~q\,
	datac => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.WAIT_FOR_ACK~q\,
	datad => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_BYTE_SEL~q\,
	combout => \u_SPI_MASTER_CONTROL|Selector2~0_combout\);

-- Location: FF_X18_Y1_N13
\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_CONTROL|Selector2~0_combout\,
	clrn => \ALT_INV_i_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\);

-- Location: LCCOMB_X18_Y1_N4
\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~0_combout\ = (!\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0) & !\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0),
	datad => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\,
	combout => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~0_combout\);

-- Location: FF_X18_Y1_N5
\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~0_combout\,
	ena => \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0));

-- Location: LCCOMB_X18_Y1_N24
\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~2_combout\ = (!\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\ & (\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(2) $ (((\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1) & \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1),
	datab => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0),
	datac => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(2),
	datad => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\,
	combout => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~2_combout\);

-- Location: FF_X18_Y1_N25
\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~2_combout\,
	ena => \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(2));

-- Location: LCCOMB_X18_Y1_N10
\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~3_combout\ = (\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1) & (\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI~q\ & (\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0) & \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1),
	datab => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.SET_MOSI~q\,
	datac => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0),
	datad => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(2),
	combout => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~3_combout\);

-- Location: LCCOMB_X18_Y1_N2
\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~4_combout\ = (!\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\ & ((\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(3)) # (\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\,
	datac => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(3),
	datad => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~3_combout\,
	combout => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~4_combout\);

-- Location: FF_X18_Y1_N3
\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(3));

-- Location: LCCOMB_X18_Y1_N6
\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~1_combout\ = (!\u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\ & (\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0) $ (\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0),
	datac => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1),
	datad => \u_SPI_MASTER_CONTROL|w_ESTADO_ATUAL.INIT_VALUES~q\,
	combout => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~1_combout\);

-- Location: FF_X18_Y1_N7
\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT~1_combout\,
	ena => \u_SPI_MASTER_DATAPATH|u_adder|o_Sinalizador~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1));

-- Location: LCCOMB_X19_Y1_N4
\u_SPI_MASTER_DATAPATH|u_mux|o_Data~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_DATAPATH|u_mux|o_Data~0_combout\ = (!\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(3) & (\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0) $ (((\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1)) # (\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(3),
	datab => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0),
	datac => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1),
	datad => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(2),
	combout => \u_SPI_MASTER_DATAPATH|u_mux|o_Data~0_combout\);

-- Location: LCCOMB_X19_Y1_N10
\u_SPI_MASTER_DATAPATH|u_mux|o_Data~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_SPI_MASTER_DATAPATH|u_mux|o_Data~1_combout\ = ((!\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0) & (!\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1) & !\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(2)))) # (!\u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(3),
	datab => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(0),
	datac => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(1),
	datad => \u_SPI_MASTER_DATAPATH|u_adder|r_COUNT\(2),
	combout => \u_SPI_MASTER_DATAPATH|u_mux|o_Data~1_combout\);

-- Location: IOIBUF_X16_Y0_N15
\i_CLK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_CLK,
	o => \i_CLK~input_o\);

-- Location: CLKCTRL_G17
\i_CLK~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_CLK~inputclkctrl_outclk\);

-- Location: LCCOMB_X23_Y1_N24
\u_FREQUENCY_DIVIDER|temporal~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \u_FREQUENCY_DIVIDER|temporal~0_combout\ = !\u_FREQUENCY_DIVIDER|temporal~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_FREQUENCY_DIVIDER|temporal~q\,
	combout => \u_FREQUENCY_DIVIDER|temporal~0_combout\);

-- Location: FF_X23_Y1_N25
\u_FREQUENCY_DIVIDER|temporal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_CLK~inputclkctrl_outclk\,
	d => \u_FREQUENCY_DIVIDER|temporal~0_combout\,
	clrn => \ALT_INV_i_RST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_FREQUENCY_DIVIDER|temporal~q\);

ww_o_SS <= \o_SS~output_o\;

ww_o_MOSI <= \o_MOSI~output_o\;

ww_o_CLK <= \o_CLK~output_o\;
END structure;


