.model small                           ; Set memory model to small
.stack 100h                            ; Allocate 256 bytes for stack

.data                                  ; Data segment starts here

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

; FILE I/O SETTINGS
log_filename db 'LOG.CSV', 0           ; relative path
fhandle      dw ?                      ; handle storage
comma_char   db ','                    ; csv separator
newline_char db 0Dh, 0Ah               ; row terminator
csv_header   db 'User ID,Email,Book Name,Book ID,Days', 0Dh, 0Ah ; csv header
days_val     db '7'                    ; days value

.code                                  ; Code segment starts here

; UTILITY PROCEDURES

print_string proc                      ; print string function
    push ax                             ; save AX
    mov ah, 09h                         ; DOS output func
    int 21h                             ; display string
    pop ax                              ; restore AX
    ret                                 ; return
print_string endp                      ; end proc

print_newline proc                     ; print newline function
    push ax                             ; save AX
    push dx                             ; save DX
    mov dl, 0Dh                         ; load CR
    mov ah, 02h                         ; display char
    int 21h                             ; DOS call
    mov dl, 0Ah                         ; load LF
    mov ah, 02h                         ; display char
    int 21h                             ; DOS call
    pop dx                              ; restore DX
    pop ax                              ; restore AX
    ret                                 ; return
print_newline endp                     ; end proc

show_digit proc                        ; show digit function
    push ax                             ; save AX
    push dx                             ; save DX
    add al, '0'                         ; convert to char
    mov dl, al                          ; move to output
    mov ah, 02h                         ; display char
    int 21h                             ; DOS call
    pop dx                              ; restore DX
    pop ax                              ; restore AX
    ret                                 ; return
show_digit endp                        ; end proc

show_number proc                       ; show number function
    push ax                             ; save AX
    push bx                             ; save BX
    push dx                             ; save DX
    mov bl, 10                          ; set divisor
    xor ah, ah                          ; clean high
    div bl                              ; divide AX
    push ax                             ; save remainder
    call show_digit                     ; show tens
    pop ax                              ; restore remainder
    mov al, ah                          ; load units
    call show_digit                     ; show units
    pop dx                              ; restore DX
    pop bx                              ; restore BX
    pop ax                              ; restore AX
    ret                                 ; return
show_number endp                       ; end proc

print_spaces proc                      ; print spaces function
    push ax                             ; save AX
    push dx                             ; save DX
    push cx                             ; save count
space_loop:                             ; repeat loop
    mov dl, ' '                         ; load space
    mov ah, 02h                         ; display char
    int 21h                             ; DOS call
    loop space_loop                     ; repeat CX
    pop cx                              ; restore count
    pop dx                              ; restore DX
    pop ax                              ; restore AX
    ret                                 ; return
print_spaces endp                      ; end proc

read_char proc                         ; read char function
    mov ah, 01h                         ; read with echo
    int 21h                             ; DOS call
    ret                                 ; return result
read_char endp                         ; end proc

wait_for_enter proc                    ; wait enter function
    push ax                             ; save AX
wait_enter_loop:                        ; waiting loop
    mov ah, 01h                         ; read with echo
    int 21h                             ; DOS call
    cmp al, 0Dh                         ; check CR
    jne wait_enter_loop                 ; repeat if not
    pop ax                              ; restore AX
    ret                                 ; return
wait_for_enter endp                    ; end proc

flush_buffer proc                      ; flush buffer function
    push ax                             ; save AX
flush_loop:                             ; check loop
    mov ah, 0Bh                         ; check status
    int 21h                             ; DOS call
    cmp al, 0                           ; any keys?
    je flush_done                       ; done if zero
    mov ah, 01h                         ; read key
    int 21h                             ; consume key
    jmp flush_loop                      ; check again
flush_done:                             ; finished
    pop ax                              ; restore AX
    ret                                 ; return
flush_buffer endp                      ; end proc

log_transaction proc                   ; function start
    push ax                             ; save AX
    push bx                             ; save BX
    push cx                             ; save CX
    push dx                             ; save DX
    push si                             ; save SI
    push di                             ; save DI

    mov ah, 43h                         ; attribute check
    mov al, 00h                         ; get mode
    lea dx, log_filename                ; load name
    int 21h                             ; DOS call
    jc create_new_log                   ; jump if missing

    mov ah, 3Dh                         ; open existing
    mov al, 2                           ; rw mode
    lea dx, log_filename                ; load name
    int 21h                             ; DOS call
    jnc open_log_success                ; handle success
    jmp log_done                        ; exit if fail

create_new_log:                         ; file setup
    mov ah, 3Ch                         ; create new
    xor cx, cx                          ; normal type
    lea dx, log_filename                ; load name
    int 21h                             ; DOS call
    jc log_done                         ; exit on fail
    
    mov fhandle, ax                     ; save handle
    
    mov ah, 40h                         ; write data
    mov bx, fhandle                     ; load handle
    mov cx, 38                          ; header size
    lea dx, csv_header                  ; load header
    int 21h                             ; DOS call
    jmp open_log_success_no_seek        ; skip seeking
    
open_log_success:                       ; file opened
    mov fhandle, ax                     ; save handle

    mov ah, 42h                         ; move pointer
    mov al, 2                           ; end pointer
    mov bx, fhandle                     ; target file
    xor cx, cx                          ; zero high
    xor dx, dx                          ; zero low
    int 21h                             ; DOS call

open_log_success_no_seek:               ; ready to log
    mov cl, student_count               ; load count
    xor ch, ch                          ; clean high
    xor si, si                          ; reset index
    mov temp_idx, 0                     ; default index
find_log_stud:                          ; search loop
    jcxz start_log_writing              ; check empty
    push cx                             ; save counter
    
    mov ax, si                          ; get index
    mov bx, 5                           ; id size
    mul bx                              ; get offset
    lea di, student_ids                 ; load table
    add di, ax                          ; target cell
    push si                             ; save index
    lea si, uid_in                      ; load input
    mov cx, 5                           ; id length
    repe cmpsb                          ; compare strings
    pop si                              ; restore index
    pop cx                              ; restore counter
    je found_log_stud                   ; check match
    
    inc si                              ; next record
    loop find_log_stud                  ; repeat search
    jmp start_log_writing               ; finish search

