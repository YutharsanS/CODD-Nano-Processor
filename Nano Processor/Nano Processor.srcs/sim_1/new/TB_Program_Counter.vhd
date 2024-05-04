library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TB_Program_Counter is
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is

  component Program_Counter_3
    port
    (
      Data   : in std_logic_vector(2 downto 0);
      Clk    : in std_logic;
      Reset  : in std_logic;
      Output : out std_logic_vector(2 downto 0)
    );
  end component;

  constant period : time      := 50 ns;
  signal Clk      : std_logic := '0';

  signal Data, Output : std_logic_vector(2 downto 0);
  signal Reset        : std_logic;

begin

  -- Clock generation process
  Clk <= not Clk after period / 2;

  -- Instantiate the Unit Under Test (UUT)
  UUT : Program_Counter_3
  port map
  (
    Clk    => Clk,
    Data   => Data,
    Reset  => Reset,
    Output => Output
  );

  -- Test cases
  process
  begin

    --Index1 : 220038U - 101 101 101 110 000 110
    --Index2 : 220404N - 101 101 110 011 110 100
    --Index3 : 220681H - 101 101 111 000 001 001
    --Index4 : 220738P - 101 101 111 001 000 010

    -- Test case 1: Set the counter
    Reset <= '0';
    Data  <= "110";
    wait for period;
    assert Output = "110" report "Test case 1 failed: set not working" severity error;

    -- Test case 2:
    Data  <= "100";
    wait for period;
    assert Output = "100" report "Test case 2 failed: set not working" severity error;

    -- Test case 3:
    Data  <= "011";
    wait for period;
    assert Output = "011" report "Test case 3 failed: set not working" severity error;

    -- Test case 4: Reset the counter
    Reset <= '1';
    wait for period;
    assert Output = "000" report "Test case 4 failed: Reset not working" severity error;

    -- Test case 3: Increment the counter
    for i in 0 to 7 loop

      Reset <= '0';
      Data  <= std_logic_vector(to_unsigned(i, 3));
      wait for period;
      assert Output = std_logic_vector(to_unsigned(i, 3)) report "Test case 3 failed: Increment not working" severity error;

    end loop;

    wait; -- Wait forever to keep the simulation running
  end process;

end Behavioral;