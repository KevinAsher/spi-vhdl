library IEEE;
use IEEE.std_logic_1164.all;

entity paridade is 
	port(
		i_dado        : in std_logic_vector(7 downto 0);
		o_par         : out std_logic
	);
end paridade;

architecture hardware of paridade is

	component xor2bit is port
	(
		i_A        : in  std_logic;
		i_B        : in  std_logic;
		o_X		  : out std_logic
	);
	end component;

signal w_y1 : std_logic;
signal w_y2 : std_logic;
signal w_y3 : std_logic;
signal w_y4 : std_logic;
signal w_y5 : std_logic;
signal w_y6 : std_logic;
signal w_y7 : std_logic;
	
begin

	U1: xor2bit port map(
		i_dado(0),i_dado(1),w_y1
	);
	
	U2: xor2bit port map(
		i_dado(2),i_dado(3),w_y2
	);
	
	U3: xor2bit port map(
		i_dado(4),i_dado(5),w_y3
	);
	
	U4: xor2bit port map(
		i_dado(6),i_dado(7),w_y4
	);
	
	U5: xor2bit port map(
		w_y1,w_y2,w_y5
	);
	
	U6: xor2bit port map(
		w_y3,w_y4,w_y6
	);
	
	U7: xor2bit port map(
		w_y5,w_y6,w_y7
	);
	
	o_par <= not w_y7;

end hardware;