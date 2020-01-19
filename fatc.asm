.stack
.data

enter db 10,13,'enter number < 9 $'
result db 10,13,'result is in bx$'
ov db 10,13,'overflow$' 
.code
 
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    int 21h
    
    
    
    mov ah , 01h
    int 21h 
    
    mov cl , al 
    sub cl ,30h
    mov ch,0
    mov ax , 1 
    
    
    
fact:

    mul cx
    jo over
    loop fact 
    
    mov bx , ax
    
    
    lea dx,result
    mov ah,09h
    int 21h
    jmp end
    
    
over:
    lea dx,ov
    mov ah,09h
    int 21h 
    jmp end
       

end:

hlt
         