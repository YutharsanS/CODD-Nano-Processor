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
  signal Q_reg    : std_logic := '0';
  signal Qbar_reg : std_logic := '1';
begin

  process (Clk) is
  begin

    if rising_edge(Clk) then
      if Res = '1' then
        Q_reg    <= '0';
        Qbar_reg <= '1';
      else
        Q_reg    <= D;
        Qbar_reg <= not D;
      end if;
    end if;
  end process;

  Q    <= Q_reg;
  Qbar <= Qbar_reg;

end Behavioral;