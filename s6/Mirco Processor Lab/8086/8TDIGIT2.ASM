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
msg db 0ah,0dh,"Enter number: $"
msg1 db 0ah,0dh,"Enterd number is $"


.code
mov ax,@data
mov ds,ax
display msg
read
mov bl,0ah
mul bl
mov bl,al
read
add al,bl 
display msg1
dispno
mov ah,4ch
int 21h
end

