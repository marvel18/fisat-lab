.model small

display macro msg
mov dx,offset msg
mov ah,09h
int 21h 
endm

read macro
mov ah,01h
int 21h 
sub al,30h
endm

dispno macro
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
endm

.data
msg1 db 0ah,0dh,"Enter n: $"
msg2 db 0ah,0dh,"factorial : $"
f db ?
.code
mov ax,@data
mov ds,ax
display msg1
read
mov cl,al
mov bl,01h
fact:
    mov al,cl
    mul bl
    mov bl,al
    loop fact
display msg2
mov al,bl
dispno 
mov ah,4ch
int 21h
end