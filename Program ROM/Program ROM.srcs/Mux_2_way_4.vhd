library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux_2_way_4 is
  port
  (
    A      : in std_logic_vector(3 downto 0);
    B      : in std_logic_vector(3 downto 0);
    Sel    : in std_logic;
    Output : out std_logic_vector(3 downto 0)
  );
end Mux_2_way_4;

architecture Behavioral of Mux_2_way_4 is
    component Mux_2_way_1 
    port
        (
            A      : in std_logic;
            B      : in std_logic;
            Sel    : in std_logic;
            Output : out std_logic
        );
end component;

begin

  MUX_0 : Mux_2_way_1(
    port map(
        A => A(0),
        B => B(0),
        Sel => Sel,
        Output => Output(0)
    );
  );

  MUX_1 : Mux_2_way_1(
    port map(
        A => A(1),
        B => B(1),
        Sel => Sel,
        Output => Output(1)
    );
  );

  MUX_2 : Mux_2_way_1(
    port map(
        A => A(2),
        B => B(2),
        Sel => Sel,
        Output => Output(2)
    );
  );

  MUX_3 : Mux_2_way_1(
    port map(
        A => A(3),
        B => B(3),
        Sel => Sel,
        Output => Output(3)
    );
  );

end Behavioral;