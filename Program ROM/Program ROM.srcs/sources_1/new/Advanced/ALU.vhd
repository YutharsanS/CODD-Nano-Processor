library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ALU is
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
end ALU;

architecture Behavioral of ALU is

  component ADD_SUB
    port
    (
      A     : in std_logic_vector (4 downto 0);
      B     : in std_logic_vector (4 downto 0);
      Ctrl  : in std_logic;
      C_out : out std_logic;
      S     : out std_logic_vector (4 downto 0);
      O     : out std_logic;
      Z     : out std_logic;
      N     : out std_logic);
  end component;

  component Multiplier_5
    port
    (
      A : in std_logic_vector(4 downto 0);
      B : in std_logic_vector(4 downto 0);
      S : out std_logic_vector(4 downto 0);
      O : out std_logic;
      Z : out std_logic;
      N : out std_logic
    );
  end component;

  component Comp_5
    port
    (
      A : in std_logic_vector(4 downto 0);
      B : in std_logic_vector(4 downto 0);
      Z : out std_logic;
      N : out std_logic
    );
  end component;

  component AND_5 is
    port
    (
      A : in std_logic_vector(4 downto 0);
      B : in std_logic_vector(4 downto 0);
      S : out std_logic_vector(4 downto 0);
      Z : out std_logic
    );
  end component;

  component OR_5 is
    port
    (
      A : in std_logic_vector(4 downto 0);
      B : in std_logic_vector(4 downto 0);
      S : out std_logic_vector(4 downto 0);
      Z : out std_logic
    );
  end component;

  component NOT_5 is
    port
    (
      A : in std_logic_vector(4 downto 0);
      S : out std_logic_vector(4 downto 0);
      Z : out std_logic
    );
  end component;

  component Mux_8_way_5 is
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

  component Mux_8_way_1 is
    port 
    ( 
      Sel : in std_logic_vector (2 downto 0);
      D : in std_logic_vector (7 downto 0);
      EN : in std_logic;
      Y : out std_logic
    );
  end component;

  signal addSubS, mulS, andS, orS, notS        : std_logic_vector(4 downto 0);
  signal addSubZ, mulZ, andZ, orZ, notZ, compZ : std_logic;
  signal addSubN, mulN, compN                  : std_logic;
  signal addSubO, mulO                         : std_logic;

begin

  AddSub : ADD_SUB
  port map
  (
    A    => A,
    B    => B,
    Ctrl => Ctrl(0),
    S    => addSubS,
    O    => addSubO,
    Z    => addSubZ,
    N    => addSubN
  );

  Multiplier : Multiplier_5
  port map
  (
    A => A,
    B => B,
    S => mulS,
    O => mulO,
    Z => mulZ,
    N => mulN
  );

  Comp : Comp_4
  port map
  (
    A => A,
    B => B,
    Z => compZ,
    N => compN
  );

  And : AND_5
  port map
  (
    A => A,
    B => B,
    S => andS,
    Z => andZ
  );

  Or : AND_5
  port map
  (
    A => A,
    B => B,
    S => orS,
    Z => orZ
  );

  Not : AND_5
  port map
  (
    A => A,
    B => B,
    S => notS,
    Z => notZ
  );


  S_Selector : Mux_8_way_5
  port map
  (
      D0   => addSubS,
      D1   => addSubS,
      D2   => mulS,
      D3   => addSubS,
      D4   => andS,
      D5   => orS,
      D6   => notS,
      D7   => "00000",
      Sel  => Ctrl,
      EN   => '1',
      Y    => S
  );

  O_Selector : Mux_8_way_1
  port map
  (
    Sel  => Ctrl,
    D(0) => addSubO,
    D(1) => addSubO,
    D(2) => mulO,
    D(3) => addSubO
    D(4) => '0',
    D(5) => '0',
    D(6) => '0',
    D(7) => '0',
    EN   => '1',
    Y    => Z
  );

  Z_Selector : Mux_8_way_1
  port map
  (
    Sel  => Ctrl,
    D(0) => addSubZ,
    D(1) => addSubZ,
    D(2) => mulZ,
    D(3) => addSubZ
    D(4) => andZ,
    D(5) => orZ,
    D(6) => notZ,
    D(7) => compZ,
    EN   => '1',
    Y    => Z
  );

  N_Selector : Mux_8_way_1
  port map
  (
    Sel  => Ctrl,
    D(0) => addSubN,
    D(1) => addSubN,
    D(2) => mulN,
    D(3) => addSubN
    D(4) => '0',
    D(5) => '0',
    D(6) => '0',
    D(7) => compN,
    EN   => '1',
    Y    => Z
  );

  
end Behavioral;