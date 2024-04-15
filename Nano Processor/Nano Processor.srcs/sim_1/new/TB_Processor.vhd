library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TB_Processor is
  --  Port ( );
end TB_Processor;

architecture Behavioral of TB_Processor is

  component Processor is
    port
    (
      PC_Reset : in std_logic;
      RB_Reset : in std_logic;
      Clk      : in std_logic;
      Out0     : out std_logic_vector(3 downto 0);
      Out1     : out std_logic_vector(3 downto 0);
      Out2     : out std_logic_vector(3 downto 0);
      Out3     : out std_logic_vector(3 downto 0);
      Out4     : out std_logic_vector(3 downto 0);
      Out5     : out std_logic_vector(3 downto 0);
      Out6     : out std_logic_vector(3 downto 0);
      Out7     : out std_logic_vector(3 downto 0);
      Zero     : out std_logic;
      Overflow : out std_logic
    );
  end component;

  signal PC_Reset : std_logic := '1';
  signal RB_Reset : std_logic := '1';
  signal Clk      : std_logic := '0';
  signal Out0     : std_logic_vector(3 downto 0);
  signal Out1     : std_logic_vector(3 downto 0);
  signal Out2     : std_logic_vector(3 downto 0);
  signal Out3     : std_logic_vector(3 downto 0);
  signal Out4     : std_logic_vector(3 downto 0);
  signal Out5     : std_logic_vector(3 downto 0);
  signal Out6     : std_logic_vector(3 downto 0);
  signal Out7     : std_logic_vector(3 downto 0);
  signal Zero     : std_logic;
  signal Overflow : std_logic;

  constant period : time := 40 ns;

begin

  -- Instantiate Processor
  UUT : Processor
  port map
  (
    PC_Reset => PC_Reset,
    RB_Reset => RB_Reset,
    Clk      => Clk,
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

  -- Clock initiation
  Clk <= not Clk after period/2;

  --Process
  process
  begin
    -- Apply reset
    PC_Reset <= '1';
    RB_Reset <= '1';
    wait for 5 * period;

    -- Release reset
    PC_Reset <= '0';
    RB_Reset <= '0';

    wait for period;
    assert Out1 = "1010" report "Move fails for R1" severity error;

    wait for period;
    assert Out2 = "0001" report "Move fails for R2" severity error;

    wait for period;
    assert Out2 = "1111" report "Negation fails for R2" severity error;

    wait for period;
    assert Out1 = "1001" report "Addition fails for R1 = R1 + R2" severity error;

    wait for 2*period;

    wait for period;
    assert Out1 = "1000" report "Addition fails for R1 = R1 + R2" severity error;
    
    wait for 2*period;

    wait for period;
    assert Out1 = "0111" report "Addition fails for R1 = R1 + R2" severity error;
    wait;
  end process;
end Behavioral;