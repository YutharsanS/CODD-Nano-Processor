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
      C_in  : in std_logic;
      C_out : out std_logic;
      S     : out std_logic_vector (3 downto 0);
      V     : out std_logic);
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

begin

end Behavioral;