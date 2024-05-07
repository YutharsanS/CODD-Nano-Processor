library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OR_5 is
  port
  (
    A : in std_logic_vector(4 downto 0);
    B : in std_logic_vector(4 downto 0);
    S : out std_logic_vector(4 downto 0);
    Z : out std_logic
  );
end OR_5;

architecture Behavioral of OR_5 is
begin

  S <= A or B;
  Z <= (A(4) or A(3) or A(2) or A(1) or A(0)) nor (B(4) or B(3) or B(2) or B(1) or B(0));

end Behavioral;