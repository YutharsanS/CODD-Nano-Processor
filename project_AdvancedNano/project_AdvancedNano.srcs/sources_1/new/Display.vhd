library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Display is
  port
  (
    Clk          : in std_logic;
    PC_Reset    : in std_logic;
    RB_Reset        : in std_logic;
    Overflow     : out std_logic;
    Zero         : out std_logic;
    LED_out      : out std_logic_vector (4 downto 0);
    Dot          : out std_logic;
    Anode_7Seg   : out std_logic_vector (3 downto 0);
    Cathode_7Seg : out std_logic_vector (6 downto 0));
end Display;

architecture Behavioral of Display is
  component Processor
    port
    (
      PC_Reset : in std_logic;
      RB_Reset : in std_logic;
      Clk      : in std_logic;
      Out0     : out std_logic_vector(4 downto 0);
      Out1     : out std_logic_vector(4 downto 0);
      Out2     : out std_logic_vector(4 downto 0);
      Out3     : out std_logic_vector(4 downto 0);
      Out4     : out std_logic_vector(4 downto 0);
      Out5     : out std_logic_vector(4 downto 0);
      Out6     : out std_logic_vector(4 downto 0);
      Out7     : out std_logic_vector(4 downto 0);
      Zero     : out std_logic;
      Overflow : out std_logic
    );
  end component;
  
  component Slow_Clk 
      Port (
       Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC
             );
  end component;

  component LUT_16_7
    port
    (
      address : in std_logic_vector (4 downto 0);
      data    : out std_logic_vector (7 downto 0)
    );
  end component;

  -- Instantiate the Nano_Processor component
  signal Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7 : std_logic_vector(4 downto 0);

  signal data : std_logic_vector(7 downto 0);
  
  signal Clk_out : std_logic;

begin

  component_inst : Processor
  port map
  (
    PC_Reset => PC_Reset,
    RB_Reset => RB_Reset,
    Clk      => Clk_out,
    Out0     => Out0,
    Out1     => Out1,
    Out2     => Out2,
    Out3     => Out3,
    Out4     => Out4,
    Out5     => Out5,
    Out6     => Out6,
    Out7     => Out7,
    Zero     => Zero,
    Overflow => Overflow
  );
  
  slow_clk_inst : Slow_Clk
  port 
  map(
    Clk_in => Clk,
    Clk_out => Clk_out  
  );

  lut_inst : LUT_16_7
  port
  map (
  address => Out1,
  data    => data
  );

  -- Connect the outputs of Nano_Processor to the Display outputs
  LED_out      <= Out1;
  Dot          <= data(0);
  Anode_7Seg   <= "1110";
  Cathode_7Seg <= data(7 downto 1);

end Behavioral;