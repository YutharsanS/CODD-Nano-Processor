library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Comp_1 is
  port
  (
    A    : in std_logic;
    B    : in std_logic;
    Zin  : in std_logic;
    Nin  : in std_logic;
    Zout : out std_logic;
    Nout : out std_logic
  );
end Comp_1;

architecture Behavioral of Comp_1 is

  
begin

  Zout <= Zin and ((A and B) or ((not A) and (not B)));
  Nout <= (Nin or Zin) and ((not A) and B);

end Behavioral;