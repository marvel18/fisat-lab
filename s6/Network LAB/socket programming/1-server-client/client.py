import socket
while True:
	c = socket.socket(socket.AF_INET,socket.SOCK_STREAM)  
	c.connect(('0.0.0.0',1234)) 
	data=c.recv(1024) 
	d=data.decode('utf-8')
	print(d)
	c.close()
