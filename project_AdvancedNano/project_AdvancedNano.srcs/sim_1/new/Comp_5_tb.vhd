library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Comp_5_tb is
--  Port ( );
end Comp_5_tb;

architecture Behavioral of Comp_5_tb is
 component Comp_5
   port
   (
     A : in std_logic_vector(4 downto 0);
     B : in std_logic_vector(4 downto 0);
     Z : out std_logic;
     N : out std_logic
   );
 end component;

 -- Inputs
 signal A_tb : std_logic_vector(4 downto 0) := "10110"; -- 22
 signal B_tb : std_logic_vector(4 downto 0) := "11100"; -- 28

 -- Outputs
 signal Z_tb : std_logic;
 signal N_tb : std_logic;

begin
 -- Instantiate the Unit Under Test (UUT)
 uut: Comp_5 port map (
   A => A_tb,
   B => B_tb,
   Z => Z_tb,
   N => N_tb
 );
 
 stim_proc: process
     begin
     
     --Index1 : 220038U - 101 10110 11100 00110
     --Index2 : 220404N - 101 10111 00111 10100
     --Index3 : 220681H - 101 10111 10000 01001
     --Index4 : 220738P - 101 10111 10010 00010
     
         -- Test case 1
         A_tb <= "00000";
         B_tb <= "00000";
         wait for 10 ns;
         assert (N_tb = '0' and Z_tb = '1') report "Test case 1 failed" severity error;
         
         -- Test case 2
         A_tb <= "11111";
         B_tb <= "00000";
         wait for 10 ns;
         assert (N_tb = '1' and Z_tb = '0') report "Test case 2 failed" severity error;
         
         -- Test case 3
         A_tb <= "11111";
         B_tb <= "11111";
         wait for 10 ns;
         assert (N_tb = '0' and Z_tb = '1') report "Test case 3 failed" severity error;
         
         -- Test case 4
         A_tb <= "01010";
         B_tb <= "10101";
         wait for 10 ns;
         assert (N_tb = '0' and Z_tb = '0') report "Test case 4 failed" severity error;
         
         -- Based on index numbers
         A_tb <= "10110";
         B_tb <= "11100";
         wait for 10 ns;
         assert (N_tb = '1' and Z_tb = '0') report "Test case 5 failed" severity error;
         
         A_tb <= "10111";
         B_tb <= "00111";
         wait for 10 ns;
         assert (N_tb = '1' and Z_tb = '0') report "Test case 6 failed" severity error;
         
         A_tb <= "00111";
         B_tb <= "10100";
         wait for 10 ns;
         assert (N_tb = '0' and Z_tb = '0') report "Test case 7 failed" severity error;
         
         A_tb <= "10111";
         B_tb <= "10000";
         wait for 10 ns;
         assert (N_tb = '0' and Z_tb = '0') report "Test case 10 failed" severity error;
         
         A_tb <= "01001";
         B_tb <= "10111";
         wait for 10 ns;
         assert (N_tb = '0' and Z_tb = '1') report "Test case 11 failed" severity error;
         
         A_tb <= "10010";
         B_tb <= "00010";
         wait for 10 ns;
         assert (N_tb = '1' and Z_tb = '0') report "Test case 12 failed" severity error;
         
         A_tb <= "00110";  
         B_tb <= "10110";
         wait for 10 ns;
         assert (N_tb = '0' and Z_tb = '0') report "Test case 13 failed" severity error;
         
         A_tb <= "10100"; 
         B_tb <= "10111";
         wait for 10 ns;
         assert (N_tb = '1' and Z_tb = '0') report "Test case 14 failed" severity error;
         
         A_tb <= "01001"; 
         B_tb <= "10111";
         wait for 10 ns;
         assert (N_tb = '0' and Z_tb = '0') report "Test case 15 failed" severity error;
         
         A_tb <= "00010";  
         B_tb <= "10111";
         wait for 10 ns;
         assert (N_tb = '0' and Z_tb = '0') report "Test case 16 failed" severity error;
         
     end process;


end Behavioral;
