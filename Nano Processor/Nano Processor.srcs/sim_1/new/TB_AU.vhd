library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ADD_SUB_tb is
end ADD_SUB_tb;

architecture tb of ADD_SUB_tb is

  component ADD_SUB
    port
    (
      A     : in std_logic_vector (3 downto 0);
      B     : in std_logic_vector (3 downto 0);
      Ctrl  : in std_logic;
      C_out : out std_logic;
      S     : out std_logic_vector (3 downto 0);
      V     : out std_logic;
      Z     : out std_logic);
  end component;

  signal A_tb     : std_logic_vector (3 downto 0);
  signal B_tb     : std_logic_vector (3 downto 0);
  signal Ctrl_tb  : std_logic;
  signal C_out_tb : std_logic;
  signal S_tb     : std_logic_vector (3 downto 0);
  signal V_tb     : std_logic;
  signal Z_tb     : std_logic;

begin

  DUT : ADD_SUB
  port map
  (
    A     => A_tb,
    B     => B_tb,
    Ctrl  => Ctrl_tb,
    C_out => C_out_tb,
    S     => S_tb,
    V     => V_tb,
    Z     => Z_tb
  );

  process
  begin

    --Index1 : 220038U - 10 1101 1011 1000 0110
    --Index2 : 220404N - 10 1101 1100 1111 0100
    --Index3 : 220681H - 10 1101 1110 0000 1001
    --Index4 : 220738P - 10 1101 1110 0100 0010


    A_tb    <= "0100";
    B_tb    <= "0010";
    Ctrl_tb <= '0';
    wait for 100 ns;
    assert S_tb = "0110" and C_out_tb = '0' and V_tb = '0' and Z_tb = '0'
    report "Addition failed" severity error;

    A_tb    <= "0110";
    B_tb    <= "0100";
    Ctrl_tb <= '1';
    wait for 100 ns;
    assert S_tb = "0010" and C_out_tb = '1' and V_tb = '0' and Z_tb = '0'
    report "Subtraction failed" severity error;

    A_tb    <= "0100";
    B_tb    <= "0110";
    Ctrl_tb <= '0';
    wait for 100 ns;
    assert S_tb = "1010" and C_out_tb = '0' and V_tb = '1' and Z_tb = '0'
    report "Addition with overflow failed" severity error;

    A_tb    <= "1011";
    B_tb    <= "0100";
    Ctrl_tb <= '1';
    wait for 100 ns;
    assert S_tb = "0111" and C_out_tb = '1' and V_tb = '1' and Z_tb = '0'
    report "Subtraction with overflow failed" severity error;
    A_tb    <= "1110";
    B_tb    <= "1110";
    Ctrl_tb <= '1';
    wait for 100 ns;
    assert S_tb = "0000" and C_out_tb = '1' and V_tb = '0' and Z_tb = '1'
    report "Zero result failed" severity error;

    A_tb    <= "0100";
    B_tb    <= "1100";
    Ctrl_tb <= '0';
    wait for 100 ns;
    assert S_tb = "0000" and C_out_tb = '1' and V_tb = '0' and Z_tb = '1'
    report "Zero result failed" severity error;
    wait;
  end process;

end tb;