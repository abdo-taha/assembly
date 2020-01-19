.STACK
.DATA 

num db 10,13,'00000$';will use it to print decimal 

msg db 10,13,'enter number from 1 to 25 $'

.CODE 
      
    mov bx , @data  ;to print from data
    mov ds,bx
begin: 
   
    
    mov ah,09h
    lea dx,msg
    int 21h
    
    
    MOV AH,01H  ;take high digit
    INT 21H
    
    MOV BH,AL
    
    INT 21H
    MOV BL,AL  ;take low digit
    
    
    SUB BL,30H   ;to decimal
    SUB BH,30H   ;to decimal
    
    MOV AX,10    ;multiply high digit * 10
    MUL BH
    ADD AL,BL    ; then add low digit
    
    
    
    
    
    
    CMP AX,25    ;check what we will do 
    JG GRE       ;
                 ;
    CMP AX,0     ;
    JL LESS      ;
                 ;
    CMP AX,0     ;
    JE ZERO
    
    ;we save the number to print in ax 
    ;and the next in bx
    ;every time we add ax and bx into dx
    ;then we print ax
    ;move bx to ax
    ;move dx to bx
    ; and repeat cx times cx = the numer
      
    MOV CX,AX ; the number we entered   
     
    MOV AX,0
    MOV BX,1
  X:
    call pr  ; function to print the number it is down go read it
    
    
    MOV DX,AX
    ADD DX,BX
    MOV AX,BX
    MOV BX,DX
    LOOP X 
    
    
    
    jmp fn  ; end 
        
   
    ZERO:
    
    jmp fn
    
    GRE:
     
    
    
    LESS: 
   ; mov ah,09h
   ; lea dx,msg
   ; int 21h
    
    jmp begin
    
    ;JMP AA
            

pr proc
    pusha ; we save registers in stack  because we will use them
    
    
    ;mov bx , @data  ;to print from data
    ;mov ds,bx  
    
    
    mov bx,6 ; the last digit of num
    mov cx,10  
    
    ;we divie by 10 every time 
    ;the reminder is the smallest digit
    ;we save it 
    ; if the number is smaller than 10 we print it and finsh 
    
    
    ;; while dividing anumber 546 this is the remainder every time 6 --> 4 ---> 5
    ; so we save the smallest digit until we get large digit
    
 xx:cmp ax,cx ; check if smaller than 10
    
    jb en  ;jmp if below
    
    mov dx,0      
    
    div cx ; divide / 10
    add dl,30h    ;the reminder is in dx we add 30h to make it ascci
    mov num[bx] , dl ; put the digit in its place
    sub bx , 1       ;we move to a higher digit 
    jmp xx
    
    
    
    
    
    
    en:  
    ;if smaller we print the biggest digit
    add al, 30h
    mov num[bx],al
    ;we print num froom data
    mov ah,09h
    lea dx,num
    
    int 21h  
    
    
    popa   ; restore registers
    ret
pr endp  

fn:


