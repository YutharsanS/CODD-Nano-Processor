library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Multiplier_5 is
  port
  (
    A : in  std_logic_vector(4 downto 0);
    B : in  std_logic_vector(4 downto 0);
    S : out std_logic_vector(4 downto 0);
    O : out std_logic;
    Z : out std_logic;
    N : out std_logic
  );
end Multiplier_5;

architecture Behavioral of Multiplier_5 is

  component HA is
    port
    (
      A     : in std_logic;
      B     : in std_logic;
      S     : out std_logic;
      C_out : out std_logic);
  end component;
  
  component FA is
    port
    (
      A     : in std_logic;
      B     : in std_logic;
      C_in  : in std_logic;
      S     : out std_logic;
      C_out : out std_logic);
  end component;

  signal                         NA0B4, A1B4, A2B4, A3B4, A4B4 : std_logic;
  signal                   NA1B3, A2B3, A3B3, A0B3, A4B3       : std_logic;
  signal             NA2B2, A3B2, A0B2, A1B2, A4B2             : std_logic;
  signal       NA3B1, A0B1, A1B1, A2B1, A4B1                   : std_logic;
  signal A4B0, NA0B0, NA1B0, NA2B0, NA3B0                      : std_logic;

  signal S_0_0, S_0_1, S_0_2, S_0_3, S_0_4 : std_logic;
  signal S_1_0, S_1_1, S_1_2, S_1_3, S_1_4 : std_logic;
  signal S_2_0, S_2_1, S_2_2, S_2_3, S_2_4 : std_logic;
  signal S_3_0, S_3_1, S_3_2, S_3_3, S_3_4 : std_logic;
  signal S_4_0, S_4_1, S_4_2, S_4_3, S_4_4 : std_logic;

  signal C_0_0, C_0_1, C_0_2, C_0_3, C_0_4 : std_logic;
  signal C_1_0, C_1_1, C_1_2, C_1_3, C_1_4 : std_logic;
  signal C_2_0, C_2_1, C_2_2, C_2_3, C_2_4 : std_logic;
  signal C_3_0, C_3_1, C_3_2, C_3_3, C_3_4 : std_logic;
  signal C_4_0, C_4_1, C_4_2, C_4_3, C_4_4 : std_logic;
  

