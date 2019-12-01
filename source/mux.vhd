library IEEE;
use IEEE.std_logic_1164.all;

entity mux is port
(
	i_Sel		:	in std_logic_vector(3 downto 0);	
	i_Data	:	in std_logic_vector(7 downto 0);
	i_par		:	in std_logic;
	o_Data	:	out std_logic
);
end mux;

architecture rtl of mux is
begin
o_Data <= 	i_Data(0) when i_Sel = "0000" else 
				i_Data(1) when i_Sel = "0001" else
				i_Data(2) when i_Sel = "0010" else
				i_Data(3) when i_Sel = "0011" else
				i_Data(4) when i_Sel = "0100" else
				i_Data(5) when i_Sel = "0101" else
				i_Data(6) when i_Sel = "0110" else
				i_Data(7) when i_Sel = "0111" else
				i_par     when i_Sel = "1000" else
				'Z';

end rtl;