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

    type rom_type is array (0 to 31) of std_logic_vector(14 downto 0);

    signal program_ROM : rom_type := (
        -- Program 1 : Solving (3! + 2) and compare the result with 10. If the result <= 10, negate 10 and again compare it with the result.

        "100000100000011", -- 0: Move 3 to register 1 
        "100001000000001", -- 1: Move 1 to register 2
        "100101101000000", -- 2: Copy register 2 to register 3
        "001001100100000", -- 3: Multiply register 3 with register 1
        "000100101000000", -- 4: Subtract register 1 by register 2
        "111000000000111", -- 5: Jump to address 6 if zero flag is enabled
        "110000000000011", -- 6: Jump to address 3 
        "100010000000010", -- 7: Move 2 to register 4
        "000010001100000", -- 8: Add register 3 to register 4
        "100010100001010", -- 9: Move 10 to register 5
        "011110110000000", -- 10: Compare register 5 with register 4 (Compare 10 with the result)
        "111100000001110", -- 11: Jump to address 13 if negative flag is enabled (If the result > 10, jump to the next program)
        "001110100000000", -- 12: Negate register 5
        "110000000001010", -- 13: Jump to address 9

        -- Program 2 : Check whether 2 IPs are in the same network

        "100000100010101", -- 14: Move -11 to register 1 (IP 1 - 10101)
        "100001000010001", -- 15: Move -15 to register 2 (IP 2 - 10001)
        "100001100011101", -- 16: Move -3 to register 3  (IP 3 - 11101)
        "100010000011000", -- 17: Move -8 to register 4  (SM   - 11000)
        "010000110000000", -- 18: Bitwise AND register 1 with register 4 (Get the Network address of IP 1)
        "010001010000000", -- 19: Bitwise AND register 2 with register 4 (Get the Network address of IP 2)
        "010001110000000", -- 20: Bitwise AND register 3 with register 4 (Get the Network address of IP 3)
        "011100101000000", -- 21: Compare register 1 with register 2 (Compare IP 1 network address with IP 2 network address)
        "011100101100000", -- 22: Compare register 1 with register 3 (Compare IP 1 network address with IP 3 network address)

        -- Program 3 : Check the access rights of a file for a user in a group

        "100000100000001", -- 23: Move 1 to register 1 (Group 1 can access the file)
        "100001000000100", -- 24: Move 4 to register 2 (Group 3 can access the file)
        "010100101000000", -- 25: Bitwise OR register 1 with register 2 (Group 1 and 3 can access the file)
        "100001000001000", -- 26: Move 8 to register 2 (User is in group 4)
        "100101101000000", -- 27: Copy register 2 to register 3 
        "010001000100000", -- 28: Bitwise AND register 2 with register 1 (Check if user is in group 1 or group 3)
        "011000100000000", -- 29: Bitwise NOT register 1 (Updating the access rights to "If the user is in a group other than group 1 or group 3")
        "010001100100000", -- 30: Bitwise AND register 3 with register 1 (Check if user is in a group other than group 1 or group 3)
        "101000000000000"  -- 31: End program
        );

begin

I <= program_ROM (to_integer(unsigned(M)));

end Behavioral;