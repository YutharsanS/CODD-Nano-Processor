library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is

component Decoder_2_to_4
    port(
        I : in std_logic_vector;
        EN : in std_logic;
        Y : out std_logic_vector
    );
end component;

signal I1I0 : std_logic_vector(1 downto 0);
signal Y0, Y1 : std_logic_vector(3 downto 0);
signal en0, en1 : std_logic;
  
begin

Decoder_2_to_4_0 : Decoder_2_to_4
    port map(
        I => I1I0,
        EN => en0,
        Y => Y0
    );

Decoder_2_to_4_1 : Decoder_2_to_4
    port map(
        I => I1I0,
        EN => en1,
        Y => Y1
    );
    
    en0 <= (NOT I(2)) AND EN;
    en1 <= I(2) AND EN;
 
    I1I0 <= I(1 downto 0);
    
    Y(0) <= Y0(0);
    Y(1) <= Y0(1);
    Y(2) <= Y0(2);
    Y(3) <= Y0(3);
    
    Y(4) <= Y1(0);
    Y(5) <= Y1(1);
    Y(6) <= Y1(2);
    Y(7) <= Y1(3);

end Behavioral;
