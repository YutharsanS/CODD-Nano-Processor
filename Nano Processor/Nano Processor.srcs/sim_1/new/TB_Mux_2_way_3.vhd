library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux_2_way_3_tb is
end Mux_2_way_3_tb;

architecture Behavioral of Mux_2_way_3_tb is
   component Mux_2_way_3
       port (
           A      : in std_logic_vector(2 downto 0);
           B      : in std_logic_vector(2 downto 0);
           Sel    : in std_logic;
           Output : out std_logic_vector(2 downto 0)
       );
   end component;

   signal A_tb      : std_logic_vector(2 downto 0);
   signal B_tb      : std_logic_vector(2 downto 0);
   signal Sel_tb    : std_logic;
   signal Output_tb : std_logic_vector(2 downto 0);

begin
   uut : Mux_2_way_3
   port map (
       A      => A_tb,
       B      => B_tb,
       Sel    => Sel_tb,
       Output => Output_tb
   );

   stim_proc : process
   begin
       A_tb <= "001";
       B_tb <= "110";
       Sel_tb <= '0';
       wait for 100 ns;
       assert Output_tb = "001" report "Selection failed for 0" severity error;

       Sel_tb <= '1';
       wait for 100 ns;
       assert Output_tb = "110" report "Selection failed for 1" severity error;

       A_tb <= "000";
       B_tb <= "000";
       Sel_tb <= '0';
       wait for 100 ns;
       assert Output_tb = "000" report "Selection failed for same number" severity error;

       A_tb <= "000";
       B_tb <= "000";
       Sel_tb <= '0';
       wait for 100 ns;
       assert Output_tb = "000" report "Selection failed for same number" severity error;

       A_tb <= "111";
       B_tb <= "010";
       Sel_tb <= '1';
       wait for 100 ns;
       assert Output_tb = "010" report "Selection failed for random test" severity error;

       wait;
   end process;
end Behavioral;