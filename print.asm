  
.stack  ; you have to write it 
.DATA  

; add $ at end 

STRING DB 'This is a sample string  $'  
S1 DB 'HELLO WORLD  $'
S2 DB 'HI  $'


  
.CODE  

 ; move adress of data to data segment
 MOV AX,@DATA  
 MOV DS,AX   
  
  
  
  
 ; to print string here it will start from begining (string)
 MOV AH,09H 
 INT 21H
  
  
 ; moves the offset to s2 to print s2 not s1 
 LEA DX , S2  ; if delete it will print s1 
 
 ; you can use (mov dx , offset s2) 
   
  MOV AH,09H 
 INT 21H
  


hlt




