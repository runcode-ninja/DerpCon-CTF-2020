# RunCodeWeb

## Name: SecureMessage

### Category: Web

### Message:
```
Use/Create your account at <a target="_new" href="https://derp.runcode.ninja">Derp Runcode</a>.<br>
Acquire the admin account.
<br><br>
<a href="https://twitter.com/ohai_ninja" target="_blank">author: @ohai_ninja</a>
```

### Value: 25

### Max Attempts: 0

### Flag: 
```
derp{silly_fixes_are_silly_sadface_dot_jpg}
```

### Files:
[docker](xss-site-3)
### Solution:
```
send a message to the admin, subjet is xss. backend replaces <script> with '', so <<script>script> XSS GOES HERE...
```

