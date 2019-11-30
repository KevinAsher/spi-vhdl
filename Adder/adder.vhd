LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY adder IS PORT (
	i_CLK : IN std_logic;
	i_Reset : IN std_logic;
	i_Increment : IN std_logic;
	o_Sinalizador : OUT std_logic := '0';
	o_Contador : OUT std_logic_vector(3 DOWNTO 0)
);
END adder;

ARCHITECTURE hardware OF adder IS	
	signal r_COUNT : integer range 0 to 8 := 0;

BEGIN

	PROCESS (i_CLK, i_Reset, i_Increment)
	BEGIN	
		IF (rising_edge(i_CLK) and i_Increment = '1') THEN
			if (r_COUNT < 8) then
				r_COUNT <= r_COUNT + 1 ;
			end if;
			
			if (r_COUNT = 8) then
				r_COUNT <= 0;
			end if;
			
			if (i_Reset = '1') then
				o_Sinalizador <= '0';
				r_COUNT <= 0;
			end if;			
		END IF;
				o_contador <= std_logic_vector(to_unsigned(r_COUNT, 4));
	END PROCESS;

END hardware;