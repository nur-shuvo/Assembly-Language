.model small
.stack 100h

.data
    
    msg1 db '- odd$'    
    msg2 db '- even$'
    msg3 db ' not in range. $' 
    
.code
main proc
    
     
    mov ax, @data
    mov ds, ax
               
        mov ah, 1 ;input a number
        int 21h 
        
        
        cmp al,48
        jl l1;
        
        cmp al,57
        jg l1; 
                 
    
        mov bl, 2 ;divide any number in al by bl or 2 here
        div bl             
    
        cmp ah, 1 ; ah has the remainder
        je odd 
        
         even:
                 
            mov ah, 9
            lea dx, msg2
            int 21h
            jmp exit
            
         odd:
            mov ah, 9
            lea dx, msg1
            int 21h
            jmp exit 
            
        l1:
        lea dx,msg3
        mov ah,9
        int 21h
        jmp exit
             
                   
        exit:
        MOV AH,4CH
        INT 21H
    
main endp
end main