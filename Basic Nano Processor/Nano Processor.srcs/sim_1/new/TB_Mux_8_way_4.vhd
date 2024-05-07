library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux_8_way_4_tb is
end Mux_8_way_4_tb;

architecture tb of Mux_8_way_4_tb is

    component Mux_8_way_4
        port (
            D0 : in std_logic_vector(3 downto 0);
            D1 : in std_logic_vector(3 downto 0);
            D2 : in std_logic_vector(3 downto 0);
            D3 : in std_logic_vector(3 downto 0);
            D4 : in std_logic_vector(3 downto 0);
            D5 : in std_logic_vector(3 downto 0);
            D6 : in std_logic_vector(3 downto 0);
            D7 : in std_logic_vector(3 downto 0);
            Sel : in std_logic_vector(2 downto 0);
            EN : in std_logic;
            Y : out std_logic_vector(3 downto 0)
        );
    end component;

    signal D0_tb, D1_tb, D2_tb, D3_tb, D4_tb, D5_tb, D6_tb, D7_tb : std_logic_vector(3 downto 0);
    signal Sel_tb : std_logic_vector(2 downto 0);
    signal EN_tb : std_logic;
    signal Y_tb : std_logic_vector(3 downto 0);

begin

    DUT : Mux_8_way_4
    port map(
        D0 => D0_tb,
        D1 => D1_tb,
        D2 => D2_tb,
        D3 => D3_tb,
        D4 => D4_tb,
        D5 => D5_tb,
        D6 => D6_tb,
        D7 => D7_tb,
        Sel => Sel_tb,
        EN => EN_tb,
        Y => Y_tb
    );

    process
    begin

        D0_tb <= "0000";
        D1_tb <= "0001";
        D2_tb <= "0010";
        D3_tb <= "0011";
        D4_tb <= "0100";
        D5_tb <= "0101";
        D6_tb <= "0110";
        D7_tb <= "0111";


        EN_tb <= '0';

        -- Test case 1
        Sel_tb <= "010";
        wait for 50 ns;
        assert Y_tb = "0000" report "Test case 1 failed : enable off" severity error;

        EN_tb <= '1';

        -- Test case 2
        Sel_tb <= "000";
        wait for 50 ns;
        assert Y_tb = D0_tb report "Test case 2 failed" severity error;

        -- Test case 3
        Sel_tb <= "001";
        wait for 50 ns;
        assert Y_tb = D1_tb report "Test case 3 failed" severity error;

        -- Test case 4
        Sel_tb <= "010";
        wait for 50 ns;
        assert Y_tb = D2_tb report "Test case 4 failed" severity error;

        -- Test case 5
        Sel_tb <= "011";
        wait for 50 ns;
        assert Y_tb = D3_tb report "Test case 5 failed" severity error;

        -- Test case 6
        Sel_tb <= "100";
        wait for 50 ns;
        assert Y_tb = D4_tb report "Test case 6 failed" severity error;

        -- Test case 7
        Sel_tb <= "101";
        wait for 50 ns;
        assert Y_tb = D5_tb report "Test case 7 failed" severity error;

        -- Test case 8
        Sel_tb <= "110";
        wait for 50 ns;
        assert Y_tb = D6_tb report "Test case 8 failed" severity error;

        -- Test case 9
        Sel_tb <= "111";
        wait for 50 ns;
        assert Y_tb = D7_tb report "Test case 9 failed" severity error;

        wait;
    end process;

end tb;