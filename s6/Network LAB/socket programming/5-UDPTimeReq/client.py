from threading import Thread
import socket
import threading 
s=socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
addr = ('127.0.0.1',14562)
try:
	while True:
		msg=input("Press Enter to send Time request")
		s.sendto(msg.encode("utf-8") , addr)
		if(msg == "exit"):
			break
		msg,addr=s.recvfrom(1024) 
		print("\n")
		print("Message from {}: ".format(addr) ,msg.decode("utf-8"))
except:
    print("\nexiting.....")