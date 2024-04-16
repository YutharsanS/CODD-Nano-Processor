library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register_1 is
  port
  (
    D     : in std_logic;
    En    : in std_logic;
    Clk   : in std_logic;
    Reset : in std_logic;
    Q     : out std_logic
  );
end Register_1;

architecture Behavioral of Register_1 is

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

  DFF_0 : D_FF
  port
  map (
  D   => D,
  Res => Reset,
  Clk => regEn,
  Q   => Q,
  Qbar => open
  );

end Behavioral;