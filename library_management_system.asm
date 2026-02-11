.model small ; Set memory model to small
.stack 100h  ; Allocate 256 bytes for stack

.data ; Data segment starts here

; SYSTEM MESSAGES
msg_welcome db 0Dh,0Ah,'===== LIBRARY MANAGEMENT SYSTEM =====$' ; Welcome message string
msg_main    db 0Dh,0Ah,0Dh,0Ah,'1. Login'                       ; Main menu option 1
            db 0Dh,0Ah,'2. Sign Up'                             ; Main menu option 2
            db 0Dh,0Ah,'3. Exit'                                ; Main menu option 3
            db 0Dh,0Ah,'Choice: $'                              ; Choice prompt
msg_uid     db 0Dh,0Ah,'Enter User ID: $'                       ; User ID prompt
msg_pwd     db 0Dh,0Ah,'Enter Password: $'                      ; Password prompt
msg_ok      db 0Dh,0Ah,'Login Successful! $'                    ; Success message
msg_fail    db 0Dh,0Ah,'Invalid Credentials! $'                 ; Failure message
msg_lock    db 0Dh,0Ah,'Account Locked! Too many attempts! $'   ; Lockout message
msg_pending db 0Dh,0Ah,'Account Pending Admin Approval! $'      ; Pending status message

; SIGNUP MESSAGES
msg_signup  db 0Dh,0Ah,0Dh,0Ah,'----- STUDENT SIGNUP -----$'   ; Signup header
msg_newuid  db 0Dh,0Ah,'Enter User ID (5 chars): $'             ; New ID prompt
msg_email   db 0Dh,0Ah,'Enter Email (30 chars): $'              ; Email prompt
msg_name    db 0Dh,0Ah,'Enter Name (10 chars): $'               ; Name prompt
msg_newpwd  db 0Dh,0Ah,'Enter Password (5 chars): $'            ; New password prompt
msg_confirm db 0Dh,0Ah,'Confirm Password: $'                    ; Password confirmation prompt
msg_reqsent db 0Dh,0Ah,'Signup Request Sent! Wait for Admin Approval $' ; Request sent message
msg_pwdmis  db 0Dh,0Ah,'Passwords Do Not Match! $'              ; Password mismatch error
msg_exists  db 0Dh,0Ah,'User ID Already Exists! $'               ; Duplicate ID error
msg_reqfull db 0Dh,0Ah,'Signup Queue Full! Try Later $'         ; Queue full error

; MENU MESSAGES
admin_menu db 0Dh,0Ah,0Dh,0Ah,'----- ADMIN MENU -----'          ; Admin menu header
           db 0Dh,0Ah,'1. View All Books'                       ; Admin option 1
           db 0Dh,0Ah,'2. Issue Book'                           ; Admin option 2
           db 0Dh,0Ah,'3. Return Book'                          ; Admin option 3
           db 0Dh,0Ah,'4. Add Stock'                            ; Admin option 4
           db 0Dh,0Ah,'5. Add New Book'                         ; Admin option 5
           db 0Dh,0Ah,'6. View Issued Books'                    ; Admin option 6
           db 0Dh,0Ah,'7. View Suggestions'                     ; Admin option 7
           db 0Dh,0Ah,'8. Approve Signups'                      ; Admin option 8
           db 0Dh,0Ah,'9. View All Students'                    ; Admin option 9
           db 0Dh,0Ah,'F. Fast Forward (1 Day)'                 ; Admin option F
           db 0Dh,0Ah,'0. Logout'                               ; Admin option 0
           db 0Dh,0Ah,'Choice: $'                               ; Choice prompt

student_menu db 0Dh,0Ah,0Dh,0Ah,'----- STUDENT MENU -----'      ; Student menu header
             db 0Dh,0Ah,'1. View Available Books'               ; Student option 1
             db 0Dh,0Ah,'2. Issue Book'                         ; Student option 2
             db 0Dh,0Ah,'3. Return Book'                        ; Student option 3
             db 0Dh,0Ah,'4. My Issued Books'                    ; Student option 4
             db 0Dh,0Ah,'5. Suggest New Book'                   ; Student option 5
             db 0Dh,0Ah,'6. Logout'                             ; Student option 6
             db 0Dh,0Ah,'Choice: $'                             ; Choice prompt

; OPERATION MESSAGES
msg_select  db 0Dh,0Ah,'Enter Book Number: $'                   ; Book selection prompt
msg_reqsel  db 0Dh,0Ah,'Enter Request Number: $'                 ; Request selection prompt
msg_qty     db 0Dh,0Ah,'Enter Quantity (1-9): $'                ; Quantity prompt
msg_issued  db 0Dh,0Ah,'Book Issued! Deadline: 7 days $'        ; Issue confirmation
msg_return  db 0Dh,0Ah,'Book Returned Successfully $'           ; Return confirmation
msg_added   db 0Dh,0Ah,'Stock Added Successfully $'             ; Stock update confirmation
msg_nostk   db 0Dh,0Ah,'Book Out of Stock! $'                   ; Stock error
msg_limit   db 0Dh,0Ah,'Issue Limit Reached! (Max 4 books) $'   ; Limit error
msg_invalid db 0Dh,0Ah,'Invalid Selection! $'                   ; Validation error
msg_newbook db 0Dh,0Ah,'Enter Book Name (15 chars): $'          ; New book name prompt
msg_stock   db 0Dh,0Ah,'Enter Initial Stock (1-9): $'           ; Initial stock prompt
msg_maxstk  db 0Dh,0Ah,'Enter Max Stock (1-9): $'               ; Max stock prompt
msg_created db 0Dh,0Ah,'Book Added Successfully! $'             ; Add book confirmation
msg_full    db 0Dh,0Ah,'Book Database Full! $'                  ; Database full error
msg_suggest db 0Dh,0Ah,'Suggestion Recorded! $'                 ; Suggestion recorded message
msg_nobook  db 0Dh,0Ah,'No Books Issued $'                      ; Empty issue list
msg_noreq   db 0Dh,0Ah,'No Pending Signup Requests $'           ; Empty request list
msg_nosuggest db 0Dh,0Ah,'No Book Suggestions Yet $'             ; Empty suggestion list
msg_ffwd    db 0Dh,0Ah,'Date Fast-Forwarded by 1 Day! $'        ; Fast-forward confirmation
msg_target_uid db 0Dh,0Ah,'Enter Student User ID: $'            ; Target student ID prompt
msg_overdue db 0Dh,0Ah,'Return Previous Book! Deadline Reached. $' ; Overdue warning
msg_approved db 0Dh,0Ah,'User Approved Successfully! $'         ; Approval confirmation
msg_rejected db 0Dh,0Ah,'User Rejected! $'                      ; Rejection confirmation
msg_nostud  db 0Dh,0Ah,'No Students Registered $'               ; Empty student list

; DISPLAY HEADERS
hdr_books   db 0Dh,0Ah,0Dh,0Ah,'No. Book Name          Stock MaxStock',0Dh,0Ah ; Book list header
            db '--- ------------------ ----- --------$'                         ; Table separator

hdr_issued  db 0Dh,0Ah,0Dh,0Ah,'No. Book Name          User       Days Left',0Dh,0Ah ; Issued list header
            db '--- ------------------ ---------- ---------$'                         ; Table separator

hdr_suggest db 0Dh,0Ah,0Dh,0Ah,'Suggested Books by Students:',0Dh,0Ah ; Suggestion header
            db '--- ------------------ --------$'                       ; Table separator

hdr_requests db 0Dh,0Ah,0Dh,0Ah,'Pending Signup Requests:',0Dh,0Ah ; Request list header
             db 'No. User ID    Email                          Name',0Dh,0Ah ; Column names
             db '--- ---------- ------------------------------ ----------$' ; Table separator

hdr_students db 0Dh,0Ah,0Dh,0Ah,'Registered Students:',0Dh,0Ah ; Student list header
             db 'No. User ID    Email                          Name           Status',0Dh,0Ah ; Column names
             db '--- ---------- ------------------------------ -------------- --------$'          ; Table separator

; USER CREDENTIALS AND DATA
admin_id    db 'admin'                  ; Admin username constant
admin_pwd   db 'admin'                  ; Default admin credentials
uid_in      db 5 dup(?)                 ; Input buffer for user ID
pwd_in      db 5 dup(?)                 ; Input buffer for password
pwd_confirm db 5 dup(?)                 ; Password confirmation buffer
email_in    db 30 dup(?)                ; Input buffer for email
name_in     db 10 dup(?)                ; Input buffer for name
attempts    db 3                        ; Login attempt counter
user_role   db 0                        ; 0=none, 1=admin, 2=student
current_uid db 5 dup(?)                 ; Currently logged in user ID

; STUDENT DATABASE
MAX_STUDENTS   equ 10                   ; Maximum number of students
student_count  db 0                     ; Number of registered students
student_ids    db 50 dup(?)             ; 10 students * 5 chars each
student_pwds   db 50 dup(?)             ; 10 students * 5 chars (encrypted)
student_emails db 300 dup(?)            ; 10 students * 30 chars each
student_names  db 100 dup(?)            ; 10 students * 10 chars each
student_status db 10 dup(0)             ; 0=inactive, 1=active

; SIGNUP REQUESTS QUEUE
MAX_REQUESTS   equ 5                    ; Maximum number of requests
request_count  db 0                     ; Number of pending requests
request_ids    db 25 dup(?)             ; 5 requests * 5 chars each
request_pwds   db 25 dup(?)             ; 5 requests * 5 chars (encrypted)
request_emails db 150 dup(?)            ; 5 requests * 30 chars each
request_names  db 50 dup(?)             ; 5 requests * 10 chars each

; BOOK DATABASE
MAX_BOOKS   equ 10                      ; Maximum books in database
book_count  db 3                        ; Initial pre-loaded book count
book_names  db 'C Programming  '        ; Book 1 name
            db 'Data Structures'        ; Book 2 name
            db 'Operating Sys  '        ; Book 3 name
            db 105 dup(?)               ; Space for 7 more books (105 bytes)
book_stock  db 5, 3, 2, 7 dup(0)       ; Current stock levels for each book
book_max    db 9, 8, 7, 7 dup(9)       ; Maximum stock capacity for each book

; ISSUED BOOKS TRACKING
MAX_ISSUES     equ 20                   ; Maximum active issues
issue_count    db 0                     ; Current number of issued books
issue_bookno   db 20 dup(0)            ; Book indices (1-indexed)
issue_userid   db 100 dup(?)           ; User IDs for active issues (20 * 5)
issue_days     db 20 dup(0)            ; Days remaining for each issue

; BOOK SUGGESTIONS
MAX_SUGGEST    equ 10                   ; Maximum book suggestions
suggest_count  db 0                     ; Current number of suggestions
suggest_names  db 150 dup(?)           ; Suggestion names (10 * 15)

; ENCRYPTION SETTINGS
encrypt_key db 'X'                      ; XOR encryption key character

; TEMPORARY VARIABLES
temp_byte   db 0                        ; Multi-purpose byte variable
temp_word   dw 0                        ; Multi-purpose word variable
temp_idx    db 0                        ; Temporary index storage
selected_book_idx db 0                  ; Index of book being processed

; ADDITIONAL MESSAGES
msg_press_enter db 0Dh,0Ah,'Press Enter to continue...$'      ; Continuation prompt
msg_approve_reject db 0Dh,0Ah,'(A)pprove/(R)eject: $'          ; Approval Choice prompt

