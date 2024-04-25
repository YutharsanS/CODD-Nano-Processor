library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Program_ROM_15 is
    port
    (
     M    : in std_logic_vector(4 downto 0);
     I    : out std_logic_vector(14 downto 0)
 );
end Program_ROM_15;

architecture Behavioral of Program_ROM_15 is

    type rom_type is array (0 to 11) of std_logic_vector(14 downto 0);

    signal program_ROM : rom_type := (
        --Instructions to be added
        "100000100000011", --Move 3 to register 1
        "100001000000001", --Move 1 to register 2
        "100101101000000", --Copy rsgister 2 to register 3
        "001001100100000", --Multiply rsgister 3 with register 1
        "000100101000000", --Subtract register 1 by register 2
        "111000000000111", --Jump to address 7 if zero flag is enabled
        "110000000000011", --Jump to address 3 
        "100010000000010", --Move 2 to register 4
        "000001110000000", --Add register 4 with register 1
        "100010100001010", --Move 10 to register 5
        "011110010100000", --Compare register 5 with register 4
        "110000000000000" --Jump to address 0 
        );

begin

I <= program_ROM (to_integer(unsigned(M)));

end Behavioral;