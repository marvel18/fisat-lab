.model small
.data
msg db 0ah,0dh,"Enter Charecter $ "
msg1 db 0ah,0dh,"charecter is $"
.code
mov ax,@data
mov ds,ax
mov dx,offset msg
mov ah,09h
int 21h
mov ah,01h
int 21h
mov bl,al
mov dx,offset msg1
mov ah,09h
int 21h
mov dl,bl
mov ah,02h
int 21h
mov ah,4ch
int 21h
end