.code ; Code segment starts here

; UTILITY PROCEDURES

; Procedure: print_string
; Displays a '$' terminated string from DX
print_string proc
    push ax                             ; Preserve AX register
    mov ah, 09h                         ; DOS: Print string function
    int 21h                             ; Call DOS interrupt
    pop ax                              ; Restore AX register
    ret                                 ; Return to caller
print_string endp

; Procedure: print_newline
; Prints carriage return and line feed
print_newline proc
    push ax                             ; Preserve AX register
    push dx                             ; Preserve DX register
    mov dl, 0Dh                         ; Carriage return character
    mov ah, 02h                         ; DOS: Display character function
    int 21h                             ; Call DOS interrupt
    mov dl, 0Ah                         ; Line feed character
    mov ah, 02h                         ; DOS: Display character function
    int 21h                             ; Call DOS interrupt
    pop dx                              ; Restore DX register
    pop ax                              ; Restore AX register
    ret                                 ; Return to caller
print_newline endp

; Procedure: show_digit
; Displays a single digit (0-9) passed in AL
show_digit proc
    push ax                             ; Preserve AX register
    push dx                             ; Preserve DX register
    add al, '0'                         ; Convert digit to ASCII
    mov dl, al                          ; Move ASCII char to DL
    mov ah, 02h                         ; DOS: Display character function
    int 21h                             ; Call DOS interrupt
    pop dx                              ; Restore DX register
    pop ax                              ; Restore AX register
    ret                                 ; Return to caller
show_digit endp

; Procedure: show_number
; Displays a two-digit number passed in AL
show_number proc
    push ax                             ; Preserve AX register
    push bx                             ; Preserve BX register
    push dx                             ; Preserve DX register
    mov bl, 10                          ; Divisor to separate digits
    xor ah, ah                          ; Clear AH for division
    div bl                              ; AL = quotient (tens), AH = remainder (units)
    push ax                             ; Save remainder
    call show_digit                      ; Display tens digit
    pop ax                              ; Restore remainder
    mov al, ah                          ; Move remainder to AL
    call show_digit                      ; Display units digit
    pop dx                              ; Restore DX register
    pop bx                              ; Restore BX register
    pop ax                              ; Restore AX register
    ret                                 ; Return to caller
show_number endp

; Procedure: print_spaces
; Prints CX number of spaces
print_spaces proc
    push ax                             ; Preserve AX register
    push dx                             ; Preserve DX register
    push cx                             ; Preserve CX register
space_loop:
    mov dl, ' '                         ; Space character
    mov ah, 02h                         ; DOS: Display character function
    int 21h                             ; Call DOS interrupt
    loop space_loop                     ; Repeat CX times
    pop cx                              ; Restore CX register
    pop dx                              ; Restore DX register
    pop ax                              ; Restore AX register
    ret                                 ; Return to caller
print_spaces endp

; Procedure: read_char
; Reads a character from keyboard with echo
read_char proc
    mov ah, 01h                         ; DOS: Read char with echo function
    int 21h                             ; Call DOS interrupt
    ret                                 ; Return with char in AL
read_char endp

; Procedure: wait_for_enter
; Blocks until Enter key (0Dh) is pressed
wait_for_enter proc
    push ax                             ; Preserve AX register
wait_enter_loop:
    mov ah, 01h                         ; DOS: Read char with echo function
    int 21h                             ; Call DOS interrupt
    cmp al, 0Dh                         ; Check if char is Carriage Return
    jne wait_enter_loop                 ; If not, wait again
    pop ax                              ; Restore AX register
    ret                                 ; Return to caller
wait_for_enter endp

; Procedure: flush_buffer
; Clears all pending keyboard input
flush_buffer proc
    push ax                             ; Preserve AX register
flush_loop:
    mov ah, 0Bh                         ; DOS: Check input status function
    int 21h                             ; Call DOS interrupt
    cmp al, 0                           ; AL = 0 means no char available
    je flush_done                       ; Finish if buffer empty
    mov ah, 01h                         ; DOS: Read char (to consume it)
    int 21h                             ; Call DOS interrupt
    jmp flush_loop                      ; Check for next char
flush_done:
    pop ax                              ; Restore AX register
    ret                                 ; Return to caller
flush_buffer endp

; Procedure: consume_enter
; Consumes a trailing Enter key if present in buffer
consume_enter proc
    push ax                             ; Preserve AX register
    push dx                             ; Preserve DX register
    mov ah, 06h                         ; DOS: Direct console I/O function
    mov dl, 0FFh                        ; 0FFh = Input mode
    int 21h                             ; Call DOS interrupt
    jz no_key_waiting                   ; Zero flag set if no key waiting
    cmp al, 0Dh                         ; Check if key is Carriage Return
    jne no_key_waiting                   ; If not, leave it in buffer
no_key_waiting:
    pop dx                              ; Restore DX register
    pop ax                              ; Restore AX register
    ret                                 ; Return to caller
consume_enter endp

; Procedure: encrypt_password
; XOR encrypts/decrypts password in SI of length CX
encrypt_password proc
    push cx                             ; Preserve CX register
    push bx                             ; Preserve BX register
    push si                             ; Preserve SI pointer
    
    lea bx, encrypt_key                 ; Load address of key
    mov bl, [bx]                        ; Get XOR key character
    
encrypt_loop:
    mov al, [si]                        ; Load character from SI
    xor al, bl                          ; Apply XOR cipher
    mov [si], al                        ; Store result back
    inc si                              ; Move to next character
    loop encrypt_loop                   ; Process CX characters
    
    pop si                              ; Restore SI pointer
    pop bx                              ; Restore BX register
    pop cx                              ; Restore CX register
    ret                                 ; Return to caller
encrypt_password endp

; MAIN PROGRAM
main proc
    mov ax, @data                       ; Load data segment address
    mov ds, ax                          ; Set DS register
    mov es, ax                          ; Set ES register

; Main Menu Loop - Display login/signup options
main_menu:
    lea dx, msg_welcome                 ; Load welcome message
    call print_string                    ; Display message
    
    lea dx, msg_main                    ; Load main menu options
    call print_string                    ; Display options
    
    call read_char                       ; Read user choice
    call wait_for_enter                  ; Wait for confirmation
    
    cmp al, '1'                         ; Check if choice is 1
    je start_login                      ; Go to login
    cmp al, '2'                         ; Check if choice is 2
    je start_signup                     ; Go to signup
    cmp al, '3'                         ; Check if choice is 3
    je exit_program                     ; Terminate program
    
    jmp main_menu                       ; Repeat menu if invalid
main endp

; SIGNUP SYSTEM
start_signup:
    ; Check if signup queue is full
    mov al, request_count               ; Get current request count
    cmp al, MAX_REQUESTS                ; Compare with maximum
    jge signup_queue_full               ; Error if queue full
    
    lea dx, msg_signup                  ; Load signup header
    call print_string                    ; Display header
    
    ; Read User ID
    lea dx, msg_newuid                  ; Load ID prompt
    call print_string                    ; Display prompt
    
    lea si, uid_in                      ; Point SI to ID buffer
    mov cx, 5                           ; Set length to 5
read_signup_uid:
    call read_char                       ; Read character
    cmp al, 0Dh                         ; Check if Enter pressed
    je pad_uid_signup                   ; Go to padding if Enter
    mov [si], al                        ; Store character in buffer
    inc si                              ; Move to next position
    loop read_signup_uid                ; Repeat for 5 chars
    jmp check_uid_exists_label          ; Continue to validation
    
pad_uid_signup:
    ; Fill remaining characters with spaces
    mov al, ' '                         ; Load space character
pad_uid_loop_signup:
    mov [si], al                        ; Store space in buffer
    inc si                              ; Move to next position
    loop pad_uid_loop_signup            ; Repeat until 5 chars
    call print_newline                  ; Print newline
    
check_uid_exists_label:
    ; Validate: Check if user ID already exists
    call check_uid_exists               ; Internal database check
    cmp al, 1                           ; Check result
    je uid_exists_error                 ; Error if exists
    
    ; Validate: Check if user ID already pending
    call check_uid_in_requests          ; Pending queue check
    cmp al, 1                           ; Check result
    je uid_exists_error                 ; Error if exists
    
    ; Read Email Address (30 characters)
    lea dx, msg_email                   ; Load email prompt
    call print_string                    ; Display prompt
    
    lea si, email_in                    ; Point SI to email buffer
    mov cx, 30                          ; Set length to 30
read_email:
    call read_char                       ; Read character
    cmp al, 0Dh                         ; Check if Enter pressed
    je pad_email                        ; Go to padding if Enter
    mov [si], al                        ; Store character in buffer
    inc si                              ; Move to next position
    loop read_email                     ; Repeat for 30 chars
    jmp read_name_section               ; Continue
    
pad_email:
    ; Fill remaining characters with spaces
    mov al, ' '                         ; Load space character
pad_email_loop:
    mov [si], al                        ; Store space in buffer
    inc si                              ; Move to next position
    loop pad_email_loop                 ; Repeat until 30 chars
    call print_newline                  ; Print newline
    
read_name_section:
    ; Read Full Name
    lea dx, msg_name                    ; Load name prompt
    call print_string                    ; Display prompt
    
    lea si, name_in                     ; Point SI to name buffer
    mov cx, 10                          ; Set length to 10
read_name:
    call read_char                       ; Read character
    cmp al, 0Dh                         ; Check if Enter pressed
    je pad_name                         ; Go to padding if Enter
    mov [si], al                        ; Store character in buffer
    inc si                              ; Move to next position
    loop read_name                      ; Repeat for 10 chars
    jmp read_password_section           ; Continue
    
pad_name:
    ; Fill remaining characters with spaces
    mov al, ' '                         ; Load space character
pad_name_loop:
    mov [si], al                        ; Store space in buffer
    inc si                              ; Move to next position
    loop pad_name_loop                  ; Repeat until 10 chars
    call print_newline                  ; Print newline
    
read_password_section:
    ; Read Password (with masking)
    lea dx, msg_newpwd                  ; Load password prompt
    call print_string                    ; Display prompt
    
    lea si, pwd_in                      ; Point SI to password buffer
    mov cx, 5                           ; Set length to 5
read_signup_pwd:
    call read_char                       ; Read character
    cmp al, 0Dh                         ; Check if Enter pressed
    je pad_signup_pwd                   ; Go to padding if Enter
    mov [si], al                        ; Store character in buffer
    push dx                             ; Save DX
    mov dl, 08h                         ; Backspace character
    mov ah, 02h                         ; Display char
    int 21h                             ; Echo backspace
    mov dl, '*'                         ; Mask character
    int 21h                             ; Echo mask
    pop dx                              ; Restore DX
    inc si                              ; Move to next position
    loop read_signup_pwd                ; Repeat for 5 chars
    jmp read_confirm_section            ; Continue
    
pad_signup_pwd:
    mov al, ' '                         ; Load space character
pad_signup_pwd_loop:
    mov [si], al                        ; Store space in buffer
    inc si                              ; Move to next position
    loop pad_signup_pwd_loop            ; Repeat until 5 chars
    call print_newline                  ; Print newline

read_confirm_section:
    ; Confirm Password (with masking)
    lea dx, msg_confirm                 ; Load confirm prompt
    call print_string                    ; Display prompt
    
    lea si, pwd_confirm                  ; Point SI to confirm buffer
    mov cx, 5                           ; Set length to 5