found_log_stud:                         ; user located
    mov ax, si                          ; load index
    mov temp_idx, al                    ; store result

start_log_writing:                      ; data commit
    mov ah, 40h                         ; write function
    mov bx, fhandle                     ; target file
    mov cx, 5                           ; id size
    lea dx, uid_in                      ; id source
    int 21h                             ; DOS call

    mov ah, 40h                         ; write function
    mov cx, 1                           ; size one
    lea dx, comma_char                  ; delimiter
    int 21h                             ; DOS call
    
    mov al, temp_idx                    ; load index
    xor ah, ah                          ; clean high
    mov bx, 30                          ; email size
    mul bx                              ; get offset
    lea dx, student_emails              ; load table
    add dx, ax                          ; address calculated
    mov ah, 40h                         ; write function
    mov bx, fhandle                     ; target file
    mov cx, 30                          ; data size
    int 21h                             ; write email
    
    mov ah, 40h                         ; write function
    mov bx, fhandle                     ; target file
    mov cx, 1                           ; size one
    lea dx, comma_char                  ; delimiter
    int 21h                             ; DOS call
    
    mov al, selected_book_idx           ; load book
    mov bl, 15                          ; name size
    mul bl                              ; get offset
    lea dx, book_names                  ; load table
    add dx, ax                          ; address calculated
    mov ah, 40h                         ; write function
    mov bx, fhandle                     ; target file
    mov cx, 15                          ; data size
    int 21h                             ; write name
    
    mov ah, 40h                         ; write function
    mov bx, fhandle                     ; target file
    mov cx, 1                           ; size one
    lea dx, comma_char                  ; delimiter
    int 21h                             ; DOS call

    mov al, selected_book_idx           ; current book
    inc al                              ; adjust index
    add al, '0'                         ; convert char
    mov temp_byte, al                   ; save temp
    mov ah, 40h                         ; write function
    mov bx, fhandle                     ; target file
    mov cx, 1                           ; size one
    lea dx, temp_byte                   ; char source
    int 21h                             ; DOS call
    
    mov ah, 40h                         ; write function
    mov bx, fhandle                     ; target file
    mov cx, 1                           ; size one
    lea dx, comma_char                  ; delimiter
    int 21h                             ; DOS call
    
    mov ah, 40h                         ; write function
    mov bx, fhandle                     ; target file
    mov cx, 1                           ; size one
    lea dx, days_val                    ; constant source
    int 21h                             ; DOS call

    mov ah, 40h                         ; write function
    mov bx, fhandle                     ; target file
    mov cx, 2                           ; newline size
    lea dx, newline_char                ; row terminator
    int 21h                             ; DOS call

    mov ah, 3Eh                         ; close file
    mov bx, fhandle                     ; source file
    int 21h                             ; exit handle

log_done:                               ; finish up
    pop di                              ; restore registers
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret                                 ; return
log_transaction endp                   ; end proc

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
    pop bx                              ; restore BX
    pop cx                              ; restore CX
    ret                                 ; return
encrypt_password endp                  ; end proc


main proc                              ; entry point
    mov ax, @data                       ; load data segment
    mov ds, ax                          ; set DS
    mov es, ax                          ; set ES

main_menu:                              ; splash screen
    lea dx, msg_welcome                ; load welcome
    call print_string                   ; display it
    
    lea dx, msg_main                   ; load options
    call print_string                   ; display them
    
    call read_char                      ; read selection
    call wait_for_enter                 ; wait enter
    
    cmp al, '1'                         ; check choice 1
    je start_login                      ; go to login
    cmp al, '2'                         ; check choice 2
    je start_signup                     ; go to signup
    cmp al, '3'                         ; check choice 3
    je exit_program                     ; close program
    
    jmp main_menu                       ; loop back
main endp                              ; end proc

start_signup:                           ; registration start
    mov al, request_count               ; load count
    cmp al, MAX_REQUESTS                ; check limit
    jge signup_queue_full               ; handle full
    
    lea dx, msg_signup                 ; load header
    call print_string                   ; display it
    
    lea dx, msg_newuid                 ; load prompt
    call print_string                   ; display it
    
    lea si, uid_in                      ; target buffer
    mov cx, 5                           ; set length
read_signup_uid:                        ; input loop
    call read_char                      ; read key
    cmp al, 0Dh                         ; check Enter
    je pad_uid_signup                   ; handle padding
    mov [si], al                        ; save char
    inc si                              ; next pos
    loop read_signup_uid                ; repeat 5x
    jmp check_uid_exists_label          ; move to check
    
pad_uid_signup:                         ; ID alignment
    mov al, ' '                         ; load space
pad_uid_loop_signup:                    ; padding loop
    mov [si], al                        ; save space
    inc si                              ; next pos
    loop pad_uid_loop_signup            ; repeat CX
    call print_newline                  ; format output
    
check_uid_exists_label:                 ; validation check
    call check_uid_exists               ; check database
    cmp al, 1                           ; check match
    je uid_exists_error                 ; handle error
    
    call check_uid_in_requests          ; check queue
    cmp al, 1                           ; check match
    je uid_exists_error                 ; handle error
    
    lea dx, msg_email                  ; load prompt
    call print_string                   ; display it
    
    lea si, email_in                    ; target buffer
    mov cx, 30                          ; set length
read_email:                             ; input loop
    call read_char                      ; read key
    cmp al, 0Dh                         ; check Enter
    je pad_email                        ; handle padding
    mov [si], al                        ; save char
    inc si                              ; next pos
    loop read_email                     ; repeat 30x
    jmp read_name_section               ; move to name
    
pad_email:                              ; Email alignment
    mov al, ' '                         ; load space
pad_email_loop:                         ; padding loop
    mov [si], al                        ; save space
    inc si                              ; next pos
    loop pad_email_loop                 ; repeat CX
    call print_newline                  ; format output
    
read_name_section:                      ; get username
    lea dx, msg_name                   ; load prompt
    call print_string                   ; display it
    
    lea si, name_in                     ; target buffer
    mov cx, 10                          ; set length
