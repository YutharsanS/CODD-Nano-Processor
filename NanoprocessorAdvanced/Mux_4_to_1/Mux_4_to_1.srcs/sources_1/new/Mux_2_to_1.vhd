library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Mux_2_way_1 is
  port
  (
    A      : in std_logic;
    B      : in std_logic;
    Sel    : in std_logic;
    Output : out std_logic
  );
end Mux_2_way_1;

architecture Behavioral of Mux_2_way_1 is

  signal Sel_p : std_logic;
begin

  sel_p <= not Sel;

  Output <= (A and Sel_p) or (B and Sel);

end Behavioral;