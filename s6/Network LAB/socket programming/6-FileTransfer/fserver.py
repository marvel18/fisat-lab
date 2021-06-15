import socket
import os
import threading


IP_ADDR = '127.0.0.1'
PORT  = 2358
SERVER = (IP_ADDR,PORT)

def sendfile(conn,addr):
    while True:
        fname  = conn.recv(1024).decode() 
        if fname=='exit':
            print("Client {} exited".format(addr))
            listofclients.remove(conn)
            if listofclients == []:
                print("All clients exited")
                print("\nEnd of Communication\n")
                return
            break
        else:
            try:
                fp = open(fname,'r')
                f_content = fp.read()
                conn.send(f_content.encode())
                print("File {} sent to client{}".format(fname,addr))
            except:
                print("File {} not Found".format(fname))
                conn.send("NotFound".encode())
            
s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.bind(SERVER)
print("Binding successful")
s.listen(4)
print("Socket is listening")

listofclients = []
try:
    while True:
        conn,addr = s.accept()
        listofclients.append(conn)
        print("Connected to client",addr)
        t1 = threading.Thread(target=sendfile,args=(conn,addr))
        t1.start()
except:
    s.close()
    print("\nEnd of Communication\n")
    exit()