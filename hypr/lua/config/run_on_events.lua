hl.on('hyprland.start', function()
	hl.exec_cmd('swaybg -m fill -i ~/pictures/backgrounds/4k_wallpapers_from_reddit/Black_Forest_Germany.jpg')
	hl.exec_cmd('waybar')
	hl.exec_cmd('systemctl --user start hyprpolkitagent')
	hl.exec_cmd('hyprsunset')
	hl.exec_cmd('hypridle')
	hl.exec_cmd('udiskie') -- automount devices
	hl.exec_cmd('wl-paste --type text --watch cliphist store') -- stores only text in clipboard
	hl.exec_cmd('wl-paste --type image --watch cliphist store') -- stores only images in clipboards
end)

hl.on('config.reloaded', function()
	hl.exec_cmd('notify-send reloaded!')
end)