read_confirm_pwd:
    call read_char                       ; Read character
    cmp al, 0Dh                         ; Check if Enter pressed
    je pad_confirm_pwd                   ; Go to padding if Enter
    mov [si], al                        ; Store character in buffer
    push dx                             ; Save DX
    mov dl, 08h                         ; Backspace character
    mov ah, 02h                         ; Display char
    int 21h                             ; Echo backspace
    mov dl, '*'                         ; Mask character
    int 21h                             ; Echo mask
    pop dx                              ; Restore DX
    inc si                              ; Move to next position
    loop read_confirm_pwd               ; Repeat for 5 chars
    jmp validate_passwords              ; Continue
    
pad_confirm_pwd:
    mov al, ' '                         ; Load space character
pad_confirm_pwd_loop:
    mov [si], al                        ; Store space in buffer
    inc si                              ; Move to next position
    loop pad_confirm_pwd_loop            ; Repeat until 5 chars
    call print_newline                  ; Print newline
    
validate_passwords:
    ; Validate: Compare passwords
    lea si, pwd_in                      ; Point SI to password
    lea di, pwd_confirm                  ; Point DI to confirmation
    mov cx, 5                           ; Set comparison length
    repe cmpsb                          ; Compare strings
    jne password_mismatch               ; Error if mismatch
    
    ; Save signup request data
    
    ; Copy User ID to request queue
    mov al, request_count               ; Get request index
    xor ah, ah                          ; Clear AH
    mov bx, 5                           ; ID length
    mul bx                              ; Offset = index * 5
    lea di, request_ids                 ; Destination
    add di, ax                          ; Add offset
    lea si, uid_in                      ; Source
    mov cx, 5                           ; Length
    rep movsb                           ; Copy ID
    
    ; Copy and encrypt password
    push si                             ; Save SI
    push cx                             ; Save CX
    lea si, pwd_in                      ; Point to input password
    mov cx, 5                           ; Length
    call encrypt_password               ; Encrypt in place
    pop cx                              ; Restore CX
    pop si                              ; Restore SI
    
    mov al, request_count               ; Get request index
    xor ah, ah                          ; Clear AH
    mov bx, 5                           ; PWD length
    mul bx                              ; Offset = index * 5
    lea di, request_pwds                ; Destination
    add di, ax                          ; Add offset
    lea si, pwd_in                      ; Source (now encrypted)
    mov cx, 5                           ; Length
    rep movsb                           ; Copy password
    
    ; Decrypt back to plain text for session consistency
    push si                             ; Save SI
    push cx                             ; Save CX
    lea si, pwd_in                      ; Point to password
    mov cx, 5                           ; Length
    call encrypt_password               ; XOR again to decrypt
    pop cx                              ; Restore CX
    pop si                              ; Restore SI
    
    ; Copy Email to request queue (30 characters)
    mov al, request_count               ; Get request index
    xor ah, ah                          ; Clear AH
    mov bx, 30                          ; Email length
    mul bx                              ; Offset = index * 30
    lea di, request_emails               ; Destination
    add di, ax                          ; Add offset
    lea si, email_in                    ; Source
    mov cx, 30                          ; Length
    rep movsb                           ; Copy email
    
    ; Copy Name to request queue
    mov al, request_count               ; Get request index
    xor ah, ah                          ; Clear AH
    mov bx, 10                          ; Name length
    mul bx                              ; Offset = index * 10
    lea di, request_names               ; Destination
    add di, ax                          ; Add offset
    lea si, name_in                     ; Source
    mov cx, 10                          ; Length
    rep movsb                           ; Copy name
    
    inc request_count                   ; Increment pending request count
    
    lea dx, msg_reqsent                 ; Load Success message
    call print_string                    ; Display message
    lea dx, msg_press_enter              ; Load prompt
    call print_string                    ; Display prompt
    call wait_for_enter                  ; Wait for Enter
    jmp main_menu                       ; Return to main menu
    
signup_queue_full:
    lea dx, msg_reqfull                 ; Load full error
    call print_string                    ; Display message
    lea dx, msg_press_enter              ; Load prompt
    call print_string                    ; Display prompt
    call wait_for_enter                  ; Wait for Enter
    jmp main_menu                       ; Return to main menu
    
uid_exists_error:
    lea dx, msg_exists                  ; Load exists error
    call print_string                    ; Display message
    lea dx, msg_press_enter              ; Load prompt
    call print_string                    ; Display prompt
    call wait_for_enter                  ; Wait for Enter
    jmp main_menu                       ; Return to main menu
    
password_mismatch:
    lea dx, msg_pwdmis                  ; Load mismatch error
    call print_string                    ; Display message
    lea dx, msg_press_enter              ; Load prompt
    call print_string                    ; Display prompt
    call wait_for_enter                  ; Wait for Enter
    jmp main_menu                       ; Return to main menu

; LOGIN SYSTEM
start_login:
    mov attempts, 3                     ; Set maximum login attempts to 3
    
login_screen:
    ; Read User ID
    lea dx, msg_uid                    ; Load User ID prompt
    call print_string                   ; Display prompt
    
    lea si, uid_in                     ; Point SI to ID buffer
    mov cx, 5                          ; Set length to 5
read_uid:
    call read_char                      ; Read character
    cmp al, 0Dh                        ; Check if Enter pressed
    je pad_uid_login                   ; If Enter, pad ID with spaces
    mov [si], al                       ; Store character
    inc si                             ; Advance pointer
    loop read_uid                      ; Repeat for 5 characters
    jmp read_password_login            ; Proceed to password
    
pad_uid_login:
    ; Fill remaining characters with spaces
    mov al, ' '                        ; Load space character
pad_uid_loop_login:
    mov [si], al                       ; Store space
    inc si                             ; Advance pointer
    loop pad_uid_loop_login            ; Repeat until 5 chars
    call print_newline                 ; Print newline after entry
    
read_password_login:
    ; Read Password (with masking)
    lea dx, msg_pwd                    ; Load password prompt
    call print_string                   ; Display prompt
    
    lea si, pwd_in                     ; Point SI to password buffer
    mov cx, 5                          ; Set length to 5
read_pwd:
    call read_char                      ; Read character
    cmp al, 0Dh                        ; Check if Enter pressed
    je pad_pwd_login                   ; If Enter, pad password
    mov [si], al                       ; Store character
    push dx                            ; Save DX register
    mov dl, 08h                        ; Backspace character
    mov ah, 02h                        ; Display char function
    int 21h                            ; Move cursor back
    mov dl, '*'                        ; Mask character
    int 21h                            ; Display mask
    pop dx                             ; Restore DX register
    inc si                             ; Advance pointer
    loop read_pwd                      ; Repeat for 5 characters
    jmp start_admin_check              ; Proceed to authentication
    
pad_pwd_login:
    mov al, ' '                        ; Load space character
pad_pwd_login_loop:
    mov [si], al                       ; Store space
    inc si                             ; Advance pointer
    loop pad_pwd_login_loop            ; Repeat until 5 chars
    call print_newline                 ; Print newline after entry

start_admin_check:
    ; Check Admin Login
    lea si, uid_in                     ; Point to entered ID
    lea di, admin_id                    ; Point to admin ID
    mov cx, 5                          ; Set comparison length
    repe cmpsb                         ; Compare strings
    jne try_student                    ; If not admin, check student
    
    lea si, pwd_in                     ; Point to entered password
    lea di, admin_pwd                   ; Point to admin password
    mov cx, 5                          ; Set comparison length
    repe cmpsb                         ; Compare strings
    jne login_failed                   ; If wrong password, fail
    
    mov user_role, 1                   ; Set role to Admin (1)
    lea dx, msg_ok                     ; Load success message
    call print_string                   ; Display message
    
    ; Save current user ID
    lea si, uid_in                     ; Point to input ID
    lea di, current_uid                 ; Point to session storage
    mov cx, 5                          ; Length 5
    rep movsb                          ; Copy ID to session
    
    jmp admin_main                     ; Redirect to Admin Menu
    
; Check Student Login
try_student:
    call find_student_login            ; Search student database
    cmp al, 0FFh                       ; Check if not found
    je login_failed                    ; If not found, fail
    cmp al, 0FEh                       ; Check if pending approval
    je login_pending                   ; If pending, notify
    
    mov user_role, 2                   ; Set role to Student (2)
    lea dx, msg_ok                     ; Load success message
    call print_string                   ; Display message
    
    ; Save current user ID
    lea si, uid_in                     ; Point to input ID
    lea di, current_uid                 ; Point to session storage
    mov cx, 5                          ; Length 5
    rep movsb                          ; Copy ID to session
    
    jmp student_main                   ; Redirect to Student Menu
    
login_pending:
    lea dx, msg_pending                ; Load pending notification
    call print_string                   ; Display notification
    lea dx, msg_press_enter             ; Load continuation prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait for Enter
    jmp main_menu                      ; Return to main menu
    
login_failed:
    dec attempts                       ; Decrement remaining attempts
    lea dx, msg_fail                   ; Load failure message
    call print_string                   ; Display message
    lea dx, msg_press_enter             ; Load continuation prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait for Enter
    
    cmp attempts, 0                    ; Check if attempts depleted
    jne login_screen                   ; If attempts left, retry
    
    lea dx, msg_lock                   ; Load lockout notification
    call print_string                   ; Display notification
    lea dx, msg_press_enter             ; Load continuation prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait for Enter
    jmp main_menu                      ; Return to main menu



; ADMIN MENU
admin_main:
    lea dx, admin_menu                 ; Load admin menu options
    call print_string                   ; Display menu
    
    call read_char                      ; Read user selection
    call wait_for_enter                 ; Wait for confirmation
    
    cmp al, '1'                         ; Choice 1: View Books
    je admin_view_books
    cmp al, '2'                         ; Choice 2: Issue Book
    je admin_issue
    cmp al, '3'                         ; Choice 3: Return Book
    je admin_return
    cmp al, '4'                         ; Choice 4: Add Stock
    je admin_add_stock
    cmp al, '5'                         ; Choice 5: Add New Book
    je admin_add_book
    cmp al, '6'                         ; Choice 6: View Issued Books
    je admin_view_issued
    cmp al, '7'                         ; Choice 7: View Suggestions
    je admin_view_suggest
    cmp al, '8'                         ; Choice 8: Approve Signups
    je admin_approve_signups
    cmp al, '9'                         ; Choice 9: View Students
    je admin_view_students
    cmp al, 'F'                         ; Choice F: Fast Forward Time
    je admin_ffwd
    cmp al, 'f'                         ; Choice f: Fast Forward Time
    je admin_ffwd
    cmp al, '0'                         ; Choice 0: Logout
    je logout
    
    jmp admin_main                     ; Repeat menu if invalid

; ADMIN: View All Books
admin_view_books:
    lea dx, hdr_books                  ; Load book list header
    call print_string                   ; Display header
    call print_newline                  ; Print newline
    
    mov cl, book_count                 ; Get current number of books
    xor ch, ch                         ; Clear high byte
    xor si, si                         ; SI as book index (0-based)
    
view_loop:
    push cx                             ; Save loop counter
    
    ; Display book number
    mov ax, si                         ; Get current index
    inc al                             ; Convert to 1-based number
    call show_digit                     ; Display number
    
    mov cx, 3                          ; Set 3 spaces
    call print_spaces                   ; Print spaces
    
    ; Display book name
    mov ax, si                         ; Get index
    mov bx, 15                         ; Name length
    mul bx                             ; Offset = index * 15
    lea bx, book_names                 ; Base address
    add bx, ax                         ; Point to specific name
    mov cx, 15                         ; Set copy length
