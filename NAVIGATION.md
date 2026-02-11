# Code Navigation Guide: Library Management System

Use this guide to quickly locate key logic during your presentation or when asked specific "Where is...?" questions.

---

## 1. Top-Level Structure
| Section | Line Range (Approx) | Purpose |
| :--- | :--- | :--- |
| **Data Segment** | 18 - 176 | Variable definitions, message strings, and database buffers. |
| **Utility Procs** | 181 - 340 | Basic I/O (Printing, Input Reading, XOR Encryption). |
| **Main Logic** | 344 - 362 | Program entry point and Role Selection loop. |
| **Signup System** | 364 - 607 | Patient detail collection and entry into Pending Queue. |
| **Login System** | 610 - 753 | Credential verification and role assignment. |
| **Admin Menu** | 760 - 1744 | Core management functions (Inventory, Approval, Staff View). |
| **Student Menu** | 1914 - 2367 | Core student functions (Issuing, Returning, Suggestions). |
| **Helper Procs** | 2371 - 2914 | Logic for counting issues, checking overdues, and queue shifting. |

---

## 2. Critical Logic Locators

### A. Security & Encryption
- **XOR Procedure**: `encrypt_password` (Line 311)
  - *Key instruction*: `xor byte ptr [si], 'X'` (Line 318)
- **Login Verification**: `find_student_login` (Line 2643)

### B. The "Smart" Heuristics
- **Overdue Block**: `check_overdue_issues` (Line 2481)
- **Issue Limit Check**: `count_student_issues` (Line 2430)
- **Queue Shifting**: `remove_request` (Line 2747)
- **Deadline Fast-Forward**: `admin_ffwd` (Line 1406)

### C. Database Operations
- **Approve Student**: `approve_user` label (Line 1606)
- **Add New Book**: `admin_add_book` (Line 1242)
- **Return Book (Logic)**: `student_return` (Line 2082)

---

## 3. Quick Tips for Navigation
- **Labels ending in `: `**: These are jump targets (e.g., `invalid_request:`).
- **Procedures ending in `endp`**: These are modular blocks called via `call`.
- **Register Usage**: 
  - `SI`/`DI`: Almost always used for string/array navigation.
  - `CX`: Almost always used as a loop counter for database scans.
  - `AL`: Usually holds the return value or a specific character/digit.
