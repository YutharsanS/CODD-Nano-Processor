
# Entity: Register_Bank_8 
- **File**: Register_Bank_8.vhd

## Diagram
![Diagram](Register_Bank_8.svg "Diagram")
## Ports

| Port name | Direction | Type                         | Description |
| --------- | --------- | ---------------------------- | ----------- |
| Data      | in        | std_logic_vector(3 downto 0) |             |
| Reg_En    | in        | std_logic_vector(2 downto 0) |             |
| En        | in        | std_logic                    |             |
| Clk       | in        | std_logic                    |             |
| Out0      | out       | std_logic_vector(3 downto 0) |             |
| Out1      | out       | std_logic_vector(3 downto 0) |             |
| Out2      | out       | std_logic_vector(3 downto 0) |             |
| Out3      | out       | std_logic_vector(3 downto 0) |             |
| Out4      | out       | std_logic_vector(3 downto 0) |             |
| Out5      | out       | std_logic_vector(3 downto 0) |             |
| Out6      | out       | std_logic_vector(3 downto 0) |             |
| Out7      | out       | std_logic_vector(3 downto 0) |             |

## Signals

| Name  | Type                         | Description |
| ----- | ---------------------------- | ----------- |
| d_out | std_logic_vector(7 downto 0) |             |

## Instantiations

- Decoder_0: Decoder_3_to_8
- Register_0: Reg
- Register_1: Reg
- Register_2: Reg
- Register_3: Reg
- Register_4: Reg
- Register_5: Reg
- Register_6: Reg
- Register_7: Reg