read_name:                              ; input loop
    call read_char                      ; read key
    cmp al, 0Dh                         ; check Enter
    je pad_name                         ; handle padding
    mov [si], al                        ; save char
    inc si                              ; next pos
    loop read_name                      ; repeat 10x
    jmp read_password_section           ; move to pwd
    
pad_name:                               ; Name alignment
    mov al, ' '                         ; load space
pad_name_loop:                          ; padding loop
    mov [si], al                        ; save space
    inc si                              ; next pos
    loop pad_name_loop                  ; repeat CX
    call print_newline                  ; format output
    
read_password_section:                  ; get password
    lea dx, msg_newpwd                 ; load prompt
    call print_string                   ; display it
    
    lea si, pwd_in                      ; target buffer
    mov cx, 5                           ; set length
read_signup_pwd:                        ; input loop
    call read_char                      ; read key
    cmp al, 0Dh                         ; check Enter
    je pad_signup_pwd                   ; handle padding
    mov [si], al                        ; save char
    push dx                             ; save DX
    mov dl, 08h                         ; backspace
    mov ah, 02h                         ; output func
    int 21h                             ; DOS call
    mov dl, '*'                         ; mask char
    int 21h                             ; DOS call
    pop dx                              ; restore DX
    inc si                              ; next pos
    loop read_signup_pwd                ; repeat 5x
    jmp read_confirm_section            ; move to confirm
    
pad_signup_pwd:                         ; PWD alignment
    mov al, ' '                         ; load space
pad_signup_pwd_loop:                    ; padding loop
    mov [si], al                        ; save space
    inc si                              ; next pos
    loop pad_signup_pwd_loop            ; repeat CX
    call print_newline                  ; format output

read_confirm_section:                    ; verify password
    lea dx, msg_confirm                ; load prompt
    call print_string                   ; display it
    
    lea si, pwd_confirm                 ; target buffer
    mov cx, 5                           ; set length
read_confirm_pwd:                       ; input loop
    call read_char                      ; read key
    cmp al, 0Dh                         ; check Enter
    je pad_confirm_pwd                  ; handle padding
    mov [si], al                        ; save char
    push dx                             ; save DX
    mov dl, 08h                         ; backspace
    mov ah, 02h                         ; output func
    int 21h                             ; DOS call
    mov dl, '*'                         ; mask char
    int 21h                             ; DOS call
    pop dx                              ; restore DX
    inc si                              ; next pos
    loop read_confirm_pwd               ; repeat 5x
    jmp validate_passwords              ; move to check
    
pad_confirm_pwd:                        ; Confirm alignment
    mov al, ' '                         ; load space
pad_confirm_pwd_loop:                   ; padding loop
    mov [si], al                        ; save space
    inc si                              ; next pos
    loop pad_confirm_pwd_loop           ; repeat CX
    call print_newline                  ; format output
    
validate_passwords:                     ; match check
    lea si, pwd_in                      ; load pwd
    lea di, pwd_confirm                 ; load confirm
    mov cx, 5                           ; set length
    repe cmpsb                          ; compare strings
    jne password_mismatch               ; check match
    
    mov al, request_count               ; load index
    xor ah, ah                          ; clean high
    mov bx, 5                           ; id size
    mul bx                              ; get offset
    lea di, request_ids                 ; find table
    add di, ax                          ; target cell
    lea si, uid_in                      ; source data
    mov cx, 5                           ; length 5
    rep movsb                           ; copy ID
    
    push si                             ; backup SI
    push cx                             ; backup CX
    lea si, pwd_in                      ; target pwd
    mov cx, 5                           ; set length
    call encrypt_password               ; secure it
    pop cx                              ; restore CX
    pop si                              ; restore SI
    
    mov al, request_count               ; load index
    xor ah, ah                          ; clean high
    mov bx, 5                           ; pwd size
    mul bx                              ; get offset
    lea di, request_pwds                ; find table
    add di, ax                          ; target cell
    lea si, pwd_in                      ; source data
    mov cx, 5                           ; length 5
    rep movsb                           ; copy PWD
    
    push si                             ; backup SI
    push cx                             ; backup CX
    lea si, pwd_in                      ; restore buffer
    mov cx, 5                           ; set length
    call encrypt_password               ; decrypt it
    pop cx                              ; restore CX
    pop si                              ; restore SI
    
    mov al, request_count               ; load index
    xor ah, ah                          ; clean high
    mov bx, 30                          ; email size
    mul bx                              ; get offset
    lea di, request_emails              ; find table
    add di, ax                          ; target cell
    lea si, email_in                    ; source data
    mov cx, 30                          ; length 30
    rep movsb                           ; copy email
    
    mov al, request_count               ; load index
    xor ah, ah                          ; clean high
    mov bx, 10                          ; name size
    mul bx                               ; get offset
    lea di, request_names                ; find table
    add di, ax                           ; target cell
    lea si, name_in                      ; source data
    mov cx, 10                           ; length 10
    rep movsb                            ; copy name
    
    inc request_count                   ; add request
    
    lea dx, msg_reqsent                 ; load success
    call print_string                    ; display it
    lea dx, msg_press_enter              ; load prompt
    call print_string                    ; display it
    call wait_for_enter                  ; wait enter
    jmp main_menu                       ; back to main
    
signup_queue_full:                      ; capacity error
    lea dx, msg_reqfull                 ; load error
    call print_string                    ; display it
    lea dx, msg_press_enter              ; load prompt
    call print_string                    ; display it
    call wait_for_enter                  ; wait enter
    jmp main_menu                       ; back to main
    
uid_exists_error:                       ; duplicate error
    lea dx, msg_exists                  ; load error
    call print_string                    ; display it
    lea dx, msg_press_enter              ; load prompt
    call print_string                    ; display it
    call wait_for_enter                  ; wait enter
    jmp main_menu                       ; back to main
    
password_mismatch:                      ; typing error
    lea dx, msg_pwdmis                  ; load error
    call print_string                    ; display it
    lea dx, msg_press_enter              ; load prompt
    call print_string                    ; display it
    call wait_for_enter                  ; wait enter
    jmp main_menu                       ; back to main

start_login:                            ; login setup
    mov attempts, 3                     ; reset counter
    
login_screen:                           ; retry loop
    lea dx, msg_uid                    ; load prompt
    call print_string                   ; display it
    
    lea si, uid_in                      ; target buffer
    mov cx, 5                           ; set length
