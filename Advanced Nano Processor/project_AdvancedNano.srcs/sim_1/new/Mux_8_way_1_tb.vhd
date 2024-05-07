library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8_way_1_tb is
end Mux_8_way_1_tb;

architecture Behavioral of Mux_8_way_1_tb is
    component Mux_8_way_1
        Port (
            Sel : in STD_LOGIC_VECTOR (2 downto 0);
            D : in STD_LOGIC_VECTOR (7 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal Sel_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal D_tb : STD_LOGIC_VECTOR (7 downto 0);
    signal EN_tb : STD_LOGIC;
    signal Y_tb : STD_LOGIC;

begin
    uut : Mux_8_way_1
    port map(
        Sel => Sel_tb,
        D => D_tb,
        EN => EN_tb,
        Y => Y_tb
    );

    stimulus_process : process
    begin
        -- Test case 1: Select D(0) when Sel = "000" and EN = '1'
        D_tb <= "10110111";
        Sel_tb <= "000";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = '1' report "Test case 1 failed" severity error;

        -- Test case 2: Select D(4) when Sel = "100" and EN = '1'
        D_tb <= "00001011";
        Sel_tb <= "100";
        wait for 10 ns;
        assert Y_tb = '0' report "Test case 2 failed" severity error;

        -- Test case 3: Select D(7) when Sel = "111" and EN = '1'
        D_tb <= "11110000";
        Sel_tb <= "111";
        wait for 10 ns;
        assert Y_tb = '1' report "Test case 3 failed" severity error;

        -- Test case 4: Output should be '0' when EN = '0'
        EN_tb <= '0';
        wait for 10 ns;
        assert Y_tb = '0' report "Test case 4 failed" severity error;
        
        -- Test case 5: Select D(0) when Sel = "000" and EN = '1'
        D_tb <= "10110111";  -- Index1: 220038U (101101101110000110)
        Sel_tb <= "000";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = '1' report "Test case 1 failed" severity error;

        -- Test case 6: Select D(4) when Sel = "100" and EN = '1'
        D_tb <= "00001011";  -- Index2: 220404N (101101110011110100)
        Sel_tb <= "100";
        wait for 10 ns;
        assert Y_tb = '1' report "Test case 2 failed" severity error;

        -- Test case 7: Select D(7) when Sel = "111" and EN = '1'
        D_tb <= "11110000";  -- Index3: 220681H (101101111000001001), Index4: 220738P (101101111001000010)
        Sel_tb <= "111";
        wait for 10 ns;
        assert Y_tb = '0' report "Test case 3 failed" severity error;

        -- Test case 8: Output should be '0' when EN = '0'
        EN_tb <= '0';
        wait for 10 ns;
        assert Y_tb = '0' report "Test case 4 failed" severity error;


        wait;
    end process;
end Behavioral;