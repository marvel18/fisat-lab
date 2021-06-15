import threading
import socket

IP_ADDR = '127.0.0.1'
PORT  = 2358
SERVER = (IP_ADDR,PORT)

c = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
c.connect(SERVER)

try:    
    while True:
        fname =str(input("Enter the filename or exit : "))
        c.send(fname.encode()) 
        if(fname=="exit"):
            c.close()
            break
        else:
            data = c.recv(1024).decode()
            if(data=="NotFound"):
                print("\nMessage from server"+str(SERVER)+"File Not Found")
            else:        
                print("\nMessage from server"+str(SERVER)+":\n")
                print("\n",data)
except:
        print("\nConnection closed")
        c.send("exit".encode())
        c.close()