read_uid:                               ; input loop
    call read_char                      ; read key
    cmp al, 0Dh                         ; check Enter
    je pad_uid_login                    ; handle padding
    mov [si], al                        ; save char
    inc si                              ; next pos
    loop read_uid                       ; repeat 5x
    jmp read_password_login             ; move to pwd
    
pad_uid_login:                          ; ID alignment
    mov al, ' '                         ; load space
pad_uid_loop_login:                     ; padding loop
    mov [si], al                        ; save space
    inc si                              ; next pos
    loop pad_uid_loop_login             ; repeat CX
    call print_newline                  ; format output
    
read_password_login:                    ; get password
    lea dx, msg_pwd                    ; load prompt
    call print_string                   ; display it
    
    lea si, pwd_in                      ; target buffer
    mov cx, 5                           ; set length
read_pwd:                               ; input loop
    call read_char                      ; read key
    cmp al, 0Dh                         ; check Enter
    je pad_pwd_login                    ; handle padding
    mov [si], al                        ; save char
    push dx                             ; backup DX
    mov dl, 08h                         ; backspace
    mov ah, 02h                         ; display char
    int 21h                             ; DOS call
    mov dl, '*'                         ; mask char
    int 21h                             ; DOS call
    pop dx                              ; restore DX
    inc si                              ; next pos
    loop read_pwd                       ; repeat 5x
    jmp start_admin_check               ; move to auth
    
pad_pwd_login:                          ; PWD alignment
    mov al, ' '                         ; load space
pad_pwd_login_loop:                     ; padding loop
    mov [si], al                        ; save space
    inc si                              ; next pos
    loop pad_pwd_login_loop             ; repeat CX
    call print_newline                  ; format output

start_admin_check:                      ; system check
    lea si, uid_in                      ; load input
    lea di, admin_id                    ; load admin
    mov cx, 5                           ; set length
    repe cmpsb                          ; compare strings
    jne try_student                     ; check student
    
    lea si, pwd_in                      ; load input
    lea di, admin_pwd                   ; load admin
    mov cx, 5                           ; set length
    repe cmpsb                          ; compare strings
    jne login_failed                    ; check match
    
    mov user_role, 1                    ; set admin
    lea dx, msg_ok                      ; load success
    call print_string                   ; display it
    
    lea si, uid_in                      ; current id
    lea di, current_uid                 ; session id
    mov cx, 5                           ; set length
    rep movsb                           ; copy data
    
    jmp admin_main                      ; open admin
    
try_student:                            ; db search
    call find_student_login             ; check records
    cmp al, 0FFh                        ; check not found
    je login_failed                     ; handle error
    cmp al, 0FEh                        ; check pending
    je login_pending                    ; handle error
    
    mov user_role, 2                    ; set student
    lea dx, msg_ok                      ; load success
    call print_string                   ; display it
    
    lea si, uid_in                      ; current id
    lea di, current_uid                 ; session id
    mov cx, 5                           ; set length
    rep movsb                           ; copy data
    
    jmp student_main                    ; open student
    
login_pending:                          ; approval status
    lea dx, msg_pending                 ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter             ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp main_menu                       ; back to main
    
login_failed:                           ; auth error
    dec attempts                        ; reduce tries
    lea dx, msg_fail                    ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter             ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    
    cmp attempts, 0                     ; check tries
    jne login_screen                    ; retry loop
    
    lea dx, msg_lock                    ; load lockout
    call print_string                   ; display it
    lea dx, msg_press_enter             ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp main_menu                       ; back to main



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
    mov al, ' '                        ; load space
pad_target_uid_loop:                    ; padding loop
    mov [si], al                        ; save space
    inc si                              ; next pos
    loop pad_target_uid_loop            ; repeat CX
    call print_newline                  ; format output
    
check_target_student:                   ; find user
    call check_uid_exists               ; check database
    cmp al, 0                           ; check not found
    je admin_student_not_found          ; handle missing
    
    call count_student_issues           ; check count
    cmp al, 4                           ; limit of 4
    jge admin_limit_reached             ; handle capped
    
    call check_overdue_issues           ; check dates
    cmp al, 1                           ; check blocked
    je admin_overdue_block              ; handle late
    
    xor bh, bh                          ; clean high
    mov bl, selected_book_idx           ; load index
    lea si, book_stock                  ; find table
    add si, bx                          ; target slot
    cmp byte ptr [si], 0                ; check inventory
    je issue_no_stock                   ; handle empty
    
    dec byte ptr [si]                   ; reduce stock
    
    mov al, issue_count                 ; load index
    xor ah, ah                          ; clean high
    mov temp_word, ax                   ; store index
    mov si, temp_word                   ; set pointer
    
    lea bx, issue_bookno                ; find table
    add bx, si                          ; target slot
    mov al, selected_book_idx           ; load index
    inc al                              ; adjust 1-based
    mov [bx], al                        ; save book
    
    mov ax, si                          ; load index
    mov bx, 5                           ; id size
    mul bx                              ; get offset
    lea di, issue_userid                ; find table
    add di, ax                          ; target cell
    lea si, uid_in                      ; source data
    mov cx, 5                           ; length 5
    rep movsb                           ; copy ID
    
    mov si, temp_word                   ; restore index
    lea bx, issue_days                  ; find table
    add bx, si                          ; target slot
    mov byte ptr [bx], 7                ; set 7 days
    
    inc issue_count                     ; add issue
    
    call log_transaction                ; save to CSV
    
    lea dx, msg_issued                 ; load success
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
admin_student_not_found:                ; lookup fail
    lea dx, msg_fail                   ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
issue_no_stock:                         ; empty shelf
    lea dx, msg_nostk                  ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
admin_overdue_block:                    ; penalty active
    lea dx, msg_overdue                ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
admin_limit_reached:                    ; too many books
    lea dx, msg_limit                  ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu

; ADMIN: Return Book
admin_return:                          ; return process
    call get_book_number                ; input book
    cmp al, 0FFh                        ; check invalid
    je admin_main                       ; back to menu
    
    inc al                              ; adjust 1-based
    mov temp_byte, al                   ; store target
    
    lea dx, msg_target_uid             ; load prompt
    call print_string                   ; display it
    
    ; Read Student ID
    lea si, uid_in                      ; target buffer
    mov cx, 5                           ; set length
