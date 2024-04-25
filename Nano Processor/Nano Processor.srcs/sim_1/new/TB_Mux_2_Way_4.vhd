library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux_2_way_4_tb is
end Mux_2_way_4_tb;

architecture Behavioral of Mux_2_way_4_tb is
    component Mux_2_way_4
        port (
            A      : in std_logic_vector(3 downto 0);
            B      : in std_logic_vector(3 downto 0);
            Sel    : in std_logic;
            Output : out std_logic_vector(3 downto 0)
        );
    end component;

    signal A_tb      : std_logic_vector(3 downto 0);
    signal B_tb      : std_logic_vector(3 downto 0);
    signal Sel_tb    : std_logic;
    signal Output_tb : std_logic_vector(3 downto 0);

begin
    UUT : Mux_2_way_4
    port map (
        A      => A_tb,
        B      => B_tb,
        Sel    => Sel_tb,
        Output => Output_tb
    );

    stimulus_process : process
    begin

        A_tb <= "0101";
        B_tb <= "1010";
        Sel_tb <= '0';
        wait for 100 ns;
        assert Output_tb = "0101" report "Selection failed for 0"  severity error;


        Sel_tb <= '1';
        wait for 100 ns;
        assert Output_tb = "1010" report "Selection failed for 1"  severity error;


       A_tb <= "1111";
       B_tb <= "1111";
       Sel_tb <= '0';
       wait for 100 ns;
       assert Output_tb = "1111" report "Selection failed for same number" severity error;

       A_tb <= "1111";
       B_tb <= "1111";
       Sel_tb <= '1';
       wait for 100 ns;
       assert Output_tb = "1111" report "Selection failed for same number" severity error;


        A_tb <= "1011";
        B_tb <= "0000";
        Sel_tb <= '0';
        wait for 100 ns;
        assert Output_tb = "1011" report "Selection failed for random test" severity error;

        wait;
    end process;
end Behavioral;