print_book_name:
    mov dl, [bx]                       ; Load character
    mov ah, 02h                        ; Display char function
    int 21h                            ; Display character
    inc bx                             ; Next character
    loop print_book_name               ; Repeat 15 times
    
    mov cx, 3                          ; Set 3 spaces
    call print_spaces                   ; Print spaces
    
    ; Display current stock
    lea bx, book_stock                 ; Base address for stock
    add bx, si                         ; Point to specific stock
    mov al, [bx]                       ; Load stock level
    call show_digit                     ; Display stock
    
    mov cx, 8                          ; Set 8 spaces
    call print_spaces                   ; Print spaces
    
    ; Display max stock
    lea bx, book_max                   ; Base address for max capacity
    add bx, si                         ; Point to specific max
    mov al, [bx]                       ; Load max level
    call show_digit                     ; Display max
    
    call print_newline                 ; End of line
    
    inc si                             ; Next book
    pop cx                             ; Restore counter
    loop view_loop                     ; Repeat for all books
    
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait for input
    jmp admin_main                     ; Return to menu

; ADMIN: Issue Book
admin_issue:
    call get_book_number                ; Input validated book index
    cmp al, 0FFh                       ; Check if invalid
    je admin_main                      ; Return to menu if invalid
    
    mov selected_book_idx, al          ; Store selected index
    
    ; Prompt for target Student User ID
    lea dx, msg_target_uid             ; Load prompt
    call print_string                   ; Display prompt
    
    ; Read Student ID
    lea si, uid_in                     ; Buffer pointer
    mov cx, 5                          ; length
read_target_uid:
    call read_char                      ; Read character
    cmp al, 0Dh                        ; Check for Enter
    je pad_target_uid                  ; Pad if Enter pressed
    mov [si], al                       ; Store character
    inc si                             ; Next position
    loop read_target_uid               ; repeat for 5 chars
    jmp check_target_student           ; proceed
    
pad_target_uid:
    mov al, ' '                        ; Space character
pad_target_uid_loop:
    mov [si], al                       ; Store space
    inc si                             ; Next position
    loop pad_target_uid_loop           ; Repeat until 5
    call print_newline                 ; Newline
    
check_target_student:
    ; Verify student exists
    call check_uid_exists              ; Search student IDs
    cmp al, 0                          ; Result 0 = Not found
    je admin_student_not_found         ; Handle missing user
    
    ; Check target student's issue limit (max 4 books)
    call count_student_issues          ; Count active issues for this user
    cmp al, 4                          ; Compare with limit
    jge admin_limit_reached            ; Handle limit error
    
    ; Check for overdue books
    call check_overdue_issues          ; Check if user has overdue books
    cmp al, 1                          ; Result 1 = Blocked
    je admin_overdue_block             ; Handle overdue error
    
    ; Check if book is in stock
    xor bh, bh                         ; Clear BH
    mov bl, selected_book_idx          ; Load index
    lea si, book_stock                 ; Base address
    add si, bx                         ; Point to stock
    cmp byte ptr [si], 0               ; Check if stock available
    je issue_no_stock                  ; Error if empty
    
    ; Decrease stock
    dec byte ptr [si]                  ; Decrement stock level
    
    ; Record issue details
    mov al, issue_count                ; Get current issue index
    xor ah, ah                         ; Clean AH
    mov temp_word, ax                  ; Store index in temp
    mov si, temp_word                  ; SI = index
    
    ; Store book number
    lea bx, issue_bookno               ; Base address
    add bx, si                         ; Point to current slot
    mov al, selected_book_idx          ; Load book index
    inc al                             ; Convert to 1-based
    mov [bx], al                       ; Store in issue record
    
    ; Store target Student ID
    mov ax, si                         ; index
    mov bx, 5                          ; length
    mul bx                             ; offset
    lea di, issue_userid               ; Base address
    add di, ax                         ; Point to destination
    lea si, uid_in                     ; Source
    mov cx, 5                          ; length
    rep movsb                          ; copy ID
    
    ; Set deadline (7 days)
    mov si, temp_word                  ; restore index
    lea bx, issue_days                 ; Base address
    add bx, si                         ; Point to current slot
    mov byte ptr [bx], 7               ; Set initial days remaining
    
    inc issue_count                    ; Increment total issues
    
    lea dx, msg_issued                 ; Load Success message
    call print_string                   ; Display success
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
admin_student_not_found:
    lea dx, msg_fail                   ; Load error message
    call print_string                   ; Display error
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
issue_no_stock:
    lea dx, msg_nostk                  ; Load out of stock message
    call print_string                   ; Display error
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
admin_overdue_block:
    lea dx, msg_overdue                ; Load overdue block message
    call print_string                   ; Display error
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
admin_limit_reached:
    lea dx, msg_limit                  ; Load limit reached message
    call print_string                   ; Display error
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu

; ADMIN: Return Book
admin_return:
    call get_book_number                ; Input validated book index
    cmp al, 0FFh                       ; Check if invalid
    je admin_main                      ; Return to menu if invalid
    
    inc al                             ; Convert to 1-based number
    mov temp_byte, al                  ; Store for search
    
    ; Prompt for Student User ID
    lea dx, msg_target_uid             ; Load prompt
    call print_string                   ; Display prompt
    
    ; Read Student ID
    lea si, uid_in                     ; Buffer pointer
    mov cx, 5                          ; Length
read_return_uid:
    call read_char                      ; Read character
    cmp al, 0Dh                        ; Check for Enter
    je pad_return_uid                  ; Pad if Enter pressed
    mov [si], al                       ; Store character
    inc si                             ; Next position
    loop read_return_uid               ; repeat for 5 chars
    jmp check_return_student           ; proceed
    
pad_return_uid:
    mov al, ' '                        ; Space character
pad_return_uid_loop:
    mov [si], al                       ; Store space
    inc si                             ; Next position
    loop pad_return_uid_loop           ; repeat until 5
    call print_newline                 ; Newline
    
check_return_student:
    ; Verify student exists
    call check_uid_exists              ; Search student IDs
    cmp al, 0                          ; Result 0 = Not found
    je admin_return_student_not_found  ; handle missing user
    
    ; Find the specific issue (Book + Student)
    mov cl, issue_count                ; Total active issues
    xor ch, ch                         ; clean high byte
    jcxz admin_no_issue_found          ; Fail if no issues record
    xor si, si                         ; SI as counter (0-based)
    
find_admin_return_issue:
    push cx                             ; Save outer count
    push si                             ; Save outer index
    
    ; 1. Check book number
    lea bx, issue_bookno               ; Base address
    add bx, si                         ; Current slot
    mov al, [bx]                       ; Load book recorded
    cmp al, temp_byte                  ; Compare with target book
    jne next_return_search             ; Mismatch, try next
    
    ; 2. Check user ID
    mov ax, si                         ; index
    mov bx, 5                          ; length
    mul bx                             ; offset
    lea si, issue_userid               ; Base for user records
    add si, ax                         ; Current user entry
    lea di, uid_in                     ; Target user entry
    mov cx, 5                          ; length
    repe cmpsb                         ; Compare IDs
    je found_admin_return_issue        ; Match, proceed to return
    
next_return_search:
    pop si                             ; Restore index
    pop cx                             ; Restore count
    inc si                             ; Advance index
    loop find_admin_return_issue       ; Repeat until end of issues
    jmp admin_no_issue_found           ; End of loop, no match found

found_admin_return_issue:
    pop si                             ; SI now contains the index to remove
    pop cx                             ; Restore stack
    jmp found_issue                    ; Goto processing

admin_return_student_not_found:
    lea dx, msg_fail
    call print_string
    lea dx, msg_press_enter
    call print_string
    call wait_for_enter
    jmp admin_main
    
admin_no_issue_found:
    lea dx, msg_nobook
    call print_string
    lea dx, msg_press_enter
    call print_string
    call wait_for_enter
    jmp admin_main
    
found_issue:
    ; Increase book stock
    mov al, temp_byte
    dec al
    xor ah, ah
    mov bx, ax
    lea di, book_stock
    add di, bx
    inc byte ptr [di]
    
    ; Shift remaining issues to fill the gap
found_issue:
    ; Increase book stock
    mov al, temp_byte                  ; Get book number (1-based)
    dec al                             ; Convert to 0-based
    xor ah, ah                         ; Clear high byte
    mov bx, ax                         ; Move to BX for index
    lea di, book_stock                 ; Base address
    add di, bx                         ; Point to specific stock
    inc byte ptr [di]                  ; Increment stock count
    
    ; Shift remaining issues to fill the gap
    mov cl, issue_count                ; Total active issues
    mov temp_word, si                  ; Store index of removed item
    mov ax, temp_word                  ; Move to AX
    sub cl, al                         ; Calculate items after removed item
    dec cl                             ; Adjust for current item removal
    xor ch, ch                         ; Clear high byte
    
shift_issues:
    jcxz remove_done                   ; If nothing to shift, finish
    
    ; Store current destination index
    mov temp_word, si                  ; Save SI to temp
    
    ; Source index is Destination + 1
    mov bx, si                         ; BX = current index
    inc bx                             ; BX = next index (source)
    
    ; 1. Shift book numbers
    push bx                             ; Save source index
    lea di, issue_bookno               ; Base address
    add di, bx                         ; DI = source slot
    mov al, [di]                       ; AL = source value
    mov di, temp_word                  ; DI = dest index
    lea bx, issue_bookno               ; Base address
    add bx, di                         ; BX = dest slot
    mov [bx], al                       ; Store value in dest
    pop bx                             ; Restore source index
    
    ; 2. Shift user IDs (5 characters)
    push cx                             ; Save outer loop counter
    
    ; Source address -> SI
    mov ax, bx                         ; Source index
    mov cx, 5                          ; length
    mul cx                             ; offset
    lea si, issue_userid               ; base
    add si, ax                         ; SI = source address
    
    ; Destination address -> DI
    mov ax, temp_word                  ; dest index
    mov cx, 5                          ; length
    mul cx                             ; offset
    lea di, issue_userid               ; base
    add di, ax                         ; DI = destination address
    
    mov cx, 5                          ; number of bytes to copy
    rep movsb                          ; copy User ID
    
    pop cx                             ; Restore loop counter
    
    ; 3. Shift days remaining
    mov bx, temp_word                  ; restore original dest
    inc bx                             ; bx = source again
    lea di, issue_days                 ; base
    add di, bx                         ; DI = source slot
    mov al, [di]                       ; AL = source value
    mov di, temp_word                  ; DI = dest index
    lea bx, issue_days                 ; base
    add bx, di                         ; BX = dest slot
    mov [bx], al                       ; Store in dest
    
    ; Next record
    mov si, temp_word                  ; back to dest index
    inc si                             ; SI = next record's dest
    loop shift_issues                  ; Repeat for remaining issues
    
remove_done:
    dec issue_count                    ; Decrement total active issues
    
    lea dx, msg_return                 ; Load Success message
    call print_string                   ; Display success
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu

