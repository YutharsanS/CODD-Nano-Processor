library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_5_tb is
end Register_5_tb;

architecture Behavioral of Register_5_tb is
    component Register_5
        port (
            D     : in std_logic_vector(4 downto 0);
            En    : in std_logic;
            Clk   : in std_logic;
            Reset : in std_logic;
            Q     : out std_logic_vector(4 downto 0)
        );
    end component;

    signal D_tb     : std_logic_vector(4 downto 0);
    signal En_tb    : std_logic;
    signal Clk_tb   : std_logic;
    signal Reset_tb : std_logic;
    signal Q_tb     : std_logic_vector(4 downto 0);

    constant clock_period : time := 10 ns;

begin
    uut : Register_5
    port map(
        D     => D_tb,
        En    => En_tb,
        Clk   => Clk_tb,
        Reset => Reset_tb,
        Q     => Q_tb
    );

    clock_process : process
    begin
        Clk_tb <= '0';
        wait for clock_period / 2;
        Clk_tb <= '1';
        wait for clock_period / 2;
    end process;

    stimulus_process : process
    begin
        -- Test case 1: Index1 - 220038U (101101101110000110)
        D_tb     <= "01101";
        En_tb    <= '1';
        Reset_tb <= '0';
        wait for clock_period;
        assert Q_tb = "01101" report "Test case 1 failed" severity error;

        -- Test case 2: Index2 - 220404N (101101110011110100)
        D_tb     <= "11010";
        En_tb    <= '1';
        Reset_tb <= '0';
        wait for clock_period;
        assert Q_tb = "11010" report "Test case 2 failed" severity error;

        -- Test case 3: Index3 - 220681H (101101111000001001)
        D_tb     <= "00001";
        En_tb    <= '1';
        Reset_tb <= '0';
        wait for clock_period;
        assert Q_tb = "00001" report "Test case 3 failed" severity error;

        -- Test case 4: Index4 - 220738P (101101111001000010)
        D_tb     <= "01000";
        En_tb    <= '1';
        Reset_tb <= '0';
        wait for clock_period;
        assert Q_tb = "01000" report "Test case 4 failed" severity error;

        -- Reset test case
        Reset_tb <= '1';
        wait for clock_period;
        assert Q_tb = "00000" report "Reset test case failed" severity error;

        wait;
    end process;
end Behavioral;