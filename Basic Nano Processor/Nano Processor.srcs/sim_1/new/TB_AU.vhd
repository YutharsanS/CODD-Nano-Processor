library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_SUB_tb is
end ADD_SUB_tb;

architecture tb of ADD_SUB_tb is

    component ADD_SUB
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Ctrl : in STD_LOGIC;
               C_out : out STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               V : out STD_LOGIC;
               Z : out STD_LOGIC );
    end component;

    signal A_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal B_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Ctrl_tb : STD_LOGIC;
    signal C_out_tb : STD_LOGIC;
    signal S_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal V_tb : STD_LOGIC;
    signal Z_tb : STD_LOGIC;

begin

    DUT : ADD_SUB
    port map(
        A => A_tb,
        B => B_tb,
        Ctrl => Ctrl_tb,
        C_out => C_out_tb,
        S => S_tb,
        V => V_tb,
        Z => Z_tb
    );

    process
    begin
        A_tb <= "0010";
        B_tb <= "0011";
        Ctrl_tb <= '0';
        wait for 100 ns;
        assert S_tb = "0101" and C_out_tb = '0' and V_tb = '0' and Z_tb = '0'
            report "Addition failed" severity error;

        A_tb <= "0111";
        B_tb <= "0101";
        Ctrl_tb <= '1';
        wait for 100 ns;
        assert S_tb = "0010" and C_out_tb = '1' and V_tb = '0' and Z_tb = '0'
            report "Subtraction failed" severity error;

        A_tb <= "0100";
        B_tb <= "0111";
        Ctrl_tb <= '0';
        wait for 100 ns;
        assert S_tb = "1011" and C_out_tb = '0' and V_tb = '1' and Z_tb = '0'
            report "Addition with overflow failed" severity error;

        A_tb <= "0100";
        B_tb <= "1000";
        Ctrl_tb <= '1';
        wait for 100 ns;
        assert S_tb = "1100" and C_out_tb = '0' and V_tb = '1' and Z_tb = '0'
            report "Subtraction with overflow failed" severity error;


        A_tb <= "0101";
        B_tb <= "0101";
        Ctrl_tb <= '1';
        wait for 100 ns;
        assert S_tb = "0000" and C_out_tb = '1' and V_tb = '0' and Z_tb = '1'
            report "Zero result failed" severity error;

        A_tb <= "0101";
        B_tb <= "1011";
        Ctrl_tb <= '0';
        wait for 100 ns;
        assert S_tb = "0000" and C_out_tb = '1' and V_tb = '0' and Z_tb = '1'
            report "Zero result failed" severity error;
        wait;
    end process;

end tb;