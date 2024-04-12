library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Program_ROM_8 is
end TB_Program_ROM_8;

architecture Behavioral of TB_Program_ROM_8 is
    -- Component declaration for the Unit Under Test (UUT)
    component Program_ROM_8
        port (
            M : in std_logic_vector(2 downto 0);
            I : out std_logic_vector(11 downto 0)
        );
    end component;

    -- Input signal
    signal M_tb : std_logic_vector(2 downto 0) := (others => '0');
    -- Output signal
    signal I_tb : std_logic_vector(11 downto 0);

    -- Expected output values
    type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
    constant program_ROM : rom_type := (
        "100010001010", -- MOVI R1, 10
        "100100000001", -- MOVI R2, 1
        "010100000000", -- NEG R2
        "000010100000", -- ADD R1, R2
        "110010000111", -- JZR R1, 7
        "110000000011", -- JZR R0, 3
        "000000000000", --
        "000000000000"  --
    );

begin
    -- Instantiate the Unit Under Test (UUT)
    uut : Program_ROM_8 port map (
        M => M_tb,
        I => I_tb
    );

    -- Stimulus process
    stim_proc : process
    begin
        -- Test all possible input values
        for i in 0 to 7 loop
            M_tb <= std_logic_vector(to_unsigned(i, 3));
            wait for 100 ns; 
            
            -- Check the output against expected values
            assert I_tb = program_ROM(i)
                report "Error: Output mismatch for M = " & integer'image(i)
                severity error;
        end loop;
        report "Simulation completed successfully" severity note;
        wait; -- Wait indefinitely
    end process;
end Behavioral;