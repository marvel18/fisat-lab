from threading import Thread
import socket
import threading

s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
print('Socket created successfully!')
s.bind(('127.0.0.1',14560))
print("binding is over")
s.listen(4)
print("listening is over")
conn,addr=s.accept()
def send():
	while True:
		a=input("Enter message:")
		b=bytes(a,'utf-8')
		conn.send(b)
	s.close()
def recieve():
	while True:
		msg=conn.recv(1024) 
		recieved=msg.decode()
		print("\n")
		print("Message from client is : ",recieved)
	
	s.close()

t1=threading.Thread(target=send)
t1.start()
t2=threading.Thread(target=recieve)
t2.start()
