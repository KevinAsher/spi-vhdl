library ieee;
use ieee.std_logic_1164.all;

entity tb_spi_master_top is
  port (
    o_dummy      : out std_logic
  );
end;

architecture rtl of tb_spi_master_top is

  -- We're slowing down the clock to speed up simulation time
	constant CLOCK_FREQUENCY : integer := 1e6; -- 1Mhz
	constant CLOCK_PERIOD : time := 1000 ms / CLOCK_FREQUENCY;
	signal w_CLK 		: std_logic	:= '1';
	

  signal w_RST        : std_logic;
  signal w_START      : std_logic;
  signal w_MISO       : std_logic;
  signal w_SS         : std_logic;
  signal w_MOSI       : std_logic;
  signal w_SLAVE_CLK  : std_logic;
    
begin

  u_spi_master_top: entity work.spi_master_top(rtl)
	port map(
    i_CLK   => w_CLK,
    i_RST   => w_RST,
    i_START => w_START,
    i_MISO  => w_MISO,
    o_MOSI  => w_MOSI,
    o_SS    => w_SS,
    o_CLK   => w_SLAVE_CLK
	);

  -- Process for generating the clock
  w_CLK <= not w_CLK after CLOCK_PERIOD / 2;
  

  process
  begin
    

    -- Resetar contador
		w_RST <= '1';
		wait until rising_edge(w_CLK);
    w_RST <= '0';
    w_START <= '1';
		wait until rising_edge(w_CLK);
    w_START <= '0';
    wait until rising_edge(w_CLK);
    

    -- Executar até a espera do ACK
    for i in 0 to 30 loop
      wait until rising_edge(w_CLK);
    end loop;	
    
    -- Simular erro de transmissão ACK=1
    w_MISO <= '1';
    wait until rising_edge(w_CLK);
    w_MISO <= 'Z';
    wait until rising_edge(w_CLK);

    -- Executar até a espera do ACK
    for i in 0 to 30 loop
      wait until rising_edge(w_CLK);
    end loop;	
    
    -- Simular sucesso na transmissão ACK=0
    w_MISO <= '0';
    wait until rising_edge(w_CLK);
    w_MISO <= 'Z';
    wait until rising_edge(w_CLK);

    -- Executar até a espera do ACK
    for i in 0 to 30 loop
      wait until rising_edge(w_CLK);
    end loop;	
    
    -- Simular sucesso na transmissão ACK=0
    w_MISO <= '0';
    wait until rising_edge(w_CLK);
    w_MISO <= 'Z';
    wait until rising_edge(w_CLK);
		
		wait;
	end process;
  
end rtl;