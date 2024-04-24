library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Comp_5 is
  port
  (
    A : in std_logic_vector(4 downto 0);
    B : in std_logic_vector(4 downto 0);
    Z : out std_logic;
    N : out std_logic
  );
end Comp_5;

architecture Behavioral of Comp_5 is
  component Comp_1
    port
    (
      A    : in std_logic;
      B    : in std_logic;
      Zin  : in std_logic;
      Nin  : in std_logic;
      Zout : out std_logic;
      Nout : out std_logic
    );
  end component;
  signal Z_ins, N_ins : std_logic_vector(3 downto 0);
begin

  Comp4 : Comp_1
  port map 
    (
        A => A(4),
        B => B(4),
        Zin => '1',
        Nin => '0',
        Zout=> Z_ins(3),
        Nout=> N_ins(3)
    );

  Comp3 : Comp_1
  port map 
    (
        A => A(3),
        B => B(3),
        Zin => Z_ins(3),
        Nin => N_ins(3),
        Zout=> Z_ins(2),
        Nout=> N_ins(2)
    );

  Comp2 : Comp_1
  port map 
    (
        A => A(2),
        B => B(2),
        Zin => Z_ins(2),
        Nin => N_ins(2),
        Zout=> Z_ins(1),
        Nout=> N_ins(1)
    );

  Comp1 : Comp_1
  port map 
    (
        A => A(1),
        B => B(1),
        Zin => Z_ins(1),
        Nin => N_ins(1),
        Zout=> Z_ins(0),
        Nout=> N_ins(0)
    );

  Comp0 : Comp_1
  port map 
    (
        A => A(0),
        B => B(0),
        Zin => Z_ins(0),
        Nin => N_ins(0),
        Zout=> Z,
        Nout=> N
    );

end Behavioral;