read_return_uid:                        ; input loop
    call read_char                      ; read key
    cmp al, 0Dh                         ; check Enter
    je pad_return_uid                   ; handle padding
    mov [si], al                        ; save char
    inc si                              ; next pos
    loop read_return_uid                ; repeat 5x
    jmp check_return_student            ; move to check
    
pad_return_uid:                         ; ID alignment
    mov al, ' '                         ; load space
pad_return_uid_loop:                    ; padding loop
    mov [si], al                        ; save space
    inc si                              ; next pos
    loop pad_return_uid_loop            ; repeat CX
    call print_newline                  ; format output
    

    ; Verify student exists
check_return_student:                   ; find user
    call check_uid_exists               ; check database
    cmp al, 0                           ; check not found
    je admin_return_student_not_found   ; handle missing
    
    ; Find the specific issue (Book + Student)
    mov cl, issue_count                ; Total active issues
    xor ch, ch                         ; clean high byte
    jcxz admin_no_issue_found          ; Fail if no issues record
    xor si, si                         ; SI as counter (0-based)
    
find_admin_return_issue:                ; search loop
    push cx                             ; save count
    push si                             ; save index
    
    lea bx, issue_bookno                ; find table
    add bx, si                          ; current slot
    mov al, [bx]                        ; load stored
    cmp al, temp_byte                   ; check book
    jne next_return_search              ; try next
    
    mov ax, si                          ; load index
    mov bx, 5                           ; id size
    mul bx                              ; get offset
    lea si, issue_userid                ; find table
    add si, ax                          ; target cell
    lea di, uid_in                      ; load input
    mov cx, 5                           ; set length
    repe cmpsb                          ; compare IDs
    je found_admin_return_issue         ; check match
    
next_return_search:                     ; continue loop
    pop si                              ; restore index
    pop cx                              ; restore count
    inc si                              ; next issue
    loop find_admin_return_issue        ; repeat CX
    jmp admin_no_issue_found            ; handle fail

found_admin_return_issue:               ; cleanup
    pop si                              ; get slot
    pop cx                              ; drop stack
    jmp found_issue                     ; process it

admin_return_student_not_found:         ; user fail
    lea dx, msg_fail                   ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
admin_no_issue_found:                   ; record fail
    lea dx, msg_nobook                 ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
found_issue:                           ; stock update
    mov al, temp_byte                   ; load book
    dec al                              ; adjust 0-based
    xor ah, ah                          ; clean high
    mov bx, ax                          ; set index
    lea di, book_stock                  ; find table
    add di, bx                          ; target slot
    inc byte ptr [di]                   ; add to stock
    
    mov cl, issue_count                 ; load total
    mov temp_word, si                   ; save slot
    mov ax, temp_word                   ; move to reg
    sub cl, al                          ; get trailing
    dec cl                              ; adjust count
    xor ch, ch                          ; clean high
    
shift_issues:                           ; pack array
    jcxz remove_done                    ; check end
    
    mov temp_word, si                   ; save slot
    mov bx, si                          ; set index
    inc bx                              ; next record
    
    push bx                             ; save source
    lea di, issue_bookno                ; find table
    add di, bx                          ; target slot
    mov al, [di]                        ; load value
    mov di, temp_word                   ; set destination
    lea bx, issue_bookno                ; find table
    add bx, di                          ; target slot
    mov [bx], al                        ; save value
    pop bx                              ; restore source
    
    push cx                             ; save count
    mov ax, bx                          ; source index
    mov cx, 5                           ; id size
    mul cx                              ; get offset
    lea si, issue_userid                ; find table
    add si, ax                          ; source address
    
    mov ax, temp_word                   ; dest index
    mov cx, 5                           ; id size
    mul cx                              ; get offset
    lea di, issue_userid                ; find table
    add di, ax                          ; dest address
    
    mov cx, 5                           ; length 5
    rep movsb                           ; copy ID
    pop cx                              ; restore count
    
    mov bx, temp_word                   ; restore slot
    inc bx                              ; next source
    lea di, issue_days                  ; find table
    add di, bx                          ; target slot
    mov al, [di]                        ; load value
    mov di, temp_word                   ; set destination
    lea bx, issue_days                  ; find table
    add bx, di                          ; target slot
    mov [bx], al                        ; save value
    
    mov si, temp_word                   ; restore slot
    inc si                              ; next pos
    loop shift_issues                   ; repeat CX
    
remove_done:                            ; finalize return
    dec issue_count                     ; reduce active
    
    lea dx, msg_return                 ; load success
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu

admin_add_stock:                        ; replenishment
    call get_book_number                ; input book
    cmp al, 0FFh                        ; check invalid
    je admin_main                       ; back to menu
    
    mov temp_byte, al                   ; save index
    
    lea dx, msg_qty                    ; load prompt
    call print_string                   ; display it
    
    call read_char                      ; read digit
    call wait_for_enter                 ; wait enter
    sub al, '0'                         ; convert decimal
    
    xor bh, bh                          ; clean high
    mov bl, temp_byte                   ; load index
    
    push ax                             ; save quantity
    lea si, book_stock                  ; find table
    add si, bx                          ; target slot
    mov al, [si]                        ; current stock
    mov cl, al                          ; copy for math
    pop ax                              ; restore qty
    
    add cl, al                          ; get total
    
    lea si, book_max                    ; find limit
    add si, bx                          ; target slot
    cmp cl, [si]                        ; check capacity
    jg stock_overflow                   ; handle full
    
    lea si, book_stock                  ; find table
    add si, bx                          ; target slot
    add [si], al                        ; update stock
    
    lea dx, msg_added                  ; load success
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
stock_overflow:                         ; limit error
    lea dx, msg_invalid                ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu

admin_add_book:                         ; database addition
    mov al, book_count                  ; load total
    cmp al, MAX_BOOKS                   ; check limit
    jge book_db_full                    ; handle full
    
    lea dx, msg_newbook                ; load header
    call print_string                   ; display it
    
    mov al, book_count                  ; set index
    xor ah, ah                          ; clean high
    mov bx, 15                          ; name size
    mul bx                              ; get offset
    lea di, book_names                  ; find table
    add di, ax                          ; target slot
    
    mov cx, 15                          ; set count
