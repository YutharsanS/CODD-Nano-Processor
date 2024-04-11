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

  Load_Sel <= I(0); -- Selecting the load
  AU_Ins <= I(1);

  Reg_1 <= I(4 downto 2);
  Reg_2 <=  I(7 downto 5);

  Imd_Val <=  I(11 downto 8);
  Jump_Addr <=  I(11 downto 9);

  RB_En <=  not(I(0) and I(1));
  Jump_Flag <=  not(Reg_Check(0) or Reg_Check(1) or Reg_Check(2) or Reg_Check(3)) and I(0) and I(1);

end Behavioral;