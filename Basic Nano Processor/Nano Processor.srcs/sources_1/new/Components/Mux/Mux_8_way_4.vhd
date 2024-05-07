library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux_8_way_4 is
  port
    (
        D0      : in std_logic_vector(3 downto 0);
        D1      : in std_logic_vector(3 downto 0);
        D2      : in std_logic_vector(3 downto 0);
        D3      : in std_logic_vector(3 downto 0);
        D4      : in std_logic_vector(3 downto 0);
        D5      : in std_logic_vector(3 downto 0);
        D6      : in std_logic_vector(3 downto 0);
        D7      : in std_logic_vector(3 downto 0);
        Sel     : in std_logic_vector(2 downto 0);
        EN      : in std_logic;
        Y : out std_logic_vector(3 downto 0)
    );
end Mux_8_way_4;

architecture Behavioral of Mux_8_way_4 is
    component Mux_8_way_1
    port
        (
            D : in STD_LOGIC_VECTOR (7 downto 0);
            Sel : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC
        );
end component;

begin

  MUX_0 : Mux_8_way_1
    port map(
        D(0) => D0(0),
        D(1) => D1(0),
        D(2) => D2(0),
        D(3) => D3(0),
        D(4) => D4(0),
        D(5) => D5(0),
        D(6) => D6(0),
        D(7) => D7(0),
        Sel => Sel,
        EN => EN,
        Y => Y(0)
    );

  MUX_1 : Mux_8_way_1
    port map(
        D(0) => D0(1),
        D(1) => D1(1),
        D(2) => D2(1),
        D(3) => D3(1),
        D(4) => D4(1),
        D(5) => D5(1),
        D(6) => D6(1),
        D(7) => D7(1),
        Sel => Sel,
        EN => EN,
        Y => Y(1)
    );


  MUX_2 : Mux_8_way_1
    port map(
        D(0) => D0(2),
        D(1) => D1(2),
        D(2) => D2(2),
        D(3) => D3(2),
        D(4) => D4(2),
        D(5) => D5(2),
        D(6) => D6(2),
        D(7) => D7(2),
        Sel => Sel,
        EN => EN,
        Y => Y(2)
    );


  MUX_3 : Mux_8_way_1
    port map(
        D(0) => D0(3),
        D(1) => D1(3),
        D(2) => D2(3),
        D(3) => D3(3),
        D(4) => D4(3),
        D(5) => D5(3),
        D(6) => D6(3),
        D(7) => D7(3),
        Sel => Sel,
        EN => EN,
        Y => Y(3)
    );

end Behavioral;