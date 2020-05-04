#!/usr/bin/env python3
import base64
import binascii
import hashlib
import os
import time

import random as rand

from Crypto import Random
from Crypto.Cipher import AES
from twisted.internet import reactor
from twisted.internet.protocol import Protocol, Factory


BLOCK_SIZE=16

secret_message = os.environ.get('CHALL_FLAG','RCN{DEMO_FLAG1234567890}')

port = int(os.environ.get('APP_PORT',8000))

secret_key = Random.new().read(BLOCK_SIZE)


def encrypt(message, passphrase):
    if not type(message) == bytes:
        message = message.encode('latin1')

    passphrase = trans(passphrase)
    if (len(message) % BLOCK_SIZE) != 0:
        length = BLOCK_SIZE - (len(message) % BLOCK_SIZE)
        message += b'0'*length
    aes = AES.new(passphrase, AES.MODE_ECB)
    return binascii.hexlify(aes.encrypt(message)).decode('utf-8')

def prep_message(s):
    if type(s) == bytes:
        return s
    else:
        return s.encode('latin1')

header = b"""
    ___  ____ ___        ___    ___.                         __          ___.   .__          
   /  / |    |   \____   \  \   \_ |_________   ____ _____  |  | _______ \_ |__ |  |   ____  
  /  /  |    |   /    \   \  \   | __ \_  __ \_/ __ \\__   \ |  |/ /\__  \ | __ \|  | _/ __ \ 
 (  (   |    |  /   |  \   )  )  | \_\ \  | \/\  ___/ / __ \|    <  / __ \| \_\ \  |_\  ___/ 
  \  \  |______/|___|  /  /  /   |___  /__|    \___  >____  /__|_ \(____  /___  /____/\___  >
   \__\              \/  /__/        \/            \/     \/     \/     \/    \/          \/ 
___________                                   __  .__                                        
\_   _____/ ____   ___________ ___.__._______/  |_|__| ____   ____                           
 |    __)_ /    \_/ ___\_  __ <   |  |\____ \   __\  |/  _ \ /    \                          
 |        \   |  \  \___|  | \/\___  ||  |_> >  | |  (  <_> )   |  \                         
/_______  /___|  /\___  >__|   / ____||   __/|__| |__|\____/|___|  /                         
        \/     \/     \/       \/     |__|                       \/     
I will take your message, add the flag to it, and give you the encrypted text back.
It's encrypted so you will never be able to get just the flag!!!
What do you want to encrypt?
"""

class Socket(Protocol):
    def connectionMade(self):
        self.transport.write(header)

    def dataReceived(self,data):
        data = data.decode('latin1').strip()
        msg = prep_message('Encrypted: {0}\n'.format(\
                                                    encrypt(data+secret_message,
                                                            secret_key
                                                            )
                                                    )
                            )
        self.transport.write(msg)
        self.transport.write(b"What do you want to encrypt?\n")

def main():
    f = Factory()
    f.protocol = Socket
    reactor.listenTCP(port, f)
    reactor.run()

if __name__ == '__main__':
    main()
