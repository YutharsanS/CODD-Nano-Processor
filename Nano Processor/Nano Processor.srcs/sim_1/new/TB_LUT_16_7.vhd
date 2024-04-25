library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LUT_16_7_tb is
end LUT_16_7_tb;

architecture tb of LUT_16_7_tb is

    component LUT_16_7
        Port (address : in STD_LOGIC_VECTOR (3 downto 0);
              data : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal address_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal data_tb : STD_LOGIC_VECTOR (7 downto 0);

begin

    DUT : LUT_16_7
    port map(
        address => address_tb,
        data => data_tb
    );

    process
    begin
        for i in 0 to 15 loop
            address_tb <= std_logic_vector(to_unsigned(i, 4));
            wait for 100 ns;

            case i is
                when 0 =>
                    assert data_tb = "10000001" report "Test failed for 0000" severity error;
                when 1 =>
                    assert data_tb = "11110011" report "Test failed for 0001" severity error;
                when 2 =>
                    assert data_tb = "01001001" report "Test failed for 0010" severity error;
                when 3 =>
                    assert data_tb = "01100001" report "Test failed for 0011" severity error;
                when 4 =>
                    assert data_tb = "00110011" report "Test failed for 0100" severity error;
                when 5 =>
                    assert data_tb = "00100101" report "Test failed for 0101" severity error;
                when 6 =>
                    assert data_tb = "00000101" report "Test failed for 0110" severity error;
                when 7 =>
                    assert data_tb = "11110001" report "Test failed for 0111" severity error;
                when 8 =>
                    assert data_tb = "00000000" report "Test failed for 1000" severity error;
                when 9 =>
                    assert data_tb = "11110000" report "Test failed for 1001" severity error;
                when 10 =>
                    assert data_tb = "00000100" report "Test failed for 1010" severity error;
                when 11 =>
                    assert data_tb = "00100100" report "Test failed for 1011" severity error;
                when 12 =>
                    assert data_tb = "00110010" report "Test failed for 1100" severity error;
                when 13 =>
                    assert data_tb = "01100000" report "Test failed for 1101" severity error;
                when 14 =>
                    assert data_tb = "01001000" report "Test failed for 1110" severity error;
                when 15 =>
                    assert data_tb = "11110010" report "Test failed for 1111" severity error;
            end case;
        end loop;

        wait;
    end process;

end tb;