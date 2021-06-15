.model small

display macro msg 
    mov dx,offset msg
    mov ah,09h
    int 21h
endm

readno macro
    mov ah,01h
    int 21h
    sub al,30h
endm

dispno macro num
    mov al,num
    add al,30h
    mov dl,al
    mov ah,02h
    int 21h
endm 

.data
msg1 db 0ah,0dh,"Enter total number: $"
msg2 db 0ah,0dh,"Enter numbers:$"
msg4 db 0ah,0dh,"Sorted array $"
msg3 db 0ah,0dh," $"
n db ?
arr db 10h dup(?)
.code
start : 
    mov ax,@data
    mov ds,ax
    display msg1
    readno
    mov n,al
    mov cl,n
    mov bl,cl
    mov ch,00
    display msg2
    display msg3
    mov si,offset arr
    read_array :
        readno
        mov [si] , al
        inc si
        display msg3
        loop read_array
    mov cl,n
    display msg4    
    loop1:
        mov ch,cl
        mov si,offset arr
        loop2 :
            mov dl,[si]
            cmp dl,[si+1]
            jnc swapped
            swap:
                mov dl,[si]
                xchg dl,[si+1]
                mov [si],dl
            swapped:
                inc si
                dec ch
                jnz loop2
        dec si     
        display msg3   
        dispno [si]
        dec cl
        jnz loop1
    mov ah,4ch
    int 21h
end

    