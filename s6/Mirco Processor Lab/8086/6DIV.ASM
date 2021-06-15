    .model small
    .data
    msg db 0ah,0dh,"Enter Divisor: $"
    msg1 db 0ah,0dh,"Enter Dividend: $"
    msg2 db 0ah,0dh,"quotient: $"
    quotient db ?
    .code
    mov ax,@data
    mov ds,ax
    mov dx,offset msg
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al
    mov dx,offset msg1
    mov ah,09h
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov ah,00h
    div bl
    mov quotient,al
    mov dx,offset msg2
    mov ah,09h
    int 21h
    add quotient,30h
    mov dl,quotient
    mov ah,02h
    int 21h
    mov ah,4ch
    int 21h
    end
