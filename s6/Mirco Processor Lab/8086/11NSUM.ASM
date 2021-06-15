.model small

.data
msg db 0ah,0dh,"Enter total number: $"
msg1 db 0ah,0dh,"Enter number $"
msg2 db 0ah,0dh,"Sum is $"
msg3 db 0ah,0dh," $"
arr db 10 dup(?)

.code
mov ax,@data
mov ds,ax
mov dx,offset msg
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
mov cl,al
mov ch,00   
mov bl,cl
mov dx,offset msg1
mov ah,09h
int 21h

mov si,offset arr
read:mov ah,01h
int 21h
sub al,30h
mov [si],al
inc si
mov dx,offset msg3
mov ah,09h
int 21h 
loop read

mov si,offset arr
mov cl,bl
mov al,[si]
Sum:inc si
add al,[si]
loop Sum

mov bl,al
mov dx,offset msg2
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