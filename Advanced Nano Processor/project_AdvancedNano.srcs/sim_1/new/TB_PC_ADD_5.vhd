


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_PC_ADD_5 is
--  Port ( );
end TB_PC_ADD_5;

architecture Behavioral of TB_PC_ADD_5 is

component PC_ADD_5 is
    Port ( Adrs : in STD_LOGIC_VECTOR (4 downto 0);
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
end component;

signal  C_out : std_logic;   
signal Adrs, S : std_logic_vector(4 downto 0);
begin

UUT : PC_ADD_5
port map
(
    Adrs => Adrs,
    C_out => C_out,
    S => S
);
    process begin
    
    --Index1 : 220038U - 101 10110 11100 00110
    --Index2 : 220404N - 101 10111 00111 10100
    --Index3 : 220681H - 101 10111 10000 01001
    --Index4 : 220738P - 101 10111 10010 00010
    
        Adrs <= "00000";
        wait for 50ns;
        
        Adrs <= "00110";
        wait for 50ns;
        
        Adrs <= "00111";
        wait for 50ns;
        
        Adrs <= "00010";
        wait for 50ns;
                
        Adrs <= "01001";
        wait for 50ns;
                
        Adrs <= "10111";
        wait for 50ns;
        
        Adrs <= "11111";
        wait for 50ns;
    
        wait;
    end process;
end Behavioral;
