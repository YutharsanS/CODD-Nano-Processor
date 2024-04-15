library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Processor is
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
end Processor;

architecture Behavioral of Processor is

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

  component Program_Counter_3
    port
    (
      Data   : in std_logic_vector(2 downto 0);
      Clk    : in std_logic;
      Reset  : in std_logic;
      Output : out std_logic_vector(2 downto 0)
    );
  end component;

  component ADD_SUB
    port
    (
      A     : in std_logic_vector (3 downto 0);
      B     : in std_logic_vector (3 downto 0);
      Ctrl  : in std_logic;
      C_out : out std_logic;
      S     : out std_logic_vector (3 downto 0);
      V     : out std_logic;
      Z     : out std_logic
    );
  end component;

  component ADD_3
    port
    (
      A     : in std_logic_vector (2 downto 0);
      B     : in std_logic_vector (2 downto 0);
      C_in  : in std_logic;
      C_out : out std_logic;
      S     : out std_logic_vector (2 downto 0));
  end component;

  component Program_Rom_8
    port
    (
      M : in std_logic_vector(2 downto 0);
      I : out std_logic_vector(11 downto 0)
    );
  end component;

  component Mux_2_way_3
    port
    (
      A      : in std_logic_vector(2 downto 0);
      B      : in std_logic_vector(2 downto 0);
      Sel    : in std_logic;
      Output : out std_logic_vector(2 downto 0)
    );
  end component;

  component Mux_2_way_4
    port
    (
      A      : in std_logic_vector(3 downto 0);
      B      : in std_logic_vector(3 downto 0);
      Sel    : in std_logic;
      Output : out std_logic_vector(3 downto 0)
    );
  end component;

  component Instruction_Decoder_12
    port
    (
      I         : in std_logic_vector(11 downto 0);
      Reg_Check : in std_logic_vector(3 downto 0);
      Reg_EN    : out std_logic_vector(2 downto 0);
      Load_Sel  : out std_logic;
      Reg_1     : out std_logic_vector(2 downto 0);
      Reg_2     : out std_logic_vector(2 downto 0);
      AU_Ins    : out std_logic;
      Jump_Flag : out std_logic;
      Jump_Addr : out std_logic_vector(2 downto 0);
      Imd_Val   : out std_logic_vector(3 downto 0);
      RB_En     : out std_logic
    );
  end component;

  component Mux_8_way_4
    port
    (
      D0  : in std_logic_vector(3 downto 0);
      D1  : in std_logic_vector(3 downto 0);
      D2  : in std_logic_vector(3 downto 0);
      D3  : in std_logic_vector(3 downto 0);
      D4  : in std_logic_vector(3 downto 0);
      D5  : in std_logic_vector(3 downto 0);
      D6  : in std_logic_vector(3 downto 0);
      D7  : in std_logic_vector(3 downto 0);
      Sel : in std_logic_vector(2 downto 0);
      EN  : in std_logic;
      Y   : out std_logic_vector(3 downto 0)
    );
  end component;

  signal mux_out_23, pc_out, add3_out, jumpAddr, reg1, reg2, regEn : std_logic_vector(2 downto 0);
  signal jumpFlag, auIns, loadSel, rbEn                            : std_logic;
  signal ins                                                       : std_logic_vector(11 downto 0);
  signal mux840_out, mux841_out, au_out, imdVal, data_in           : std_logic_vector(3 downto 0);

  signal Out_0 : std_logic_vector(3 downto 0);-- := (others => '0');
  signal Out_1 : std_logic_vector(3 downto 0);-- := (others => '0');
  signal Out_2 : std_logic_vector(3 downto 0);-- := (others => '0');
  signal Out_3 : std_logic_vector(3 downto 0);-- := (others => '0');
  signal Out_4 : std_logic_vector(3 downto 0);-- := (others => '0');
  signal Out_5 : std_logic_vector(3 downto 0);-- := (others => '0');
  signal Out_6 : std_logic_vector(3 downto 0);-- := (others => '0');
  signal Out_7 : std_logic_vector(3 downto 0);-- := (others => '0');
begin

  PC : Program_Counter_3
  port map
  (
    Reset  => PC_Reset,
    Clk    => Clk,
    Data   => mux_out_23,
    Output => pc_out
  );

  Mux23 : Mux_2_way_3
  port
  map(
  A      => add3_out,
  B      => jumpAddr,
  Sel    => jumpFlag,
  Output => mux_out_23
  );

  Add3 : ADD_3
  port
  map
  (
  A    => pc_out,
  B    => "001",
  C_in => '0',
  C_out => open,
  S    => add3_out
  );

  Ins_Dec : Instruction_Decoder_12
  port
  map
  (
  I         => ins,
  Reg_Check => mux840_out,
  Reg_EN    => regEn,
  Load_Sel  => loadSel,
  Reg_1     => reg1,
  Reg_2     => reg2,
  AU_Ins    => auIns,
  Jump_Flag => jumpFlag,
  Jump_Addr => jumpAddr,
  Imd_Val   => imdVal,
  RB_En     => rbEn
  );

  PR : Program_Rom_8
  port
  map
  (
  M => pc_out,
  I => ins
  );

  AU : ADD_SUB
  port
  map
  (
  A    => mux841_out,
  B    => mux840_out,
  Ctrl => auIns,
  C_out => open,
  S    => au_out,
  V    => Overflow,
  Z    => Zero
  );

  Mux84_0 : Mux_8_way_4
  port
  map
  (
  D0  => Out_0,
  D1  => Out_1,
  D2  => Out_2,
  D3  => Out_3,
  D4  => Out_4,
  D5  => Out_5,
  D6  => Out_6,
  D7  => Out_7,
  Sel => reg1,
  EN  => '1',
  Y   => mux840_out
  );

  Mux84_1 : Mux_8_way_4
  port
  map
  (
  D0  => Out_0,
  D1  => Out_1,
  D2  => Out_2,
  D3  => Out_3,
  D4  => Out_4,
  D5  => Out_5,
  D6  => Out_6,
  D7  => Out_7,
  Sel => reg2,
  EN  => '1',
  Y   => mux841_out
  );

  Mux24 : Mux_2_way_4
  port
  map
  (
  A      => au_out,
  B      => imdVal,
  Sel    => loadSel,
  Output => data_in
  );

  RB : Register_Bank_8
  port
  map
  (
  Data   => data_in,
  Reg_En => regEn,
  En     => rbEn,
  Reset  => RB_Reset,
  Clk    => Clk,
  Out0   => Out_0,
  Out1   => Out_1,
  Out2   => Out_2,
  Out3   => Out_3,
  Out4   => Out_4,
  Out5   => Out_5,
  Out6   => Out_6,
  Out7   => Out_7
  );

  -- assignments
  Out0 <= Out_0;
  Out1 <= Out_1;
  Out2 <= Out_2;
  Out3 <= Out_3;
  Out4 <= Out_4;
  Out5 <= Out_5;
  Out6 <= Out_6;
  Out7 <= Out_7;

end Behavioral;