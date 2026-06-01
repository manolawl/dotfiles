local function backlight(sign, val)
	hl.exec_cmd('\
		brightnessctl set ' ..val.. '%' ..sign.. ' &&\
		ddcutil setvcp 10 ' ..sign.. ' ' ..val.. ' --noverify --sleep-multiplier=0.2\
	')
end

-- BACKLIGHT
hl.bind('XF86MonBrightnessUp', function() backlight('+', 25) end)
hl.bind('XF86MonBrightnessDown', function() backlight('-', 25) end)
hl.bind('SHIFT + XF86MonBrightnessUp', function() backlight('', 100) end)
hl.bind('SHIFT + XF86MonBrightnessDown', function() backlight('', 0) end)

-- AUDIO
hl.bind('XF86AudioRaiseVolume', hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'), { repeating = true })
hl.bind('XF86AudioLowerVolume', hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'), { repeating = true })
hl.bind('XF86AudioMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'))
hl.bind('XF86AudioMicMute', hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle'))
