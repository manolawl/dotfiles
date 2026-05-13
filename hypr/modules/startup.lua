-- STARTUP
hl.on("hyprland.start", function()
	hl.exec_cmd("~/.config/scripts/walls_shuffler.sh")
	hl.exec_cmd("waybar")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("udiskie") -- automount devices
	hl.exec_cmd("wl-paste --type text --watch cliphist store") -- stores only text in clipboard
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- stores only images in clipboards
end)
