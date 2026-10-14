hl.on('hyprland.start', function()
	hl.exec_cmd('swaybg -m fill -i ~/pictures/backgrounds/myriad_color_skies.png')
	hl.exec_cmd('waybar')
	hl.exec_cmd('systemctl --user start hyprpolkitagent')
	hl.exec_cmd('hyprsunset')
	hl.exec_cmd('hypridle')
	hl.exec_cmd('udiskie')                                      -- automount devices
	hl.exec_cmd('wl-paste --type text --watch cliphist store')  -- stores only text in clipboard
	hl.exec_cmd('wl-paste --type image --watch cliphist store') -- stores only images in clipboards
end)

hl.on('config.reloaded', function ()
	hl.exec_cmd('killall -SIGUSR2 waybar')
end)

hl.on('monitor.added',   function() hl.notification.create({ text = 'Monitor Added',   font_size = 16, timeout = 3000 }) end)
hl.on('monitor.removed', function() hl.notification.create({ text = 'Monitor Removed', font_size = 16, timeout = 3000 }) end)
