library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Slow_Clk_tb is
end Slow_Clk_tb;

architecture Behavioral of Slow_Clk_tb is
    
    component Slow_Clk
        Port ( Clk_in  : in  STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;
    
    signal Clk_in  : STD_LOGIC := '0';
    
    signal Clk_out : STD_LOGIC;

    -- Clock period
    constant period : time := 10 ns;

begin
    
    Clk_in <= not Clk_in after period/2;
    
    uut : Slow_Clk port map (
        Clk_in  => Clk_in,
        Clk_out => Clk_out
    );


    process
    begin

        wait for 10 * period;


        assert Clk_out = '0' report "Clk_out = 0" severity error;


        wait for 100 * period;


        assert Clk_out = '1' report "Clk_out = 1" severity error;


        wait for 200 * period;


        assert Clk_out = '0' report "Clk_out = 0" severity error;

        wait; 
    end process;
end Behavioral;