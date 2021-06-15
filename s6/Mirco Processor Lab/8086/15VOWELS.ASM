.model small
display macro msg 
    mov dx,offset msg
    mov ah,09h
    int 21h
endm

read macro
    mov ah,01h
    int 21h
endm

dispno macro num
    mov al,num
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h
endm 
.data
msg1 db 0ah,0dh,"Enter string:$"
msg2 db 0ah,0dh,"No of vowels $"
vow db "aeiouAEIOU$"
arr db 20h dup(?)
count db 0h
.code
start : 
    mov ax,@data
    mov ds,ax
    mov cl,00
    mov ch,00
    display msg1
    mov si,offset arr
    read_array :
        read
        cmp al,0dh
        jz loop1
        mov [si] , al
        inc si
        inc cl
        jmp read_array
    loop1:
        dec si
        mov di,offset vow
        mov ch,0ah
        loop2:
            mov bl,[si]
            cmp bl,[di]
            jne next
            inc count
            jmp endloop   
            next:
                inc di
                dec ch
                jnz loop2
        endloop:
            dec cl
            jnz loop1
    display msg2    
    dispno count    
    mov ah,4ch
    int 21h
end                