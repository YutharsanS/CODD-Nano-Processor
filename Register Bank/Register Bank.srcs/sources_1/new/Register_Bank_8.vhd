library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register_Bank_8 is
  port
  (
    Data   : in std_logic_vector(3 downto 0);
    Reg_En : in std_logic_vector(2 downto 0);
    En     : in std_logic;
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
end Register_Bank_8;

architecture Behavioral of Register_Bank_8 is

  component Decoder_3_to_8 -- Decoder
    port
    (
      I  : in std_logic_vector (2 downto 0);
      EN : in std_logic;
      Y  : out std_logic_vector (7 downto 0));
  end component;

  component Reg  -- Register
    port
    (
      D   : in std_logic_vector(3 downto 0);
      En  : in std_logic;
      Clk : in std_logic;
      Q   : out std_logic_vector(3 downto 0)
    );
  end component;

  signal d_out : std_logic_vector(7 downto 0) := "00000000";


begin

    Decoder_0 : Decoder_3_to_8
    port map (
        I => Reg_En,
        En => En,
        Y => d_out
    );


    Register_0 : Reg
    port map (
        D => Data,
        En => d_out(0),
        Clk => Clk,
        Q => Out0
    );

    Register_1 : Reg
    port map (
        D => Data,
        En => d_out(1),
        Clk => Clk,
        Q => Out1
    );

    Register_2 : Reg
    port map (
        D => Data,
        En => d_out(2),
        Clk => Clk,
        Q => Out2
    );

    Register_3 : Reg
    port map (
        D => Data,
        En => d_out(3),
        Clk => Clk,
        Q => Out3
    );

    Register_4 : Reg
    port map (
        D => Data,
        En => d_out(4),
        Clk => Clk,
        Q => Out4
    );

    Register_5 : Reg
    port map (
        D => Data,
        En => d_out(5),
        Clk => Clk,
        Q => Out5
    );

    Register_6 : Reg
    port map (
        D => Data,
        En => d_out(6),
        Clk => Clk,
        Q => Out6
    );

    Register_7 : Reg
    port map (
        D => Data,
        En => d_out(7),
        Clk => Clk,
        Q => Out7
    );

end Behavioral;