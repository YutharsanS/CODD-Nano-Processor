library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_SUB_tb is
end ADD_SUB_tb;

architecture Behavioral of ADD_SUB_tb is

component ADD_SUB
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Ctrl : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           V : out STD_LOGIC;
           Z : out STD_LOGIC );
end component;

signal A_tb, B_tb : STD_LOGIC_VECTOR (3 downto 0);
signal Ctrl_tb : STD_LOGIC;
signal C_out_tb, V_tb, Z_tb : STD_LOGIC;
signal S_tb : STD_LOGIC_VECTOR (3 downto 0);

begin

DUT: ADD_SUB
    port map (
        A => A_tb,
        B => B_tb,
        Ctrl => Ctrl_tb,
        C_out => C_out_tb,
        S => S_tb,
        V => V_tb,
        Z => Z_tb
    );

stimulus: process
begin
    -- Test case 1: Addition
    A_tb <= "0101";
    B_tb <= "0011";
    Ctrl_tb <= '0';
    wait for 50 ns;
    assert S_tb = "1000" and C_out_tb = '0' and V_tb = '0' and Z_tb = '0'
        report "Test case 1 failed" severity error;

    -- Test case 2: Subtraction
    A_tb <= "1010";
    B_tb <= "0101";
    Ctrl_tb <= '1';
    wait for 50 ns;
    assert S_tb = "0101" and C_out_tb = '0' and V_tb = '0' and Z_tb = '0'
        report "Test case 2 failed" severity error;

    -- Test case 3: Overflow
    A_tb <= "0111";
    B_tb <= "0001";
    Ctrl_tb <= '0';
    wait for 50 ns;
    assert S_tb = "1000" and C_out_tb = '0' and V_tb = '1' and Z_tb = '0'
        report "Test case 3 failed" severity error;

    -- Test case 4: Zero
    A_tb <= "1010";
    B_tb <= "1010";
    Ctrl_tb <= '1';
    wait for 50 ns;
    assert S_tb = "0000" and C_out_tb = '0' and V_tb = '0' and Z_tb = '1'
        report "Test case 4 failed" severity error;

    report "Testbench completed successfully";
    wait; -- Wait forever
end process;

end Behavioral;