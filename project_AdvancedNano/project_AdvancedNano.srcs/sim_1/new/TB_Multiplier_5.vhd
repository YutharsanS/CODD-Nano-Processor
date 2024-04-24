----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2024 03:13:41 PM
-- Design Name: 
-- Module Name: TB_Multiplier_5 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Multiplier_5 is
--  Port ( );
end TB_Multiplier_5;

architecture Behavioral of TB_Multiplier_5 is

component Multiplier_5 is
  port
  (
    A : in  std_logic_vector(4 downto 0);
    B : in  std_logic_vector(4 downto 0);
    S : out std_logic_vector(4 downto 0);
    O : out std_logic;
    Z : out std_logic;
    N : out std_logic
  );
end component;

signal A, B, S : std_logic_vector(4 downto 0);
signal O, Z, N : std_logic;

begin

UUT : Multiplier_5
port map
(
    A => A,
    B => B,
    S => S,
    O => O,
    Z => Z,
    N => N               
);

process begin
    A <= "00000"; --0
    B <= "00000"; --0 
    wait for 50ns;
    
    A <= "00001"; --1
    B <= "00000"; --0
    wait for 50ns;
    
    A <= "00000"; --0
    B <= "00001"; --1
    wait for 50ns;
    
    A <= "10000"; --0
    B <= "00000"; --1
    wait for 50ns;
    
    A <= "11000"; --(-8)
    B <= "00010"; --2
    wait for 50ns;
   
    A <= "00010"; --2
    B <= "11000"; --(-8)
    wait for 50ns;
    
    A <= "11100"; --(-4)
    B <= "11110"; --(-2)
    wait for 50ns;
    
    A <= "01000"; --8
    B <= "00010"; --2
    wait for 50ns;
    
    wait;
end process;

end Behavioral;
