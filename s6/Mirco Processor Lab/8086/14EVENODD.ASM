.model small

display macro msg 
    mov dx,offset msg
    mov ah,09h
    int 21h
endm

readno macro
    mov ah,01h
    int 21h
    sub al,30h
endm
.data
msg1 db 0ah,0dh,"Enter a Number: $"
msg2 db 0ah,0dh,"Even$"
msg3 db 0ah,0dh,"Odd$"
arr db 10h dup(?)
.code
start : 
    mov ax,@data
    mov ds,ax
    display msg1
    readno
    mov bl,0ah
    mul bl
    mov bl,al
    readno
    add al,bl 
    mov bl,02h
    div bl
    cmp ah,01h
    jz odd
    display msg2
    jmp exit
odd:
    display msg3
exit:
    mov ah,4ch
    int 21h
end                 
