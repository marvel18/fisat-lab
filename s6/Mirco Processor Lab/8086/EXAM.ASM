.model small
.data
msg1 db 0ah,0dh,"Enter n: $"
msg2 db 0ah,0dh,"Sum :$"
sum db ?
.code
mov ax,@data
mov ds,ax
mov dx,offset msg1
mov ah,09h
int 21h 
mov ah,01h
int 21h 
sub al,30h
mov cl,al
mov sum,00h
square:
    mov al,cl
    mov bl,al
    mul bl
    add al,sum
    mov sum,al
    loop square
mov dx,offset msg2
mov ah,09h
int 21h 
mov al,sum  
mov bl,0ah
mov ah,00h
div bl
add ah,30h
add al,30h
mov bl,ah
mov dl,al
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
mov ah,4ch
int 21h
end