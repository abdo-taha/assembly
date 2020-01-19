mov bx,0
bgn:
mov ah,01
int 21h

cmp al,'#'
jz fn 

cmp al,bl
ja change


jmp bgn

change:
    mov bl,al
jmp bgn

fn: 
    mov ah,02h
    mov dl , 10 
    
    int 21h 
    mov dl ,13
    
    int 21h
    mov dl , bl 
    
    int 21h 
    
    hlt

