library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_SUB is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Ctrl : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           V : out STD_LOGIC;
           Z : out STD_LOGIC );
end ADD_SUB;

architecture Behavioral of ADD_SUB is

component FA 
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal FA0_C, FA1_C, FA2_C, FA3_C : STD_LOGIC;
signal temp : STD_LOGIC_VECTOR (3 downto 0);
signal S0, S1, S2, S3 : std_logic;

begin

temp(0) <= B(0) XOR Ctrl;
temp(1) <= B(1) XOR Ctrl;
temp(2) <= B(2) XOR Ctrl;
temp(3) <= B(3) XOR Ctrl;

FA_0 : FA
    Port map(
    A => A(0),
    B => temp(0),
    C_in => Ctrl,
    S => S0,
    C_out => FA0_C );
    
FA_1 : FA
    Port map(
    A => A(1),
    B => temp(1),
    C_in => FA0_C,
    S => S1,
    C_out => FA1_C );
        
FA_2 : FA
    Port map(
    A => A(2),
    B => temp(2),
    C_in => FA1_C,
    S => S2,
    C_out => FA2_C);
    
FA_3 : FA
    Port map(
    A => A(3),
    B => temp(3),
    C_in => FA2_C,
    S => S3,
    C_out => FA3_C);
    
C_out <= FA3_C;
V <= FA3_C XOR FA2_C;
Z <= not(S0 or S1 or S2 or S3);

S(0) <= S0;
S(1) <= S1;
S(2) <= S2;
S(3) <= S3;

end Behavioral;