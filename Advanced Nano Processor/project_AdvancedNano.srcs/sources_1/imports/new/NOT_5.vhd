library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity NOT_5 is
  port
  (
    A : in std_logic_vector(4 downto 0);
    S : out std_logic_vector(4 downto 0);
    Z : out std_logic
  );
end NOT_5;

architecture Behavioral of NOT_5 is
begin

  S <= not A;
  Z <= (A(4) or A(3) or A(2) or A(1) or A(0));

end Behavioral;