library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Mux_8_way_5_tb is
end Mux_8_way_5_tb;

architecture Behavioral of Mux_8_way_5_tb is
    -- Component declaration
    component Mux_8_way_5
        port (
            D0 : in std_logic_vector(4 downto 0);
            D1 : in std_logic_vector(4 downto 0);
            D2 : in std_logic_vector(4 downto 0);
            D3 : in std_logic_vector(4 downto 0);
            D4 : in std_logic_vector(4 downto 0);
            D5 : in std_logic_vector(4 downto 0);
            D6 : in std_logic_vector(4 downto 0);
            D7 : in std_logic_vector(4 downto 0);
            Sel : in std_logic_vector(2 downto 0);
            EN : in std_logic;
            Y : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Signals
    signal D0_tb : std_logic_vector(4 downto 0);
    signal D1_tb : std_logic_vector(4 downto 0);
    signal D2_tb : std_logic_vector(4 downto 0);
    signal D3_tb : std_logic_vector(4 downto 0);
    signal D4_tb : std_logic_vector(4 downto 0);
    signal D5_tb : std_logic_vector(4 downto 0);
    signal D6_tb : std_logic_vector(4 downto 0);
    signal D7_tb : std_logic_vector(4 downto 0);
    signal Sel_tb : std_logic_vector(2 downto 0);
    signal EN_tb : std_logic;
    signal Y_tb : std_logic_vector(4 downto 0);

begin
    -- Instantiate the Mux_8_way_5 module
    UUT : Mux_8_way_5
        port map (
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

    -- Test cases
    process
    begin
        -- Test case 1: Select D0 when Sel = "000"
        D0_tb <= "10110"; 
        D1_tb <= "10111";
        D2_tb <= "00111";
        D3_tb <= "10100";
        D4_tb <= "10111";
        D5_tb <= "10000";
        D6_tb <= "01001";
        D7_tb <= "10111";
        Sel_tb <= "000";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = "10110" report "Test case 1 failed" severity error;

        -- Test case 2: Select D1 when Sel = "001"
        D0_tb <= "10110";
        D1_tb <= "10111";
        D2_tb <= "00111";
        D3_tb <= "10100";
        D4_tb <= "10111";
        D5_tb <= "10000";
        D6_tb <= "01001";
        D7_tb <= "10111";
        Sel_tb <= "001";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = "10111" report "Test case 2 failed" severity error;

        -- Test case 3: Select D2 when Sel = "010"
        D0_tb <= "10110";
        D1_tb <= "10111";
        D2_tb <= "00111"; 
        D3_tb <= "10100";
        D4_tb <= "10111";
        D5_tb <= "10000";
        D6_tb <= "01001";
        D7_tb <= "10111";
        Sel_tb <= "010";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = "00111" report "Test case 3 failed" severity error;

        -- Test case 4: Select D3 when Sel = "011"
        D0_tb <= "10110";
        D1_tb <= "10111";
        D2_tb <= "00111";
        D3_tb <= "10100"; 
        D4_tb <= "10111";
        D5_tb <= "10000";
        D6_tb <= "01001";
        D7_tb <= "10111";
        Sel_tb <= "011";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = "10100" report "Test case 4 failed" severity error;

        -- Test case 5: Select D4 when Sel = "100"
        D0_tb <= "10110";
        D1_tb <= "10111";
        D2_tb <= "00111";
        D3_tb <= "10100";
        D4_tb <= "10111";
        D5_tb <= "10000";
        D6_tb <= "01001";
        D7_tb <= "10111";
        Sel_tb <= "100";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = "10111" report "Test case 5 failed" severity error;
        
        -- Test case 6: Select D5 when Sel = "101"
        D0_tb <= "10110";
        D1_tb <= "10111";
        D2_tb <= "00111";
        D3_tb <= "10100";
        D4_tb <= "10111";
        D5_tb <= "10000";
        D6_tb <= "01001";
        D7_tb <= "10111";
        Sel_tb <= "101";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = "10000" report "Test case 6 failed" severity error;
        
        -- Test case 7: Select D6 when Sel = "110"
        D0_tb <= "10110";
        D1_tb <= "10111";
        D2_tb <= "00111";
        D3_tb <= "10100";
        D4_tb <= "10111";
        D5_tb <= "10000";
        D6_tb <= "01001";
        D7_tb <= "10111";
        Sel_tb <= "110";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = "01001" report "Test case 7 failed" severity error;
        
        -- Test case 8: Select D7 when Sel = "111"
        D0_tb <= "10110";
        D1_tb <= "10111";
        D2_tb <= "00111";
        D3_tb <= "10100";
        D4_tb <= "10111";
        D5_tb <= "10000";
        D6_tb <= "01001";
        D7_tb <= "10111";
        Sel_tb <= "111";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = "10010" report "Test case 8 failed" severity error;
        
        -- Test case 9:
        D0_tb <= "10110";  -- Index1: 220038U (101101101110000110)
        D1_tb <= "11010";  -- Index2: 220404N (101101110011110100)
        D2_tb <= "00001";  -- Index3: 220681H (101101111000001001)
        D3_tb <= "01000";  -- Index4: 220738P (101101111001000010)
        D4_tb <= "11111";
        D5_tb <= "00000";
        D6_tb <= "10101";
        D7_tb <= "01010";
        Sel_tb <= "000";
        EN_tb <= '1';
        wait for 10 ns;
        assert Y_tb = "10110" report "Test case 1 failed" severity error;

        -- Test case 2: Select D4 when Sel = "100" and EN = '1'
        Sel_tb <= "100";
        wait for 10 ns;
        assert Y_tb = "11111" report "Test case 2 failed" severity error;

        -- Test case 3: Select D7 when Sel = "111" and EN = '1'
        Sel_tb <= "111";
        wait for 10 ns;
        assert Y_tb = "01010" report "Test case 3 failed" severity error;

        -- Test case 4: Output should be all zeros when EN = '0'
        EN_tb <= '0';
        wait for 10 ns;
        assert Y_tb = "00000" report "Test case 4 failed" severity error;


        report "All test cases passed";
        wait;
    end process;
end Behavioral;
