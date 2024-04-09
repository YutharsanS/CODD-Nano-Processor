library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_FF is
  port
  (
    D    : in std_logic;
    Res  : in std_logic;
    Clk  : in std_logic;
    Q    : out std_logic;
    Qbar : out std_logic);
end D_FF;

architecture Behavioral of D_FF is

begin

  process (Clk) is
  begin

    if rising_edge(Clk) then
      if Res = '1' then
        Q    <= '0';
        Qbar <= '1';
      else
        Q    <= D;
        Qbar <= not D;
      end if;
    end if;

  end process;

end Behavioral;