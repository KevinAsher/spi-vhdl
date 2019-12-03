library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity spi_master_datapath is
	 port (
    -- Inputs
    i_CLK           : in std_logic;
    i_COUNTER_CLR   : in std_logic;
    i_COUNTER_INC   : in std_logic;
		i_BYTE_SEL      : in std_logic;
		
		-- Outputs
		o_COUNTER_LT_10 : out std_logic;
		o_MOSI					: out std_logic
  );
end;


architecture rtl of spi_master_datapath is
	signal w_REG_DATA : std_logic_vector(15 downto 0) := x"3456";
	
	signal w_Reset : std_logic;
	signal w_Increment : std_logic;
	signal w_Sinalizador : std_logic;
	signal w_Contador : std_logic_vector(3 downto 0);


	signal w_mosi : std_logic;
	signal w_par  : std_logic;
	signal w_data : std_logic_vector(7 downto 0);
	signal w_BYTE_SEL : std_logic := '0';
begin
  

 	-- -- -- The Device Under Test (DUT)
	u_adder: entity work.adder(rtl)
	port map(
		i_CLK  				=>  i_CLK,
		i_Reset  			=>  i_COUNTER_CLR,
		i_Increment  	=>  i_COUNTER_INC,
		o_Sinalizador	=>  o_COUNTER_LT_10,
		o_Contador 	 	=>  w_Contador
	);

	-- -- -- The Device Under Test (DUT)
	u_mux: entity work.mux(rtl)
	port map(
		i_Sel			=>	w_Contador,
		i_Data		=>	w_data,
		i_par			=>	w_par,
		o_Data		=>	o_MOSI
	);

	-- -- The Device Under Test (DUT)
	u_paridade: entity work.paridade(rtl)
	port map(
		i_dado        => w_data,
		o_par         => w_par
	);

	
	-- The Device Under Test (DUT)
	u_register_16_bits_in_8_bits_out: entity work.register_16_bits_in_8_bits_out(rtl)
	port map(
		i_Byte_Sel  => i_BYTE_SEL,
		i_DATA 		=> w_REG_DATA,
		o_Read_DATA => w_data
	);


end rtl;