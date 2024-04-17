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

    type rom_type is array (0 to 1) of std_logic_vector(14 downto 0);

    signal program_ROM : rom_type := (
        --Instructions to be added
        "000000000000000", --
        "000000000000000" --
        
    );

begin

    I <= program_ROM (to_integer(unsigned(M)));

end Behavioral;