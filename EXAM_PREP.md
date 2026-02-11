# Exam Prep: Viva Questions & Live Code Changes

This guide prepares you for technical "What if?" questions and requests to modify the code on the fly during your SEE examination.

---

## 1. Likely Viva Questions (Theory & Logic)

**Q: Why do you use `rep movsb` instead of a loop?**
- **A**: `rep movsb` is a hardware-accelerated string instruction. It’s faster and more compact than a manual `MOV` loop because the processor handles the incrementing of SI/DI and the decrementing of CX in a single instruction cycle.

**Q: What happens if the `XOR` key is changed?**
- **A**: The system will still work perfectly *if* the key is changed globally. However, any existing passwords in the database would become unreadable because they were encrypted with the old key.

**Q: Why are your book names exactly 15 characters?**
- **A**: Fixed-th record sizes are essential for **Relative Addressing**. It allows us to calculate the address of the Nth book using `(N * 15)`, avoiding the need for linked list traversal.

**Q: How does the system prevent a student from issuing two copies of the same book?**
- **A**: (Note: If they ask this, look at `student_issue`). Currently, the system checks the *total count* and *overdue status*. A good follow-up would be: "We could add a check in the issue loop to see if `selected_book_idx` already exists in that user's issue records."

---

## 2. "Live Change" Challenges (Coding on the Spot)

### Challenge A: Change the Max Book Limit
**Examiner:** "Change the system so a student can only issue 2 books instead of 4."
- **Locate**: `student_issue` (Line 1994) and `admin_issue` (Line 898).
- **Change**: Find `cmp al, 4` and change it to `cmp al, 2`.

### Challenge B: Change the Encryption Key
**Examiner:** "The 'X' key is too simple. Use 0AAh instead."
- **Locate**: `.data` segment (Line 165).
- **Change**: `encrypt_key db 'X'` becomes `encrypt_key db 0AAh`.

### Challenge C: Shorten the Deadline
**Examiner:** "The library is now high-demand. Make the deadline 3 days."
- **Locate**: `student_issue` (Line 2046) and `admin_issue` (Line 944).
- **Change**: `mov byte ptr [bx], 7` becomes `mov byte ptr [bx], 3`.

### Challenge D: Add a Password Length Check
**Examiner:** "What if I want to ensure the password is exactly 5 characters and doesn't allow shorter ones via Enter?"
- **Logic**: You would look at `read_signup_pwd`.
- **Change**: Remove the `je pad_signup_pwd` branch, forcing the user to type all 5 characters before the loop finishes.

### Challenge E: Change Character Limits (e.g., Names from 10 to 20)
**Examiner:** "The names are too short. Make them 20 characters instead of 10."
-   **Step 1 (Data)**: Update the buffers in the `.data` segment.
    -   `name_in db 20 dup(?)` (Line 120)
    -   `student_names db 200 dup(?)` (10 students * 20 = 200) (Line 131)
    -   `request_names db 100 dup(?)` (5 requests * 20 = 100) (Line 140)
-   **Step 2 (Logic)**: Update all offset math.
    -   Find every occurrence of `mov bx, 10` related to names and change it to `mov bx, 20`.
-   **Step 3 (Input)**: Update the input loop.
    -   In `read_name`, change `mov cx, 10` to `mov cx, 20` (Line 437).

### The "Infinite" Challenge
**Examiner:** "Can you make the name length infinite?"
-   **The Answer**: "No, not in this architecture."
-   **The Reasoning**: 
    1.  **Static Allocation**: 8086 Assembly in Small model requires fixed-size segments. We must know the size at compile-time to prevent the data segment from overflowing into the code segment.
    2.  **Memory Constraints**: We only have 64KB for the data segment. "Infinite" would eventually crash the system.
    3.  **No OS Managed Heap**: In high-level languages like C or Python, 'infinite' strings use a dynamic heap. In 16-bit DOS Assembly, we would have to manualy write a memory manager (MALLOC logic), which is overkill for this system.

---

## 3. Deep-Dive Architecture & Theory

### A. Register Roles in the Project
- **Q: Why is SI and DI used so much in the database logic?**
  - **A**: `SI` (Source Index) and `DI` (Destination Index) are specifically designed for string and array operations. Instructions like `movsb` and `cmpsb` implicitly use them, making database scans and data copying much faster.
- **Q: What is the purpose of `AX` vs `AL`?**
  - **A**: `AX` is a 16-bit accumulator, while `AL` is its lower 8 bits. We use `AL` for character-level tasks (ASCII) and small counters (0-255), which saves time by avoiding unnecessary 16-bit operations.

### B. Logical vs. Arithmetic Flags
- **Q: How does `cmp` actually work?**
  - **A**: `cmp` performs a subtraction without saving the result. It only updates the **Flags register**. For equality, it sets the Zero Flag (`ZF=1`).
- **Q: Why use `xor` for encryption instead of `add`?**
  - **A**: If you use `add`, you might cause a **Carry Overflow** that changes the data's nature. `xor` is bitwise and symmetrical; performing `A XOR B XOR B` always returns `A`, making it perfect for reversible encryption.

