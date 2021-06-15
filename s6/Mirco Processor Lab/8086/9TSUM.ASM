.model small
.data
msg1 db 0ah,0dh,"enter first number $"
msg2 db 0ah,0dh,"enter second number $"
msg3 db 0ah,0dh,"sum  $"
a db ?
.code
mov ax,@data
mov ds,ax
mov dx, offset msg1
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
mov bl,0ah
mul bl
mov bl,al
mov ah,01h
int 21h
sub al,30h
add bl,al
mov a,bl
mov dx, offset msg2
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
mov bl,0ah
mul bl
mov bl,al
mov ah,01h
int 21h
sub al,30h
add bl,al
mov al,a
add al,bl
mov dx, offset msg3
mov ah,09h
int 21h
mov ah,00h
mov bl,0ah
div bl
add al,30h
add ah,30h
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