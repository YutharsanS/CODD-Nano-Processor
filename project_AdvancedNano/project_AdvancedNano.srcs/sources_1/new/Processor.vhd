library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor is
  Port ( 
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
      Negative : out std_logic;
      Zero     : out std_logic;
      Overflow : out std_logic
  );
end Processor;

architecture Behavioral of Processor is

component Instruction_Decoder_15 
    Port 
    (
      I : in std_logic_vector(14 downto 0);
      Reg1_Check : in std_logic_vector(4 downto 0);
      Zflag_in : in std_logic;
      Nflag_in : in std_logic;
      Load_Sel : out std_logic;
      Imd_Val : out std_logic_vector(4 downto 0);
      Reg_1 : out std_logic_vector(2 downto 0);
      Reg_2 : out std_logic_vector(2 downto 0);
      Reg_EN : out std_logic_vector(2 downto 0);
      ALU_Control : out std_logic_vector(2 downto 0);
      RegisterBank_EN : out std_logic;
      Jump_Flag : out std_logic;
      Jump_Address : out std_logic_vector(4 downto 0)
    );
end component;

component Program_ROM_15 
    port
    (
     M    : in std_logic_vector(4 downto 0);
     I    : out std_logic_vector(14 downto 0)
 );
end component;

component ALU 
  port
  (
    A    : in std_logic_vector(4 downto 0);
    B    : in std_logic_vector(4 downto 0);
    Ctrl : in std_logic_vector(2 downto 0);
    S    : out std_logic_vector(4 downto 0);
    O    : out std_logic;
    Z    : out std_logic;
    N    : out std_logic
  );
end component;

component Register_Bank_8 
  port
  (
    Data   : in std_logic_vector(4 downto 0);
    Reg_En : in std_logic_vector(2 downto 0);
    En     : in std_logic;
    Reset  : in std_logic;
    Clk    : in std_logic;
    Out0   : out std_logic_vector(4 downto 0);
    Out1   : out std_logic_vector(4 downto 0);
    Out2   : out std_logic_vector(4 downto 0);
    Out3   : out std_logic_vector(4 downto 0);
    Out4   : out std_logic_vector(4 downto 0);
    Out5   : out std_logic_vector(4 downto 0);
    Out6   : out std_logic_vector(4 downto 0);
    Out7   : out std_logic_vector(4 downto 0)
  );
end component;

component Mux_8_way_5 
  port
    (
        D0      : in std_logic_vector(4 downto 0);
        D1      : in std_logic_vector(4 downto 0);
        D2      : in std_logic_vector(4 downto 0);
        D3      : in std_logic_vector(4 downto 0);
        D4      : in std_logic_vector(4 downto 0);
        D5      : in std_logic_vector(4 downto 0);
        D6      : in std_logic_vector(4 downto 0);
        D7      : in std_logic_vector(4 downto 0);
        Sel     : in std_logic_vector(2 downto 0);
        EN      : in std_logic;
        Y : out std_logic_vector(4 downto 0)
    );
end component;

component Register_5 
  port
  (
    D     : in std_logic_vector(4 downto 0);
    En    : in std_logic;
    Clk   : in std_logic;
    Reset : in std_logic;
    Q     : out std_logic_vector(4 downto 0)
  );
 end component;
  
 component PC_ADD_5 
    Port ( 
      Adrs : in STD_LOGIC_VECTOR (4 downto 0);
      C_out : out STD_LOGIC;
      S : out STD_LOGIC_VECTOR (4 downto 0));
 end component;
 
 component Mux_2_way_5 is
   port
   (
     A      : in std_logic_vector(4 downto 0);
     B      : in std_logic_vector(4 downto 0);
     Sel    : in std_logic;
     Output : out std_logic_vector(4 downto 0)
   );
 end component;
 
 signal Out_0, Out_1, Out_2, Out_3, Out_4, Out_5, Out_6, Out_7 : std_logic_vector(4 downto 0);
 signal mux850_out, mux851_out, Imd_val, Jump_Adrs, PC_Add_out, PC_Mux_out, Load_Sel_Mux_out : std_logic_vector(4 downto 0);
 signal ALU_S, M : std_logic_vector(4 downto 0);
 signal reg1, reg2, ALU_Ctrl, Reg_EN : std_logic_vector(2 downto 0);
 signal I : std_logic_vector(14 downto 0);
 signal ALU_O, ALU_Z, ALU_N, Oflag, Zflag, Nflag, Load_Sel, RB_En, Jump_Flag : std_logic;

begin

Instruc_Dec : Instruction_Decoder_15
port map
(
    I => I,
    Reg1_Check => mux850_out,
    Zflag_in => Zflag,
    Nflag_in => Nflag,
    Load_Sel => Load_Sel,
    Imd_Val => Imd_val,
    Reg_1 => reg1,
    Reg_2 => reg2,
    Reg_EN => Reg_EN,
    ALU_Control => ALU_Ctrl,
    RegisterBank_EN => RB_En,
    Jump_Flag => Jump_Flag,
    Jump_Address => Jump_Adrs
);

PR : Program_ROM_15
port map
(
    M => M,
    I => I
);

RB : Register_Bank_8
port map
(
    Data   => Load_Sel_Mux_out,
    Reg_En => Reg_EN,
    En     => RB_En,
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

Load_Sel_Mux : Mux_2_way_5
port map
(
    A      => ALU_S,
    B      => Imd_val,
    Sel    => Load_Sel,
    Output => Load_Sel_Mux_out
);

Mux85_0 : Mux_8_way_5
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
  Y   => mux850_out
  );
  
Mux85_1 : Mux_8_way_5
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
    Y   => mux851_out
    );

ALU0 : ALU
port map(
    A      => mux850_out,
    B      => mux851_out,
    Ctrl   => ALU_Ctrl,
    S      => ALU_S,
    O      => ALU_O,
    Z      => ALU_Z,
    N      => ALU_N
);

Flag_Reg : Register_5
port map
(
    D(4 downto 3) => "00",
    D(2) => ALU_O,
    D(1) => ALU_Z,
    D(0) => ALU_N,
    En    => '1',
    Clk   => Clk,
    Reset => PC_Reset,
    Q(2) => Oflag,
    Q(1) => Zflag,
    Q(0) => Nflag
);

PC : Register_5
port map
(
    D => PC_Mux_out,
    En    => '1',
    Clk   => Clk,
    Reset => PC_Reset,
    Q => M
);

PC_Add : PC_ADD_5
port map
(
    Adrs => M,
    C_out => open,
    S => PC_Add_out
);

PC_Mux : Mux_2_way_5
port map
(
    A      => PC_Add_out,
    B      => Jump_Adrs,
    Sel    => Jump_Flag,
    Output => PC_Mux_out
);

end Behavioral;
