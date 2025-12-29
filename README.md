# FSM_Four_LEDs
Using Verilog, this code implements a state machine to switch between 4 states of LEDs repeatedly
The LED controller is implemented as a 4‑state Moore FSM, where each state corresponds to exactly one LED being active. The FSM uses a synchronous state register updated on the rising edge of the clock and a separate combinational block that computes the next state and the LED outputs based only on the current state. A Verilog testbench generates a periodic clock, applies an initial reset, and then allows the FSM to advance through four clock cycles before stopping the simulation.



<img width="757" height="437" alt="FSMstate" src="https://github.com/user-attachments/assets/3f850514-4053-438e-850b-f5fb53bb56b1" />



In the ModelSim waveform, the clk signal toggles with a 20 ns period, while reset_n is asserted low at the beginning and then released, enabling state transitions. After reset, the leds[3:0] bus clearly sequences through 0001 → 0010 → 0100 → 1000 → 0001, showing that the FSM cycles through its four states, each active for one clock period before moving to the next. The simulation is stopped after these four transitions.

<img width="573" height="499" alt="FSM_waveSimulation" src="https://github.com/user-attachments/assets/03a1b99e-5636-4d3b-a905-c43f7feafd9a" />
