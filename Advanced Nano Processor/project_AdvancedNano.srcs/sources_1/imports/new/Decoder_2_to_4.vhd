library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is

signal I0P, I1P : std_logic;

begin

I0P <= NOT I(0);
I1P <= NOT I(1);

Y(0) <= I0P AND I1P AND EN;
Y(1) <= I(0) AND I1P AND EN;
Y(2) <= I0P AND I(1) AND EN;
Y(3) <= I(0) AND I(1) AND EN;


end Behavioral;
