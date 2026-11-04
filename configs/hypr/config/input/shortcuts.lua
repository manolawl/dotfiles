hl.bind(AppMod .. 'T', hl.dsp.exec_cmd('kitty'))
hl.bind(AppMod .. 'B', hl.dsp.exec_cmd('zen-browser'))
hl.bind(AppMod .. 'E', hl.dsp.exec_cmd('kitty yazi'))
hl.bind(AppMod .. 'C', hl.dsp.exec_cmd('hyprpicker -a -f hex -n -u 256 -s 10'))

hl.bind(MenuMod .. 'V',     hl.dsp.exec_cmd('cliphist list | rofi -dmenu | cliphist decode | wl-copy'))
hl.bind(MenuMod .. 'Space', hl.dsp.exec_cmd('rofi -show drun'))

hl.bind('Print',             hl.dsp.exec_cmd('hyprshot -m region -o ~/pictures/screenshots'))
hl.bind('XF86Presentation',  hl.dsp.exec_cmd('kitty btop'))
hl.bind('switch:Lid Switch', hl.dsp.exec_cmd('hyprlock'), { locked = true })

local function set_backlight(sign, num)
	hl.exec_cmd('brightnessctl set ' ..num.. '%' ..sign)
	hl.exec_cmd('ddcutil setvcp 10 ' ..sign.. ' ' ..num.. ' -b 18 --sleep-multiplier=0.1 --noverify')
end

hl.bind('XF86MonBrightnessUp',   function() set_backlight('+', 20) end)
hl.bind('XF86MonBrightnessDown', function() set_backlight('-', 20) end)

hl.bind('XF86AudioRaiseVolume',  hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'), { repeating = true })
hl.bind('XF86AudioLowerVolume',  hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'),      { repeating = true })
hl.bind('XF86AudioMute',         hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'))
hl.bind('XF86Launch6',           hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'))