; ADMIN: Add Stock
admin_add_stock:
    call get_book_number                ; Get validated book index
    cmp al, 0FFh                       ; Check if invalid
    je admin_main                      ; Return to menu if invalid
    
    mov temp_byte, al                  ; Store book index
    
    ; Get quantity to add
    lea dx, msg_qty                    ; Load quantity prompt
    call print_string                   ; Display prompt
    
    call read_char                      ; Read quantity digit
    call wait_for_enter                 ; Wait for confirmation
    sub al, '0'                        ; Convert ASCII to number
    
    ; Validate against maximum stock
    xor bh, bh                         ; Clear high byte
    mov bl, temp_byte                  ; Load book index
    
    push ax                             ; Save quantity to add
    lea si, book_stock                 ; Point to stock levels
    add si, bx                         ; Point to specific book
    mov al, [si]                       ; Load current stock
    mov cl, al                         ; Store in CL
    pop ax                             ; Restore quantity to add
    
    add cl, al                         ; Calculate new potential stock
    
    lea si, book_max                   ; Point to maximum capacities
    add si, bx                         ; Point to specific limit
    cmp cl, [si]                       ; Compare total with limit
    jg stock_overflow                  ; Error if total exceeds max
    
    ; Add to stock
    lea si, book_stock                 ; Point to stock levels
    add si, bx                         ; Point to specific book
    add [si], al                       ; Added confirmed quantity
    
    lea dx, msg_added                  ; Load Success message
    call print_string                   ; Display success
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
stock_overflow:
    lea dx, msg_invalid                ; Load Overflow/Invalid message
    call print_string                   ; Display error
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu

; ADMIN: Add New Book
admin_add_book:
    ; Check if book database is full
    mov al, book_count                 ; Current total books
    cmp al, MAX_BOOKS                  ; Compare with max allowed
    jge book_db_full                   ; Error if full
    
    lea dx, msg_newbook                ; Load Header
    call print_string                   ; Display header
    
    ; Read book name
    mov al, book_count                 ; Use current count as new index
    xor ah, ah                         ; Clean AH
    mov bx, 15                         ; Name slot size
    mul bx                             ; Calculate offset
    lea di, book_names                 ; Base address
    add di, ax                         ; DI = destination slot
    
    mov cx, 15                         ; Set input length
read_bookname:
    call read_char                      ; Read character
    cmp al, 0Dh                        ; Check for Enter
    je pad_bookname                    ; Pad if Enter pressed
    mov [di], al                       ; Store character
    inc di                             ; Next position
    loop read_bookname                 ; Repeat for 15 characters
    jmp read_stock_section              ; Proceed
    
pad_bookname:
    ; Fill remaining characters with spaces
    mov al, ' '                        ; Space character
pad_bookname_loop:
    mov [di], al                       ; Store space
    inc di                             ; Next position
    loop pad_bookname_loop              ; Repeat until 15
    call print_newline                  ; Newline
    
read_stock_section:
    ; Read initial stock
    lea dx, msg_stock                  ; Load Stock prompt
    call print_string                   ; Display prompt
    call read_char                      ; Read digit
    call wait_for_enter                 ; Wait
    sub al, '0'                        ; Convert to number
    
    xor bh, bh                         ; clean BX
    mov bl, book_count                  ; current index
    lea si, book_stock                 ; stock array
    add si, bx                         ; target slot
    mov [si], al                       ; store value
    
    ; Read maximum stock
    lea dx, msg_maxstk                 ; Load Max Stock prompt
    call print_string                   ; Display prompt
    call read_char                      ; Read digit
    call wait_for_enter                 ; Wait
    sub al, '0'                        ; Convert to number
    
    lea si, book_max                   ; max array
    add si, bx                         ; target slot
    mov [si], al                       ; store value
    
    inc book_count                     ; Increment database size
    
    lea dx, msg_created                ; Load Success message
    call print_string                   ; Display success
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
book_db_full:
    lea dx, msg_full                   ; Load full error
    call print_string                   ; Display message
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu

; ADMIN: View Issued Books
admin_view_issued:
    cmp issue_count, 0                 ; Any active issues?
    je no_issues                       ; Branch if none
    
    lea dx, hdr_issued                 ; Load Header
    call print_string                   ; Display header
    call print_newline                  ; Newline
    
    mov cl, issue_count                ; Total count
    xor ch, ch                         ; clean high byte
    xor si, si                         ; index (0-based)
    
view_issued_loop:
    push cx                             ; Save counter
    
    ; Display issue number
    mov ax, si                         ; index
    inc al                             ; 1-based
    call show_digit                     ; Display number
    
    mov cx, 3                          ; 3 spaces
    call print_spaces                   ; Display
    
    ; Display book name
    lea bx, issue_bookno               ; Base array
    add bx, si                         ; Current slot
    mov al, [bx]                       ; Load book recorded
    dec al                             ; Convert to 0-based index
    push si                             ; Save current issue index
    
    xor ah, ah                         ; clean AX
    mov bx, 15                         ; Slot size
    mul bx                             ; offset
    lea bx, book_names                 ; Base table
    add bx, ax                         ; Point to record
    mov cx, 15                         ; Set length
print_issued_name:
    mov dl, [bx]                       ; Load character
    mov ah, 02h                        ; Display
    int 21h                            ; Call DOS
    inc bx                             ; Next
    loop print_issued_name             ; Repeat 15
    
    pop si                             ; Restore issue index
    mov cx, 3                          ; 3 spaces
    call print_spaces                   ; Display
    
    ; Display user ID
    push si                             ; save index
    mov ax, si                         ; index
    mov bx, 5                          ; length
    mul bx                             ; offset
    lea bx, issue_userid               ; Base table
    add bx, ax                         ; Point to record
    mov cx, 5                          ; length
print_issue_user:
    mov dl, [bx]                       ; Load character
    mov ah, 02h                        ; Display
    int 21h                            ; Call DOS
    inc bx                             ; Next
    loop print_issue_user               ; Repeat 5
    pop si                             ; restore index
    
    mov cx, 5                          ; 5 spaces
    call print_spaces                   ; Display
    
    ; Display days remaining
    lea bx, issue_days                 ; Base array
    add bx, si                         ; Current slot
    mov al, [bx]                       ; Load value
    call show_digit                     ; Display
    
    call print_newline                 ; line feed
    
    inc si                             ; next issue
    pop cx                             ; restore counter
    loop view_issued_loop              ; repeat for all issues
    
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
no_issues:
    lea dx, msg_nobook                 ; Load no books issued message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu

; ADMIN: Fast Forward Days
admin_ffwd:
    mov cl, issue_count                ; Total active issues
    xor ch, ch                         ; clean high byte
    jcxz ffwd_done                     ; Skip if no issues
    xor si, si                         ; reset index
ffwd_loop:
    lea bx, issue_days                 ; Base array
    add bx, si                         ; current slot
    cmp byte ptr [bx], 0               ; Check if already 0
    je skip_dec                        ; Don't decrement if 0
    dec byte ptr [bx]                  ; decrement remaining days
skip_dec:
    inc si                             ; next issue
    loop ffwd_loop                     ; repeat
ffwd_done:
    lea dx, msg_ffwd                   ; Load Success message
    call print_string                   ; Display success
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu

; ADMIN: View Suggestions
admin_view_suggest:
    cmp suggest_count, 0               ; Any suggestions?
    je no_suggestions                  ; branch if none
    
    lea dx, hdr_suggest                 ; Load Header
    call print_string                   ; Display header
    call print_newline                  ; Newline
    
    mov cl, suggest_count               ; Total count
    xor ch, ch                         ; clean high
    xor si, si                         ; index
    
view_suggest_loop:
    push cx                             ; Save counter
    
    ; Display suggestion number
    mov ax, si                         ; index
    inc al                             ; 1-based
    call show_digit                     ; Display
    
    mov cx, 3                          ; 3 spaces
    call print_spaces                   ; Display
    
    ; Display book name
    mov ax, si                         ; index
    mov bx, 15                         ; Slot size
    mul bx                             ; offset
    lea bx, suggest_names              ; Base table
    add bx, ax                         ; Point to record
    mov cx, 15                         ; Length
print_suggest_name:
    mov dl, [bx]                       ; Load character
    mov ah, 02h                        ; Display
    int 21h                            ; Call DOS
    inc bx                             ; Next
    loop print_suggest_name             ; Repeat 15
    
    call print_newline                  ; Line feed
    
    inc si                             ; next record
    pop cx                             ; restore counter
    loop view_suggest_loop              ; repeat for all
    
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
no_suggestions:
    lea dx, msg_nosuggest              ; Load error message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu

; ADMIN: Approve Signups
admin_approve_signups:
    cmp request_count, 0               ; Any pending requests?
    je no_requests                     ; branch if none
    
    lea dx, hdr_requests               ; Load Header
    call print_string                   ; Display header
    call print_newline                  ; Newline
    
    mov cl, request_count
    xor ch, ch
    xor si, si
    

; Display all pending signup requests
show_requests_loop:
    push cx                             ; Save outer count
    
    ; Display request number
    mov ax, si                         ; current index
    inc al                             ; 1-based
    call show_digit                     ; Display number
    
    mov cx, 3                          ; 3 spaces
    call print_spaces                   ; Display
    
    ; Display User ID
    mov ax, si                         ; index
    mov bx, 5                          ; length
    mul bx                             ; offset
    lea bx, request_ids                ; base table
    add bx, ax                         ; point to record
    push si                             ; save record index
    mov cx, 5                          ; length
print_req_uid:
    mov dl, [bx]                       ; Load char
    mov ah, 02h                        ; Display
    int 21h                            ; Call DOS
    inc bx                             ; next
    loop print_req_uid                 ; repeat 5
    pop si                             ; restore index
    
    mov cx, 5                          ; 5 spaces
    call print_spaces                   ; Display
    
    ; Display Email (30 characters)
    mov ax, si                         ; index
    mov bx, 30                         ; length
    mul bx                             ; offset
    lea bx, request_emails             ; base table
    add bx, ax                         ; point to record
    push si                             ; save index
    mov cx, 30                         ; length
print_req_email:
    mov dl, [bx]                       ; Load char
    mov ah, 02h                        ; Display
    int 21h                            ; Call DOS
    inc bx                             ; next
    loop print_req_email               ; repeat 30
    pop si                             ; restore index
    
    mov cx, 5                          ; 5 spaces
    call print_spaces                   ; Display
    
    ; Display Name
    mov ax, si                         ; index
    mov bx, 10                         ; length
    mul bx                             ; offset
    lea bx, request_names              ; base table
    add bx, ax                         ; point to record
    mov cx, 10                         ; length
print_req_name:
    mov dl, [bx]                       ; Load char
    mov ah, 02h                        ; Display
    int 21h                            ; Call DOS
    inc bx                             ; next
    loop print_req_name                ; repeat 10
    
    call print_newline                  ; line feed
    
    inc si                             ; next record
    pop cx                             ; restore counter
    loop show_requests_loop            ; repeat for all requests
    
    ; Get admin's selection
    lea dx, msg_reqsel                 ; Load selection prompt
    call print_string                   ; Display prompt
    
    call read_char                      ; Read user input
    call wait_for_enter                 ; Wait for confirmation
    sub al, '0'                        ; Convert ASCII to number
    
    cmp al, 1                          ; Minimum index 1
    jl invalid_request                 ; Error if too low
    mov bl, request_count               ; Get total count
    inc bl                             ; Adjust for comparison
    cmp al, bl                         ; Compare selection with count + 1
    jge invalid_request                ; Error if too high
    
    dec al                             ; Convert back to 0-based index
    mov temp_idx, al                   ; Store selected index

    ; Ask admin to approve or reject
    lea dx, msg_approve_reject        ; Load Action prompt (A/R)
    call print_string                   ; Display prompt
    
    call read_char                      ; Read action
    call wait_for_enter                 ; Wait for confirmation
    
    cmp al, 'A'                        ; Approval key (UpperCase)
    je approve_user
    cmp al, 'a'                        ; Approval key (LowerCase)
    je approve_user
    cmp al, 'R'                        ; Rejection key (UpperCase)
    je reject_user
    cmp al, 'r'                        ; Rejection key (LowerCase)
    je reject_user
    
    jmp invalid_request                ; Handle unknown action

