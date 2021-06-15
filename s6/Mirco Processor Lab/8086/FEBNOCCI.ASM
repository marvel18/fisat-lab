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
add al,30h
mov dl,al
mov ah,02h
int 21h
sub al,30h
endm

.data
msg1 db 0ah,0dh,"Enter n: $"
msg2 db 0ah,0dh,"febnocci series ",0ah,0dh,"$"
msg3 db " $"
f db ?
.code
mov ax,@data
mov ds,ax
display msg1
read
mov cl,al
mov al,00h
mov bl,01h
display msg2
feb:
    dispno
    display msg3
    mov f,al
    mov al,bl
    mov bl,f
    add al,bl
    loop feb
mov ah,4ch
int 21h
end