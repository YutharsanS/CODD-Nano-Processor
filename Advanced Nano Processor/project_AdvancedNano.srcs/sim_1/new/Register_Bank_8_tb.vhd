library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_Bank_8_tb is
end Register_Bank_8_tb;

architecture Behavioral of Register_Bank_8_tb is
    -- Component Declaration
    component Register_Bank_8
        port (
            Data    : in std_logic_vector(4 downto 0);
            Reg_En  : in std_logic_vector(2 downto 0);
            En      : in std_logic;
            Reset   : in std_logic;
            Clk     : in std_logic;
            Out0    : out std_logic_vector(4 downto 0);
            Out1    : out std_logic_vector(4 downto 0);
            Out2    : out std_logic_vector(4 downto 0);
            Out3    : out std_logic_vector(4 downto 0);
            Out4    : out std_logic_vector(4 downto 0);
            Out5    : out std_logic_vector(4 downto 0);
            Out6    : out std_logic_vector(4 downto 0);
            Out7    : out std_logic_vector(4 downto 0)
        );
    end component;

    -- Stimulus signals
    signal Data_tb    : std_logic_vector(4 downto 0);
    signal Reg_En_tb  : std_logic_vector(2 downto 0);
    signal En_tb      : std_logic;
    signal Reset_tb   : std_logic;
    signal Clk_tb     : std_logic := '0';

    -- Observed signals
    signal Out0_tb    : std_logic_vector(4 downto 0);
    signal Out1_tb    : std_logic_vector(4 downto 0);
    signal Out2_tb    : std_logic_vector(4 downto 0);
    signal Out3_tb    : std_logic_vector(4 downto 0);
    signal Out4_tb    : std_logic_vector(4 downto 0);
    signal Out5_tb    : std_logic_vector(4 downto 0);
    signal Out6_tb    : std_logic_vector(4 downto 0);
    signal Out7_tb    : std_logic_vector(4 downto 0);

    -- Clock period
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut : Register_Bank_8
    port map (
        Data    => Data_tb,
        Reg_En  => Reg_En_tb,
        En      => En_tb,
        Reset   => Reset_tb,
        Clk     => Clk_tb,
        Out0    => Out0_tb,
        Out1    => Out1_tb,
        Out2    => Out2_tb,
        Out3    => Out3_tb,
        Out4    => Out4_tb,
        Out5    => Out5_tb,
        Out6    => Out6_tb,
        Out7    => Out7_tb
    );

    -- Clock process
    clk_process : process
    begin
        Clk_tb <= '0';
        wait for clk_period / 2;
        Clk_tb <= '1';
        wait for clk_period / 2;
    end process;

    -- Stimulus process
    stim_proc : process
    begin
        -- Reset the registers
        Reset_tb <= '1';
        En_tb <= '0';
        Reg_En_tb <= "000";
        Data_tb <= "00000";
        wait for clk_period * 2;

        -- Enable the register bank
        Reset_tb <= '0';
        En_tb <= '1';

        -- Write data to register 0
        Reg_En_tb <= "000";
        Data_tb <= "00001";
        wait for clk_period;

        -- Write data to register 1
        Reg_En_tb <= "001";
        Data_tb <= "00010";
        wait for clk_period;

        -- Write data to register 2
        Reg_En_tb <= "010";
        Data_tb <= "00011";
        wait for clk_period;

        -- Write data to register 3
        Reg_En_tb <= "011";
        Data_tb <= "00100";
        wait for clk_period;

        -- Write data to register 4
        Reg_En_tb <= "100";
        Data_tb <= "00101";
        wait for clk_period;

        -- Write data to register 5
        Reg_En_tb <= "101";
        Data_tb <= "00110";
        wait for clk_period;

        -- Write data to register 6
        Reg_En_tb <= "110";
        Data_tb <= "00111";
        wait for clk_period;

        -- Write data to register 7
        Reg_En_tb <= "111";
        Data_tb <= "01000";
        wait for clk_period;

        -- Disable the register bank
        En_tb <= '0';
        wait for clk_period * 2;
        
        --Test cases using index numbers
        
        -- Test case 1: Index1 - 220038U (101 10110 11100 00110)
                Reg_En_tb <= "101";
                Data_tb <= "10110";
                wait for clk_period;
                Reg_En_tb <= "110";
                Data_tb <= "11100";
                wait for clk_period;
                Reg_En_tb <= "111";
                Data_tb <= "00110";
                wait for clk_period;
        
                -- Test case 2: Index2 - 220404N (101 10111 00111 10100)
                Reg_En_tb <= "101";
                Data_tb <= "10111";
                wait for clk_period;
                Reg_En_tb <= "111";
                Data_tb <= "00111";
                wait for clk_period;
                Reg_En_tb <= "100";
                Data_tb <= "10100";
                wait for clk_period;
        
                -- Test case 3: Index3 - 220681H (101 10111 10000 01001)
                Reg_En_tb <= "101";
                Data_tb <= "10111";
                wait for clk_period;
                Reg_En_tb <= "000";
                Data_tb <= "10000";
                wait for clk_period;
                Reg_En_tb <= "001";
                Data_tb <= "01001";
                wait for clk_period;
        
                -- Test case 4: Index4 - 220738P (101 10111 10010 00010)
                Reg_En_tb <= "101";
                Data_tb <= "10111";
                wait for clk_period;
                Reg_En_tb <= "010";
                Data_tb <= "10010";
                wait for clk_period;
                Reg_En_tb <= "010";
                Data_tb <= "00010";
                wait for clk_period;

        -- Finish the simulation
        wait;
    end process;
end Behavioral;