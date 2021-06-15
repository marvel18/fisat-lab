import os

r,w = os.pipe()
pid = os.fork()
if pid>0:
    os.close(w)
    fd = os.fdopen(r,'r')
    str = fd.read()
    print("\nViewing Message..")
    print(str)
else: 
    os.close(r)
    fd = os.fdopen(w,'w')
    msg = input("Enter the message : ")
    fd.write(msg)
    print("Message Written")    
    