begin

  NA0B4 <= a(0) nand b(4);  A1B4 <= a(1) and b(4);  A2B4 <= a(2) and b(4);  A3B4 <= a(3) and b(4);  A4B4 <= a(4) and b(4);
  NA1B3 <= a(1) nand b(3);  A2B3 <= a(2) and b(3);  A3B3 <= a(3) and b(3);  A0B3 <= a(0) and b(3);  A4B3 <= a(4) and b(3);
  NA2B2 <= a(2) nand b(2);  A3B2 <= a(3) and b(2);  A0B2 <= a(0) and b(2);  A1B2 <= a(1) and b(2);  A4B2 <= a(4) and b(2);
  NA3B1 <= a(3) nand b(1);  A0B1 <= a(0) and b(1);  A1B1 <= a(1) and b(1);  A2B1 <= a(2) and b(1);  A4B1 <= a(4) and b(1);
  A4B0  <= a(4) and b(0);  NA0B0 <= a(0) nand b(0);  NA1B0 <= a(1) nand b(0);  NA2B0 <= a(2) nand b(0);  NA3B0 <= a(3) nand b(0);

  -- 1st Row

  HA_0_0 : HA
  port map(
    A => A3B4,
    B => A4B3,
    S => S_0_0,
    C_out => C_0_0
  );

  FA_0_1 : FA
  port map(
    A => A2B4,
    B => A0B3,
    C_in => C_0_0,
    S => S_0_1,
    C_out => C_0_1
  );

  FA_0_2 : FA
  port map(
    A => A1B4,
    B => A3B3,
    C_in => C_0_1,
    S => S_0_2,
    C_out => C_0_2
  );

  FA_0_3 : FA
  port map(
    A => NA0B4,
    B => A2B3,
    C_in => C_0_2,
    S => S_0_3,
    C_out => C_0_3
  );

  FA_0_4 : FA
  port map(
    A => '0',
    B => NA1B3,
    C_in => C_0_3,
    S => S_0_4,
    C_out => C_0_4
  );

  --2nd Row

  HA_1_0 : HA
  port map(
    A => S_0_1,
    B => A4B2,
    S => S_1_0,
    C_out => C_1_0
  );

  FA_1_1 : FA
  port map(
    A => S_0_2,
    B => A3B2,
    C_in => C_1_0,
    S => S_1_1,
    C_out => C_1_1
  );

  FA_1_2 : FA
  port map(
    A => S_0_3,
    B => A2B2,
    C_in => C_1_1,
    S => S_1_2,
    C_out => C_1_2
  );

  FA_1_3 : FA
  port map(
    A => S_0_4,
    B => A1B2,
    C_in => C_1_2,
    S => S_1_3,
    C_out => C_1_3
  );

  FA_1_4 : FA
  port map(
    A => C_0_4,
    B => NA0B2,
    C_in => C_1_3,
    S => S_1_4,
    C_out => C_1_4
  );

  --3rd Row

  HA_2_0 : HA
  port map(
    A => S_1_1,
    B => A4B1,
    S => S_2_0,
    C_out => C_2_0
  );

  FA_2_1 : FA
  port map(
    A => S_1_2,
    B => A3B1,
    C_in => C_2_0,
    S => S_2_1,
    C_out => C_2_1
  );

  FA_2_2 : FA
  port map(
    A => S_1_3,
    B => A2B1,
    C_in => C_2_1,
    S => S_2_2,
    C_out => C_2_2
  );

  FA_1_3 : FA
  port map(
    A => S_1_4,
    B => A1B1,
    C_in => C_2_2,
    S => S_2_3,
    C_out => C_2_3
  );

  FA_2_4 : FA
  port map(
    A => C_1_4,
    B => NA0B1,
    C_in => C_2_3,
    S => S_2_4,
    C_out => C_2_4
  );

  --4th Row
  HA_3_0 : HA
  port map(
    A => S_2_1,
    B => NA4B0,
    S => S_3_0,
    C_out => C_3_0
  );

  FA_3_1 : FA
  port map(
    A => S_2_2,
    B => NA3B0,
    C_in => C_3_0,
    S => S_3_1,
    C_out => C_3_1
  );

  FA_3_2 : FA
  port map(
    A => S_2_3,
    B => NA2B0,
    C_in => C_3_1,
    S => S_3_2,
    C_out => C_3_2
  );

  FA_3_3 : FA
  port map(
    A => S_2_4,
    B => NA1B0,
    C_in => C_3_2,
    S => S_3_3,
    C_out => C_3_3
  );

  FA_3_4 : FA
  port map(
    A => C_2_4,
    B => A0B0,
    C_in => C_3_3,
    S => S_3_4,
    C_out => C_3_4
  );
 

  --5th Row
  HA_4_0 : HA
  port map(
    A => S_2_1,
    B => '1',
    S => S_4_0,
    C_out => C_4_0
  );

  FA_4_1 : FA
  port map(
    A => S_2_2,
    B => '0',
    C_in => C_4_0,
    S => S_4_1,
    C_out => C_4_1
  );

  FA_4_2 : FA
  port map(
    A => S_2_3,
    B => '0',
    C_in => C_4_1,
    S => S_4_2,
    C_out => C_4_2
  );

  FA_4_3 : FA
  port map(
    A => S_2_4,
    B => '0',
    C_in => C_4_2,
    S => S_4_3,
    C_out => C_4_3
  );

  FA_4_4 : FA
  port map(
    A => C_2_4,
    B => '1',
    C_in => C_4_3,
    S => S_4_4,
    C_out => C_4_4
  );

    S <= S_3_4 & S_2_4 & S_1_4 & S_0_4 & A4B4;


    Z <= not (S_4_0 or S_4_1 or S_4_2 or S_4_3 or S_4_4 or S_3_4 or S_2_4 or S_1_4 or S_0_4 or A4B4);
    N <= A(0) xor B(0);
    O <= (S_4_0 and S_4_1 and S_4_2 and S_4_3 and S_4_4) or not (S_4_0 or S_4_1 or S_4_2 or S_4_3 or S_4_4);
  
end Behavioral;