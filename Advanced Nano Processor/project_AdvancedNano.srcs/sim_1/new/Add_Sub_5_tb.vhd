library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_SUB_tb is
end ADD_SUB_tb;

architecture Behavioral of ADD_SUB_tb is
    -- Component declaration
    component ADD_SUB
        Port (
            A : in STD_LOGIC_VECTOR (4 downto 0);
            B : in STD_LOGIC_VECTOR (4 downto 0);
            Ctrl : in STD_LOGIC;
            C_out : out STD_LOGIC;
            S : out STD_LOGIC_VECTOR (4 downto 0);
            O : out STD_LOGIC;
            Z : out STD_LOGIC;
            N : out STD_LOGIC
        );
    end component;

    -- Inputs
    signal A_tb : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal B_tb : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal Ctrl_tb : STD_LOGIC := '0';

    -- Outputs
    signal C_out_tb : STD_LOGIC;
    signal S_tb : STD_LOGIC_VECTOR (4 downto 0);
    signal O_tb : STD_LOGIC;
    signal Z_tb : STD_LOGIC;
    signal N_tb : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: ADD_SUB port map (
        A => A_tb,
        B => B_tb,
        Ctrl => Ctrl_tb,
        C_out => C_out_tb,
        S => S_tb,
        O => O_tb,
        Z => Z_tb,
        N => N_tb
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: Addition (Ctrl = '0')
        Ctrl_tb <= '0';
        A_tb <= "00101";
        B_tb <= "00011";
        wait for 10 ns;
        assert (S_tb = "01000" and C_out_tb = '0' and O_tb = '0' and Z_tb = '0' and N_tb = '0')
            report "Test case 1 failed" severity error;

        -- Test case 2: Subtraction (Ctrl = '1')
        Ctrl_tb <= '1';
        A_tb <= "00101";
        B_tb <= "00011";
        wait for 10 ns;
        assert (S_tb = "00010" and C_out_tb = '1' and O_tb = '1' and Z_tb = '0' and N_tb = '0')
            report "Test case 2 failed" severity error;

        -- Test case 3: Addition with carry
        Ctrl_tb <= '0';
        A_tb <= "11111";
        B_tb <= "00001";
        wait for 10 ns;
        assert (S_tb = "00000" and C_out_tb = '1' and O_tb = '1' and Z_tb = '1' and N_tb = '0')
            report "Test case 3 failed" severity error;

        -- Test case 4: Subtraction with borrow
        Ctrl_tb <= '1';
        A_tb <= "00010";
        B_tb <= "00011";
        wait for 10 ns;
        assert (S_tb = "11111" and C_out_tb = '0' and O_tb = '1' and Z_tb = '0' and N_tb = '1')
            report "Test case 4 failed" severity error;

        -- Additional test cases using given index numbers
        Ctrl_tb <= '0';  -- Addition
        A_tb <= "10110"; -- Index1: 220038U
        B_tb <= "11100";
        wait for 10 ns;
        assert (S_tb = "10000" and C_out_tb = '1' and O_tb = '1' and Z_tb = '0' and N_tb = '0')
            report "Test case 5 failed" severity error;

        Ctrl_tb <= '1';  -- Subtraction
        A_tb <= "10111"; -- Index2: 220404N
        B_tb <= "00111";
        wait for 10 ns;
        assert (S_tb = "10000" and C_out_tb = '1' and O_tb = '1' and Z_tb = '0' and N_tb = '0')
            report "Test case 6 failed" severity error;

        Ctrl_tb <= '0';  -- Addition
        A_tb <= "10111"; -- Index3: 220681H
        B_tb <= "10000";
        wait for 10 ns;
        assert (S_tb = "00111" and C_out_tb = '1' and O_tb = '0' and Z_tb = '0' and N_tb = '0')
            report "Test case 7 failed" severity error;

        Ctrl_tb <= '1';  -- Subtraction
        A_tb <= "10111"; -- Index4: 220738P
        B_tb <= "10010";
        wait for 10 ns;
        assert (S_tb = "00101" and C_out_tb = '1' and O_tb = '0' and Z_tb = '0' and N_tb = '0')
            report "Test case 8 failed" severity error;

        -- Add more test cases as needed

        wait; -- End the simulation
    end process;
end Behavioral;