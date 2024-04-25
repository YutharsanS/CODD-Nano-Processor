library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is
signal count:integer :=1;
signal clk_status:std_logic:='0';

begin
    --For "100 MHz" input clock by this it will generate "0.5 Hz" clock
    process(Clk_in) begin
        if(rising_edge(Clk_in))then
            count<=count+1;                 --increment counter for each rising edge
            if (count= 10) then               --for simulation purpose
                clk_status<=not(clk_status);--Invert clock signal(it will again invert after another 100M pulse and formed one period)
                Clk_out<=clk_status;        
                count<=1;                   --reset counter
            end if;
        end if;
    end process;

end Behavioral;
