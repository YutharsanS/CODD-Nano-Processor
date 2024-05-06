library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register_Bank_8 is
  port
  (
    Data   : in std_logic_vector(4 downto 0);
    Reg_En : in std_logic_vector(2 downto 0);
    En     : in std_logic;
    Reset  : in std_logic;
    Clk    : in std_logic;
    Out0   : out std_logic_vector(4 downto 0);
    Out1   : out std_logic_vector(4 downto 0);
    Out2   : out std_logic_vector(4 downto 0);
    Out3   : out std_logic_vector(4 downto 0);
    Out4   : out std_logic_vector(4 downto 0);
    Out5   : out std_logic_vector(4 downto 0);
    Out6   : out std_logic_vector(4 downto 0);
    Out7   : out std_logic_vector(4 downto 0)
  );
end Register_Bank_8;

architecture Behavioral of Register_Bank_8 is

  component Decoder_3_to_8 -- Decoder
    port
    (
      I  : in std_logic_vector (2 downto 0);
      EN : in std_logic;
      Y  : out std_logic_vector (7 downto 0));
  end component;

  component Register_5 -- Register
    port
    (
      D     : in std_logic_vector(4 downto 0);
      En    : in std_logic;
      Clk   : in std_logic;
      Reset : in std_logic;
      Q     : out std_logic_vector(4 downto 0)
    );
  end component;

  signal d_out : std_logic_vector(7 downto 0) := "00000000";
begin

  Decoder_0 : Decoder_3_to_8
  port map
  (
    I  => Reg_En,
    En => En,
    Y  => d_out
  );
  Register0 : Register_5
  port
  map (
  D   => Data,
  En  => '0',
  Clk => Clk,
  Reset => Reset,
  Q   => Out0
  );

  Register1 : Register_5
  port
  map (
  D   => Data,
  En  => d_out(1),
  Clk => Clk,
  Reset => Reset,
  Q   => Out1
  );

  Register2 : Register_5
  port
  map (
  D   => Data,
  En  => d_out(2),
  Clk => Clk,
  Reset => Reset,
  Q   => Out2
  );

  Register3 : Register_5
  port
  map (
  D   => Data,
  En  => d_out(3),
  Clk => Clk,
  Reset => Reset,
  Q   => Out3
  );

  Register4 : Register_5
  port
  map (
  D   => Data,
  En  => d_out(4),
  Clk => Clk,
  Reset => Reset,
  Q   => Out4
  );

  Register5 : Register_5
  port
  map (
  D   => Data,
  En  => d_out(5),
  Clk => Clk,
  Reset => Reset,
  Q   => Out5
  );

  Register6 : Register_5
  port
  map (
  D   => Data,
  En  => d_out(6),
  Clk => Clk,
  Reset => Reset,
  Q   => Out6
  );

  Register7 : Register_5
  port
  map (
  D   => Data,
  En  => d_out(7),
  Clk => Clk,
  Reset => Reset,
  Q   => Out7
  );

end Behavioral;