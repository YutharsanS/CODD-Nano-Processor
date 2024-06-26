library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Program_ROM_8 is
  port
  (
    M    : in std_logic_vector(2 downto 0);
    I    : out std_logic_vector(11 downto 0)
  );
end Program_ROM_8;

architecture Behavioral of Program_ROM_8 is
  type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

  signal program_ROM : rom_type := (
    "101110001010", -- MOVI R7, 10
    "100100000001", -- MOVI R2, 1
    "010100000000", -- NEG R2
    "001110100000", -- ADD R7, R2
    "111110000111", -- JZR R7, 7
    "110000000011", -- JZR R0, 3
    "000000000000",  --
    "000000000000" --
  );
  
begin

  I <= program_ROM (to_integer(unsigned(M)));

end Behavioral;