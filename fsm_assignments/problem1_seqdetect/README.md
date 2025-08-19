# Sequence Detector 1101 (Mealy FSM with Overlap)

## Project Overview
This project implements a **Mealy Finite State Machine (FSM)** that detects the bit sequence `1101` in a serial input stream.  

- **FSM Type**: Mealy  
- **Sequence**: `1101`  
- **Overlap**: Allowed (the FSM can detect sequences that share bits with the previous match)  
- **Reset**: **Synchronous, active-high**  
- **Output (y)**: Generates a **1-cycle pulse** when the final `1` of the sequence arrives.  
- **din** (input given in tb): 11011011101
- **y** (expected outcome): 00010010001

