library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_ADD_5 is
    Port ( Adrs : in STD_LOGIC_VECTOR (4 downto 0);
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (4 downto 0));
end PC_ADD_5;

architecture Behavioral of PC_ADD_5 is

component FA           
        port (           
        A: in std_logic;           
        B: in std_logic;        
        C_in: in std_logic;           
        S: out std_logic;         
        C_out: out std_logic);       
    end component;
    
    signal  FA0_C, FA1_C, FA2_C, FA3_C  : std_logic;   
    
begin

FA_0 : FA         
        port map (               
        A => Adrs(0),               
        B => '1',             
        C_in => '0',         
        S => S(0),               
        C_Out => FA0_C );    
           
    FA_1 : FA         
        port map (               
        A => Adrs(1),               
        B => '0',             
        C_in => FA0_C,                
        S => S(1),               
        C_Out => FA1_C );
         
    FA_2 : FA         
        port map (               
        A => Adrs(2),               
        B => '0',             
        C_in => FA1_C,                
        S => S(2),               
        C_Out => FA2_C ); 
        
    FA_3 : FA         
        port map (               
        A => Adrs(3),               
        B => '0',             
        C_in => FA2_C,                
        S => S(3),               
        C_Out => FA3_C ); 
            
    FA_4 : FA         
         port map (               
         A => Adrs(4),               
         B => '0',             
         C_in => FA3_C,                
         S => S(4),               
         C_Out => C_out ); 


end Behavioral;
