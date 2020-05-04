#!/usr/bin/env python2
# this should demo the intended solve
from __future__ import print_function
import sys
import re
import socket
import string
from collections import Counter
blocksize = 16
padding_char = '0'
flag = ''

def r_u(sock,what): #recv_until()
    data = ''
    while what not in data:
        data += sock.recv(1024)
    return data

def get_blocks(enc):
    return re.findall(".{32}",enc)

HOST = 'localhost'
PORT = 8000

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))
r_u(s,'?') # get banner


nc = []
p_size = 0
cbs = 0
cbe = 0

def create_blocks(msg,psize):
    payload = (('A'*(blocksize-len(msg)))+msg)[-blocksize:]
    payload += 'A'*(psize-len(msg) )
    return payload

for i in range(128,2048):
    s.sendall('A'*i)
    b = r_u(s,'?').split('\n')[0].split()[1]
    blocks = get_blocks(b)
    
    n = Counter(blocks).most_common(1)
    if n[0][1] >= 8:
        if cbe > cbs and blocks[cbs] == blocks[cbe+1]:
            p_size = i
            print('Using payload size: {0}'.format(i))
            break
        
        fb = n[0][0]
        cbs = blocks.index(fb)
        cbe = len(blocks)-1-blocks[::-1].index(fb)
cbe += 2
while not flag.endswith('}'):
    for guess in string.ascii_letters+string.digits+string.punctuation:
        payload = flag
        payload += guess
        payload = create_blocks(payload,p_size)

        s.sendall(payload)
        b = r_u(s,'?').split('\n')[0].split()[1]
        blocks = get_blocks(b)
        
        print(('A'*16 + flag+guess)[-16:], end='\r')
        sys.stdout.flush()
        if blocks[cbs] == blocks[cbe]:
            flag += guess
        

print(flag)
