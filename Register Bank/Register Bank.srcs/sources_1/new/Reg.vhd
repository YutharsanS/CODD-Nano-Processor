library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Reg is
  port
  (
    D   : in std_logic_vector(3 downto 0);
    En  : in std_logic;
    Clk : in std_logic;
    Q   : out std_logic_vector(3 downto 0)
  );
end Reg;

architecture Behavioral of Reg is

begin

  process (Clk) begin
    if (rising_edge(Clk)) then
      if EN = '1' then
        Q <= D;
      end if;
    end if;
  end process;

end Behavioral;