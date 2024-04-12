library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Instruction_Decoder_12 is
  port
  (
    I : in std_logic_vector(11 downto 0);
    Reg_Check : in std_logic_vector(3 downto 0);
    Reg_EN : out std_logic_vector(2 downto 0);
    Load_Sel : out std_logic;
    Reg_1 : out std_logic_vector(2 downto 0);
    Reg_2 : out std_logic_vector(2 downto 0);
    AU_Ins : out std_logic;
    Jump_Flag : out std_logic;
    Jump_Addr : out std_logic_vector(2 downto 0);
    Imd_Val : out std_logic_vector(3 downto 0);
    RB_En : out std_logic
  );
end Instruction_Decoder_12;

architecture Behavioral of Instruction_Decoder_12 is

begin

  Load_Sel <= I(11); -- Selecting the load
  AU_Ins <= I(10);

  Reg_1 <= I(9 downto 7);
  Reg_EN <= I(9 downto 7);
  Reg_2 <=  I(6 downto 4);

  Imd_Val <=  I(3 downto 0);
  Jump_Addr <=  I(2 downto 0);

  RB_En <=  not(I(10) and I(11));
  Jump_Flag <=  not(Reg_Check(0) or Reg_Check(1) or Reg_Check(2) or Reg_Check(3)) and I(10) and I(11);

end Behavioral;