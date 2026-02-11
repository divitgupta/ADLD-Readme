# Technical Architecture: 8086 Instruction Set Analysis

This document explains the Assembly Language Program (ALP) style used in the Library Management System, focusing on the instruction formats and addressing modes of the Intel 8086 architecture.

---

## 1. Classification: 2-Address Architecture
The Intel 8086 processor, used in this project, primarily follows a **2-Address Instruction Format**.

### What is a 2-Address Architecture?
In this style, most instructions specify two operands: a **Destination** and a **Source**. The result of the operation is stored in the destination operand, overwriting its previous value.

**Syntax Example:**
```assembly
MOV AX, 5       ; Destination: AX, Source: 5 (Direct Assignment)
ADD STUDENT_COUNT, 1 ; Destination: STUDENT_COUNT, Source: 1
```

### Comparison table
| Format | Syntax | Example | Usage in Project |
| :--- | :--- | :--- | :--- |
| **1-Address** | `Opcode Operand` | `ADD X` (Implies Accumulator) | Rare in 8086, except for `PUSH`/`POP`. |
| **2-Address** | `Opcode Dest, Src` | `MOV AX, BX` | **Standard for 8086.** Used for almost all logic here. |
| **3-Address** | `Opcode D, S1, S2` | `ADD R1, R2, R3` | Common in MIPS/RISC; not supported by 8086 natively. |

---

## 2. Instruction Set Deep Dive

### A. Data Movement (`MOV`)
-   **Function**: Copies data from source to destination.
-   **Requirement**: At least one operand must be a register. You cannot `MOV` directly from memory to memory.
-   **Project Implementation**: 
    ```assembly
    MOV AL, [BX]    ; Load book stock into AL
    ```

### B. Logical XOR (Symmetrical Security)
We utilize the XOR instruction for password protection.
-   **Instruction**: `XOR Dest, Key`
-   **Addressing**: Register-Immediate or Register-Memory.
-   **Logic**: 
    ```assembly
    XOR AL, 'X'     ; 2-address: Result stored back in AL
    ```

### C. String Instructions (`REP MOVSB`)
While 8086 is 2-address, string instructions are specialized "Implicit Address" instructions.
-   **Implicit Source**: `DS:SI`
-   **Implicit Destination**: `ES:DI`
-   **Project Usage**: Used for copying 30-character emails and 5-character IDs efficiently.

---

## 3. Addressing Modes Used
Our project leverages several 8086 addressing modes to manage the database:

1.  **Immediate Addressing**: `MOV CX, 5` (Constant value).
2.  **Register Addressing**: `MOV AX, BX` (Fastest, no memory access).
3.  **Direct Addressing**: `MOV AL, STUDENT_COUNT` (Accessing a specific variable).
4.  **Register Indirect Addressing**: `MOV AL, [BX]` (Accessing memory pointed to by a register).
5.  **Indexed Addressing**: `LEA SI, BOOK_NAMES` + `ADD SI, AX` (Used for offset calculations in databases).

---

## 4. Why 8086 for this System?
-   **Segmented Memory**: Allows us to separate code and data cleanly using `.data` and `.code`.
-   **Register Versatility**: Registers like `CX` act as dedicated loop counters, making database iterations very compact compared to high-level code.
-   **Hardware Interaction**: Simple `INT 21h` calls provide direct access to DOS I/O, vital for building interactive CLI tools.
