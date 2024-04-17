library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder_12 is
    Port 
    (
      I : in std_logic_vector(14 downto 0);
      Reg1_Check : in std_logic_vector(4 downto 0);
      Zflag_in : in std_logic;
      Nflag_in : in std_logic;
      Load_Sel : out std_logic;
      Imd_Val : out std_logic_vector(4 downto 0);
      Reg_1 : out std_logic_vector(2 downto 0);
      Reg_2 : out std_logic_vector(2 downto 0);
      Reg_EN : out std_logic_vector(2 downto 0);
      ALU_Control : out std_logic_vector(2 downto 0);
      RegisterBank_EN : out std_logic;
      Jump_Flag : out std_logic;
      Jump_Address : out std_logic_vector(4 downto 0)
      
    );
end Instruction_Decoder_12;

architecture Behavioral of Instruction_Decoder_12 is

component Mux_4_to_1
  port
  (
    D      : in std_logic_vector(3 downto 0);
    Sel    : in std_logic_vector(1 downto 0);
    Output : out std_logic
  );
end component;

signal Mux_out, Reg_check : std_logic;

begin

    Reg_check <= NOT(Reg1_Check(0)OR Reg1_Check(1)OR Reg1_Check(2) OR Reg1_Check(3));

    JumpSel_Mux : Mux_4_to_1
    port map(
       D(3) => '1',
       D(2) => Reg_check,
       D(1) => Zflag_in,
       D(0) => Nflag_in,
       Sel  =>  I(12 downto 11),
       Output => Mux_out
    );

    Load_Sel <= I(14);
    ALU_Control <= I(13 downto 11);
    
    Reg_1 <= I(10 downto 8);
    Reg_EN <= I(10 downto 8);
    Reg_2 <= I(7 downto 5);
    Imd_Val <= I(4 downto 0);
    
    RegisterBank_EN <= NOT(I(14) AND (I(13) OR I(12)));
    
    Jump_Flag <= Mux_out AND I(14) AND I(13);


end Behavioral;
