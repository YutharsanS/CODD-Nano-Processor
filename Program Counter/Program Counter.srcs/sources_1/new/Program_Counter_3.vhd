library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Program_Counter_3 is
  port
  (
    Data   : in std_logic_vector(2 downto 0);
    Clk    : in std_logic;
    Reset  : in std_logic;
    Output : out std_logic_vector(2 downto 0)
  );
end Program_Counter_3;

architecture Behavioral of Program_Counter_3 is

  component Register_3
    port
    (
      D     : in std_logic_vector(2 downto 0);
      En    : in std_logic;
      Clk   : in std_logic;
      Reset : in std_logic;
      Q     : out std_logic_vector(2 downto 0)
    );
  end component;

begin

  Reg0 : Register_3
  port map
  (
    D     => Data,
    En    => '1',
    Clk   => Clk,
    Reset => Reset,
    Q     => Output
  );

end Behavioral;