; Approve user - Add to student database
approve_user:
    ; Check if student database is full
    mov al, student_count               ; current total students
    cmp al, MAX_STUDENTS               ; compare with limit
    jge student_db_full                ; handle overflow
    
    ; Copy User ID to student database
    mov al, student_count               ; get new student index
    xor ah, ah                         ; clear AH
    mov bx, 5                          ; ID length
    mul bx                             ; calculate offset
    push ax                             ; save destination offset
    
    mov al, temp_idx                    ; get request index
    xor ah, ah                         ; clear AH
    mov bx, 5                          ; ID length
    mul bx                             ; calculate offset
    lea si, request_ids                ; source base
    add si, ax                         ; source address
    
    pop ax                             ; restore destination offset
    lea di, student_ids                 ; destination base
    add di, ax                         ; destination address
    mov cx, 5                          ; bytes to copy
    rep movsb                          ; copy ID
    
    ; Copy encrypted password to student database
    mov al, student_count               ; dest index
    xor ah, ah                         ; clear AH
    mov bx, 5                          ; length
    mul bx                             ; offset
    push ax                             ; save offset
    
    mov al, temp_idx                    ; source index
    xor ah, ah                         ; clear AH
    mov bx, 5                          ; length
    mul bx                             ; offset
    lea si, request_pwds               ; source table
    add si, ax                         ; source address
    
    pop ax                             ; restore offset
    lea di, student_pwds                ; dest table
    add di, ax                         ; dest address
    mov cx, 5                          ; copy 5 bytes
    rep movsb                          ; copy password
    
    ; Copy Email to student database (30 characters)
    mov al, student_count               ; dest index
    xor ah, ah                         ; clear AH
    mov bx, 30                         ; length
    mul bx                             ; offset
    push ax                             ; save offset
    
    mov al, temp_idx                    ; source index
    xor ah, ah                         ; clear AH
    mov bx, 30                         ; length
    mul bx                             ; offset
    lea si, request_emails             ; source table
    add si, ax                         ; source address
    
    pop ax                             ; restore offset
    lea di, student_emails              ; dest table
    add di, ax                         ; dest address
    mov cx, 30                         ; copy 30 bytes
    rep movsb                          ; copy email
    
    ; Copy Name to student database
    mov al, student_count               ; dest index
    xor ah, ah                         ; clear AH
    mov bx, 10                         ; length
    mul bx                             ; offset
    push ax                             ; save offset
    
    mov al, temp_idx                    ; source index
    xor ah, ah                         ; clear AH
    mov bx, 10                         ; length
    mul bx                             ; offset
    lea si, request_names              ; source table
    add si, ax                         ; source address
    
    pop ax                             ; restore offset
    lea di, student_names               ; dest table
    add di, ax                         ; dest address
    mov cx, 10                         ; copy 10 bytes
    rep movsb                          ; copy name
    
    ; Set status to active
    xor bh, bh                         ; clear BX
    mov bl, student_count               ; current student index
    lea si, student_status             ; status table
    add si, bx                         ; target slot
    mov byte ptr [si], 1               ; Set status to Active (1)
    
    inc student_count                  ; Increment registered students
    
    ; Remove from request queue
    call remove_request                 ; Shift queue left
    
    lea dx, msg_approved               ; Load Success message
    call print_string                   ; Display success
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
; Reject user - Remove from request queue
reject_user:
    call remove_request                 ; Simply remove from queue
    lea dx, msg_rejected               ; Load Rejection message
    call print_string                   ; Display message
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
invalid_request:
    lea dx, msg_invalid                ; Load Invalid Selection message
    call print_string                   ; Display error
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
no_requests:
    lea dx, msg_noreq                  ; Load No Requests message
    call print_string                   ; Display message
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
student_db_full:
    lea dx, msg_full                   ; Load Database Full message
    call print_string                   ; Display error
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display prompt
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu


; ADMIN: View All Students


admin_view_students:
    cmp student_count, 0
    je no_students
    
    lea dx, hdr_students
    lea dx, hdr_students               ; Load Header
    call print_string                   ; Display header
    call print_newline                  ; Newline
    
    mov cl, student_count               ; Total student count
    xor ch, ch                         ; clean high byte
    xor si, si                         ; index (0-based)
    
view_students_loop:
    push cx                             ; Save counter
    
    ; Display student number
    mov ax, si                         ; index
    inc al                             ; 1-based
    call show_digit                     ; Display number
    
    mov cx, 3                          ; 3 spaces
    call print_spaces                   ; Display
    
    ; Display User ID
    mov ax, si                         ; index
    mov bx, 5                          ; slot size
    mul bx                             ; offset
    lea bx, student_ids                ; base table
    add bx, ax                         ; point to record
    push si                             ; save index
    mov cx, 5                          ; length
print_student_uid:
    mov dl, [bx]                       ; Load char
    mov ah, 02h                        ; Display
    int 21h                            ; Call DOS
    inc bx                             ; next
    loop print_student_uid              ; repeat 5
    pop si                             ; restore index
    
    mov cx, 5                          ; 5 spaces
    call print_spaces                   ; Display
    
    ; Display Email (30 characters)
    mov ax, si                         ; index
    mov bx, 30                         ; slot size
    mul bx                             ; offset
    lea bx, student_emails             ; base table
    add bx, ax                         ; point to record
    push si                             ; save index
    mov cx, 30                         ; length
print_student_email:
    mov dl, [bx]                       ; Load char
    mov ah, 02h                        ; Display
    int 21h                            ; Call DOS
    inc bx                             ; next
    loop print_student_email            ; repeat 30
    pop si                             ; restore index
    
    mov cx, 5                          ; 5 spaces
    call print_spaces                   ; Display
    
    ; Display Name
    mov ax, si                         ; index
    mov bx, 10                         ; slot size
    mul bx                             ; offset
    lea bx, student_names              ; base table
    add bx, ax                         ; point to record
    push si                             ; save index
    mov cx, 10                         ; length
print_student_name:
    mov dl, [bx]                       ; Load char
    mov ah, 02h                        ; Display
    int 21h                            ; Call DOS
    inc bx                             ; next
    loop print_student_name             ; repeat 10
    pop si                             ; restore index
    
    mov cx, 5                          ; 5 spaces
    call print_spaces                   ; Display
    
    ; Display Status
    lea bx, student_status             ; status table
    add bx, si                         ; target slot
    cmp byte ptr [bx], 1               ; Active?
    je print_active_list
    
    ; Print "Inactive" manually
    mov dl, 'I'
    mov ah, 02h
    int 21h
    mov dl, 'n'
    int 21h
    mov dl, 'a'
    int 21h
    mov dl, 'c'
    int 21h
    mov dl, 't'
    int 21h
    mov dl, 'i'
    int 21h
    mov dl, 'v'
    int 21h
    mov dl, 'e'
    int 21h
    jmp next_student_view_list
    
print_active_list:
    ; Print "Active" manually
    mov dl, 'A'
    mov ah, 02h
    int 21h
    mov dl, 'c'
    int 21h
    mov dl, 't'
    int 21h
    mov dl, 'i'
    int 21h
    mov dl, 'v'
    int 21h
    mov dl, 'e'
    int 21h
    mov cx, 2                          ; alignment
    call print_spaces                   ; display
    
next_student_view_list:
    call print_newline                  ; line feed
    
    inc si                             ; next record
    pop cx                             ; restore counter
    loop view_students_loop            ; repeat for all records
    
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu
    
no_students:
    lea dx, msg_nostud                 ; Load No Students registered message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu

; STUDENT MENU
student_main:
    lea dx, student_menu               ; Load student menu options
    call print_string                   ; Display menu
    
    call read_char                      ; Read user selection
    call wait_for_enter                 ; Wait for confirmation
    sub al, '0'                        ; Convert ASCII to number
    
    cmp al, 1                          ; Option 1: View Books
    je student_view_books
    cmp al, 2                          ; Option 2: Issue Book
    je student_issue
    cmp al, 3                          ; Option 3: Return Book
    je student_return
    cmp al, 4                          ; Option 4: My Issued Books
    je student_my_books
    cmp al, 5                          ; Option 5: Suggest New Book
    je student_suggest
    cmp al, 6                          ; Option 6: Logout
    je logout
    
    jmp student_main                   ; Repeat if invalid

; STUDENT: View Available Books
student_view_books:
    lea dx, hdr_books                  ; Load Header
    call print_string                   ; Display header
    call print_newline                  ; Newline
    
    mov cl, book_count                 ; Total book database size
    xor ch, ch                         ; clean high byte
    xor si, si                         ; index
    
student_view_loop:
    push cx                             ; Save counter
    
    ; Only show books with stock > 0
    lea bx, book_stock                 ; Stock levels table
    add bx, si                         ; point to current book's stock
    cmp byte ptr [bx], 0               ; Out of stock?
    je skip_book_view                  ; skip if empty
    
    ; Display book number
    mov ax, si                         ; index
    inc al                             ; 1-based
    call show_digit                     ; display number
    
    mov cx, 3                          ; 3 spaces
    call print_spaces                   ; display
    
    ; Display book name
    mov ax, si                         ; index
    mov bx, 15                         ; name slot size
    mul bx                             ; offset
    lea bx, book_names                 ; table base
    add bx, ax                         ; record address
    mov cx, 15                         ; length
print_avail_book_name:
    mov dl, [bx]                       ; load char
    mov ah, 02h                        ; display
    int 21h                            ; call DOS
    inc bx                             ; next
    loop print_avail_book_name          ; repeat 15
    
    mov cx, 3                          ; 3 spaces
    call print_spaces                   ; display
    
    ; Display stock
    lea bx, book_stock                 ; stock levels
    add bx, si                         ; current book
    mov al, [bx]                       ; load stock
    call show_digit                     ; display
    
    call print_newline                  ; line feed
    
skip_book_view:
    inc si                             ; next book
    pop cx                             ; restore counter
    loop student_view_loop              ; repeat for all books
    
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu

