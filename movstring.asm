.stack
.data
s1 db 10,13,'hi$'
s2 db 10,13,'oooook$'
.code

    mov ax , @data
    mov ds , ax
    mov es , ax
    
    mov ah , 09h
    int 21h
    lea dx , s2
    int 21h
    
    
    
    
    
    
    
    lea si , s1
    lea di , s2
                
    mov cx , 4
    
 m: ;lodsb
    ;stosb
    movsb
    loop m
    
    mov ah , 09h 
    lea dx, s1
    int 21h   
    lea dx,s2
    int 21h
     