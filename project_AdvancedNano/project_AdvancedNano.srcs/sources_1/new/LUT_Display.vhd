library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (4 downto 0);
           data : out STD_LOGIC_VECTOR (7 downto 0)
           );
end LUT_16_7;

architecture Behavioral of LUT_16_7 is
type rom_type is array (0 to 31) of std_logic_vector(7 downto 0);
    signal sevenSegment_ROM : rom_type := (
                        "10000001",  -- 0
                        "11110011",  -- 1
                        "01001001",  -- 2
                        "01100001",  -- 3
                        "00110011",  -- 4
                        "00100101",  -- 5
                        "00000101",  -- 6
                        "11110001",  -- 7
                        "00000001",  -- 8
                        "00100001",  -- 9
                        "01000001",  -- a
                        "00000111",  -- b
                        "10001101",  -- C
                        "01000011",  -- d
                        "00001101",  -- e
                        "00011101",  -- f
                        "10000000",  -- (-g)
                        "00011100",  -- (-f)
                        "00001100",  -- (-e)
                        "01000010",  -- (-d)
                        "10001100",  -- (-C)
                        "00000110",  -- (-b)
                        "01000000",  -- (-a)
                        "00100000",  -- (-9)
                        "00000000",  -- (-8)
                        "11110000",  -- (-7)
                        "00000100",  -- (-6)
                        "00100100",  -- (-5)
                        "00110010",  -- (-4)
                        "01100000",  -- (-3)
                        "01001000",  -- (-2)
                        "11110010"   -- (-1)
                        );
begin

data <= sevenSegment_ROM(to_integer(unsigned(address)));

end Behavioral;
