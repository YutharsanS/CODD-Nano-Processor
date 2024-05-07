library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register_5 is
  port
  (
    D     : in std_logic_vector(4 downto 0);
    En    : in std_logic;
    Clk   : in std_logic;
    Reset : in std_logic;
    Q     : out std_logic_vector(4 downto 0)
  );
end Register_5;

architecture Behavioral of Register_5 is

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


begin

  Reg_0 : Register_1
  port map
  (
    D     => D(0),
    En    => En,
    Clk   => Clk,
    Reset => Reset,
    Q     => Q(0)
  );

  Reg_1 : Register_1
  port map
  (
  D     => D(1),
  En    => En,
  Clk   => Clk,
  Reset => Reset,
  Q     => Q(1)
  );

  Reg_2 : Register_1
  port map
  (
  D     => D(2),
  En    => En,
  Clk   => Clk,
  Reset => Reset,
  Q     => Q(2)
  );

  Reg_3 : Register_1
  port map
  (
  D     => D(3),
  En    => En,
  Clk   => Clk,
  Reset => Reset,
  Q     => Q(3)
  );
  
  Reg_4 : Register_1
    port map
    (
    D     => D(4),
    En    => En,
    Clk   => Clk,
    Reset => Reset,
    Q     => Q(4)
    );
  

end Behavioral;