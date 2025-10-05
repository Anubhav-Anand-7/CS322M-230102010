# RVX10 Custom Instruction Encodings Reference

This document provides the detailed bitfield formats and sample encodings for the RVX10 custom instructions added to the RISC-V processor. It includes the traditional R-type instruction format and the specific opcode, funct7, and funct3 fields assigned to each custom instruction.

---

## Instruction Format

RVX10 instructions use the R-Type format with the following bitfields:

| Bits      | Field   | Description                            |
|-----------|---------|----------------------------------------|
| 31 - 25   | funct7  | 7-bit function code for the operation  |
| 24 - 20   | rs2     | Source register 2                      |
| 19 - 15   | rs1     | Source register 1                      |
| 14 - 12   | funct3  | 3-bit function code                    |
| 11 - 7    | rd      | Destination register                   |
| 6 - 0     | opcode  | Operation code (fixed at 0x0B)         |

**Custom Opcode:** `0001011` (0x0B)

---

| Instruction | funct7 | funct3 | Sample Regs (rd, rs1, rs2) | 32-bit Binary Encoding                          | Hex Code  | Description                     |
|-------------|--------|--------|----------------------------|------------------------------------------------|-----------|---------------------------------|
| ANDN        | 0000000| 000    | rd=7, rs1=3, rs2=2         | 0000000 00010 00011 000 00111 0001011          | 0x0021838B| x7 = x3 & ~x2                  |
| ORN         | 0000000| 001    | rd=7, rs1=3, rs2=2         | 0000000 00010 00011 001 00111 0001011          | To Compute| x7 = x3 | ~x2                   |
| XNOR        | 0000000| 010    | rd=7, rs1=3, rs2=2         | 0000000 00010 00011 010 00111 0001011          | To Compute| x7 = ~(x3 ^ x2)               |
| MIN         | 0000001| 000    | rd=7, rs1=3, rs2=2         | 0000001 00010 00011 000 00111 0001011          | To Compute| x7 = min signed(x3, x2)       |
| MAX         | 0000001| 001    | rd=7, rs1=3, rs2=2         | 0000001 00010 00011 001 00111 0001011          | To Compute| x7 = max signed(x3, x2)       |
| MINU        | 0000001| 010    | rd=7, rs1=3, rs2=2         | 0000001 00010 00011 010 00111 0001011          | To Compute| x7 = min unsigned(x3, x2)     |
| MAXU        | 0000001| 011    | rd=7, rs1=3, rs2=2         | 0000001 00010 00011 011 00111 0001011          | 0x0221B38B| x7 = max unsigned(x3, x2)     |
| ROL         | 0000010| 000    | rd=7, rs1=3, rs2=2         | 0000010 00010 00011 000 00111 0001011          | To Compute| x7 = rol(x3, x2[4:0])         |
| ROR         | 0000010| 001    | rd=7, rs1=3, rs2=2         | 0000010 00010 00011 001 00111 0001011          | To Compute| x7 = ror(x3, x2[4:0])         |
| ABS         | 0000011| 000    | rd=7, rs1=3, rs2=0         | 0000011 00000 00011 000 00111 0001011          | To Compute| x7 = abs(x3) (unary, rs2=x0) |

---

## Example Detailed Encoding: MAXU x7, x3, x2

- Binary: `00000010001000011011001110001011`
- Hex: `0x0221B38B`

- Fields:

  - funct7: 0000001 (bits 31-25)
  - rs2:    00010   (x2, bits 24-20)
  - rs1:    00011   (x3, bits 19-15)
  - funct3: 011     (bits 14-12)
  - rd:     00111   (x7, bits 11-7)
  - opcode: 0001011 (0x0B, bits 6-0)

This document provides a complete blueprint for your custom instruction encodings ready for integration, test vector generation, and validation.

