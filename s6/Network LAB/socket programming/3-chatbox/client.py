from threading import Event, Thread 
import socket


server_name = "127.0.0.1"
SERVER = socket.gethostbyname(server_name)

PORT  = 12345

FORMAT = 'utf-8'
DISCONNECT_MESSAGE = "quit"

print("Connecting to {} port {}".format(SERVER,PORT))
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try : 
    sock.connect((SERVER,PORT))
    print("Connected")
    sock.send(input("username : ").encode(FORMAT))
except :
    print("connection refused")
    exit(0)    
close = Event()
def receive():
    while not close.is_set():
        try : 
            message = sock.recv(1024).decode(FORMAT) 
            print('\n' + message) 
            print('\n<YOU>:',end='')
        except :
            continue    
    sock.close()    
def send():
    while True:
        message = input('<YOU>:')
        sock.send(message.encode(FORMAT))
        if(message == DISCONNECT_MESSAGE):
            close.set()
            break
t1 = Thread(target = send)
t2 = Thread(target = receive)
t1.start()
t2.start()

    