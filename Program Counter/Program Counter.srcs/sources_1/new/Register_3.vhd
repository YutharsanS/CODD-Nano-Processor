library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register_3 is
  port
  (
    D     : in std_logic_vector(2 downto 0);
    En    : in std_logic;
    Clk   : in std_logic;
    Reset : in std_logic;
    Q     : out std_logic_vector(2 downto 0)
  );
end Register_3;

architecture Behavioral of Register_3 is

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

signal Q_temp : std_logic_vector(2 downto 0);

begin

  Reg_0 : Register_1
  port map
  (
    D     => D(0),
    En    => En,
    Clk   => Clk,
    Reset => Reset,
    Q     => Q_temp(0)
  );

  Reg_1 : Register_1
  port map
  (
  D     => D(1),
  En    => En,
  Clk   => Clk,
  Reset => Reset,
  Q     => Q_temp(1)
  );

  Reg_2 : Register_1
  port map
  (
  D     => D(2),
  En    => En,
  Clk   => Clk,
  Reset => Reset,
  Q     => Q_temp(2)
  );

  Q <= Q_temp;

end Behavioral;