read_bookname:                          ; input loop
    call read_char                      ; read key
    cmp al, 0Dh                         ; check Enter
    je pad_bookname                     ; handle padding
    mov [di], al                        ; save char
    inc di                              ; next pos
    loop read_bookname                  ; repeat 15x
    jmp read_stock_section              ; move to stock
    
pad_bookname:                           ; alignment
    mov al, ' '                         ; load space
pad_bookname_loop:                      ; padding loop
    mov [di], al                        ; save space
    inc di                              ; next pos
    loop pad_bookname_loop               ; repeat CX
    call print_newline                  ; format output
    
read_stock_section:                     ; get inventory
    lea dx, msg_stock                  ; load prompt
    call print_string                   ; display it
    call read_char                      ; read digit
    call wait_for_enter                 ; wait enter
    sub al, '0'                         ; convert decimal
    
    xor bh, bh                          ; clean high
    mov bl, book_count                  ; current index
    lea si, book_stock                  ; find table
    add si, bx                          ; target slot
    mov [si], al                        ; save value
    
    lea dx, msg_maxstk                 ; load prompt
    call print_string                   ; display it
    call read_char                      ; read digit
    call wait_for_enter                 ; wait enter
    sub al, '0'                         ; convert decimal
    
    lea si, book_max                    ; find table
    add si, bx                          ; target slot
    mov [si], al                        ; save value
    
    inc book_count                      ; add book
    
    lea dx, msg_created                ; load success
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
book_db_full:                           ; database limit
    lea dx, msg_full                   ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu

; ADMIN: View Issued Books
admin_view_issued:                        ; active loans
    cmp issue_count, 0                 ; check empty
    je no_issues                       ; handle none
    
    lea dx, hdr_issued                 ; load header
    call print_string                   ; display it
    call print_newline                  ; format output
    
    mov cl, issue_count                ; load total
    xor ch, ch                         ; clean high
    xor si, si                         ; reset index
    
view_issued_loop:                       ; display loop
    push cx                             ; save count
    
    mov ax, si                          ; load index
    inc al                              ; adjust 1-based
    call show_digit                     ; display id
    
    mov cx, 3                           ; load spacing
    call print_spaces                   ; format output
    
    lea bx, issue_bookno                ; find table
    add bx, si                          ; current slot
    mov al, [bx]                        ; load value
    dec al                              ; adjust index
    push si                             ; save slot
    
    xor ah, ah                          ; clean high
    mov bx, 15                          ; name size
    mul bx                              ; get offset
    lea bx, book_names                  ; find table
    add bx, ax                          ; target name
    mov cx, 15                          ; set length
print_issued_name:                      ; name loop
    mov dl, [bx]                        ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    inc bx                              ; next char
    loop print_issued_name              ; repeat 15x
    
    pop si                              ; restore slot
    mov cx, 3                           ; load spacing
    call print_spaces                   ; format output
    
    push si                             ; save slot
    mov ax, si                          ; load index
    mov bx, 5                           ; id size
    mul bx                              ; get offset
    lea bx, issue_userid                ; find table
    add bx, ax                          ; target id
    mov cx, 5                           ; set length
print_issue_user:                       ; id loop
    mov dl, [bx]                        ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    inc bx                              ; next char
    loop print_issue_user               ; repeat 5x
    pop si                              ; restore slot
    
    mov cx, 5                          ; 5 spaces
    call print_spaces                   ; format output
    
    lea bx, issue_days                  ; find table
    add bx, si                          ; current slot
    mov al, [bx]                        ; load value
    call show_digit                     ; display it
    
    call print_newline                  ; format output
    
    inc si                              ; next issue
    pop cx                              ; restore count
    loop view_issued_loop               ; repeat CX
    
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
no_issues:                              ; empty list
    lea dx, msg_nobook                 ; load notice
    call print_string                   ; Display
    lea dx, msg_press_enter             ; Load prompt
    call print_string                   ; Display
    call wait_for_enter                 ; Wait
    jmp admin_main                     ; Return to menu

; ADMIN: Fast Forward Days
admin_ffwd:                           ; skip time
    mov cl, issue_count                ; active total
    xor ch, ch                         ; clean high
    jcxz ffwd_done                     ; check empty
    xor si, si                         ; reset index
ffwd_loop:                              ; update loop
    lea bx, issue_days                 ; find table
    add bx, si                         ; current slot
    cmp byte ptr [bx], 0               ; check expired
    je skip_dec                        ; skip zero
    dec byte ptr [bx]                  ; reduce day
skip_dec:                               ; next item
    inc si                             ; next issue
    loop ffwd_loop                     ; repeat CX
ffwd_done:                              ; finishing
    lea dx, msg_ffwd                   ; load success
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu

; ADMIN: View Suggestions
admin_view_suggest:                     ; user feedback
    cmp suggest_count, 0               ; check empty
    je no_suggestions                  ; handle none
    
    lea dx, hdr_suggest                ; load header
    call print_string                   ; display it
    call print_newline                  ; format output
    
    mov cl, suggest_count               ; load total
    xor ch, ch                         ; clean high
    xor si, si                         ; reset index
    
view_suggest_loop:                      ; display loop
    push cx                             ; save count
    
    mov ax, si                          ; load index
    inc al                              ; adjust 1-based
    call show_digit                     ; display id
    
    mov cx, 3                           ; load spacing
    call print_spaces                   ; format output
    
    mov ax, si                          ; load index
    mov bx, 15                          ; name size
    mul bx                              ; get offset
    lea bx, suggest_names               ; find table
    add bx, ax                          ; target name
    mov cx, 15                          ; set length
print_suggest_name:                     ; name loop
    mov dl, [bx]                        ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    inc bx                              ; next char
    loop print_suggest_name             ; repeat 15x
    
    call print_newline                  ; format output
    
    inc si                              ; next item
    pop cx                              ; restore count
    loop view_suggest_loop              ; repeat CX
    
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
no_suggestions:                         ; empty list
    lea dx, msg_nosuggest              ; load notice
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu

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
show_requests_loop:                     ; display loop
    push cx                             ; save count
    
    mov ax, si                          ; load index
    inc al                              ; adjust 1-based
    call show_digit                     ; display id
    
    mov cx, 3                           ; load spacing
    call print_spaces                   ; format output
    
    mov ax, si                          ; load index
    mov bx, 5                           ; id size
    mul bx                              ; get offset
    lea bx, request_ids                 ; find table
    add bx, ax                          ; target id
    push si                             ; save slot
    mov cx, 5                           ; set length
