# Test Plan for riscvtest.s

## Objective
Verify correct execution of the custom RVX10 instructions, resulting in the memory address 100 containing the value 25.

---

## Instructions Under Test

| Address | Instruction           | Description                    |
|---------|-----------------------|--------------------------------|
| 0x0     | addi x2, x0, -1       | x2 = -1                        |
| 0x4     | addi x3, x0, 0        | x3 = 0                         |
| 0x8     | andn x7, x3, x2       | x7 = x3 & ~x2, expect 0        |
| 0xC     | addi x2, x0, 25       | x2 = 25                        |
| 0x10    | addi x3, x0, 15       | x3 = 15                        |
| 0x14    | maxu x7, x3, x2       | x7 = max unsigned(x3, x2)      |
| 0x4C    | sw x7, 100(x0)        | memory[100] = x7 (expected 25) | 
| 0x50    | beq x2, x2, done      | infinite loop                  |

---

## Verification Steps

1. **Register Initialization:**
   - Confirm `x2` loads `-1` at cycle corresponding to address 0x0.
   - Confirm `x3` loads `0` at cycle corresponding to address 0x4.

2. **Custom Instruction `andn` Execution (address 0x8):**
   - Check that `x7` contains `x3 & ~x2`.
   - Since `x3 = 0` and `x2 = -1 (0xFFFFFFFF)`, expected `andn` result is `0 & ~0xFFFFFFFF = 0`.

3. **Immediate Loads:**
   - Confirm `x2` is updated to `25` at address 0xC.
   - Confirm `x3` is updated to `15` at address 0x10.

4. **Custom Instruction `maxu` Execution (address 0x14):**
   - Check `x7` contains the unsigned maximum of `x3` and updated `x2`.
   - Since `x3 = 15` and `x2 = 25`, expect `x7 = 25`.

5. **Memory Store (at 0x4C):**
   - Validate `MemWrite` is asserted.
   - Confirm the memory address is `100`.
   - Verify data written matches `x7`'s expected value `25`.

6. **Test End Condition:**
   - Ensure processor enters infinite loop at 0x50 by branching `beq x2, x2, done`.

---

## Expected Signals

- `RegWrite` asserted on addi, andn, maxu instructions writes.
- `MemWrite` asserted only for store at 0x4C.
- `ResultSrc` selects ALU output except for store instruction.
- `Zero` flags for `beq` instruction's branch decision.

---

## Test Bench Checks

- On memory write to address 100, check value is 25. Print `"Simulation succeeded"` if true.
- On any unexpected behavior or incorrect value, print `"Simulation failed"` and log register/memory content.
  
---

## Additional Notes

- Monitor PC values for correct address sequencing.
- Confirm the ALU control signals align with custom instructions during execution.
- Log register file read/write addresses and data for debugging if needed.
