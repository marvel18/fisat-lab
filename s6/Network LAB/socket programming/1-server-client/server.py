import socket
s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)         
print ("Socket successfully created")           
s.bind(('0.0.0.0',1234))         
print ("socket binded") 
s.listen(3) 		    
print ("socket listening")            
while True:
	c,addr=s.accept()     
	msg=input("Enter the message: ")
	a=msg.encode('utf-8')
	if(msg=="end"):
		break;
	c.send(a)
c.close()