### C. Segmented Memory
- **Q: Why did you use `.model small`?**
  - **A**: The "Small" model provides one 64KB segment for Code and one 64KB segment for Data. Since our library system is a compact embedded-style application, this is more than enough and simpler to manage than the "Large" or "Huge" models.
- **Q: What are `0Dh` and `0Ah` in your strings?**
  - **A**: They are the ASCII codes for **Carriage Return** (move to start of line) and **Line Feed** (move to next line). Together, they create a "Newline" effect in DOS.

---

## 4. Advanced "Live Change" Challenges

### Challenge F: Add a "Phone Number" Field
**Examiner:** "Add a 10-digit phone number to the student profile."
- **Data Modification**: 
  - Add `phone_in db 10 dup(?)` in `.data`.
  - Expand `student_phones db 100 dup(?)` (10 students * 10 digits).
- **Code Modification**: 
  - In `start_signup`, add a copy loop to move the input phone number to the new array.
  - In `admin_view_students`, add logic to print the phone number alongside the name.

### Challenge G: Implement a "Direct Delete"
**Examiner:** "The Admin wants to delete a student immediately by ID."
- **Logic**: Use `check_uid_exists` to find the index. Then, call the `remove_request` shift logic (modified for the student array) to pull all subsequent students up by one slot and decrement `student_count`.

### Challenge H: Block a Specific Book
**Examiner:** "Make the 'Operating Systems' book unavailable regardless of stock."
- **Code Modification**: 
  - In `student_view_books`, add a hard-coded check: `cmp si, 2` (if current index is OS book).
  - If match, `jmp skip_book_view` to hide it from the student.

---

## 5. Explaining Technical Decisions

- **Error Handling**: "I used `0FFh` and `0FEh` as return signals in AL because they are outside the range of valid indices (0-9), making them perfect for error flagging."
- **Memory Efficiency**: "By using `db` (byte) for counters and status instead of `dw` (word), I saved 50% of the memory required for metadata storage."
- **Validation**: "I used `call wait_for_enter` after every selection to prevent the 'Enter' key from being accidentally read by the *next* menu's input prompt."
- **Linear Search Performance**: "With a maximum of 10 students, a Linear Search takes only ~50-100 clock cycles. A Binary Search would require sorting the database first, which would add more complexity than it saves at this scale."

---

## 6. Project "Cheat Codes" (Boilerplate Logic)

If you are asked to write a new procedure from scratch, use these standard blocks:

### A. The "Linear Scan" Template
Used for searching IDs, counting books, or finding overdue items.
```assembly
    mov cl, [count_variable]  ; Set loop count
    xor ch, ch                ; Clear high byte
    xor si, si                ; Reset index
scan_loop:
    jcxz scan_done            ; Safety exit
    ; ... (Perform Comparison Logic Here) ...
    inc si                    ; Next record
    loop scan_loop            ; Decrement CX and Jump
scan_done:
```

### B. The "String Copy" Template
Used for moving IDs, Names, or Emails between buffers.
```assembly
    lea si, source_buffer     ; Source address
    lea di, dest_buffer       ; Destination address
    mov cx, [length]          ; Number of bytes
    rep movsb                 ; Hardware-accelerated copy
```

### C. The "Digit Display" Template
Used to print raw numbers (0-9) as ASCII characters.
```assembly
    add al, '0'               ; 5 -> '5'
    mov dl, al                ; Move to DL for printing
    mov ah, 02h               ; DOS Print Char function
    int 21h                   ; Execute
```

---

## 7. DOS Interrupt Reference (INT 21h)

The examiner might point to an `int 21h` and ask what it does. Here is the list:

| AH Value | Function | Usage in Project |
| :--- | :--- | :--- |
| **01h** | **Read Char with Echo** | Used in `read_char` to take menu choices and password inputs. |
| **02h** | **Display Character** | Used to print single spaces, digits, and ASCII characters. |
| **07h** | **Direct Input (No Echo)** | (Optional) Used for hidden passwords so characters don't show. |
| **09h** | **Print String** | Used for all headers, prompts, and success/error messages. |
| **0Bh** | **Check Input Status** | Used in `flush_buffer` to see if keys are waiting to be processed. |
| **4Ch** | **Terminate Process** | Used in `exit_program` to return control to the DOS shell. |

---

## 8. Master Challenge: The "Multi-Student" Issue
**Examiner:** "Allow the Admin to issue the *same* book to 3 different students at once."
- **Logic**: 
    1. Wrap the `admin_issue` logic in a `mov cx, 3` loop.
    2. Read `uid_in` three separate times inside the loop.
    3. Ensure `issue_count` is incremented after *each* successful record creation.
    4. **Crucial**: Check `book_stock` inside the loop to ensure you don't issue more than what's available during the batch!

---

## 9. Final Advice for Viva
- **Confidently point**: When they ask where a feature is, don't scroll aimlessly. Use your [NAVIGATION.md](./NAVIGATION.md) to jump directly to the line range.
- **Explain the 'Why'**: If you change a value, explain that you are also updating the **Data Segment** and **Offset Math** to keep the record structure aligned.
- **The "Safety" Argument**: "I added `wait_for_enter` and `flush_buffer` to make the system robust against accidental double-keypresses, which is a common point of failure in simple CLI tools."
