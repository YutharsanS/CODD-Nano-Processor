library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8_to_1 is
    Port ( Sel : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

component Decoder_3_to_8 
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal int1, int2 : std_logic_vector(7 downto 0);

begin

DC1 : Decoder_3_to_8
    port map(
        I => Sel,
        EN => EN,
        Y => int1
    );
    
int2 <= int1 AND D;

Y <= int2(0) OR int2(1) OR int2(2) OR int2(3) OR int2(4) OR int2(5) OR int2(6) OR int2(7);


end Behavioral;
