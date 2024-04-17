library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_4_to_1 is
  port
  (
    D      : in std_logic_vector(3 downto 1);
    Sel    : in std_logic_vector(1 downto 0);
    Output : out std_logic
  );
end Mux_4_to_1;

architecture Behavioral of Mux_4_to_1 is

component Mux_2_way_1
  port
  (
    A      : in std_logic;
    B      : in std_logic;
    Sel    : in std_logic;
    Output : out std_logic
  );
end component;

signal MUX_0_out, MUX_1_out : std_logic;

begin

    MUX_0 : Mux_2_way_1
    port map(
        A => D(3),
        B => D(2),
        Sel => Sel(0),
        Output => MUX_0_out
    );
    
    MUX_1 : Mux_2_way_1
        port map(
            A => D(1),
            B => D(0),
            Sel => Sel(0),
            Output => MUX_1_out
    );
    
    MUX_2 : Mux_2_way_1
        port map(
            A => MUX_0_out,
            B => MUX_1_out,
            Sel => Sel(1),
            Output => Output
        );


end Behavioral;