print_req_uid:                          ; id loop
    mov dl, [bx]                        ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    inc bx                              ; next char
    loop print_req_uid                  ; repeat 5x
    pop si                              ; restore slot
    
    mov cx, 5                           ; load spacing
    call print_spaces                   ; format output
    
    mov ax, si                          ; load index
    mov bx, 30                          ; email size
    mul bx                              ; get offset
    lea bx, request_emails              ; find table
    add bx, ax                          ; target email
    push si                             ; save slot
    mov cx, 30                          ; set length
print_req_email:                        ; email loop
    mov dl, [bx]                        ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    inc bx                              ; next char
    loop print_req_email                ; repeat 30x
    pop si                              ; restore slot
    
    mov cx, 5                           ; load spacing
    call print_spaces                   ; format output
    
    mov ax, si                          ; load index
    mov bx, 10                          ; name size
    mul bx                              ; get offset
    lea bx, request_names               ; find table
    add bx, ax                          ; target name
    mov cx, 10                          ; set length
print_req_name:                         ; name loop
    mov dl, [bx]                        ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    inc bx                              ; next char
    loop print_req_name                 ; repeat 10x
    
    call print_newline                  ; format output
    
    inc si                              ; next item
    pop cx                              ; restore count
    loop show_requests_loop             ; repeat CX
    
    ; Get admin's selection
    lea dx, msg_reqsel                 ; load prompt
    call print_string                   ; display it
    
    call read_char                      ; read digit
    call wait_for_enter                 ; wait enter
    sub al, '0'                         ; convert decimal
    
    cmp al, 1                           ; check min
    jl invalid_request                  ; handle low
    mov bl, request_count               ; load limit
    inc bl                              ; adjust limit
    cmp al, bl                          ; check max
    jge invalid_request                 ; handle high
    
    dec al                              ; adjust index
    mov temp_idx, al                    ; save selection

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

approve_user:                           ; process approval
    mov al, student_count               ; load count
    cmp al, MAX_STUDENTS               ; check limit
    jge student_db_full                ; handle full
    
    mov al, student_count               ; load index
    xor ah, ah                         ; clean high
    mov bx, 5                          ; id size
    mul bx                             ; get offset
    push ax                             ; save dest
    
    mov al, temp_idx                    ; load selection
    xor ah, ah                         ; clean high
    mov bx, 5                          ; id size
    mul bx                             ; get offset
    lea si, request_ids                ; source table
    add si, ax                         ; source item
    
    pop ax                             ; restore dest
    lea di, student_ids                 ; dest table
    add di, ax                         ; dest item
    mov cx, 5                          ; set length
    rep movsb                          ; copy id
    
    mov al, student_count               ; load index
    xor ah, ah                         ; clean high
    mov bx, 5                          ; id size
    mul bx                             ; get offset
    push ax                             ; save dest
    
    mov al, temp_idx                    ; load selection
    xor ah, ah                         ; clean high
    mov bx, 5                          ; id size
    mul bx                             ; get offset
    lea si, request_pwds                ; source table
    add si, ax                         ; source item
    
    pop ax                             ; restore dest
    lea di, student_pwds                ; dest table
    add di, ax                         ; dest item
    mov cx, 5                          ; set length
    rep movsb                          ; copy pass
    
    mov al, student_count               ; load index
    xor ah, ah                         ; clean high
    mov bx, 30                         ; email size
    mul bx                             ; get offset
    push ax                             ; save dest
    
    mov al, temp_idx                    ; load selection
    xor ah, ah                         ; clean high
    mov bx, 30                         ; email size
    mul bx                             ; get offset
    lea si, request_emails              ; source table
    add si, ax                         ; source item
    
    pop ax                             ; restore dest
    lea di, student_emails              ; dest table
    add di, ax                         ; dest item
    mov cx, 30                         ; set length
    rep movsb                          ; copy email
    
    mov al, student_count               ; load index
    xor ah, ah                         ; clean high
    mov bx, 10                         ; name size
    mul bx                             ; get offset
    push ax                             ; save dest
    
    mov al, temp_idx                    ; load selection
    xor ah, ah                         ; clean high
    mov bx, 10                         ; name size
    mul bx                             ; get offset
    lea si, request_names               ; source table
    add si, ax                         ; source address
    
    pop ax                             ; restore offset
    lea di, student_names               ; dest table
    add di, ax                         ; dest address
    mov cx, 10                         ; copy 10 bytes
    rep movsb                          ; copy name
    
    xor bh, bh                          ; clean high
    mov bl, student_count               ; load count
    lea si, student_status              ; find table
    add si, bx                          ; target status
    mov byte ptr [si], 1                ; set active
    
    inc student_count                   ; add student
    
    call remove_request                 ; clear queue
    
    lea dx, msg_approved               ; load success
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
; Reject user - Remove from request queue
reject_user:                            ; deny request
    call remove_request                 ; drop item
    lea dx, msg_rejected               ; load notice
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
invalid_request:                        ; bad choice
    lea dx, msg_invalid                ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
no_requests:                            ; empty queue
    lea dx, msg_noreq                  ; load notice
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
student_db_full:                        ; table full
    lea dx, msg_full                   ; load error
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu


; ADMIN: View All Students


admin_view_students:                    ; user list
    cmp student_count, 0               ; check empty
    je no_students                     ; handle none
    
    lea dx, hdr_students               ; load header
    call print_string                   ; display it
    call print_newline                  ; format output
    
    mov cl, student_count               ; load total
    xor ch, ch                         ; clean high
    xor si, si                         ; reset index
    
view_students_loop:                     ; display loop
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
    lea bx, student_ids                 ; find table
    add bx, ax                          ; target id
    push si                             ; save slot
    mov cx, 5                           ; set length
