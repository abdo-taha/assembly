.STACK 
.DATA
 
S1 DB 0AH,0DH, 'ENTER TWO DIDGIT NUMBER : $' 
S2 DB 0AH,0DH, 'RESULT IS : $'    
.CODE

    MOV AX, @DATA
    MOV DS , AX
    
    ;;;;;;;;;;;;
    MOV AH ,09H
    INT 21H
    ;;;;;;;;;;
    MOV AH , 01H
    INT 21H
    ;;;;;;;;
    SUB AL , 30H
    MOV BH, AL
    ;;;;;;;;;            
    
    MOV AH , 01H
    INT 21H
    ;;;;;;;;;;
    SUB AL,30H
    MOV BL , AL
    ;;;;;;;;; 
    
    ;MOV DL, 10
    ;MOV AH, 02H
    ;INT 21H
    ;;;;;;;;
    
    LEA DX, S1
    MOV AH ,09H
    INT 21H
    ;;;;;;;;;;
    MOV AH , 01H
    INT 21H
    ;;;;;;;;
    SUB AL , 30H
    MOV CH, AL
    ;;;;;;;;;            
    
    MOV AH , 01H
    INT 21H
    ;;;;;;;;;;
    SUB AL,30H
    MOV CL , AL
    ;;;;;;;;; 
    
   ; MOV DL, 10
    ;MOV AH, 02H
    ;INT 21H
    ;;;;;;;;
    
    ADD BL , CL
    MOV AL , BL
    MOV AH , 0H
    AAA
    
    MOV CL , AL
    MOV BL, AH
    
    
    ADD BL , BH
    ADD BL , CH
    
    MOV AL , BL
    MOV AH , 0H
    AAA
    
    MOV BX , AX
    
    ADD BH , 30H
    ADD BL , 30H
    ADD CL , 30H
    
    LEA DX , S2
    MOV AH , 09H
    INT 21H
    
    
    MOV DL , BH
    MOV AH , 02H
    INT 21H 
    MOV DL , BL
    INT 21H
    MOV DL, CL
    INT 21H
    










HLT