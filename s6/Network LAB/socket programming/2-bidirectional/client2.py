from threading import Thread
import socket
import threading 
c=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
c.connect(('127.0.0.1',14560))
def send():
	while True:
		a=input("Enter message: ")
		b=bytes(a,'utf-8')
		c.send(b)
	c.close()
def recieve():
	while True:
		msg=c.recv(1024) 
		r=msg.decode()
		print("\n")
		print("Message from server : " ,r)
	c.close()
t1=threading.Thread(target=send)
t1.start()
t2=threading.Thread(target=recieve)
t2.start()