print_student_uid:                      ; id loop
    mov dl, [bx]                        ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    inc bx                              ; next char
    loop print_student_uid              ; repeat 5x
    pop si                              ; restore slot
    
    mov cx, 5                           ; load spacing
    call print_spaces                   ; format output
    
    mov ax, si                          ; load index
    mov bx, 30                          ; email size
    mul bx                              ; get offset
    lea bx, student_emails              ; find table
    add bx, ax                          ; target email
    push si                             ; save slot
    mov cx, 30                          ; set length
print_student_email:                    ; email loop
    mov dl, [bx]                        ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    inc bx                              ; next char
    loop print_student_email            ; repeat 30x
    pop si                              ; restore slot
    
    mov cx, 5                           ; load spacing
    call print_spaces                   ; format output
    
    mov ax, si                          ; load index
    mov bx, 10                          ; name size
    mul bx                              ; get offset
    lea bx, student_names               ; find table
    add bx, ax                          ; target name
    push si                             ; save slot
    mov cx, 10                          ; set length
print_student_name:                     ; name loop
    mov dl, [bx]                        ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    inc bx                              ; next char
    loop print_student_name             ; repeat 10x
    pop si                              ; restore slot
    
    mov cx, 5                           ; load spacing
    call print_spaces                   ; format output
    
    lea bx, student_status              ; find table
    add bx, si                          ; current slot
    cmp byte ptr [bx], 1                ; check active
    je print_active_list                ; branch active
    
    mov dl, 'I'                         ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    mov dl, 'n'                         ; load char
    int 21h                             ; system call
    mov dl, 'a'                         ; load char
    int 21h                             ; system call
    mov dl, 'c'                         ; load char
    int 21h                             ; system call
    mov dl, 't'                         ; load char
    int 21h                             ; system call
    mov dl, 'i'                         ; load char
    int 21h                             ; system call
    mov dl, 'v'                         ; load char
    int 21h                             ; system call
    mov dl, 'e'                         ; load char
    int 21h                             ; system call
    jmp next_student_view_list                   ; done inactive_view_list
    
print_active_list:                      ; active logic
    mov dl, 'A'                         ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    mov dl, 'c'                         ; load char
    int 21h                             ; system call
    mov dl, 't'                         ; load char
    int 21h                             ; system call
    mov dl, 'i'                         ; load char
    int 21h                             ; system call
    mov dl, 'v'                         ; load char
    int 21h                             ; system call
    mov dl, 'e'                         ; load char
    int 21h                             ; system call
    mov cx, 2                           ; load padding
    call print_spaces                   ; format output
    
next_student_view_list:                 ; loop bottom
    call print_newline                  ; format output
    
    inc si                              ; next item
    pop cx                              ; restore count
    loop view_students_loop             ; repeat CX
    
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu
    
no_students:                            ; empty list
    lea dx, msg_nostud                 ; load notice
    call print_string                   ; display it
    lea dx, msg_press_enter            ; load prompt
    call print_string                   ; display it
    call wait_for_enter                 ; wait enter
    jmp admin_main                      ; back to menu

; STUDENT MENU
student_main:                           ; student menu
    lea dx, student_menu               ; load menu
    call print_string                   ; display it
    
    call read_char                      ; read choice
    call wait_for_enter                 ; wait enter
    sub al, '0'                         ; convert decimal
    
    cmp al, 1                           ; check view
    je student_view_books               ; branch view
    cmp al, 2                           ; check issue
    je student_issue                    ; branch issue
    cmp al, 3                           ; check return
    je student_return                   ; branch return
    cmp al, 4                           ; check history
    je student_my_books                 ; branch history
    cmp al, 5                           ; check suggest
    je student_suggest                  ; branch suggest
    cmp al, 6                           ; check logout
    je logout                           ; branch logout
    
    jmp student_main                    ; loop menu

; STUDENT: View Available Books
student_view_books:                     ; view library
    lea dx, hdr_books                  ; load header
    call print_string                   ; display it
    call print_newline                  ; format output
    
    mov cl, book_count                  ; load total
    xor ch, ch                         ; clean high
    xor si, si                         ; reset index
    
student_view_loop:                      ; display loop
    push cx                             ; save count
    
    lea bx, book_stock                  ; find table
    add bx, si                          ; current stock
    cmp byte ptr [bx], 0                ; check empty
    je skip_book_view                   ; skip zero
    
    mov ax, si                          ; load index
    inc al                              ; adjust 1-based
    call show_digit                     ; display id
    
    mov cx, 3                           ; load spacing
    call print_spaces                   ; format output
    
    mov ax, si                          ; load index
    mov bx, 15                          ; name size
    mul bx                              ; get offset
    lea bx, book_names                  ; find table
    add bx, ax                          ; target name
    mov cx, 15                          ; set length
print_avail_book_name:                  ; name loop
    mov dl, [bx]                        ; load char
    mov ah, 02h                         ; write char
    int 21h                             ; system call
    inc bx                              ; next char
    loop print_avail_book_name          ; repeat 15x
    
    mov cx, 3                           ; load spacing
    call print_spaces                   ; format output
    
    lea bx, book_stock                  ; find table
    add bx, si                          ; current stock
    mov al, [bx]                        ; load value
    call show_digit                     ; display it
    
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
    
    call log_transaction               ; Log the issue to LOG.CSV for Excel
    
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
    push si                             ; SAVE LOOP INDEX BEFORE OVERWRITE
    
    mov ax, si                         ; index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea di, student_ids                 ; student ID table
    add di, ax                         ; record address
    
    lea si, uid_in                      ; target ID (Overwrites SI)
    push cx                             ; save counter
    mov cx, 5                          ; size
    repe cmpsb                         ; compare
    pop cx                             ; restore counter
    
    pop si                             ; RESTORE LOOP INDEX
    
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
    
    push si                             ; SAVE LOOP INDEX
    
    ; Compare user IDs
    mov ax, si                         ; index
    mov bx, 5                          ; size
    mul bx                             ; offset
    lea di, request_ids                ; request ID table
    add di, ax                         ; record address
    
    lea si, uid_in                      ; target ID (Overwrites SI)
    push cx                             ; save counter
    mov cx, 5                          ; size
    repe cmpsb                         ; compare
    pop cx                             ; restore
    
    pop si                             ; RESTORE LOOP INDEX
    
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
