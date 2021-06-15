from threading import Thread
import socket
import threading 
import time
s=socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
addr = ('127.0.0.1',14562)
s.bind(addr)
try:
	while True:
		msg,addr=s.recvfrom(1024) 
		print("\n")
		print("Time Request  from {}".format(addr) )
		msg=str(time.asctime())
		s.sendto(msg.encode("utf-8") , addr)
		if(msg == "exit"):
			break
except:
    print("\nexiting...")