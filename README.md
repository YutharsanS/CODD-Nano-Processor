# Components that are available now

## Register Bank

- Uses Registers internally
- Registers are not abstract design(how we did for the lab), rather they are implemented using DFF and Multiplexors.
- DFF is an abstract design(based on my research, there's no other option)
- The reset port assigns **all** registers the value 0.(Maybe they want us to control individual registers, have to clarify)

## 4-bit Register
- Made up of four 1-bit registers.
- Each register can be resetable to the value of 0, so, this entity also can be resetable to "0000".

## 1-bit Register
- Ecapsulates a 2-way-1-bit multiplexor and DFF.
- Reset is connected to the reset of the DFF.

## DFF
- Abstract design(almost same as we used in the lab)
- But to prevent the initial undefined condition, the outputs are initially loaded with values(Q = 0)

## 2-way-1-bit Multiplexor
- Since it's a simple one, implemented using primitive logical gate rather than the decoder.
