library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Mux_2_way_5_tb is
end Mux_2_way_5_tb;

architecture Behavioral of Mux_2_way_5_tb is
    -- Component declaration
    component Mux_2_way_5
        port (
            A      : in std_logic_vector(4 downto 0);
            B      : in std_logic_vector(4 downto 0);
            Sel    : in std_logic;
            Output : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Signals
    signal A_tb      : std_logic_vector(4 downto 0);
    signal B_tb      : std_logic_vector(4 downto 0);
    signal Sel_tb    : std_logic;
    signal Output_tb : std_logic_vector(4 downto 0);

begin
    -- Instantiate the Mux_2_way_5 module
    UUT : Mux_2_way_5
    port map (
        A      => A_tb,
        B      => B_tb,
        Sel    => Sel_tb,
        Output => Output_tb
    );

    -- Test cases
    process
    begin
        -- Test case 1: Select A when Sel = '0'
        A_tb <= "01010";
        B_tb <= "10101";
        Sel_tb <= '0';
        wait for 10 ns;
        assert Output_tb = "01010" report "Test case 1 failed" severity error;

        -- Test case 2: Select B when Sel = '1'
        A_tb <= "01010";
        B_tb <= "10101";
        Sel_tb <= '1';
        wait for 10 ns;
        assert Output_tb = "10101" report "Test case 2 failed" severity error;

        report "All test cases passed";
        wait;
    end process;
end Behavioral;
