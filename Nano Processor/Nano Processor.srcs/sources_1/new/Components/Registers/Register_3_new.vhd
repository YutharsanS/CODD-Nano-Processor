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

  component D_FF
    port
    (
      D    : in std_logic;
      Res  : in std_logic;
      Clk  : in std_logic;
      Q    : out std_logic;
      Qbar : out std_logic);
  end component;


  signal regEn : std_logic;

begin

  regEn <= Clk and En;

  D_FF_0 : D_FF
  port map
  (
    D    => D(0),
    Res  => Reset,
    Clk  => regEn,
    Q    => Q(0),
    Qbar => open
  );

  D_FF_1 : D_FF
  port
  map
  (
  D    => D(1),
  Res  => Reset,
  Clk  => regEn,
  Q    => Q(1),
  Qbar => open
  );

  D_FF_2 : D_FF
  port
  map
  (
  D    => D(2),
  Res  => Reset,
  Clk  => regEn,
  Q    => Q(2),
  Qbar => open
  );

end Behavioral;