; STUDENT: Issue Book
student_issue:
    ; Prepare uid_in for counting
    push si                             ; Save SI
    push di                             ; Save DI
    lea si, current_uid                 ; current login source
    lea di, uid_in                      ; target buffer for logic
    mov cx, 5                          ; length
    rep movsb                          ; copy current login to uid_in
    pop di                             ; restore registers
    pop si
    
    ; Check student's issue limit (max 4 books)
    call count_student_issues          ; Check how many books user has
    cmp al, 4                          ; Compare with limit
    jge student_limit_reached
    
    ; Check for overdue books
    call check_overdue_issues
    cmp al, 1
    je student_overdue_block
    
    call get_book_number                ; Get validated book index
    cmp al, 0FFh                       ; Check if invalid
    je student_main                    ; Return to menu if canceled
    
    mov selected_book_idx, al          ; Store selected index
    
    ; Check if book is in stock
    xor bh, bh                         ; clear high byte
    mov bl, selected_book_idx          ; load index
    lea si, book_stock                 ; stock table
    add si, bx                         ; target slot
    cmp byte ptr [si], 0               ; Out of stock?
    je student_no_stock                ; error if empty
    
    ; Decrease stock
    dec byte ptr [si]                  ; record lending
    
    ; Record issue details
    mov al, issue_count                ; current total issues
    xor ah, ah                         ; clean high
    mov temp_word, ax                  ; store index for logic
    mov si, temp_word                  ; si = target slot
    
    ; Store book number
    lea bx, issue_bookno               ; book numbers table
    add bx, si                         ; target slot
    mov al, selected_book_idx          ; get 0-based index
    inc al                             ; convert to 1-based
    mov [bx], al                       ; store in table
    
    ; Store user ID
    mov ax, si                         ; index
    mov bx, 5                          ; length
    mul bx                             ; offset
    lea di, issue_userid               ; target table
    add di, ax                         ; destination address
    lea si, current_uid                 ; source (current login)
    mov cx, 5                          ; length
    rep movsb                          ; copy ID
    
    ; Set deadline
    mov si, temp_word                  ; restore index
    lea bx, issue_days                 ; remaining days table
    add bx, si                         ; target slot
    mov byte ptr [bx], 7               ; Initial deadline: 7 days
    
    inc issue_count                    ; Increment active issues
    
    lea dx, msg_issued                 ; Load Success message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu
    
student_overdue_block:
    lea dx, msg_overdue                ; Load Overdue Error message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu
    
student_limit_reached:
    lea dx, msg_limit                  ; Load Over-Limit Error message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu
    
student_no_stock:
    lea dx, msg_nostk                  ; Load Out of Stock message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu

; STUDENT: Return Book
student_return:
    call get_book_number                ; Ask for book to return
    cmp al, 0FFh                       ; Check cancellation
    je student_main                    ; Return if invalid
    
    inc al                             ; convert to 1-based
    mov temp_byte, al                  ; store for search
    
    ; Find the book issued by current student
    mov cl, issue_count                ; total active issues
    xor ch, ch                         ; clean high
    xor si, si                         ; index
    
find_student_issue:
    lea bx, issue_bookno               ; issued books table
    add bx, si                         ; current slot
    mov al, [bx]                       ; load value
    cmp al, temp_byte                  ; matching book?
    jne next_student_issue             ; skip if no
    
    ; Verify it was issued by current student
    push si                             ; save si
    mov ax, si                         ; index
    mov bx, 5                          ; length
    mul bx                             ; offset
    lea si, issue_userid               ; ID table
    add si, ax                         ; point to record
    lea di, current_uid                 ; current login
    mov cx, 5                          ; length
    push cx                             ; save length
    repe cmpsb                         ; Compare strings
    pop cx                             ; restore length
    pop si                             ; restore si
    je found_student_issue             ; branch if match
    
next_student_issue:
    inc si                             ; next record
    loop find_student_issue            ; continue search
    
    lea dx, msg_nobook                 ; Load Not Found Error message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu
    
found_student_issue:
    ; Increase book stock
    mov al, temp_byte                  ; 1-based index
    dec al                             ; 0-based index
    xor ah, ah                         ; clean AX
    mov bx, ax                         ; store in BX
    lea di, book_stock                 ; Stock levels table
    add di, bx                         ; target book
    inc byte ptr [di]                  ; Return to stock
    
    ; Shift remaining issues
    mov cl, issue_count                ; current total
    mov temp_word, si                  ; save found index
    mov ax, temp_word                  ; ax = SI
    sub cl, al                         ; cl = count - SI
    dec cl                             ; cl = remainder to shift
    xor ch, ch                         ; clean high byte
    
shift_student_issues:
    jcxz student_remove_done           ; Nothing to move, finish
    
    ; Store current destination index
    mov temp_word, si                  ; Save SI to temp
    
    ; Source index is Destination + 1
    mov bx, si                         ; BX = dest index
    inc bx                             ; BX = source index
    
    ; 1. Shift book numbers
    push bx                             ; save source
    lea di, issue_bookno               ; base table
    add di, bx                         ; source address
    mov al, [di]                       ; load value
    mov di, temp_word                  ; target index
    lea bx, issue_bookno               ; base table
    add bx, di                         ; target address
    mov [bx], al                       ; store value
    pop bx                             ; restore source
    
    ; 2. Shift user IDs (5 characters)
    push cx                            ; Save outer loop count
    
    ; Source address -> SI
    mov ax, bx                         ; index
    mov cx, 5                          ; length
    mul cx                             ; offset
    lea si, issue_userid               ; table base
    add si, ax                         ; address
    
    ; Destination address -> DI
    mov ax, temp_word                  ; index
    mov cx, 5                          ; length
    mul cx                             ; offset
    lea di, issue_userid               ; table base
    add di, ax                         ; address
    
    mov cx, 5                          ; bytes to copy
    rep movsb                          ; Move ID
    
    pop cx                             ; Restore outer loop
    
    ; 3. Shift days remaining
    mov bx, temp_word                  ; dest record
    inc bx                             ; source record
    lea di, issue_days                 ; table base
    add di, bx                         ; source address
    mov al, [di]                       ; load value
    mov di, temp_word                  ; target index
    lea bx, issue_days                 ; table base
    add bx, di                         ; target address
    mov [bx], al                       ; store value
    
    ; Next record
    mov si, temp_word                  ; restore original dest
    inc si                             ; increment target
    loop shift_student_issues          ; Repeat
    
student_remove_done:
    dec issue_count                    ; Reduction confirmed
    
    lea dx, msg_return                 ; Load Success message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu

; STUDENT: View My Issued Books
student_my_books:
    ; Prepare uid_in for counting
    push si                             ; Save registers
    push di
    lea si, current_uid                 ; source login
    lea di, uid_in                      ; target logic buffer
    mov cx, 5                          ; size
    rep movsb                          ; copy
    pop di                             ; restore
    pop si
    
    call count_student_issues          ; Check how many user has
    cmp al, 0                          ; None?
    je student_no_books                ; branch if none
    
    lea dx, hdr_issued                 ; Load Header
    call print_string                   ; Display
    call print_newline                  ; Newline
    
    mov cl, issue_count                ; Total active in system
    xor ch, ch                         ; clean high
    xor si, si                         ; index
    mov temp_byte, 1                   ; user-view record counter
    
my_books_loop:
    push cx                             ; Save system count
    
    ; Check if issued by current student
    push si                             ; save index
    mov ax, si                         ; index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea si, issue_userid               ; ID table
    add si, ax                         ; point to record
    lea di, current_uid                 ; current login
    mov cx, 5                          ; size
    repe cmpsb                         ; comparing
    pop si                             ; restore index
    jne skip_my_book                   ; skip if not user's
    
    ; Display record number for user
    mov al, temp_byte                  ; counter
    call show_digit                     ; display
    inc temp_byte                      ; next counter
    
    mov cx, 3                          ; 3 spaces
    call print_spaces                   ; display
    
    ; Display book name
    lea bx, issue_bookno               ; book numbers table
    add bx, si                         ; current system slot
    mov al, [bx]                       ; load value
    dec al                             ; convert to 0-based
    push si                             ; save system index
    
    xor ah, ah                         ; clean AX
    mov bx, 15                         ; name size
    mul bx                             ; offset
    lea bx, book_names                 ; names table
    add bx, ax                         ; address
    mov cx, 15                         ; length
print_my_name:
    mov dl, [bx]                       ; load char
    mov ah, 02h                        ; display
    int 21h                            ; Call DOS
    inc bx                             ; next
    loop print_my_name                 ; repeat 15
    
    pop si                             ; restore system index
    mov cx, 3                          ; 3 spaces
    call print_spaces                   ; display
    
    ; Display User ID
    push si                             ; save index
    mov ax, si                         ; index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea bx, issue_userid               ; ID table
    add bx, ax                         ; record address
    mov cx, 5
print_my_user:
    mov dl, [bx]
    mov ah, 02h
    int 21h
    inc bx
    loop print_my_user                 ; repeat 5
    pop si                             ; restore index
    
    mov cx, 5                          ; 5 spaces
    call print_spaces                   ; display
    
    ; Display days remaining
    lea bx, issue_days                 ; remaining days table
    add bx, si                         ; current system slot
    mov al, [bx]                       ; load value
    call show_digit                     ; display number
    
    call print_newline                  ; line feed
    
skip_my_book:
    inc si                             ; next record
    pop cx                             ; restore counter
    loop my_books_loop                  ; repeat for all issues
    
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu
    
student_no_books:
    lea dx, msg_nobook                  ; Load No Books Issued message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu

; STUDENT: Suggest New Book
student_suggest:
    ; Check if suggestion database is full
    mov al, suggest_count               ; current total suggestions
    cmp al, MAX_SUGGEST                ; compare with limit
    jge suggest_full                   ; handle overflow
    
    lea dx, msg_newbook                ; Load Suggestion header/prompt
    call print_string                   ; Display
    
    ; Read book suggestion
    mov al, suggest_count               ; current index
    xor ah, ah                         ; clean high byte
    mov bx, 15                         ; slot size
    mul bx                             ; offset
    lea di, suggest_names              ; target table base
    add di, ax                         ; destination address
    
    mov cx, 15                         ; max characters
read_suggestion:
    call read_char                      ; read char
    cmp al, 0Dh                        ; Enter pressed?
    je pad_suggestion                  ; pad with spaces and finish
    mov [di], al                       ; store char
    inc di                             ; next
    loop read_suggestion               ; repeat 15
    jmp increment_suggest_count         ; done reading
    
pad_suggestion:
    ; Fill remaining characters with spaces
    mov al, ' '                        ; space character
pad_suggestion_loop:
    mov [di], al                       ; store space
    inc di                             ; next
    loop pad_suggestion_loop           ; repeat for remaining CX
    call print_newline                  ; Line feed
    
increment_suggest_count:
    inc suggest_count                  ; Update total suggestions
    
    lea dx, msg_suggest                ; Load Success message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu
    
suggest_full:
    lea dx, msg_full                   ; Load Database Full error
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp student_main                   ; Return to menu

; HELPER FUNCTIONS

get_book_number proc
    lea dx, msg_select                 ; Load selection prompt
    call print_string                   ; Display
    
    call read_char                      ; read input
    call wait_for_enter                 ; Wait for confirmation
    sub al, '0'                        ; Convert ASCII to number
    
    ; Validate range
    cmp al, 1                          ; min index 1
    jl invalid_book                    ; error if low
    
    mov bl, book_count                 ; total books in system
    inc bl                             ; adjust for range check
    cmp al, bl                         ; compare selection
    jge invalid_book                   ; error if too high
    
    dec al                             ; convert to 0-based index
    ret                                ; finish
    
invalid_book:
    lea dx, msg_invalid                ; Load Invalid Selection message
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    mov al, 0FFh                        ; Signal invalid
    ret                                ; finish
get_book_number endp


count_student_issues proc
    push cx                             ; Preserve registers
    push si
    push bx
    push di
    
    mov temp_byte, 0                    ; Initialize counter
    mov cl, issue_count                ; total active issues in system
    xor ch, ch                         ; clean high
    xor si, si                         ; system index
    
