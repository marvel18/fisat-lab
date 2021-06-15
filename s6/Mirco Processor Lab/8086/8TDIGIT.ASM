.model small
.data
msg db 0ah,0dh, "Enter first digit: $"
msg1 db 0ah,0dh,"Enter second digit: $"
msg2 db 0ah,0dh,"Number $"
.code
mov ax,@data
mov ds,ax
mov dx,offset msg
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
mov bl,0ah
mul bl
mov bl,al
mov dx,offset msg1
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
add al,bl
mov bl,0ah
mov ah,00h
div bl
add ah,30h
add al,30h
mov bl,ah
mov dx,offset msg2
mov ah,09h
int 21h
mov dl,al
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
mov ah,4ch
int 21h
end