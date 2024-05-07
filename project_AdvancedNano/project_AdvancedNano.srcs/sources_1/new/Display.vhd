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
    Negative     : out std_logic;
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
      PC_Adrs  : out std_logic_vector(4 downto 0);
      Zero     : out std_logic;
      Overflow : out std_logic;
      Negative : out std_logic
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
  signal Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7, PC_Adrs : std_logic_vector(4 downto 0);

  signal data1, data2, data3, data4 : std_logic_vector(7 downto 0);
  
  signal tempCathode_7Seg  : std_logic_vector(6 downto 0);

  signal tempAnode_7Seg : std_logic_vector(3 downto 0);
  
  signal Clk_out : std_logic;

  signal count:integer :=1; --counter for clock signal for segment display
  signal seg_Select :integer :=1; --counter for segment display select

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
    PC_Adrs  => PC_Adrs,
    Zero     => Zero,
    Overflow => Overflow,
    Negative => Negative
  );
  
  slow_clk_inst : Slow_Clk
  port 
  map(
    Clk_in => Clk,
    Clk_out => Clk_out  
  );

  lut_1 : LUT_16_7
  port
  map (
  address => Out1,
  data    => data1
  );

  lut_2 : LUT_16_7
  port
  map (
  address => Out2,
  data    => data2
  );

  lut_3 : LUT_16_7
  port
  map (
  address => Out3,
  data    => data3
  );

  lut_4 : LUT_16_7
  port
  map (
  address => Out4,
  data    => data4
  );

  -- Connect the outputs of Nano_Processor to the Display outputs
  LED_out      <= PC_Adrs;

  process(Clk) begin
    if(rising_edge(Clk))then
        count<=count+1;                 --increment counter for each rising edge
        if (count = 1000) then  
            count <= 1;                  --reset counter   

            if seg_Select = 1 then      --select segment display 1
                seg_Select <= 2;
                Dot          <= data1(0);
                tempAnode_7Seg   <= "0111";
                tempCathode_7Seg <= data1(7 downto 1);

            elsif seg_Select = 2 then   --select segment display 2
                seg_Select <= 3;
                Dot          <= data2(0);
                tempAnode_7Seg   <= "1011";
                tempCathode_7Seg <= data2(7 downto 1);

            elsif seg_Select = 3 then   --select segment display 3
                seg_Select <= 4;
                Dot          <= data3(0);
                tempAnode_7Seg   <= "1101";
                tempCathode_7Seg <= data3(7 downto 1);

            elsif seg_Select = 4 then   --select segment display 4
                seg_Select <= 1;
                Dot          <= data4(0);
                tempAnode_7Seg   <= "1110";
                tempCathode_7Seg <= data4(7 downto 1);
            end if;
        end if;
    end if;

  end process;

  Anode_7Seg   <= tempAnode_7Seg;
  Cathode_7Seg <= tempCathode_7Seg;

end Behavioral;