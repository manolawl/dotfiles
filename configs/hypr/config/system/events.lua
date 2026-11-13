hl.on('hyprland.start', function()
	hl.exec_cmd('swaybg -m fill -i ~/pictures/backgrounds/background.png')
	hl.exec_cmd('waybar')
	hl.exec_cmd('systemctl --user start hyprpolkitagent')
	hl.exec_cmd('hyprsunset')
	--hl.exec_cmd('udiskie')                                      -- automount devices
	hl.exec_cmd('wl-paste --type text --watch cliphist store')  -- stores only text in clipboard
	hl.exec_cmd('wl-paste --type image --watch cliphist store') -- stores only images in clipboards
end)

hl.on('config.reloaded', function ()
	hl.exec_cmd('killall -SIGUSR2 waybar')
	hl.exec_cmd('hyprsunset')
	hl.exec_cmd('pkill swaybg; swaybg -m fill -i ~/pictures/backgrounds/background.png')
end)

hl.on('monitor.added',   function() notify('Monitor Added!',   18, '#ff60ff') end)
hl.on('monitor.removed', function() notify('Monitor Removed!', 18, '#ff60ff') end)

