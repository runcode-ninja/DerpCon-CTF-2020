# RunCodeWeb

## Name: pwn-1

### Category: Pwn

### Message:
```
Use/Create your account at <a target="_new" href="https://derp.runcode.ninja">Derp Runcode</a>.<br>
The babiest of pwns. Port 9999 of your instance. Download the binary <a href="https://derp.runcode.ninja/downloads/pwn-1">here</a>
<br><br>
<a href="https://twitter.com/ohai_ninja" target="_blank">author: @ohai_ninja</a>
```

### Value: 20

### Max Attempts: 0

### Flag: 
```
derp{HOW_IS_BABBY_FORMED_babypwn}
```

### Files:
[docker](pwn1)

### Solution:
```
format string vuln. echo '%34$s' | nc 10.0.16.31 9999 ## gets secret word. Of note, the word can be bruteforced as well, but it'll take a hot minute as it uses american-english dictionary and sits in the T's. The word is "supposed" to be random, but it is not tho it will differ from their local run if the dictionary is different than the server. Can add the server side dictionary later if this causes too much troubles.
```
