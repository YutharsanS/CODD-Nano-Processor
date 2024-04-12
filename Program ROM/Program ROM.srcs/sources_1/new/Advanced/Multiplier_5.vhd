library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Multiplier_5 is
  port
  (
    A : in  std_logic_vector(4 downto 0);
    B : in  std_logic_vector(4 downto 0);
    S : out std_logic_vector(4 downto 0);
    O : out std_logic;
    Z : out std_logic;
    N : out std_logic
  );
end Multiplier_5;

architecture Behavioral of Multiplier_5 is

  component HA is
    port
    (
      A     : in std_logic;
      B     : in std_logic;
      S     : out std_logic;
      C_out : out std_logic);
  end component;
  
  component FA is
    port
    (
      A     : in std_logic;
      B     : in std_logic;
      C_in  : in std_logic;
      S     : out std_logic;
      C_out : out std_logic);
  end component;

begin

  N <= A(4) xor B(4);
  Z <= (A(4) or A(3) or A(2) or A(1) or A(0)) nand (B(4) or B(3) or B(2) or B(1) or B(0));

end Behavioral;