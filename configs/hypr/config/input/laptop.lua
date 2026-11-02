local LightDec = 'XF86MonBrightnessDown'
local LightInc = 'XF86MonBrightnessUp'
local VolumeDec = 'XF86AudioLowerVolume'
local VolumeInc = 'XF86AudioRaiseVolume'
local AudioMute = 'XF86AudioMute'
local MicMute =   'XF86Launch6' --keycode when pressing fn + f4

local function set_backlight(sign, num)
	hl.exec_cmd('brightnessctl set ' ..num.. '%' ..sign)
	hl.exec_cmd('ddcutil setvcp 10 ' ..sign.. ' ' ..num.. ' -b 18 --sleep-multiplier=0.1 --noverify')
end

hl.bind(LightInc, function() set_backlight('+', 20) end)
hl.bind(LightDec, function() set_backlight('-', 20) end)

hl.bind(VolumeInc, hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'), { repeating = true })
hl.bind(VolumeDec, hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'),      { repeating = true })
hl.bind(AudioMute, hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'))
hl.bind(MicMute,   hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'))

hl.bind('switch:Lid Switch', hl.dsp.exec_cmd('hyprlock'), { locked = true })

hl.gesture({ fingers = 3, direction = 'horizontal', action = 'scroll_move' })
hl.gesture({ fingers = 3, direction = 'vertical',   action = 'workspace' })
