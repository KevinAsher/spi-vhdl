library ieee;
use ieee.std_logic_1164.all;

entity spi_master_top is
  port (
    -- Inputs
    i_CLK     : in std_logic;
    i_RST     : in std_logic;
    i_START   : in std_logic;
    i_MISO    : in std_logic;

    -- Outputs
    o_SS      : out std_logic;
    o_MOSI    : out std_logic;
    o_CLK     : out std_logic
  );
end;

architecture rtl of spi_master_top is


  signal w_ACK           : std_logic;
  
	signal w_COUNTER_CLR 		: std_logic;
	signal w_COUNTER_INC 		: std_logic;
	signal w_COUNTER_LT_10 	: std_logic;
	signal w_MOSI 					: std_logic;
  signal w_BYTE_SEL 			: std_logic := '0';
  
begin

  u_spi_master_control: entity work.spi_master_control(rtl)
	port map(
    i_CLK  					=>  i_CLK,
    i_RST           =>  i_RST,
    i_START         =>  i_START,
    i_ACK           =>  i_MISO,
    o_SS            =>  o_SS,
		i_COUNTER_LT_10	=>  w_COUNTER_LT_10,
		o_COUNTER_CLR 	=>  w_COUNTER_CLR,
		o_COUNTER_INC 	=>  w_COUNTER_INC,
		o_BYTE_SEL  		=>  w_BYTE_SEL  
	);


  u_spi_master_datapath: entity work.spi_master_datapath(rtl)
	port map(
		i_CLK  					=>  i_CLK,
		i_COUNTER_CLR 	=>  w_COUNTER_CLR,
		i_COUNTER_INC 	=>  w_COUNTER_INC,
		i_BYTE_SEL  		=>  w_BYTE_SEL,
		o_COUNTER_LT_10	=>  w_COUNTER_LT_10,
		o_MOSI					=>  o_MOSI
  );

  u_FREQUENCY_DIVIDER: entity work.frequency_divider(rtl)
  generic map(g_FREQ_HZ => 1) -- 1 -> twice as slower
	port map(
		clk_in => i_CLK,
		reset => i_RST,
    clk_out => o_CLK
  );

  
  

  
    
end rtl;