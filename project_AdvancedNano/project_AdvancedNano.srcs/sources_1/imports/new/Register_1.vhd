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

  component Mux_2_way_1
    port
    (
      A      : in std_logic;
      B      : in std_logic;
      Sel    : in std_logic;
      Output : out std_logic
    );
  end component;

  signal Q_temp  : std_logic;
  signal mux_out : std_logic;

begin

  Q <= Q_temp;

  Mux_0 : Mux_2_way_1
  port map
  (
    A      => Q_temp,
    B      => D,
    Sel    => En,
    Output => mux_out
  );

  DFF_0 : D_FF
  port
  map (
  D   => mux_out,
  Res => Reset,
  Clk => Clk,
  Q   => Q_temp,
  Qbar => open
  );

end Behavioral;