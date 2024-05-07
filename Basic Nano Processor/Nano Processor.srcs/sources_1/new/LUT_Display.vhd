library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (7 downto 0)
           );
end LUT_16_7;

architecture Behavioral of LUT_16_7 is
type rom_type is array (0 to 15) of std_logic_vector(7 downto 0);
    signal sevenSegment_ROM : rom_type := (
                        "10000001",  -- 0
                        "11110011",  -- 1
                        "01001001",  -- 2
                        "01100001",  -- 3
                        "00110011",  -- 4
                        "00100101",  -- 5
                        "00000101",  -- 6
                        "11110001",  -- 7
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
