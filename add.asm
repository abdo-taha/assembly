.STACK
.DATA

; 10 , 13 to print new line check ascii codes in program

S1 DB 10,13,'ENTER NUMBER : $'
S2 DB 10,13,'RESULT IS : $'

.CODE
    
    ; printing string -->check string printing code 
    MOV AX , @DATA
    MOV DS , AX
    
    
    LEA DX , S1
    MOV AH , 09H
    INT 21H
    
    
    ;; take input one digit
    MOV AH ,01H
    INT 21H
    
    ; input is in al
    MOV BL , AL 
    ; input is saved as ascii so we subtract 30h the ascii of 0 or 48 decimal
    ; saved in bl
    SUB BL , 30H
    
    ;; print string s1 again
    LEA DX , S1
    MOV AH , 09H
    INT 21H
    
    ; take input
    MOV AH ,01H
    INT 21H 
    
    ; save to cl
    MOV CL , AL
    SUB CL , 30H 
    
    ; add and save in bl
    ADD BL , CL
    
    
    ; aaa ascii adjust after addition 
    ; if the number in al greater than 9 will convert it to two digit ah:al  
    ; ex: al -> 11 -> (0b H) it will be  ah = 1 and al = 1 
    MOV AX , BX
    AAA
    
    MOV BX , AX
    
    
    
    ; print string s2
    
    MOV AH , 09H
    INT 21H
    
    
    ;to print digit move its ascii to dl and put ah = 02h
    ; we print high digit first
    ; we add 30h to make the digit ascii again
    MOV DL , BH
    ADD DL , 30H
    MOV AH , 02H
    INT 21H
    ; print lower digit
    
    MOV DL,BL
    ADD DL, 30H
    MOV AH,02H
    INT 21H



HLT
  