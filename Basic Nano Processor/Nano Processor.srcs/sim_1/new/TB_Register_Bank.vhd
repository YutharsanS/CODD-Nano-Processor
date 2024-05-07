library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TB_Register_Bank is
  --  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

  component Register_Bank_8
    port
    (
      Data   : in std_logic_vector(3 downto 0);
      Reg_En : in std_logic_vector(2 downto 0);
      En     : in std_logic;
      Reset  : in std_logic;
      Clk    : in std_logic;
      Out0   : out std_logic_vector(3 downto 0);
      Out1   : out std_logic_vector(3 downto 0);
      Out2   : out std_logic_vector(3 downto 0);
      Out3   : out std_logic_vector(3 downto 0);
      Out4   : out std_logic_vector(3 downto 0);
      Out5   : out std_logic_vector(3 downto 0);
      Out6   : out std_logic_vector(3 downto 0);
      Out7   : out std_logic_vector(3 downto 0)

    );
  end component;

  signal Data   : std_logic_vector(3 downto 0);
  signal Reg_En : std_logic_vector(2 downto 0);
  signal En     : std_logic;
  signal Reset  : std_logic;
  signal Clk    : std_logic := '0';
  signal Out0   : std_logic_vector(3 downto 0);
  signal Out1   : std_logic_vector(3 downto 0);
  signal Out2   : std_logic_vector(3 downto 0);
  signal Out3   : std_logic_vector(3 downto 0);
  signal Out4   : std_logic_vector(3 downto 0);
  signal Out5   : std_logic_vector(3 downto 0);
  signal Out6   : std_logic_vector(3 downto 0);
  signal Out7   : std_logic_vector(3 downto 0);

  constant period : time := 40 ns;

begin
  UUT : Register_Bank_8
  port map
  (
    Data   => Data,
    Reg_En => Reg_En,
    En     => En,
    Reset  => Reset,
    Clk    => Clk,
    Out0   => Out0,
    Out1   => Out1,
    Out2   => Out2,
    Out3   => Out3,
    Out4   => Out4,
    Out5   => Out5,
    Out6   => Out6,
    Out7   => Out7
  );

  Clk <= (not Clk) after period/2;

  process
  begin
    Reset <= '0';
    En    <= '1';

    Data   <= "0000";
    Reg_En <= "000";

    wait for period;
    assert Out0 = "0000"
    report "False at Register 0 when W/R"
      severity error;

    Data   <= "0001";
    Reg_En <= "001";

    wait for period;
    assert Out1 = "0001"
    report "False at Register 1 when W/R"
      severity error;

    Data   <= "0010";
    Reg_En <= "010";

    wait for period;
    assert Out2 = "0010"
    report "False at Register 2 when W/R"
      severity error;

    Data   <= "0011";
    Reg_En <= "011";

    wait for period;
    assert Out3 = "0011"
    report "False at Register 3 when W/R"
      severity error;

    Data   <= "0100";
    Reg_En <= "100";

    wait for period;
    assert Out4 = "0100"
    report "False at Register 4 when W/R"
      severity error;

    Data   <= "0101";
    Reg_En <= "101";

    wait for period;
    assert Out5 = "0101"
    report "False at Register 5 when W/R"
      severity error;

    Data   <= "0110";
    Reg_En <= "110";

    wait for period;
    assert Out6 = "0110"
    report "False at Register 6 when W/R"
      severity error;

    Data   <= "0111";
    Reg_En <= "111";

    wait for period;
    assert Out7 = "0111"
    report "False at Register 7 when W/R"
      severity error;

    -- Reset test
    Reset <= '1';

    wait for period * 3;
    assert Out7 = "0000"
    report "False at Register 7 when resetting"
      severity error;
    assert Out4 = "0000"
    report "False at Register 4 when resetting"
      severity error;
    assert Out1 = "0000"
    report "False at Register 1 when resetting"
      severity error;

    -- Enable test for bank
    Reset <= '0';
    En    <= '1';

    Data   <= "0000";
    Reg_En <= "000";

    wait for period;
    assert Out0 = "0000"
    report "False at Register 0 when W/R"
      severity error;

    Data   <= "0001";
    Reg_En <= "001";

    wait for period;
    assert Out1 = "0001"
    report "False at Register 1 when W/R"
      severity error;

    Data   <= "0010";
    Reg_En <= "010";

    wait for period;
    assert Out2 = "0010"
    report "False at Register 2 when W/R"
      severity error;

    Data   <= "0011";
    Reg_En <= "011";

    wait for period;
    assert Out3 = "0011"
    report "False at Register 3 when W/R"
      severity error;

    Data   <= "0100";
    Reg_En <= "100";

    wait for period;
    assert Out4 = "0100"
    report "False at Register 4 when W/R"
      severity error;

    Data   <= "0101";
    Reg_En <= "101";

    wait for period;
    assert Out5 = "0101"
    report "False at Register 5 when W/R"
      severity error;

    Data   <= "0110";
    Reg_En <= "110";

    wait for period;
    assert Out6 = "0110"
    report "False at Register 6 when W/R"
      severity error;

    Data   <= "0111";
    Reg_En <= "111";

    wait for period;
    assert Out7 = "0111"
    report "False at Register 7 when W/R"
      severity error;

    -- Enable off
    En     <= '0';
    Data   <= "0000";
    Reg_En <= "111";

    wait for period;
    assert Out7 = "0111"
    report "False at Register 7 when W/R"
      severity error;

    Data   <= "1111";
    Reg_En <= "101";

    wait for period;
    assert Out5 = "0101"
    report "False at Register 5 when W/R"
      severity error;

    Data   <= "1010";
    Reg_En <= "011";

    wait for period;
    assert Out3 = "0011"
    report "False at Register 3 when W/R"
      severity error;

    wait;

  end process;

end Behavioral;