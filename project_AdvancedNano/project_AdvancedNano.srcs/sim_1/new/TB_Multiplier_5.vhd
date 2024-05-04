library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Multiplier_5 is
-- Port ( );
end TB_Multiplier_5;

architecture Behavioral of TB_Multiplier_5 is

component Multiplier_5 is
port (
    A : in std_logic_vector(4 downto 0);
    B : in std_logic_vector(4 downto 0);
    S : out std_logic_vector(4 downto 0);
    O : out std_logic; 
    Z : out std_logic; 
    N : out std_logic  
);
end component;

signal A, B, S : std_logic_vector(4 downto 0);
signal O, Z, N : std_logic;

begin

UUT : Multiplier_5
port map (
    A => A,
    B => B,
    S => S,
    O => O,
    Z => Z,
    N => N
);

process begin
    -- Note: This multiplier uses signed numbers
    A <= "10110"; 
    B <= "10111"; 
    wait for 50ns;
    assert (O = '0' and N = '0' and Z = '0') report "Test case 1 failed" severity error;

    A <= "10111"; 
    B <= "10111"; 
    wait for 50ns;
    assert (O = '0' and N = '0' and Z = '0') report "Test case 2 failed" severity error;

    A <= "10111"; 
    B <= "00000"; -- 0
    wait for 50ns;
    assert (O = '0' and N = '0' and Z = '1') report "Test case 3 failed" severity error;

    A <= "00000"; -- 0
    B <= "10111"; 
    wait for 50ns;
    assert (O = '0' and N = '0' and Z = '1') report "Test case 4 failed" severity error;

    A <= "10000"; 
    B <= "00000"; -- 0
    wait for 50ns;
    assert (O = '0' and N = '0' and Z = '1') report "Test case 5 failed" severity error;

    A <= "11000"; -- -8
    B <= "10010"; 
    wait for 50ns;
    assert (O = '0' and N = '1' and Z = '0') report "Test case 6 failed" severity error;

    A <= "10010"; 
    B <= "11000"; -- -8
    wait for 50ns;
    assert (O = '0' and N = '1' and Z = '0') report "Test case 7 failed" severity error;

    A <= "11100"; -- -4
    B <= "11110"; -- -2
    wait for 50ns;
    assert (O = '0' and N = '0' and Z = '0') report "Test case 8 failed" severity error;

    A <= "01000"; -- 8
    B <= "10010"; 
    wait for 50ns;
    assert (O = '0' and N = '0' and Z = '0') report "Test case 9 failed" severity error;

    wait;
end process;

end Behavioral;