#!/usr/bin/env python
import socket
nums = '1 9 45 55 99 297 703 999 2223 2728 4879 4950 5050 5292 7272 7777 9999 17344 22222 38962 727329 3127482 7757143'.split(' ')
remote = '10.0.1.41'
port = 9999

def recvuntil(s,c):
    x = ''
    while not x.endswith(c):
        x += s.recv(1)
    return x

csock = socket.socket()
csock.connect((remote,port))
for num in nums:
    csock.send("{}\n".format(num))
    recvuntil(csock,'needful\n')
print(recvuntil(csock,'}'))
