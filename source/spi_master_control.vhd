library ieee;
use ieee.std_logic_1164.all;

entity spi_master_control is
  port (
    -- Inputs
    i_CLK           : in std_logic;
    i_RST           : in std_logic;
    i_START         : in std_logic;

    i_ACK           : in std_logic;
    i_COUNTER_LT_10 : in std_logic;

    -- Outputs
    o_SS            : out std_logic;
    o_COUNTER_CLR   : out std_logic;
    o_COUNTER_INC   : out std_logic;
    -- o_MOSI_LD       : out std_logic;
    o_BYTE_SEL      : out std_logic
  );
end;

architecture rtl of spi_master_control is

-- Estados da FSM
	type t_ESTADO is ( INIT, INIT_BYTE_SEL, INIT_VALUES, SET_MOSI_LOOP, SET_MOSI, WAIT_FOR_ACK, NEXT_BYTE_SEL, END_TX);
  
  signal w_ESTADO_ATUAL   : t_ESTADO;
  signal w_PROXIMO_ESTADO : t_ESTADO;
  signal w_SHOULD_END_TX  : std_logic := 'Z';
  signal w_START_TX       : std_logic := '0';
  signal w_BYTE_SEL       : std_logic := '0';

begin

  p_ESTADOS : process (i_CLK, i_RST)
  begin
    if (i_RST = '1') then
      w_ESTADO_ATUAL <= INIT;            -- idle, or first state
    elsif (rising_edge(i_CLK)) then
      w_ESTADO_ATUAL <= w_PROXIMO_ESTADO;
  end if;
  end process;


  -- only state transitions, no outputs setting
  p_next_state : process (w_ESTADO_ATUAL, i_START, i_ACK, i_COUNTER_LT_10)
  begin
    case (w_ESTADO_ATUAL) is
      when INIT =>
        if(i_START = '1') then
          w_PROXIMO_ESTADO <= INIT_BYTE_SEL;
        else
          w_PROXIMO_ESTADO <= INIT;
        end if;

      when INIT_BYTE_SEL =>
        w_PROXIMO_ESTADO <= INIT_VALUES;
        
      when INIT_VALUES =>
        w_PROXIMO_ESTADO <= SET_MOSI_LOOP;
        
      when SET_MOSI_LOOP =>
        if (i_COUNTER_LT_10 = '1') then
          w_PROXIMO_ESTADO <= SET_MOSI;
        else
          w_PROXIMO_ESTADO <= WAIT_FOR_ACK;
        end if;
      
      when SET_MOSI =>
          w_PROXIMO_ESTADO <= SET_MOSI_LOOP;
       
      WHEN WAIT_FOR_ACK =>
        if (i_ACK = 'Z') then
          w_PROXIMO_ESTADO <= WAIT_FOR_ACK;
        elsif (i_ACK = '1') then
          w_PROXIMO_ESTADO <= INIT_VALUES;
        elsif (i_ACK = '0') then
          w_PROXIMO_ESTADO <= NEXT_BYTE_SEL;
        end if;
        
      WHEN NEXT_BYTE_SEL =>
        if (w_SHOULD_END_TX = '1') then
          w_PROXIMO_ESTADO <= END_TX;
        else
          w_PROXIMO_ESTADO <= INIT_VALUES;
        end if;
        
      WHEN END_TX =>
        w_PROXIMO_ESTADO <= INIT; -- i_START must be a single pulse, otherwise the whole system loops forever
      
    end case;
  end process;
    
    -- Send bit to slave
    w_START_TX <=  '1' when  w_ESTADO_ATUAL = INIT_BYTE_SEL else w_START_TX;

    -- Select Slave
    o_SS <= '0' when w_START_TX = '1' and w_SHOULD_END_TX = '0' else '1'; -- slave is "selected" at LOW

    -- Start loading bits to MOSI
    -- o_MOSI_LD <= w_START_TX;

    -- Clear counter
    o_COUNTER_CLR <= '1' when w_ESTADO_ATUAL = INIT_VALUES else '0';
    
    -- Increment counter
    o_COUNTER_INC <= '1' when w_ESTADO_ATUAL = SET_MOSI else '0';

    -- Select byte
    w_BYTE_SEL <= '1' when w_ESTADO_ATUAL = NEXT_BYTE_SEL else w_BYTE_SEL;
    o_BYTE_SEL <= w_BYTE_SEL; 

    -- If already processed last byte successfully, then signal transmission end;
    w_SHOULD_END_TX <= '1' when w_BYTE_SEL = '1' and i_ACK = '0' else '0';
    
end rtl;