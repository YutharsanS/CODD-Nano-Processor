----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2024 01:28:11 PM
-- Design Name: 
-- Module Name: TB_PC_ADD_5 - Behavioral
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

entity TB_PC_ADD_5 is
--  Port ( );
end TB_PC_ADD_5;

architecture Behavioral of TB_PC_ADD_5 is

component PC_ADD_5 is
    Port ( Adrs : in STD_LOGIC_VECTOR (4 downto 0);
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
end component;

signal  C_out : std_logic;   
signal Adrs, S : std_logic_vector(4 downto 0);
begin

UUT : PC_ADD_5
port map
(
    Adrs => Adrs,
    C_out => C_out,
    S => S
);
    process begin
        Adrs <= "00000";
        wait for 50ns;
        
        Adrs <= "00001";
        wait for 50ns;
        
        Adrs <= "00011";
        wait for 50ns;
        
        Adrs <= "00100";
        wait for 50ns;
                
        Adrs <= "00101";
        wait for 50ns;
                
        Adrs <= "00111";
        wait for 50ns;
        
        Adrs <= "11111";
        wait for 50ns;
    
        wait;
    end process;
end Behavioral;
