.STACK 
.DATA
 
S1 DB 0AH,0DH, 'ENTER TWO DIDGIT NUMBER : $' 
S2 DB 0AH,0DH, 'RESULT IS : $'    
.CODE
    
    ;read adding one digit file first
    
    MOV AX, @DATA
    MOV DS , AX
    
    ;print s1
    MOV AH ,09H
    INT 21H
    
    
    
    
    ;take input
    ;the higher digit
    
    MOV AH , 01H
    INT 21H
    SUB AL , 30H
    MOV BH, AL
    
    
    
    
    ;the second digit           
    
    MOV AH , 01H
    INT 21H
    SUB AL,30H
    MOV BL , AL 
    
    ;now the first number is in bx bh:bl
    
    
    ;print s1 again 
    
    LEA DX, S1
    MOV AH ,09H
    INT 21H 
    
    
    ; take second number and sace it in cx
    MOV AH , 01H
    INT 21H
    
    SUB AL , 30H
    MOV CH, AL
              
    
    MOV AH , 01H
    INT 21H
   
    SUB AL,30H
    MOV CL , AL
    
    
    
    ; the ans will be 3 digits
    
    ; add firstdigit
    ; use aaa to make it two digits  
    ADD BL , CL
    MOV AL , BL
    MOV AH , 0H
    AAA
    
    ;move to dx
    ; the first digit of ans in dl
    ; the carry in dh
    MOV DX , AX
    
    ; add the carry and the high digits of the two numbers in dh
    ADD DH , BH
    ADD DH , CH
    
    
    ;move to ax and convert to two digits
     
    MOV AL , DH
    MOV AH , 0H
    AAA
    
    ; save to bx (the higher 2 digits in ans)
    ; move the lowest digit from dl
    ; because we will use dl
    
    MOV BX , AX 
    MOV CL , DL
    
    ; add 30h to make them ascii again
    
    ADD BH , 30H
    ADD BL , 30H
    ADD CL , 30H
    
    

    
    ; print s2
    LEA DX , S2
    MOV AH , 09H
    INT 21H
    
    ; print bh then bl then cl
    MOV DL , BH
    MOV AH , 02H
    INT 21H
     
    MOV DL , BL
    INT 21H
    
    MOV DL, CL
    INT 21H
    










HLT