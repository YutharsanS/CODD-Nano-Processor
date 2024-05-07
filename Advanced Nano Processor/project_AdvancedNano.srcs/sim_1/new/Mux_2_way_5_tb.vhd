library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2_way_5_tb is
end Mux_2_way_5_tb;

architecture Behavioral of Mux_2_way_5_tb is
    component Mux_2_way_5
        port (
            A      : in std_logic_vector(4 downto 0);
            B      : in std_logic_vector(4 downto 0);
            Sel    : in std_logic;
            Output : out std_logic_vector(4 downto 0)
        );
    end component;

    signal A_tb      : std_logic_vector(4 downto 0);
    signal B_tb      : std_logic_vector(4 downto 0);
    signal Sel_tb    : std_logic;
    signal Output_tb : std_logic_vector(4 downto 0);

begin
    uut : Mux_2_way_5
    port map(
        A      => A_tb,
        B      => B_tb,
        Sel    => Sel_tb,
        Output => Output_tb
    );

    stimulus_process : process
    begin
        -- Test case 1: Select input A
        A_tb  <= "10110";  -- Index1: 220038U (101101101110000110)
        B_tb  <= "01010";
        Sel_tb <= '0';
        wait for 10 ns;
        assert Output_tb = "10110" report "Test case 1 failed" severity error;

        -- Test case 2: Select input B
        A_tb  <= "11010";  -- Index2: 220404N (101101110011110100)
        B_tb  <= "00001";
        Sel_tb <= '1';
        wait for 10 ns;
        assert Output_tb = "00001" report "Test case 2 failed" severity error;

        -- Test case 3: Select input A
        A_tb  <= "00001";  -- Index3: 220681H (101101111000001001)
        B_tb  <= "01000";  -- Index4: 220738P (101101111001000010)
        Sel_tb <= '0';
        wait for 10 ns;
        assert Output_tb = "00001" report "Test case 3 failed" severity error;

        -- Test case 4: Select input B
        A_tb  <= "11111";
        B_tb  <= "00000";
        Sel_tb <= '1';
        wait for 10 ns;
        assert Output_tb = "00000" report "Test case 4 failed" severity error;

        -- Test case 5: Select input A with all ones
        A_tb  <= "11111";
        B_tb  <= "00000";
        Sel_tb <= '0';
        wait for 10 ns;
        assert Output_tb = "11111" report "Test case 5 failed" severity error;

        -- Test case 6: Select input B with all ones
        A_tb  <= "00000";
        B_tb  <= "11111";
        Sel_tb <= '1';
        wait for 10 ns;
        assert Output_tb = "11111" report "Test case 6 failed" severity error;

        -- Test case 7: Select input A with alternating bits
        A_tb  <= "10101";
        B_tb  <= "01010";
        Sel_tb <= '0';
        wait for 10 ns;
        assert Output_tb = "10101" report "Test case 7 failed" severity error;

        -- Test case 8: Select input B with alternating bits
        A_tb  <= "01010";
        B_tb  <= "10101";
        Sel_tb <= '1';
        wait for 10 ns;
        assert Output_tb = "10101" report "Test case 8 failed" severity error;

        wait;
    end process;
end Behavioral;