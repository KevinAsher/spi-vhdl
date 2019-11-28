library IEEE;
use IEEE.std_logic_1164.all;

entity xor2bit is 
	port(
		i_A        : in  std_logic;
		i_B        : in  std_logic;
		o_X		  : out std_logic
	);
end xor2bit;

architecture hardware of xor2bit is
begin

	o_X <= i_A xor i_B;

end hardware;