import socket 
import threading 

PORT = 12345
SERVER = socket.gethostbyname("")
FORMAT = 'utf-8'
DISCONNECT_MESSAGE = "quit"
ListOfClient = []

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((SERVER, PORT))

def handle_client(conn, addr):
    print("[NEW CONNECTION]{} connected".format(addr))
    name = conn.recv(1024).decode(FORMAT)
    connected = True 
    while connected:
        try:
            msg = conn.recv(1024).decode(FORMAT)
            if(msg):
                if msg == DISCONNECT_MESSAGE:
                    ListOfClient.remove(conn)
                    msg = "{} user disconnected".format(name)
                    connected = False
                message = "<{} , {} > : {}".format(addr[0],name,msg)    
                for client in ListOfClient:
                    if client == conn:
                        continue
                    client.send(message.encode(FORMAT))
                print(message)
        except :
            continue    
        
    conn.close()



def start():
    server.listen()
    print("[LISTENING] Server is listing to {}".format(SERVER))
    while True:
        conn, addr = server.accept()
        ListOfClient.append(conn)
        thread = threading.Thread(target=handle_client, args=(conn, addr))
        thread.start()
        print("[ACTIVE CONNECTIONS]...{}".format(threading.activeCount() - 1))


print("[STARTING] server is starting...")
start()
