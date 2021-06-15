.model small
display macro msg 
    mov dx,offset msg
    mov ah,09h
    int 21h
endm

readno macro
    mov ah,01h
    int 21h
endm

disp macro c
    mov al,c
    mov dl,al
    mov ah,02h
    int 21h
endm 
.data
msg2 db 0ah,0dh,"Enter string:$"
msg4 db 0ah,0dh,"Palindrome$"
msg3 db 0ah,0dh," Not a Palindrome $"

arr db 10h dup(?)
.code
start : 
    mov ax,@data
    mov ds,ax
    mov cl,00
    mov ch,00
    display msg2
    mov si,offset arr
    mov di,offset arr
    read_array :
        readno
        cmp al,0dh
        jz loop1
        mov [si] , al
        inc si
        inc cl
        jmp read_array
    loop1:
        dec si
        mov bl,[si]
        cmp [di],bl
        jnz nopalin
        inc di
        loop loop1
    display msg4
    jmp exit
nopalin:
    display msg3
exit:
    mov ah,4ch
    int 21h            
end    