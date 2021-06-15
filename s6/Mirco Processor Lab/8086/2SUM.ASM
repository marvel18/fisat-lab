.model small
.data
.code
mov ax,@data
mov ds,ax
mov al,05h
mov bl,02h
add al,bl
add al,30h
mov dl,al
mov ah,02h
int 21h
mov ah,4ch
int 21h
end
