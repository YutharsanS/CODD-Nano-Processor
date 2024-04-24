----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2024 12:33:05 PM
-- Design Name: 
-- Module Name: TB_Register_1 - Behavioral
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

entity TB_Register_1 is
--  Port ( );
end TB_Register_1;

architecture Behavioral of TB_Register_1 is

component Register_1 
  port
  (
    D     : in std_logic;
    En    : in std_logic;
    Clk   : in std_logic;
    Reset : in std_logic;
    Q     : out std_logic
  );
end component;
signal D, En, Reset, Q : std_logic;
signal Clk : std_logic := '0';
constant period : time := 40ns;

begin

  Clk <= (not Clk) after period/2;
  
  UUT : Register_1
  port map(
    D => D,
    En => En,
    Clk => Clk,
    Reset => Reset,
    Q => Q
  );
  
  process begin
    Reset <= '0';
    En <='0';
    D <= '0';
    wait for period;
    
    En <='0';
    D <= '1';
    wait for period;
        
    En <='1';
    D <= '0';
    wait for period;
            
    En <='1';
    D <= '1';
    wait for period;
    
    En <='0';
    D <= '0';
    wait for period;
    
    Reset <= '1';
    wait for period;
    
    wait;
  
  end process;

end Behavioral;
