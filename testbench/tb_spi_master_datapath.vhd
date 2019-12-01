package mips_test_helpers_pkg is
	procedure print(arg : in string := "");
end package;

package body mips_test_helpers_pkg is
	procedure print(arg : in string := "") is
	begin
			std.textio.write(std.textio.output, arg);
	end procedure;
end mips_test_helpers_pkg;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.env.finish;
use work.mips_test_helpers_pkg.all;

entity tb_spi_master_datapath is
end;


architecture rtl of tb_spi_master_datapath is

	-- We're slowing down the clock to speed up simulation time
	constant CLOCK_FREQUENCY : integer := 1e6; -- 1Mhz
	constant CLOCK_PERIOD : time := 1000 ms / CLOCK_FREQUENCY;
	signal w_CLK 		: std_logic	:= '1';
	
	signal w_COUNTER_CLR 		: std_logic;
	signal w_COUNTER_INC 		: std_logic;
	signal w_COUNTER_LT_10 	: std_logic;
	signal w_MOSI 					: std_logic;
	signal w_BYTE_SEL 			: std_logic := '0';

	signal w_REG_DATA : std_logic_vector(15 downto 0) := x"3456";



begin
  

 	-- -- -- The Device Under Test (DUT)
	u_spi_master_datapath: entity work.spi_master_datapath(rtl)
	port map(
		i_CLK  					=>  w_CLK,
		i_COUNTER_CLR 	=>  w_COUNTER_CLR,
		i_COUNTER_INC 	=>  w_COUNTER_INC,
		i_BYTE_SEL  		=>  w_BYTE_SEL,
		o_COUNTER_LT_10	=>  w_COUNTER_LT_10,
		o_MOSI					=>  w_MOSI
	);


	-- Process for generating the clock
	w_CLK <= not w_CLK after CLOCK_PERIOD / 2;

	-- Testbench sequence
	-- Reference images/control-signals.png
	process
	begin
		
		-- Resetar contador
		w_COUNTER_CLR <= '1';
		wait until rising_edge(w_CLK);
		w_COUNTER_CLR <= '0';
		w_COUNTER_INC <= '0';

		wait until rising_edge(w_CLK);


		for i in 0 to 8 loop

			print("Test w_COUNTER_LT_10=1" & LF);
				assert w_COUNTER_LT_10 = '1'
					report "w_COUNTER_LT_10=" & to_string(w_COUNTER_LT_10) & " failed, " 
								&	"output=" & to_string(w_COUNTER_LT_10) 
								& " expected output=1" 
					severity failure;
			print("Passed!" & LF);

			w_COUNTER_INC <= '1';
			wait until rising_edge(w_CLK);

			print("Test MOSI=" & to_string(w_REG_DATA(i)) & LF);
			assert std_match(w_mosi, w_REG_DATA(i))
				report "MOSI=" & to_string(w_REG_DATA(i)) & " failed, " 
							&	"output=" & to_string(w_mosi) 
							& " expected output=" & to_string(w_REG_DATA(i))
				severity failure;
			print("Passed!" & LF);

			w_COUNTER_INC <= '0';
			wait until rising_edge(w_CLK);

		end loop;			

		-- wait for 10 ns;
		-- report "Tests: OK";
		-- finish;
		wait until rising_edge(w_CLK);

	end process;

end rtl;