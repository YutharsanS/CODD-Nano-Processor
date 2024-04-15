library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity HA is
  port
  (
    A     : in std_logic;
    B     : in std_logic;
    S     : out std_logic;
    C_out : out std_logic);
end HA;

architecture Behavioral of HA is

begin

  C_out <= A and B;
  S     <= A xor B;

end Behavioral;