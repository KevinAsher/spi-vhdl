library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity frequency_divider is
    generic(g_FREQ_HZ : integer);
    port (
        clk_in : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end frequency_divider;

architecture rtl of frequency_divider is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to g_FREQ_HZ-1 := 0;
begin
    frequency_divider: process (reset, clk_in) begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = g_FREQ_HZ-1) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end rtl;