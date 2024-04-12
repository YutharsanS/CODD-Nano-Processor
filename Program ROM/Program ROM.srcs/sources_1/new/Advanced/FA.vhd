library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FA is
  port
  (
    A     : in std_logic;
    B     : in std_logic;
    C_in  : in std_logic;
    S     : out std_logic;
    C_out : out std_logic);
end FA;

architecture Behavioral of FA is

  component HA
    port
    (
      A     : in std_logic;
      B     : in std_logic;
      S     : out std_logic;
      C_out : out std_logic);
  end component;

  signal HA0_S, HA0_C, HA1_C : std_logic;

begin

  HA_0 : HA
  port map
  (
    A     => A,
    B     => B,
    S     => HA0_S,
    C_out => HA0_C);

  HA_1 : HA
  port
  map(
  A     => HA0_S,
  B     => C_in,
  S     => S,
  C_out => HA1_C);

  C_out <= HA0_C or HA1_C;
end Behavioral;