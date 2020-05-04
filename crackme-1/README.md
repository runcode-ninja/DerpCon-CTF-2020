# RunCodeWeb

## Name: crackme-1

### Category: Reversing

### Message:
```
Use/Create your account at <a target="_new" href="https://derp.runcode.ninja">Derp Runcode</a>.<br>
RE this binary, then do the needful on port 9999 of your instance. Download the binary <a href="https://derp.runcode.ninja/downloads/crackme-1">here</a>
<br><br>
<a href="https://twitter.com/ohai_ninja" target="_blank">author: @ohai_ninja</a>
```

### Value: 60

### Max Attempts: 0

### Flag: 
```
derp{K4preKar_w4s_teh_D0p3sT_h3_l0v3s_scanf}
```

### Files:
[docker](crackme-1)

### Solution:
```
kaprekar numbers up to 7757143. binary gives no visible output on successful numbers so is only brute forceable with some ida (or whatever) scripting (or potentially abusing the 'you already said that' functionality). Solution in files/
```
