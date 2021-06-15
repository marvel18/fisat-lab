.model small
.data
msg db 0ah,0dh,"Enter first no: $"
msg1 db 0ah,0dh,"Enter second no: $"
msg2 db 0ah,0dh,"Difference= $"
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
sub bl,al
mov dx,offset msg2
mov ah,09h
int 21h
add bl,30h
mov dl,bl
mov ah,02h
int 21h
mov ah,4ch
int 21h
end
