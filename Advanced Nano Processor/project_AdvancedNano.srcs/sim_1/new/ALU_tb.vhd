library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
  -- Component Declaration
  component ALU
    port (
      A    : in  std_logic_vector(4 downto 0);
      B    : in  std_logic_vector(4 downto 0);
      Ctrl : in  std_logic_vector(2 downto 0);
      S    : out std_logic_vector(4 downto 0);
      O    : out std_logic;
      Z    : out std_logic;
      N    : out std_logic
    );
  end component;

  -- Stimulus signals
  signal A_tb    : std_logic_vector(4 downto 0);
  signal B_tb    : std_logic_vector(4 downto 0);
  signal Ctrl_tb : std_logic_vector(2 downto 0);

  -- Observed signals
  signal S_tb : std_logic_vector(4 downto 0);
  signal O_tb : std_logic;
  signal Z_tb : std_logic;
  signal N_tb : std_logic;

begin
  -- Instantiate the Unit Under Test (UUT)
  uut : ALU
    port map (
      A    => A_tb,
      B    => B_tb,
      Ctrl => Ctrl_tb,
      S    => S_tb,
      O    => O_tb,
      Z    => Z_tb,
      N    => N_tb
    );

  -- Stimulus process
  stim_proc : process
  begin
    -- Test cases for addition
    A_tb    <= "00000"; B_tb <= "00000"; Ctrl_tb <= "000"; wait for 10 ns;
    A_tb    <= "00101"; B_tb <= "00011"; Ctrl_tb <= "000"; wait for 10 ns;
    A_tb    <= "11111"; B_tb <= "00001"; Ctrl_tb <= "000"; wait for 10 ns;

    -- Test cases for subtraction
    A_tb    <= "00000"; B_tb <= "00000"; Ctrl_tb <= "001"; wait for 10 ns;
    A_tb    <= "01010"; B_tb <= "00111"; Ctrl_tb <= "001"; wait for 10 ns;
    A_tb    <= "00010"; B_tb <= "11111"; Ctrl_tb <= "001"; wait for 10 ns;

    -- Test cases for multiplication
    A_tb    <= "00000"; B_tb <= "00000"; Ctrl_tb <= "010"; wait for 10 ns;
    A_tb    <= "00101"; B_tb <= "00011"; Ctrl_tb <= "010"; wait for 10 ns;
    A_tb    <= "11111"; B_tb <= "11111"; Ctrl_tb <= "010"; wait for 10 ns;

    -- Test cases for AND operation
    A_tb    <= "00000"; B_tb <= "00000"; Ctrl_tb <= "100"; wait for 10 ns;
    A_tb    <= "01010"; B_tb <= "00101"; Ctrl_tb <= "100"; wait for 10 ns;
    A_tb    <= "11111"; B_tb <= "01010"; Ctrl_tb <= "100"; wait for 10 ns;

    -- Test cases for OR operation
    A_tb    <= "00000"; B_tb <= "00000"; Ctrl_tb <= "101"; wait for 10 ns;
    A_tb    <= "01010"; B_tb <= "00101"; Ctrl_tb <= "101"; wait for 10 ns;
    A_tb    <= "11111"; B_tb <= "01010"; Ctrl_tb <= "101"; wait for 10 ns;

    -- Test cases for NOT operation
    A_tb    <= "00000"; Ctrl_tb <= "110"; wait for 10 ns;
    A_tb    <= "01010"; Ctrl_tb <= "110"; wait for 10 ns;
    A_tb    <= "11111"; Ctrl_tb <= "110"; wait for 10 ns;

    -- Test cases for comparison
    A_tb    <= "00000"; B_tb <= "00000"; Ctrl_tb <= "111"; wait for 10 ns;
    A_tb    <= "01010"; B_tb <= "00101"; Ctrl_tb <= "111"; wait for 10 ns;
    A_tb    <= "00101"; B_tb <= "01010"; Ctrl_tb <= "111"; wait for 10 ns;

    wait; -- End the simulation
  end process;
end Behavioral;