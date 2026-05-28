hl.on('hyprland.start', function()
	hl.exec_cmd('swaybg -m fill -i ~/pictures/backgrounds/4k_wallpapers_from_reddit/painting.jpg')
	hl.exec_cmd('waybar -s ~/.config/waybar/style_1.css')
	hl.exec_cmd('systemctl --user start hyprpolkitagent')
	hl.exec_cmd('hyprsunset')
	hl.exec_cmd('hypridle')
	hl.exec_cmd('udiskie') -- automount devices
	hl.exec_cmd('wl-paste --type text --watch cliphist store') -- stores only text in clipboard
	hl.exec_cmd('wl-paste --type image --watch cliphist store') -- stores only images in clipboards
end)

hl.on('hyprland.shutdown', function()
	hl.exec_cmd('hyprshutdown -t "shutting down..." --post-cmd "shutdown -P 0"')
end)

