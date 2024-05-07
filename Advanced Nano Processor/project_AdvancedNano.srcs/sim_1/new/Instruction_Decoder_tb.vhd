library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Instruction_Decoder_15_tb is
end Instruction_Decoder_15_tb;

architecture Behavioral of Instruction_Decoder_15_tb is
    -- Component declaration
    -- ... (component declaration remains the same)
     component Instruction_Decoder_15
           port (
               I              : in std_logic_vector(14 downto 0);
               Reg1_Check     : in std_logic_vector(4 downto 0);
               Zflag_in       : in std_logic;
               Nflag_in       : in std_logic;
               Load_Sel       : out std_logic;
               Imd_Val        : out std_logic_vector(4 downto 0);
               Reg_1          : out std_logic_vector(2 downto 0);
               Reg_2          : out std_logic_vector(2 downto 0);
               Reg_EN         : out std_logic_vector(2 downto 0);
               ALU_Control    : out std_logic_vector(2 downto 0);
               RegisterBank_EN : out std_logic;
               Jump_Flag      : out std_logic;
               Jump_Address   : out std_logic_vector(4 downto 0);
               FlagEn         : out std_logic;
               Copy_Sel       : out std_logic;
               PC_En          : out std_logic
           );
       end component;

    -- Signals
    signal I_tb              : std_logic_vector(14 downto 0);
    signal Reg1_Check_tb     : std_logic_vector(4 downto 0);
    signal Zflag_in_tb       : std_logic;
    signal Nflag_in_tb       : std_logic;
    signal Load_Sel_tb       : std_logic;
    signal Imd_Val_tb        : std_logic_vector(4 downto 0);
    signal Reg_1_tb          : std_logic_vector(2 downto 0);
    signal Reg_2_tb          : std_logic_vector(2 downto 0);
    signal Reg_EN_tb         : std_logic_vector(2 downto 0);
    signal ALU_Control_tb    : std_logic_vector(2 downto 0);
    signal RegisterBank_EN_tb : std_logic;
    signal Jump_Flag_tb      : std_logic;
    signal Jump_Address_tb   : std_logic_vector(4 downto 0);
    signal FlagEn_tb         : std_logic;
    signal Copy_Sel_tb       : std_logic;
    signal PC_En_tb          : std_logic;

begin
    -- Instantiate the Instruction_Decoder_15 module
    -- ... (instantiation remains the same)
UUT : Instruction_Decoder_15
        port map (
            I              => I_tb,
            Reg1_Check     => Reg1_Check_tb,
            Zflag_in       => Zflag_in_tb,
            Nflag_in       => Nflag_in_tb,
            Load_Sel       => Load_Sel_tb,
            Imd_Val        => Imd_Val_tb,
            Reg_1          => Reg_1_tb,
            Reg_2          => Reg_2_tb,
            Reg_EN         => Reg_EN_tb,
            ALU_Control    => ALU_Control_tb,
            RegisterBank_EN => RegisterBank_EN_tb,
            Jump_Flag      => Jump_Flag_tb,
            Jump_Address   => Jump_Address_tb,
            FlagEn         => FlagEn_tb,
            Copy_Sel       => Copy_Sel_tb,
            PC_En          => PC_En_tb
        );
    -- Test cases
    process
    begin
        -- Test case 1: All input signals are set to '0' or "00000"
        I_tb <= "000000000000000";
        Reg1_Check_tb <= "00000";
        Zflag_in_tb <= '0';
        Nflag_in_tb <= '0';
        wait for 10 ns;
        -- Add assertions for the expected outputs

        -- Test case 2: All input signals are set to '1' or "11111"
        I_tb <= "111111111111111";
        Reg1_Check_tb <= "11111";
        Zflag_in_tb <= '1';
        Nflag_in_tb <= '1';
        wait for 10 ns;
        -- Add assertions for the expected outputs

        -- Test case 3: Check Load_Sel and Imd_Val outputs
        I_tb <= "100000000000101";
        Reg1_Check_tb <= "00000";
        Zflag_in_tb <= '0';
        Nflag_in_tb <= '0';
        wait for 10 ns;
        assert Load_Sel_tb = '1' report "Test case 3: Load_Sel incorrect" severity error;
        assert Imd_Val_tb = "00101" report "Test case 3: Imd_Val incorrect" severity error;

        -- Test case 4: Check Reg_1, Reg_2, and Reg_EN outputs
        I_tb <= "000101010001010";
        Reg1_Check_tb <= "00000";
        Zflag_in_tb <= '0';
        Nflag_in_tb <= '0';
        wait for 10 ns;
        assert Reg_1_tb = "001" report "Test case 4: Reg_1 incorrect" severity error;
        assert Reg_2_tb = "010" report "Test case 4: Reg_2 incorrect" severity error;
        assert Reg_EN_tb = "010" report "Test case 4: Reg_EN incorrect" severity error;

        -- Test case 5: Check ALU_Control and Copy_Sel outputs
        I_tb <= "001011010000000";
        Reg1_Check_tb <= "00000";
        Zflag_in_tb <= '0';
        Nflag_in_tb <= '0';
        wait for 10 ns;
        assert ALU_Control_tb = "011" report "Test case 5: ALU_Control incorrect" severity error;
        assert Copy_Sel_tb = '0' report "Test case 5: Copy_Sel incorrect" severity error;

        -- Test case 6: Check RegisterBank_EN output
        I_tb <= "110000000000000";
        Reg1_Check_tb <= "00000";
        Zflag_in_tb <= '0';
        Nflag_in_tb <= '0';
        wait for 10 ns;
        assert RegisterBank_EN_tb = '0' report "Test case 6: RegisterBank_EN incorrect" severity error;

        -- Test case 7: Check Jump_Flag and Jump_Address outputs
        I_tb <= "101000000010101";
        Reg1_Check_tb <= "00000";
        Zflag_in_tb <= '0';
        Nflag_in_tb <= '0';
        wait for 10 ns;
        assert Jump_Flag_tb = '1' report "Test case 7: Jump_Flag incorrect" severity error;
        assert Jump_Address_tb = "10101" report "Test case 7: Jump_Address incorrect" severity error;

        -- Test case 8: Check FlagEn output
        I_tb <= "001000000000000";
        Reg1_Check_tb <= "00000";
        Zflag_in_tb <= '0';
        Nflag_in_tb <= '0';
        wait for 10 ns;
        assert FlagEn_tb = '1' report "Test case 8: FlagEn incorrect" severity error;

        -- Test case 9: Check PC_En output
        I_tb <= "000100001000000";
        Reg1_Check_tb <= "00000";
        Zflag_in_tb <= '0';
        Nflag_in_tb <= '0';
        wait for 10 ns;
        assert PC_En_tb = '1' report "Test case 9: PC_En incorrect" severity error;

        report "All test cases passed";
        wait;
    end process;
end Behavioral;