count_loop:
    jcxz count_done                    ; Exit if no issues
    
    ; Compare user ID with current student
    push si                             ; save index
    push cx                             ; save counter
    mov ax, si                         ; index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea si, issue_userid               ; table base
    add si, ax                         ; record address
    lea di, uid_in                      ; target ID for comparison
    push cx                             ; extra push
    mov cx, 5                          ; length
    repe cmpsb                         ; comparison
    pop cx                             ; restore
    pop cx                             ; restore
    pop si                             ; restore
    
    jne skip_count                      ; skip if not a match
    inc temp_byte                      ; increment user's total
    
skip_count:
    inc si                             ; next record
    loop count_loop                    ; repeat for all
    
count_done:
    mov al, temp_byte                  ; return total
    pop di                             ; Restore registers
    pop bx
    pop si
    pop cx
    ret                                ; finish
count_student_issues endp


check_overdue_issues proc
    push cx                             ; Preserve registers
    push si
    push bx
    push di
    
    mov temp_byte, 0                    ; Default: no overdue
    mov cl, issue_count                ; total system issues
    xor ch, ch                         ; clean high
    xor si, si                         ; system index
    
overdue_check_loop:
    jcxz overdue_check_done            ; exit if none
    
    ; Compare user ID
    push si                             ; save si
    push cx                             ; save cx
    mov ax, si                         ; index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea si, issue_userid               ; table base
    add si, ax                         ; record address
    lea di, uid_in                      ; target ID
    push cx                             ; extra push
    mov cx, 5                          ; size
    repe cmpsb                         ; comparing
    pop cx                             ; restore
    pop cx                             ; restore
    pop si                             ; restore
    
    jne next_overdue_check             ; skip if no match
    
    ; Match found, check days
    lea bx, issue_days                 ; remaining days table
    add bx, si                         ; target slot
    cmp byte ptr [bx], 0               ; Expired?
    jne next_overdue_check             ; skip if time left
    
    ; Overdue found!
    mov temp_byte, 1                   ; Set flag
    jmp overdue_check_done             ; Exit early
    
next_overdue_check:
    inc si                             ; next record
    loop overdue_check_loop            ; repeat
    
overdue_check_done:
    mov al, temp_byte                  ; return status
    pop di                             ; restore registers
    pop bx
    pop si
    pop cx
    ret                                ; finish
check_overdue_issues endp


check_uid_exists proc
    push cx                             ; Preserve registers
    push si
    push di
    push bx
    
    mov cl, student_count               ; total registered students
    xor ch, ch                         ; clean high
    xor si, si                         ; index
    
check_uid_loop:
    jcxz uid_not_exists                ; Exit if none
    
    ; Compare user IDs
    mov ax, si                         ; index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea di, student_ids                 ; student ID table
    add di, ax                         ; record address
    lea si, uid_in                      ; target ID
    push cx                             ; save counter
    mov cx, 5                          ; size
    repe cmpsb                         ; compare
    pop cx                             ; restore
    
    je uid_exists                      ; branch if found
    
    inc si                             ; next
    loop check_uid_loop                ; repeat
    
uid_not_exists:
    xor al, al                         ; return False (0)
    jmp check_uid_done                 ; finish
    
uid_exists:
    mov al, 1                          ; return True (1)
    
check_uid_done:
    pop bx                             ; restore registers
    pop di
    pop si
    pop cx
    ret                                ; finish
check_uid_exists endp


check_uid_in_requests proc
    push cx
    push si
    push di
    push bx
    
    mov cl, request_count
    xor ch, ch
    xor si, si                         ; index
    
check_req_loop:
    jcxz req_not_exists                ; Exit if none
    
    ; Compare user IDs
    mov ax, si                         ; index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea di, request_ids                ; request ID table
    add di, ax                         ; record address
    lea si, uid_in                      ; target ID
    push cx                             ; save counter
    mov cx, 5                          ; size
    repe cmpsb                         ; compare
    pop cx                             ; restore
    
    je req_exists                      ; branch if found
    
    inc si                             ; next
    loop check_req_loop                ; repeat
    
req_not_exists:
    xor al, al                         ; return False (0)
    jmp check_req_done                 ; finish
    
req_exists:
    mov al, 1                          ; return True (1)
    
check_req_done:
    pop bx                             ; restore registers
    pop di
    pop si
    pop cx
    ret                                ; finish
check_uid_in_requests endp


find_student_login proc
    push cx                             ; Preserve registers
    push si
    push di
    push bx
    
    mov cl, student_count               ; total registered students
    xor ch, ch                         ; clean high byte
    xor si, si                         ; index
    
find_stud_loop:
    jcxz stud_not_found                ; Exit if none
    
    ; Compare user ID
    mov ax, si                         ; index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea di, student_ids                 ; ID table
    add di, ax                         ; record address
    push si                             ; save system index
    lea si, uid_in                      ; target ID
    push cx                             ; save counter
    mov cx, 5                          ; size
    repe cmpsb                         ; Compare IDs
    pop cx                             ; restore counter
    pop si                             ; restore index
    
    jne next_student_login             ; skip if no ID match
    
    ; User ID matched, now check password
    ; First encrypt the input password for comparison
    push si                             ; save index
    push cx                             ; save counter
    lea si, pwd_in                      ; plain text input
    mov cx, 5                          ; size
    call encrypt_password               ; In-place encryption
    pop cx                             ; restore counter
    pop si                             ; restore index
    
    ; Compare encrypted passwords
    mov ax, si                         ; index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea di, student_pwds                ; encrypted table
    add di, ax                         ; record address
    push si                             ; save index
    lea si, pwd_in                      ; newly encrypted input
    push cx                             ; save counter
    mov cx, 5                          ; size
    repe cmpsb                         ; comparing
    mov temp_byte, 0                    ; Default: mismatch
    jne pwd_check_result               ; skip if no match
    mov temp_byte, 1                    ; Match confirmed!
    
pwd_check_result:
    pop cx                             ; restore counter
    pop si                             ; restore index
    
    ; Decrypt the input password back for potential retry/re-display
    push si                             ; save index
    push cx                             ; save counter
    lea si, pwd_in                      ; encrypted input
    mov cx, 5                          ; size
    call encrypt_password               ; Toggle back to plain
    pop cx                             ; restore
    pop si                             ; restore
    
    cmp temp_byte, 1                   ; Check match flag
    jne next_student_login             ; fail if mismatch
    
    ; Check account status
    lea bx, student_status             ; status table
    add bx, si                         ; target slot
    cmp byte ptr [bx], 1               ; Active (1)?
    jne stud_pending                   ; branch if Inactive (0)
    
    ; Login successful
    xor al, al                         ; Return Success (0)
    jmp find_stud_done                 ; finish
    
stud_pending:
    mov al, 0FEh                        ; Return Pending (0FEh)
    jmp find_stud_done                 ; finish
    
next_student_login:
    inc si                             ; next record
    loop find_stud_loop                ; continue search
    
stud_not_found:
    mov al, 0FFh                        ; Return Not Found (0FFh)
    
find_stud_done:
    pop bx                             ; restore registers
    pop di
    pop si
    pop cx
    ret                                ; finish
find_student_login endp


remove_request proc
    push cx                             ; Preserve registers
    push si
    push di
    push bx
    
    mov al, temp_idx                    ; selected index
    xor ah, ah                         ; clean high
    mov si, ax                         ; si = starting point
    
    ; Calculate how many items follow the removed one
    mov cl, request_count               ; current total
    xor ch, ch                         ; clean high
    sub cl, al                         ; cl = count - index
    dec cl                             ; cl = remainder to move
    
shift_requests:
    jcxz remove_req_done               ; exit if nothing to shift
    
    mov bx, si                         ; destination index
    inc bx                             ; source index
    
    ; Shift User IDs (5 chars)
    push si                             ; save dest index
    push bx                             ; save source index
    mov ax, bx                          ; index
    mov bx, 5                          ; size
    mul bx                             ; source offset
    lea di, request_ids                ; table base
    add di, ax                         ; source address
    push di                             ; save source addr
    
    pop si                             ; si = source addr
    pop bx                             ; restore source index
    pop ax                             ; ax = dest index
    push ax                             ; save dest index
    mov bx, 5                          ; size
    mul bx                             ; dest offset
    lea di, request_ids                ; table base
    add di, ax                         ; dest address
    
    push cx                             ; save loop count
    mov cx, 5                          ; size
    rep movsb                          ; copy
    pop cx                             ; restore loop count
    
    pop si                             ; si = dest index
    
    ; Shift Passwords (5 chars)
    mov bx, si                         ; dest
    inc bx                             ; source
    
    push si                             ; save dest index
    push bx                             ; save source index
    mov ax, bx                          ; index
    mov bx, 5                          ; size
    mul bx                             ; source offset
    lea di, request_pwds               ; table base
    add di, ax                         ; address
    push di                             ; save source addr
    
    pop si                             ; si = source addr
    pop bx                             ; restore source index
    pop ax                             ; ax = dest index
    push ax                             ; save dest index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea di, request_pwds               ; table base
    add di, ax                         ; address
    
    push cx                             ; save loop count
    mov cx, 5                          ; size
    rep movsb                          ; copy
    pop cx                             ; restore loop
    
    pop si                             ; si = dest index
    
    ; Shift Emails (30 chars)
    mov bx, si                         ; dest
    inc bx                             ; source
    
    push si                             ; save dest
    push bx                             ; save source
    mov ax, bx                          ; index
    mov bx, 30                         ; size
    mul bx                             ; offset
    lea di, request_emails             ; table base
    add di, ax                         ; address
    push di                             ; save source addr
    
    pop si                             ; si = source
    pop bx                             ; restore source index
    pop ax                             ; ax = dest index
    push ax                             ; save dest
    mov bx, 30                         ; size
    mul bx                             ; offset
    lea di, request_emails             ; table base
    add di, ax                         ; address
    
    push cx                             ; save loop
    mov cx, 30                         ; size
    rep movsb                          ; copy email
    pop cx                             ; restore loop
    
    pop si                             ; si = dest index
    
    ; Shift Names (10 chars)
    mov bx, si                         ; dest
    inc bx                             ; source
    
    push si                             ; save dest
    push bx                             ; save source
    mov ax, bx                          ; index
    mov bx, 10                         ; size
    mul bx                             ; offset
    lea di, request_names              ; table base
    add di, ax                         ; address
    push di                             ; save source
    
    pop si                             ; si = source
    pop bx                             ; restore source index
    pop ax                             ; ax = dest index
    push ax                             ; save dest index
    mov bx, 10                         ; size
    mul bx                             ; offset
    lea di, request_names              ; table base
    add di, ax                         ; address
    
    push cx                             ; save loop
    mov cx, 10                         ; size
    rep movsb                          ; copy name
    pop cx                             ; restore loop
    
    pop si                             ; restore dest index
    
    inc si                             ; increment target slot
    loop shift_requests                ; Repeat for next item
    
remove_req_done:
    dec request_count                  ; Update queue length
    
    pop bx                             ; restore registers
    pop di
    pop si
    pop cx
    ret                                ; finish
remove_request endp


logout:
    mov user_role, 0                   ; Reset session role
    jmp main_menu                      ; return to splash screen


exit_program:
    mov ah, 4Ch                        ; DOS Termination Function
    int 21h                            ; Call interrupt

end main                               ; End of code and define start
