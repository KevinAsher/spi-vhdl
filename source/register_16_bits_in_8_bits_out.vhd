library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 

entity register_16_bits_in_8_bits_out is
	
	port (
		i_Byte_Sel : in std_logic;
		
		i_DATA : in std_logic_Vector(15 downto 0);
		
		-- output
		o_Read_DATA: out std_logic_Vector(7 downto 0)
	);

end register_16_bits_in_8_bits_out;

architecture rtl of register_16_bits_in_8_bits_out is

begin 
process (i_Byte_Sel)
	begin
		
		if (i_Byte_Sel = '0') then
			o_Read_DATA <= i_DATA(15 downto 8);
		
		else 
			o_Read_DATA <= i_DATA(7 downto 0);
		
		end if;
end process;
end rtl;