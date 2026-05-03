-- PERMISSIONS
hl.config({
	ecosystem = { enforce_permissions = true },
})
hl.permission({ binary = "usr/sbin/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "usr/sbin/slurp", type = "screencopy", mode = "allow" })
hl.permission({ binary = "usr/sbin/hyprpicker", type = "screencopy", mode = "allow" })
hl.permission({ binary = "usr/(lib|libexec|lib64)/", type = "screencopy", mode = "allow" })
