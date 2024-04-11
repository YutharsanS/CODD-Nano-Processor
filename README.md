# Components that are available now

## Register Bank

- Uses Registers internally.
- Registers are not abstract designs (as we did for the lab), but rather implemented using DFF and multiplexors.
- DFF is an abstract design (based on my research, there's no other option).
- The reset port assigns **all** registers the value 0. (Maybe they want us to control individual registers; I have to clarify.)

## 4-bit Register
- Made up of four 1-bit registers.
- Each register can be reset to the value of 0, so this entity can also be reset to "0000."

## 1-bit Register
- Ecapsulates a 2-way-1-bit multiplexor and DFF.
- Reset is connected to the reset of the DFF.

## DFF
- Abstract design (almost the same as what we used in the lab)
- But to prevent the initial undefined condition, the outputs are initially loaded with values (Q = 0).

## 2-way-1-bit multiplexor
- Since it's a simple one, it's implemented using primitive logical gates rather than the decoder.

## Program Counter
- Encapsulates a 3-bit register
- The register always **loads** some value, either the next instruction or the jump instruction; so, the EN port is set to '1'.
